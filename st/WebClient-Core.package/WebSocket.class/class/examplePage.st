example
examplePage
	"The example HTML page for WebServer"

	^'<html>
<p id="status">WebSocket: Not connected</p> 
<form> 
    <input type="text" id="chat" placeholder="type and press enter to chat" /> 
</form> 
<p>To test, open two windows with Web Socket support, type a message above and press return.</p> 
<ul id="log"></ul> 

<script>

var conn = {};
var log = document.getElementById("log");
var chat = document.getElementById("chat");
var form = chat.form;
var state = document.getElementById("status"); 
 
if (window.WebSocket === undefined) {
  state.innerHTML = "(WebSockets not supported)";
} else {
    conn = new WebSocket("ws://localhost:8080/broadcast");
    conn.onopen = function () {
      state.innerHTML = "WebSocket: Connected";
    };
 
    conn.onmessage = function (event) {
      log.innerHTML = "<li>" + event.data + "</li>" + log.innerHTML;
    };
    
    conn.onclose = function (event) {
      state.innerHTML = "WebSocket: Closed";
    };

	form.addEventListener("submit", function (event) {
		event.preventDefault();
		if (conn.readyState === 1) {
			conn.send(chat.value);      
			chat.value = "";
		}
	}, false);
};
 
</script> 

</body>
</html>'