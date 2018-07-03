package com.dingyun.model;

import org.springframework.stereotype.Repository;

@Repository
public class Admin {
    private Integer adminId;

    private String adminName;

    private String adminPasswod;

    private String adminRemark;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminPasswod() {
        return adminPasswod;
    }

    public void setAdminPasswod(String adminPasswod) {
        this.adminPasswod = adminPasswod == null ? null : adminPasswod.trim();
    }

    public String getAdminRemark() {
        return adminRemark;
    }

    public void setAdminRemark(String adminRemark) {
        this.adminRemark = adminRemark == null ? null : adminRemark.trim();
    }
}