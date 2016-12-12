var blocks = ["ground","ground","blank","ground","bridge","ground","bridge","blank","bridge","ground","blank","bridge","ground"];


function renderBlocks(){
    for(var i = 0; i < blocks.length; i++){
        var template = $("#" + blocks[i] + "Template").html();
        var el = $(template);
        $("#map").append(el);
        el.css("left",i * 200);
        
    }
}

renderBlocks();



var nickname = "Anom";
var ip = "192.168.0.25";
var port = "8989";

$("#join").click(function(){

    $("#joinScreen").fadeToggle("fast",function(){
        ip = $("#ip").val();
        nickname = $("#nickname").val();
        
        // Create the web socket
        setup();
        
        $("#game").fadeToggle("fast");
    })
    
});

$("#nickname").keydown(function(e){
    if(e.keyCode == 13){
        $("#join").click();
    }
})


// [ Create socket ]
var socket = null;

function setup(){
    socket = new WebSocket("ws://" + ip + ":" + port);
   
    socket.onmessage = function(event){
        var json = event.data;
        var data = JSON.parse(json);

        if(data.event == "movement"){
            $("#map").css({
                 "left":data.x * 50 + 10
                ,"top":data.y * 50 - 30
            });     
        }else if(data.event == "chat"){
            $("#chatLog").append("<div class='comment'><b>" + data.nickname + "</b>: " + data.message + "</div>")
        }else if(data.event == "platform"){
            var platform = $(".platform").eq(data.i);
            if(platform.length == 0){
                platform = $("<div class='platform'></div>");
                $("#map").append(platform);
            }

            platform.css({
                 "left":data.x * -50 - 20
                ,"top":data.y * -50 + 50
            })
        }
    }
}

$("#chatTextBox").keydown(function(e){

    if(e.keyCode == 13){
        var text = $(this).val();
        var data = {
             "event":"chat"  
            ,"message":text
            ,"nickname":nickname
        };
        socket.send(JSON.stringify(data));
        
        $(this).val("");
    } 
});

$(".ability").click(function(){
    var kind = $(this).val();
    var data = {
         "event":"vote"
        ,"kind":kind  
    };
    socket.send(JSON.stringify(data));
})

//send.onclick = function(){
//    var msg = textbox.value;
//    socket.send(msg);
//}