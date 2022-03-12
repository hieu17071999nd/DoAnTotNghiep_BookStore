package com.hieuvm.bookstore.task;

import org.activiti.engine.delegate.TaskListener;

public abstract class AbstractTaskListener implements TaskListener {

    public <T> T getBean(Class<T> clazz) {
        T object = ApplicationContextProvider.getApplicationContext().getBean(clazz);
        return object;
    }
}
