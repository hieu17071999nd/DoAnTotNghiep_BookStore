package com.hieuvm.bookstore.task;

import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Service;

@Service
public class ReceiveOrderTask extends AbstractTask2 {

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        /*
        Tiếp nhận đơn hàng: không xử lý gì cả
         */

    }
}
