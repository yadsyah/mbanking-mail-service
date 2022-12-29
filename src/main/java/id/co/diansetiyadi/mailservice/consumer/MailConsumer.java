package id.co.diansetiyadi.mailservice.consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import id.co.diansetiyadi.mailservice.service.MailService;
import id.co.diansetiyadi.mailservice.util.MailConstant;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MailConsumer {

    private final MailService mailService;
    private final Gson gson;
    
    @Autowired
    public MailConsumer(MailService mailService, Gson gson) {
        this.mailService = mailService;
        this.gson = gson;
    }

    @KafkaListener(topics = MailConstant.TOPIC_NOTIFICATION_MAIL, groupId = "notification")
    public void consumeMessageMail(String message) {

        log.info("Consume Kafka : {}", gson.toJson(message));
        mailService.sendMail(message);

    }
    
}
