<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Chat</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!------ Include the above in your HEAD tag ---------->
		<link rel="stylesheet" href="/css/chating/chatingFriend.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		
		 <script type="text/javascript">
		var ws ;
		
		window.onload = function(){
			//websocket 객체생성(websocket서버 연결)
			ws= new WebSocket("ws://" + location.host + "/chating/"+$("#friendNo").val());
			ws.onopen = function(data){
				//소켓이 열리면 동작
			}
			
			wsEvt()
			
			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){ //enter press
					send();
				}
			});
			
			$('#action_menu_btn').click(function(){
				$('.action_menu').toggle();
			});
		}
		
		function wsEvt() {
			
			var today = new Date()
			var noon = '오후'
			if(today.getHours() < 12){
				noon = '오전'
			}
			
			//화면 뜨자마자 아니면 친구선택할때에 채팅기록 뜨기
			
			var mDate = new Date()
			var dateSigh;
			$.ajax({
				url:'/api/messageHistory',
				type:'get',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",

				data:{	friendNo : $("#friendNo").val()
					},
				 contentType: "application/json; charset=utf-8;",
				 dataType: "json",
				 success:function(data){
					 console.log(data.length)
					 $('.msg_card_body').empty()
					  
					  for(var i=data.length-1;i>=0;i--){
						  
						  var messageDate = new Date(data[i].time)
						  console.log(messageDate)
						  if(messageDate.getFullYear() != mDate.getFullYear() | messageDate.getMonth() != mDate.getMonth() | messageDate.getDate() != mDate.getDate()){
							  mDate = messageDate
							  dateSigh = messageDate.getFullYear()+'년'+ messageDate.getMonth()+'월'+messageDate.getDate()+'일'
	 						  $('.msg_card_body').append('<p class="dateSign">'+dateSigh+'</p>')
						  }
						  var noon = '오후'
						  if(messageDate.getHours() < 12){
							noon = '오전'
						  }
 						 
						  if((data[i].user1 == $('#userNickname').val() && data[i].sign == '1') | (data[i].user2 == $('#userNickname').val() && data[i].sign == '2')){
							 $('.msg_card_body').append('<div class="d-flex justify-content-end mb-4">'+
										'<div class="msg_cotainer_send">'+
										data[i].message+
										'<span class="msg_time0_send">'+ messageDate.getHours()+':'+ messageDate.getMinutes()+' '+noon+'</span>'+
										'</div>'+
									'<div class="img_cont_msg">'+
									'<img src="'+$('#userImg').val()+'" class="rounded-circle user_img_msg">'+
									'</div>'+
								'</div>')
								$('.msg_card_body').scrollTop($('.msg_card_body').prop('scrollHeight')); 
						 }else{
							 $(".msg_card_body").append('<div class="d-flex justify-content-start mb-4">'+
									'<div class="img_cont_msg">'+
										'<img src="'+$('#friendImg').val()+'" class="rounded-circle user_img_msg">'+
									'</div>'+
									'<div class="msg_cotainer">'+
									data[i].message+ 
										'<span class="msg_time">'+ messageDate.getHours()+':'+ messageDate.getMinutes()+' '+noon+'</span>'+
									'</div>'+
								'</div>');	
								
								$('.msg_card_body').scrollTop($('.msg_card_body').prop('scrollHeight')); 
								
						 } 
					 }  
				 }
			})
			
			//메세지 받기
			ws.onmessage = function(data){
				var msg = data.data;
				console.log(msg)
				if(msg != null && msg.type != ''){
					var d = JSON.parse(msg);
					console.log(d)
					var si = d.sessionId
					
				}
				
				
				var today = new Date()
				var noon = '오후'
				if(today.getHours() < 12){
					noon = '오전'
				}
				
				if(d.type == "getId"){
					
					var si = d.sessionId
					
					$("#sessionId").val(si); 
					
				}
				
				if(d.type == 'message'){
					if(d.userName == $("#userNickname").val()){
								$('.msg_card_body').append('<div class="d-flex justify-content-end mb-4">'+
								'<div class="msg_cotainer_send">'+
								d.msg+
								'<span class="msg_time0_send">'+ today.getHours()+':'+ today.getMinutes()+'  '+noon+'</span>'+
								'</div>'+
							'<div class="img_cont_msg">'+
							'<img src="'+$('#userImg').val()+'" class="rounded-circle user_img_msg">'+
							'</div>'+
						'</div>')
						
						$('.msg_card_body').scrollTop($('.msg_card_body').prop('scrollHeight'));
					}else{
						 $(".msg_card_body").append('<div class="d-flex justify-content-start mb-4">'+
							'<div class="img_cont_msg">'+
								'<img src="'+$('#friendImg').val()+'" class="rounded-circle user_img_msg">'+
							'</div>'+
							'<div class="msg_cotainer">'+
							 d.msg + 
								'<span class="msg_time">'+ today.getHours()+':'+ today.getMinutes()+'  '+noon+'</span>'+
							'</div>'+
						'</div>');	
						
						$('.msg_card_body').scrollTop($('.msg_card_body').prop('scrollHeight')); 
						
					}
				}
			}
		}
		
		function send() {
			if($("#chatting").val() != ''){
				var option ={
						sessionId : $("#sessionId").val(),
						type: "message",
						roomNumber: $('#friendNo').val(),
						userName : $('#userNickname').val(),
						msg : $("#chatting").val()
					}
				ws.send(JSON.stringify(option))
				
				$.ajax({
					url:'/api/saveMessage',
					type:'get',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",

					data:{	chatingMessage:$("#chatting").val(),
							friendNo:$("#friendNo").val(),
							userEmail:$('#userEmail').val()
						},
					 contentType: "application/json; charset=utf-8;",
					 //dataType: "json",
					 success:function(data){
						 console.log(data)
					 }
				})
			}
			$('#chatting').val("");
		}
		</script> 
		
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
	</head>
	
	<body>
		<input type="hidden" id="friendList" value="${userList}" />
		<input type="hidden" id="userEmail" value="${sessionScope.userEmail}">
		<input type="hidden" id="userNickname" value="${user.userNickname}">
		<input type="hidden" id="userImg" value="/${userImg}">
		<input type="hidden" id="friendImg" value="/${userList[0].img}">
		<input type="hidden" id="sessionId" value="">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<div class="input-group">
							<input type="text" placeholder="Search..." id="search" class="form-control search">
							<div  class="input-group-prepend" >
								<span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
							</div>
						</div>
					</div>
					<input type="hidden" value="${userList[0].friendNo}" id="friendNo" />
					<div class="card-body contacts_body">
						<ui class="contacts">
						
						<c:forEach items="${userList}" var="vo">
						<li class="friend" content="${vo.friendNo}" >
							
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="/${vo.img}" class="rounded-circle user_img">
									
								</div>
								<div class="user_info">
									<span >${vo.nickName}</span>
									
								</div>
							</div>
						</li>
						</c:forEach>
						
						</ui>
					</div>
					<div class="card-footer"></div>
				</div></div>
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont" id="friendTitle">
									<img id="friendImage" src="/${userList[0].img}" class="rounded-circle user_img">
									
								</div>
								<div class="user_info">
									<span id="friendName">${userList[0].nickName}</span>
									<p></p>
								</div>
								
							</div>
							<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
							<div class="action_menu">
								<ul>
									<li><i class="fas fa-user-circle"></i> View profile</li>
									<li><i class="fas fa-users"></i> Add to close friends</li>
									<li><i class="fas fa-plus"></i> Add to group</li>
									<li><i class="fas fa-ban"></i> 친구차단</li>
								</ul>
							</div>
						</div>
						<div class="card-body msg_card_body">
						
						</div>
						<div class="card-footer">
							<div class="input-group">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"></span>
								</div>
								<input id="chatting" class="form-control type_msg" placeholder="Type your message..." />
								<div class="input-group-append">
									<span onclick="send()" class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		
		$('.friend').click(function(){
			$('#friendImg').val($(this).find('img').attr('src'))
			$('.contacts > .friend').removeClass('active')
			$(this).addClass('active')
			
			$('#friendName').text( $(this).find('span').text())

			$('#friendImage').attr('src',$(this).find('img').attr('src'))
			//*******
			ws.close()
			$('#friendNo').val($(this).attr('content'))
			ws= new WebSocket("ws://" + location.host + "/chating/"+$('#friendNo').val());
			ws.onopen = function(data){
				//소켓이 열리면 동작
				
			}
			
			wsEvt()
			
			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){ //enter press
					send();
				}
			});
			
			$('#action_menu_btn').click(function(){
				$('.action_menu').toggle();
			});
		})
		
	/* 	$('.input-group-prepend').click(function(){
			
			var rList = []
			
			var friends = '${userList}'
			var friendList=friends.replaceAll('{','').replaceAll('}','').replaceAll('[','').replaceAll(']','').replaceAll('img=','').replaceAll(' friendNo=','').replaceAll(' nickName=','').replaceAll(' email=','').split(',')
			console.log(friendList)
			var fNum = friendList.length/4
			for(var i=0;i<fNum;i++){
				if(friendList[2+4*i].includes($('#search').val())){
					var fInfo = []
					fInfo.push(friendList[4*i])
					fInfo.push(friendList[4*i+1])
					fInfo.push(friendList[4*i+2])
					fInfo.push(friendList[4*i+3])
					rList.push(fInfo)
				}
				
			}
		}) */
		
		
		</script>
	</body>
</html>
