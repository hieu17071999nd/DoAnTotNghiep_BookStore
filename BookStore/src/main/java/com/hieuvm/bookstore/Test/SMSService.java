package com.hieuvm.bookstore.Test;

public class SMSService implements MessageService {
    public void sendMsg(String message) {
        System.out.println(message);
    }
}