package com.hieuvm.bookstore.service;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.security.auth.login.LoginException;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class TaskProcessService {

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private ProcessEngineFactoryBean processEngine;

    public byte[] generateDiagram(String processDefinitionId, String processInstanceId) throws IOException {
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
        Context.setProcessEngineConfiguration(processEngine.getProcessEngineConfiguration());
        if (bpmnModel == null || bpmnModel.getLocationMap().isEmpty()) {
            return null;
        }

        DefaultProcessDiagramGenerator processDiagramGenerator = new DefaultProcessDiagramGenerator();
        List<String> activeActivityds = new ArrayList<>();
        if (processInstanceId != null) {
            List<HistoricActivityInstance> historicActivityInstances = historyService.createHistoricActivityInstanceQuery()
                    .processInstanceId(processInstanceId)
                    .list();
            for (HistoricActivityInstance history : historicActivityInstances) {
                activeActivityds.add(history.getActivityId());
            }
        }

        List<String> activeFlows = new ArrayList<>();

        return IOUtils.toByteArray(processDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityds, activeFlows));
    }

    public String getProcessDefinitionIdByProcessId(String processId) {
        if (processId == null) {
//            throw new LoginException("ProcessId bij null");
        }

        // tim trong cac rocess dang chay
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (processInstance != null) {
            return processInstance.getProcessDefinitionId();
        }

        //neu khong tim thay thi tim trong cac process da end
        HistoricProcessInstance doneProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processId).singleResult();
        if(doneProcessInstance == null) {
//            throw
        }
        return doneProcessInstance.getProcessDefinitionId();
    }
}
