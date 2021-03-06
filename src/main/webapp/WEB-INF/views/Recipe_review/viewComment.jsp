<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<script>
var r_r_c_bno = '${view.r_r_bno}'; //게시글 번호
var nickname = '${nickname}'; // 닉네임
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	// 유효성 제어	  
	  if($('[name=r_r_c_content]').val() == ""){
       alert("내용을 입력하시오!"); 
       $('[name=r_r_c_content]').focus(); 
       return false; 
     }  
	/* alert("r_r_c_bno" + r_r_c_bno); */
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});


//댓글 목록 
function commentList(){
    $.ajax({
        url : '/rcomment/rlist',
        type : 'get',
        data : {'r_r_c_bno':r_r_c_bno},
        success : function(data){
            var a =''; 
            var star = '<div class="startRadio"><label class="startRadio__box"><span class="startRadio__img"></span></div>';
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.r_r_c_cno+'">'+'댓글번호 : '+value.r_r_c_cno+' / 작성자 : '+value.r_r_c_nickname;
                 if ((nickname != null && nickname == value.r_r_c_nickname)|| (nickname == '관리자')){ // 답글 본인, 관리자만 수정 삭제 가능 
  	                a += '<a onclick="commentUpdate('+value.r_r_c_cno+',\''+value.r_r_c_content+'\');"> 수정 </a>';
	                a += '<a onclick="commentDelete('+value.r_r_c_cno+');"> 삭제 </a> </div>';
	                a += '<div class="commentContent'+value.r_r_c_cno+'"> <p> 내용 : ' + value.r_r_c_content +'</p>';
	                a += '</div></div></div>';
	             }
                 else{
                	 a += '<div class="commentContent'+value.r_r_c_cno+'"> <p> 내용 : ' + value.r_r_c_content +'</p>';
                     a += '</div></div></div></div>';
                   }
                
            });
            
            $(".commentList").html(a);
        }
    });
    
}

//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/rcomment/rinsert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(r_r_c_cno, r_r_c_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+r_r_c_cno+'" value="'+r_r_c_content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+r_r_c_cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+r_r_c_cno).html(a);
    
} 
 
//댓글 수정
function commentUpdateProc(r_r_c_cno){
    var updateContent = $('[name=content_'+r_r_c_cno+']').val();
    $.ajax({
        url : '/rcomment/rupdate',
        type : 'post',
        data : {'r_r_c_content' : updateContent, 'r_r_c_cno' : r_r_c_cno },
        success : function(data){
       	// 유효성 제어	  
        	  if(updateContent == ""){
                alert("내용을 입력하시오!"); 
                $('[name=content_'+r_r_c_cno+']').focus(); 
                return false; 
              } 
            if(data == 1) commentList(r_r_c_bno); //댓글 수정후 목록 출력 
        }
    });
}

//댓글 삭제 
function commentDelete(r_r_c_cno){
    $.ajax({
        url : '/rcomment/rdelete/'+r_r_c_cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(r_r_c_bno); //댓글 삭제후 목록 출력 
        }
    });
}

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
</script>
