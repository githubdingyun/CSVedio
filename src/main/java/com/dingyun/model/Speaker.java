package com.dingyun.model;

import org.springframework.stereotype.Repository;

@Repository
public class Speaker {
    private Integer speakerId;

    private String speakerName;

    private String speakerDesc;

    private String speakerJob;

    private String speakerHeadUrl;

    private Speaker speaker;

    public Integer getSpeakerId() {
        return speakerId;
    }

    public void setSpeakerId(Integer speakerId) {
        this.speakerId = speakerId;
    }

    public String getSpeakerName() {
        return speakerName;
    }

    public void setSpeakerName(String speakerName) {
        this.speakerName = speakerName == null ? null : speakerName.trim();
    }

    public String getSpeakerDesc() {
        return speakerDesc;
    }

    public void setSpeakerDesc(String speakerDesc) {
        this.speakerDesc = speakerDesc == null ? null : speakerDesc.trim();
    }

    public String getSpeakerJob() {
        return speakerJob;
    }

    public void setSpeakerJob(String speakerJob) {
        this.speakerJob = speakerJob == null ? null : speakerJob.trim();
    }

    public String getSpeakerHeadUrl() {
        return speakerHeadUrl;
    }

    public void setSpeakerHeadUrl(String speakerHeadUrl) {
        this.speakerHeadUrl = speakerHeadUrl == null ? null : speakerHeadUrl.trim();
    }
}