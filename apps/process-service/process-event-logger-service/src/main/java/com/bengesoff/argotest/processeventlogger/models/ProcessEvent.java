package com.bengesoff.argotest.processeventlogger.models;

public class ProcessEvent {
    private final String processCode;

    private final String processOutcome;

    public ProcessEvent(String processCode, String processOutcome) {
        this.processCode = processCode;
        this.processOutcome = processOutcome;
    }

    public String getProcessCode() {
        return processCode;
    }

    public String getProcessOutcome() {
        return processOutcome;
    }
}
