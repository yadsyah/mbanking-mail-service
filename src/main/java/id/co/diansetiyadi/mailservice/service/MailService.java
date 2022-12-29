package id.co.diansetiyadi.mailservice.service;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailService {


    public Object sendMail(String message) {

        log.info("Send Mail : {}", message);
        
        // todo send mail SMTP
        return null;
    }

    
}
