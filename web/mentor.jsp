<%-- 
    Document   : mentor
    Created on : Jun 3, 2014, 2:33:49 PM
    Author     : jayanthi_raviteja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="script1.js"></script>
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="theme.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <meta charset='utf-8'/>
        <style>
            textarea {
                border:2px solid #ccc;
                padding: 10px;
                vertical-align: top;
                width: 65%;
            }
            .animated {
                -webkit-transition: height 0.2s;
                -moz-transition: height 0.2s;
                transition: height 0.2s;
            }
        </style>

        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js'></script>
        <script src='jquery.autosize.js'></script>
        
        <script>
            $(function() {
                $('.normal').autosize();
                $('.animated').autosize({append: "\n"});
            });
        </script>
        <script src="script1.js"></script>
         
        <script>
            $(function() {
                $('#currentTime').html($('#video_container').find('video').get(0).load());
                $('#currentTime').html($('#video_container').find('video').get(0).play());
            })
            setInterval(function() {
                $('#currentTime').html($('#video_container').find('video').get(0).currentTime);
                $('#totalTime').html($('#video_container').find('video').get(0).duration);
            }, 50)
        </script>
      
        <script>
      var globalCount=0;
       function Captions1()
          {
            var time=$('#video_container').find('video').get(0).currentTime;         
            var start = formatTime(time - 0.025); 
            var end = formatTime(time + 3);
             var imgVal = document.getElementById('fileAttachment');
        var file=imgVal.files,length=file.length;
        for(i=0;i<length;i++)
        {
            var name= file[i].name;
            var s = name.substring(0, name.length - 4);
            document.getElementById("hi2").value= s;
            var ex1= ""+document.getElementById("hi2").value;
           var ex1=encodeURIComponent(ex1);
         }
          if(globalCount==0)
         {
            var vtt = "WEBVTT FILE\n"; 
         }
         else
         {
             var vtt="";    
         }
         globalCount=globalCount+1;
            //vtt += "\n"+globalCount;            
            vtt += "\n" + start+" --> " + end;  
            vtt += "\n"+ document.getElementById("mistake1").value;
           
            vtt += "\n" + document.getElementById("textCaptionEntry").value;
            vtt += "\n";
            document.getElementById("hi").value= vtt;
            var ex= ""+document.getElementById("hi").value;
              var ex=encodeURIComponent(ex);
              if(window.XMLHttpRequest)
            {
                  xmlHttp=new XMLHttpRequest();
             }
             else
            {
                 xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
             }
              
             xmlHttp.onreadystatechange=function()
          {
           //window.alert("inside myfunction"+xmlHttp.responseText);
                   if (xmlHttp.readyState==4 && xmlHttp.status==200)
                 {            
                   // document.getElementById("hi").innerHTML=xmlHttp.responseText;
                  }
  
           }
             xmlHttp.open("GET","CreateVtt?q="+ex+"&q1="+ex1,true);
            // xmlHttp.open("GET","CreateVtt?q1="+ex1,true);
             xmlHttp.send();  
             
            }
            
            </script>
            
            
            <script>
                function back() 
                {
                   
                       var videoElement = document.querySelector("video");
                        videoElement.currentTime -=5;
                  }    
            </script>
        <script>
            function formatTime(sec_num)
            {
                var hours = Math.floor(sec_num / 3600);
                var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
                var seconds = Math.floor(sec_num - (hours * 3600) - (minutes * 60));

                if (hours < 10) {
                    hours = "0" + hours;
                }
                if (minutes < 10) {
                    minutes = "0" + minutes;
                }
                if (seconds < 10) {
                    seconds = "0" + seconds;
                }
                var time = hours + ':' + minutes + ':' + seconds +'.'+0+0+0;
                return time;
            }
        </script>   
    </head>
    <body>
        <h2>
           Video-Annotations  Mentor Mode
        </h2>
                 <div id="message" class="hidden"></div>
            <div class="center" id="video_container">              
                <p>Choose the video file to play here </p>
                <input type="file" id="fileAttachment" accept="video/*">
                <video id="video1" controls  width="750" height="400" tabindex="0">
                </video>
                
            </div>
                    <div class="mistake">
                    <select id="mistake1">
                    <option value="grammatical">Grammatical</option>
                    <option value="pronounciation">Pronunciation</option>
                    <option value="body-language">Body-Language</option>
                    <option value="Eyecontact">Eye-Contact</option>
                    <option value="Sentence-Formation">Sentence-Formation</option>
                     <option value="Animation">Animation</option>
                     <option value="WrongUsage">WrongUsage</option>
                </select>
            </div>
            <div class="textarea2">
                <textarea  id= "textCaptionEntry"  placeholder="please enter the comments here..." disabled  columns = "130">
                </textarea>               
            </div>
            <div  id="video-controls">                 
                <button class="buttons" id="btn" onClick="Captions1()" >Save</button>               
                <button class="buttons1" id="play-pause" class="play">Play</button>
                <button class="buttons2" onClick="back()">Backward</button>   
                 <input type="hidden" id="hi" name="hidden1"/>
                 <input type="hidden" id="hi2" name="hidden2"/>
            </div>
                 
                 
                 <div class="end">
                     <button class="buttons" id="btn" onClick="location.href = 'thankyou.jsp';" >End of the Feedback</button>               
              
                 </div>
        <div class="footer">
            copy rights: @msit.program.net
        </div>


    </body>
</html>

