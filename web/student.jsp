<%-- 
    Document   : student
    Created on : Jun 3, 2014, 2:33:59 PM
    Author     : jayanthi_raviteja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="theme.css">
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <script src="script1.js"></script>
        <script type="text/javascript">
      var global1=0;
      var global2=0;

              function next()
            {
                
                  var myText = document.getElementById('cue');
                 if(global1==0)
                  {
                  var videoElement = document.querySelector("video");
                  var textTracks = videoElement.textTracks; // one for each track element
                  var textTrack = textTracks[0]; // corresponds to the first track element
                  var cues = textTrack.cues;
                  var length=cues.length;
                  var cue = cues[0]; // corresponds to the first cue in a track src file
                  var cueId = cue.id // cue.id corresponds to the cue id set in the WebVTT file
                  var cueText = cue.text; // "The Web is always changing", for example (or some JSON!)
                 myText.innerHTML = cueText;
                 var start=cue . startTime ;
                 var time1=formatTime(start)
                 videoElement.currentTime = start;
                  document.getElementById("currenttime").value = time1;
                
                 global1=global1+1;
                } 
             else
             {
              var videoElement = document.querySelector("video");
                  var textTracks = videoElement.textTracks; // one for each track element
                  var textTrack = textTracks[0]; // corresponds to the first track element
                  var cues = textTrack.cues;
                  var length=cues.length;
                  var cue = cues[global1]; // corresponds to the first cue in a track src file
                  var cueId = cue.id // cue.id corresponds to the cue id set in the WebVTT file
                  var start=cue . startTime ;
                 videoElement.currentTime = start;
                  var time1=formatTime(start)
                 var cueText = cue.text; // "The Web is always changing", for example (or some JSON!)
                 
                 var myText = document.getElementById('cue');
                 myText.innerHTML = cueText;
                 document.getElementById("currenttime").value = time1;
                 //var myText = document.getElementById('textcaption');
                 //myText.innerHTML += start + "\n" + "\n";
                 global1=global1+1;
                 if(global1==length)
                 {
                     alert("End of the FeedBack");
                     
                 }
             }
            global2= global1;
              }
             function prev()
             {
                 global2=global2-1;
                 var videoElement = document.querySelector("video");
                  var textTracks = videoElement.textTracks; // one for each track element
                  var textTrack = textTracks[0]; // corresponds to the first track element
                  var cues = textTrack.cues;
                 var length=cues.length;
                  var cue = cues[global2]; // corresponds to the first cue in a track src file
                  var cueId = cue.id // cue.id corresponds to the cue id set in the WebVTT file
                  var start=cue . startTime ;
                  var time1=formatTime(start);
                 videoElement.currentTime = start;
                 document.getElementById("currenttime").value = time1;
                 global1=global2+1;
             }
            
            

    function comments()
    {
                 var videoElement = document.querySelector("video");
                  var textTracks = videoElement.textTracks; // one for each track element
                  var textTrack = textTracks[0]; // corresponds to the first track element
                  var cues = textTrack.cues;
                  var length=cues.length;
                for(var i=0;i<=length;i++)
                  {
                  var cue = cues[i]; // corresponds to the first cue in a track src file
                  var start=cue . startTime;
                  var time=formatTime(start);
                  var end=cue.endTime;
                  var text=cue.text;
                 var myText = document.getElementById('textcaption');
                  myText.innerHTML +="\n" + "\n"+time ;
                  }
    }
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
     function load()
     {
       window.location.reload();
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
             xmlHttp.open("GET","Upload_Servlet?q1="+ex1,true);
            // xmlHttp.open("GET","CreateVtt?q1="+ex1,true);
             xmlHttp.send(); 
     }
</script>
    </head>
    <body >
        <h2>
           Video-Annotations Student Mode
        </h2>
     
        <h3>
            TimeStamps List:
        </h3>
         <div>
                 <div id="message" class="hidden"></div>
            <div  class="center1" id="video_container">
                <p>  Choose the video file to play here</p>               
                <input type="file" id="fileAttachment" accept="video/*">
                <div class="fed">
                    <button class="skip" onclick="load()">Load Feedback</button>  
                </div>
                <video id="video1" controls  width="800" height="380" tabindex="0">
                <track src="<%=session.getAttribute("filename")%>" id="track1" onload="comments()" kind="subtitles" srclang="en" label="English">
                    <p>Your user agent does not support the HTML5 Video element.</p>
                </video>
</div>  
                 <div class="cue1">
                     <textarea id= "cue" cols="95" rows="2">
                     </textarea> 
                     <div class="timestamps">
                        <textarea id= "textcaption" cols="18" rows="25">
                     </textarea> 
                         <input type="hidden" id="hi2" name="hidden2"/>
                     </div>
                     </div>
                
                     <button class="skip" onclick="next()"> Next Comment</button>             
                      <button class="skip1" onclick="prev()"> prev Comment</button>
                <div class="cur">
                    <label>CurrentTime:</label>
                     <input   TYPE="TEXT" id="currenttime"  SIZE="25" MAXLENGTH="50" >
                 </div>
                

                 
            </div>
    </body>
</html>
