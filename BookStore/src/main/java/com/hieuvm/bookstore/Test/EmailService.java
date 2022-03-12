package com.hieuvm.bookstore.Test;

public class EmailService implements MessageService {
    public void sendMsg(String message) {
        System.out.println(message);
    }
}
