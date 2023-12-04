function loadContent(elementId, jspFile){
	let contentDiv = document.getElementById("content");
	contentDiv.innerHTML = '<%@ include file = "' + jspFile + '" %>';
	document.getElementById("selected").removeAttribute("id");
	document.getElementById(elementId).setAttribute("id", "selected");
}
function loadPost(){
	loadContent("post_filter", "./mainPost.jsp");
}

function loadGroup(){
	loadContent("group_filter", "./mainGroup.jsp");
}