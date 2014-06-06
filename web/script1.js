/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


window.onload=function(){
(function localFileVideoPlayerInit(win) {
    var URL = win.URL || win.webkitURL, displayMessage = (function displayMessageInit() {       
            var node = document.querySelector('#message');
            
            return function displayMessage(message, isError) {
                node.innerHTML = message;
                node.className = isError ? 'error' : 'info';
            };
        }()),
        playSelectedFile = function playSelectedFileInit(event) {
         
            var file = this.files[0];            
            var type = file.type;
            var videoNode = document.querySelector('video');
            var canPlay = videoNode.canPlayType(type);
            canPlay = (canPlay === '' ? 'no' : canPlay);           
            var isError = canPlay === 'no';
            displayMessage(message, isError);
            if (isError) {
                return;
            }
            var fileURL = URL.createObjectURL(file);
            videoNode.src = fileURL;
        },
        inputNode = document.querySelector('input');                                                 
    inputNode.addEventListener('change', playSelectedFile, false);
}(window));
var video = document.getElementById("video1");

	// Buttons
	var playButton = document.getElementById("play-pause");
        
	// Event listener for the play/pause button
	playButton.addEventListener("click", function() {
            
		if (video.paused == true) {
			// Play the video
			video.play();
                        document.getElementById("textCaptionEntry").disabled = true;
                        document.getElementById("textCaptionEntry").value = "";
			playButton.innerHTML = "Pause";
                        
		} else {
			// Pause the video
			video.pause();
                        document.getElementById("textCaptionEntry").disabled = false;
                        document.getElementById("textCaptionEntry").value = "";   

			// Update the button text to 'Play'
			playButton.innerHTML = "Play";
		}
	});

};

