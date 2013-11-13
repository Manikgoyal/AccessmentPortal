/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.TestDataBean;
import com.arcadian.loginbeans.TestNoticeBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author manik
 */
public class TestsService {

    Statement smt;
    ResultSet rs;
    Connection con;
    
    public TestsService() {
    
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Test Service"+e);
        }
    }
    
    
    public String fetchBranch(String username){
        
        String branchid="";
        try {
            String query="select branchid from userbranch where userid='"+username+"'";
            rs=smt.executeQuery(query);
            while(rs.next()){
                branchid=rs.getString("branchid");
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in Fetch User"+e);
        }
        
        return branchid;
    }
    
    public ArrayList fetchClassid(String username){
        
        ArrayList alstClassid=new ArrayList();
        
        try {
            String query="select classid from userclasses where userid='"+username+"'";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                
                alstClassid.add(rs.getString("classid"));
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in Fetch Class"+e);
        }
        
        return alstClassid;
    }
    
    
    public int setTestQuestion(TestDataBean testDataBean){
        int i=0;
        try {
            String query="insert into testdata (branchid, classid, question, opt1, opt2, opt3, opt4, ans, subjectid) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement=con.prepareStatement(query);
            statement.setString(1,testDataBean.getBranchid());
            statement.setString(2,testDataBean.getClassid());
            statement.setString(3,testDataBean.getQuestion());
            statement.setString(4,testDataBean.getOpt1());
            statement.setString(5,testDataBean.getOpt2());
            statement.setString(6,testDataBean.getOpt3());
            statement.setString(7,testDataBean.getOpt4());
            statement.setString(8,testDataBean.getAns());
            statement.setString(9,testDataBean.getSubjectid());
            i=statement.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Exception in set Question"+e);
        }
        
        return i;
    }
    
    
    public ArrayList getTestQuestion(String classid,String subjectid){
        
        ArrayList alstQuestionList=new ArrayList();
        
        String query="select * from testdata where classid='"+classid+"' and subjectid='"+subjectid+"' ";
        try {
            rs=smt.executeQuery(query);
            while(rs.next()){
                TestDataBean testDataBean=new TestDataBean();
                testDataBean.setBranchid(rs.getString("branchid"));
                testDataBean.setSubjectid(rs.getString("subjectid"));
                testDataBean.setClassid(rs.getString("classid"));
                testDataBean.setQuestion(rs.getString("question"));
                testDataBean.setOpt1(rs.getString("opt1"));
                testDataBean.setOpt2(rs.getString("opt2"));
                testDataBean.setOpt3(rs.getString("opt3"));
                testDataBean.setOpt4(rs.getString("opt4"));
                testDataBean.setAns(rs.getString("ans"));
                alstQuestionList.add(testDataBean);
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in get Question list"+e);
        }
        return alstQuestionList;
    }
    
    public int createTest(TestNoticeBean testNoticeBean){
        int i=0;
        
        try {
            String query="insert into testnotice (testid, testname, branchid,subjectid, classid, maximarks, dateoftest, status, maxitime) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement=con.prepareStatement(query);
            
            statement.setString(1,testNoticeBean.getTestid());
            statement.setString(2,testNoticeBean.getTestname());
            statement.setString(3,testNoticeBean.getBranchid());
            statement.setString(4,testNoticeBean.getSubjectid());
            statement.setString(5,testNoticeBean.getClassid());
            statement.setString(6,testNoticeBean.getMaximarks());
            statement.setString(7,testNoticeBean.getDateoftest());
            statement.setBoolean(8,testNoticeBean.getStatus());
            statement.setString(9,testNoticeBean.getMaxitime());
        
            i=statement.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Exception in create Test"+e);
        }
        
                
        return i;
    }
    
    public ArrayList fetctTestDetails(String branchid){
        
        ArrayList alstTestDetails=new ArrayList();
        try {
            String query="select * from testnotice where branchid='"+branchid+"'";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                TestNoticeBean testNoticeBean=new TestNoticeBean();
                testNoticeBean.setTestid(rs.getString("testid"));
                testNoticeBean.setTestname(rs.getString("testname"));
                testNoticeBean.setSubjectid(rs.getString("subjectid"));
                testNoticeBean.setClassid(rs.getString("classid"));
                testNoticeBean.setMaximarks(rs.getString("maximarks"));
                testNoticeBean.setDateoftest(rs.getString("dateoftest"));
                testNoticeBean.setStatus(rs.getBoolean("status"));
                testNoticeBean.setMaxitime(rs.getString("maxitime"));
                alstTestDetails.add(testNoticeBean);
                
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in fetch test details="+e);
        }
        
        return alstTestDetails;
    }
    
    public ArrayList fetctStudentTestDetails(String branchid,String Classid){
        
        ArrayList alstTestDetails=new ArrayList();
        try {
            String query="select * from testnotice where branchid='"+branchid+"' and classid='"+Classid+"'";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                TestNoticeBean testNoticeBean=new TestNoticeBean();
                testNoticeBean.setTestid(rs.getString("testid"));
                testNoticeBean.setTestname(rs.getString("testname"));
                testNoticeBean.setSubjectid(rs.getString("subjectid"));
                testNoticeBean.setClassid(rs.getString("classid"));
                testNoticeBean.setMaximarks(rs.getString("maximarks"));
                testNoticeBean.setDateoftest(rs.getString("dateoftest"));
                testNoticeBean.setStatus(rs.getBoolean("status"));
                testNoticeBean.setMaxitime(rs.getString("maxitime"));
                alstTestDetails.add(testNoticeBean);
                
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in fetch test details="+e);
        }
        
        return alstTestDetails;
    }
    
    public int updateStatus(Boolean status , String testid){
        
        int i=0;
        
        try {
            String query="update testnotice set status="+status+" where testid='"+testid+"'";
            i=smt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Exception in update status"+e);
        }
        return i;
    }
    
    
    public int deleteTest(String testid){
       
        int i=0;
        String query="delete from testnotice where testid='"+testid+"'";
        try {
            i=smt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Exception in delete test"+e);
        }
        return i;
    }
    
    public String fetchStudentClassid(String username){
        
       String classid="";
        try {
            String query="select classid from studentclasses where userid='"+username+"'";
            
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                classid=rs.getString("classid");
            }
        } catch (SQLException e) {
            System.out.println("Exception in fetch Student Classes"+e);
        }
        
        return classid;
    }
    
    
    public ArrayList getQuestion(String testid){
        
       ArrayList alstQuestion=new ArrayList();
       String query="select quesno from testdata where testid='"+testid+"' and status=1 limit 20";
       try {
       rs=smt.executeQuery(query);
       
       while(rs.next()){
           alstQuestion.add(rs.getString("quesno"));
       }
        } catch (SQLException e) {
            System.out.println("Exception in getQuestion="+e);
        }
        
        return alstQuestion;
        
    }
    
    public ArrayList getQuestionAns(int quesno){
        
       ArrayList alstQuestion=new ArrayList();
       TestDataBean testDataBean=null;
       String query="select * from testdata where quesno='"+quesno+"'";
       try {
       rs=smt.executeQuery(query);
       
       while(rs.next()){
           testDataBean=new TestDataBean();
           
           testDataBean.setQuestion(rs.getString("question"));
           testDataBean.setOpt1(rs.getString("opt1"));
           testDataBean.setOpt2(rs.getString("opt2"));
           testDataBean.setOpt3(rs.getString("opt3"));
           testDataBean.setOpt4(rs.getString("opt4"));
           testDataBean.setAns(rs.getString("ans"));
           testDataBean.setQuesno(quesno);
           alstQuestion.add(testDataBean);
       }
        } catch (SQLException e) {
            System.out.println("Exception in getQuestionAns="+e);
        }
        
        return alstQuestion;
        
    }
    public String getAns(int quesno){
        
       String ans="";
       String query="select ans from testdata where quesno='"+quesno+"'";
       try {
       rs=smt.executeQuery(query);
       
       while(rs.next()){
           ans=rs.getString("ans");
       }
        } catch (SQLException e) {
            System.out.println("Exception in getQuestionAns="+e);
        }
        
        return ans;
        
    }
    
    public int insertResult(String userid,String testid,int marks){
        int i=0;
        
        try {
            String query="insert into testfolder (userid,testid,marks,status) values('"+userid+"','"+testid+"',"+marks+",0)";
            i=smt.executeUpdate(query);
            
        } catch (SQLException e) {
            System.out.println("Exception in insert Result="+e);
        }
        
        return i;
    }
    
    public String getStudentStatus(String testid,String userid){
        
        String status="";
        
        try {
            String query="select status from testfolder where testid='"+testid+"' and userid='"+userid+"' ";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
               boolean b=rs.getBoolean("status");
                status=Boolean.toString(b);
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in getStatus="+e);
        }
        
        return status;
    }
    
    
}
