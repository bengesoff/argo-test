package com.bengesoff.argotest.processeventlogger.models;

import javax.validation.constraints.NotBlank;

public class ProcessEvent {
    @NotBlank(message = "serialNumber is required")
    private final String serialNumber;
    @NotBlank(message = "processCode is required")
    private final String processCode;
    @NotBlank(message = "processOutcome is required")
    private final String processOutcome;

    public ProcessEvent(String serialNumber, String processCode, String processOutcome) {
        this.serialNumber = serialNumber;
        this.processCode = processCode;
        this.processOutcome = processOutcome;
    }

    public String getProcessCode() {
        return processCode;
    }

    public String getProcessOutcome() {
        return processOutcome;
    }

    public String getSerialNumber() {
        return serialNumber;
    }
}
