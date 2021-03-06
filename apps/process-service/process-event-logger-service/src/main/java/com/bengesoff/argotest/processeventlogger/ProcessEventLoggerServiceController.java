package com.bengesoff.argotest.processeventlogger;

import com.bengesoff.argotest.processeventlogger.models.ProcessEvent;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import javax.validation.Valid;

@RestController
public class ProcessEventLoggerServiceController {

    private final KafkaSender kafkaSender;

    public ProcessEventLoggerServiceController(KafkaSender kafkaSender) {
        this.kafkaSender = kafkaSender;
    }

    @PostMapping("/process")
    public String recordProcess(@Valid @RequestBody ProcessEvent event) {
        this.kafkaSender.sendEvent(event);
        return "ok";
    }
}
