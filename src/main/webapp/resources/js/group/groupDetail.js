function showConfirmation(){
    var isConfirmed = window.confirm("[이름]을 멤버에서 삭제하시겠습니까?");
    		
    if(isConfirmed){
    			/*삭제 로직 구현*/
    	alert("[이름]이 멤버에서 삭제되었습니다.");
    			location.reload();
    }else{
    	alert("[이름] 삭제가 취소되었습니다.");
    }
}

function copyLink(){
    var url = "";
    var textarea = document.createElement("textarea");
    	   	
    document.body.appendChild(textarea);
    url = 'window.location.href';
    textarea.value = url;
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    	   	
    alert("초대 링크가 복사되었습니다.");
}

