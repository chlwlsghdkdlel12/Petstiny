<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.spring.petsitter.board.mboard.*" %>
<meta charset="UTF-8">
<%
MemberBoardVO mboard = (MemberBoardVO)request.getAttribute("vo");
String bno = request.getParameter("bno");

String id = (String)session.getAttribute("id");
String rank = (String)session.getAttribute("rank");
String name = (String)session.getAttribute("name");
String btype = "mboard";

if(rank == null) {
	rank = "guest";
}
%>
<!-- 댓글 입력란 -->
<style> 
    .pb-cmnt-container {
        font-family: Lato;
        margin-top: 100px;
    }

    .pb-cmnt-textarea {
        resize: none;
        padding: 20px;
        margin-bottom: 10px;
        height: 130px;
        width: 100%;
        border: 1px solid #827979!important;
    }
    #replyContent {
        word-break:break-all;    
    }    
</style>

<div>	
	<%
 		if(!rank.equals("guest")) {
 	%>
	<div class="replyList"></div>
	<%
 		}
	%>
</div>
<%
	if(!rank.equals("guest")) {
%>
<div class="container">
    	<div class="row justify-content-center">
    		<div class="col-md-10">	
            <div class="panel panel-info">
            <form name="replyInsertForm">
                <div class="panel-body">
                <input type="hidden" name="bno" value="<%=bno %>"/>
                    <input class="pb-cmnt-textarea" id="content" name="content" placeholder="댓글 입력란"></textarea>
                    <div class="text-right">
                    	<button class="btn btn-sm btn-primary" type="button" name="replyInsertBtn">등록</button>
                    </div>
                </div>
               </form>
            </div>
        </div>
    </div>
</div>
<%
	}
%>

<!-- 댓글 시작 -->
<script>
$('[name=replyInsertBtn]').click(function() {  
	var insertData = $('[name=replyInsertForm]').serialize();
	replyInsert(insertData); // Insert 함수호출(아럐)
});

var bno = <%=bno %>; // 게시판 글 번호
// 댓글 목록

 function replyList() {
	 $.ajax({
		 
		 url : '/petsitter/read_Reply.bo',
			type : 'post',
			data : {'bno': bno},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	
		success : function(data) {
			var a = '';
			var num = 1;
			$.each(data, function(key, value) {
				
				a +='<div class="container">';
		    a +='<div class="row justify-content-center">'
		    a +='<div class="col-md-10">';	
				a += '<div class="replyArea" style="border-bottom:1px solid #5e5e5e; margin-bottom: 15px;">';
				a += '<div style="color:#525252;" class="replyInfo' + value.rno+'">'+'댓글 번호 : ' + num + ' / 작성자 : '+value.writer_name +'&nbsp&nbsp;';
				
				a += '<form action="./reportReply.me" method="post" name="reportreplyform" id="reportreplyform">';
 	 		 	a += '<input type="hidden" name="MEMBER_ID" value="${id}">';
				a += '<input type="hidden" name="BNO" value="' + <%=mboard.getMEMBER_NUM() %> + '">';
				a += '<input type="hidden" name="RNO" value=' + value.rno + '>';
				a += '<input type="hidden" name="BTYPE" value="mboard">';
	
				a += '<button type="button" class="btn btn-danger btn-sm float-right" data-toggle="modal" data-target="#exampleModal">';
				a += '신고';
				a += '</button>';

				a += '<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
				a += '<div class="modal-dialog" role="document">';
				a += '<div class="modal-content">';
				a += '<div class="modal-header">';
				a += '<h5 class="modal-title" id="exampleModalLabel"> 코멘트 신고하기</h5>';
				a += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
				a += '<span aria-hidden="true">&times;</span>';
				a += '</button>';
				a += '</div>';
				a += '<div class="modal-body">';
				a += '<textarea id="REPORT_REASON" name="REPORT_REASON" rows="4" cols="63" placeholder="신고 사유를 적어주세요."></textarea>';
				a += '</div>';
				a += '<div class="modal-footer">';
				a += '<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>';
				a += '<a type="button" class="btn btn-primary" href="javascript:addreport2()">신고</a>';
				a += '</div>';
				a += '</div>';
				a += '</div>';
				a += '</div>';
				a += '</form>';

				num = num + 1;
				
				<%if (rank.equals("admin") || rank.equals("manager")) {%>
				a += '<a style="color:#26bd72;" href="#" class="oi oi-pencil" onclick="replyUpdateForm('+value.rno+',\''+value.content+'\');">수정</a>  ';
				a += '<a style="color:#26bd72;" href="#" class="oi oi-x" onclick="replyDelete('+value.rno+');">삭제</a></div>';
				<%} %>
				
				if((value.writer_rank == "admin") || (value.writer_rank == "manager")) {
				a += '<div style="color:#525252;" id="replyContent" class="replyContent'+value.rno+'">';
				a += '<table class="table table-bordered" style="margin: 10px auto;"><tr><td>';
				a += '<p><b>관리자의 메세지입니다. </b><br>' + value.content + '</p>';
				a += '</td></tr></table>';
				} else {
				a += '<div style="color:#525252;" id="replyContent" class="replyContent'+value.rno+'"><p>내용 : <br>' + value.content + '</p>';
				}
				
				a += '</div></div></div>'; 
				a += '</div></div></div>';
			}); 
			
			$(".replyList").html(a);
		}, 
		error:function(request, status, error){
			console.log("ajax 통신 실패");
			alert("ajax 통신 실패(List)");
		}
		
	}); 
} 

// 댓글 등록
function replyInsert(insertData) {
	$.ajax({		
		url : '/petsitter/write_Reply.bo',
		type : 'POST',
		data : insertData,
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			if(data == 1) {
				replyList(); // 댓글 작성 후 댓글 목록 reload
				$('[name=content]').val('');
			}
		},
		error:function() {
			alert("ajax 통신 실패(write)");			
		}
	});
}

// 댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function replyUpdateForm(rno, content) {
	var a = '';
	
	a += '<div>';
	a += '<input type="text" name="content_'+rno+'" value="'+content+'"/>';
	a += '<span ><button type="button" onclick="replyUpdate('+rno+');">수정</button></span>';
	a += '</div>';
	
	$('.replyContent' + rno).html(a);
}

function replyUpdate(rno) {
	var updateContent = $('[name=content_'+rno+']').val();
	
	$.ajax({
		url : '/petsitter/update_Reply.bo',
		type : 'post',
		dataType : 'json',
		data : {'content' : updateContent, 'rno' : 	rno},
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			if(data == 1) replyList(); // 댓글 수정 후 목록 출력
		},
		 error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		       }
	});
}

function replyDelete(rno) {
	$.ajax({
		url : '/petsitter/delete_Reply.bo?rno=' + rno,
		type : 'post',
	    data : {'rno': rno},
        dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			if(data == 1) replyList(); // 댓글 삭제 후 목록 출력
		},
		error:function() {
			alert("ajax 통신 실패(delete)");			
		}		
	});
}

$(document).ready(function() {
	replyList(); // 페이지 로딩시 댓글 목록 출력
});

</script>
<!-- 댓글 처리 -->