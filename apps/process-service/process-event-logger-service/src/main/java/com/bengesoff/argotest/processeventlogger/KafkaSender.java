package com.bengesoff.argotest.processeventlogger;

import com.bengesoff.argotest.processeventlogger.models.ProcessEvent;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;
import org.springframework.util.concurrent.ListenableFuture;

@Component
public class KafkaSender {
    private final KafkaTemplate<String, ProcessEvent> kafkaTemplate;

    @Value("${topic.name}")
    private String topicName;

    public KafkaSender(KafkaTemplate<String, ProcessEvent> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public ListenableFuture<SendResult<String, ProcessEvent>> sendEvent(ProcessEvent event) {
        return this.kafkaTemplate.send(topicName, event.getProcessCode(), event);
    }
}
