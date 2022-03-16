package com.hieuvm.bookstore.task;

import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Service;

@Service
public class SendEmailCancelServiceTask extends AbstractTask2 {

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        //luu thong tin don hang vao bang orderItem
        Long numberProductOrder = 1L;
//        execution.setVariable(String.valueOf(numberProductOrder), numberProductOrder);
//
//        execution.getVariable(String.valueOf(numberProductOrder));
    }
}
