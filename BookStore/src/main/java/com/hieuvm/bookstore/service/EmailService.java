package com.hieuvm.bookstore.service;

import com.hieuvm.bookstore.repository.OrderRepo;
import com.hieuvm.bookstore.task.AbstractTask2;
import org.activiti.engine.delegate.DelegateExecution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class EmailService extends AbstractTask2 {

    public void sendEmail(String to, String subject, String content) {
        MailSender mailSender = getBean(MailSender.class);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("hieumv99nd@gmail.com");
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);
        mailSender.send(mailMessage);
    }

    @Override
    public void execute(DelegateExecution delegateExecution) throws Exception {
    }
}
