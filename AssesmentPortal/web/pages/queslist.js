function showUser5(str,str1)
{
    
if (str=="")
  {
      
  document.getElementById("queslist").innerHTML="";
  return;
  } 
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("queslist").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","ServletQuestionListAjaxServlet?classid="+str1+"&subjectid="+str,true);
xmlhttp.send();
}
    
    

