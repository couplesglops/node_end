var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http); //添加socket.io


app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
  });
// 客户端传到服务器端然后发送给其他用户 包括发件人
io.on('connection', function(socket){
  // 转发消息
  socket.on('message', function(msg){
    io.emit('message', msg);
    console.log('mm',msg);
  });
 
});

http.listen(80, function(){
  console.log('listening on *:80');
});


