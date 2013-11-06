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
public class AssignmentNoticeBean {
    
    String assignmentid;
    String assignmentname;
    String subjectid;
    String classid;
    String file;
    int maximarks;
    Date dateofallotment;
    Date dateofsubmission;
    boolean status;
    String userid;

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getAssignmentid() {
        return assignmentid;
    }

    public void setAssignmentid(String assignmentid) {
        this.assignmentid = assignmentid;
    }

    public String getAssignmentname() {
        return assignmentname;
    }

    public void setAssignmentname(String assignmentname) {
        this.assignmentname = assignmentname;
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

    public int getMaximarks() {
        return maximarks;
    }

    public void setMaximarks(int maximarks) {
        this.maximarks = maximarks;
    }

    public Date getDateofallotment() {
        return dateofallotment;
    }

    public void setDateofallotment(Date dateofallotment) {
        this.dateofallotment = dateofallotment;
    }

    public Date getDateofsubmission() {
        return dateofsubmission;
    }

    public void setDateofsubmission(Date dateofsubmission) {
        this.dateofsubmission = dateofsubmission;
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
