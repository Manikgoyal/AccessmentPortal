/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginbeans;

import java.util.Date;

/**
 *
 * @author komal
 */
public class CourseMaterialBean {

    String materialid;
    String materialname;
    String subjectid;
    String classid;
    Date dateupload;
    String filename;

    boolean status;
    String userid;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getMaterialid() {
        return materialid;
    }

    public void setMaterialid(String materialid) {
        this.materialid = materialid;
    }

    public String getMaterialname() {
        return materialname;
    }

    public void setMaterialname(String materialname) {
        this.materialname = materialname;
    }

    public String getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(String subjectid) {
        this.subjectid = subjectid;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid;
    }

    public Date getDateupload() {
        return dateupload;
    }

    public void setDateupload(Date dateupload) {
        this.dateupload = dateupload;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

}
