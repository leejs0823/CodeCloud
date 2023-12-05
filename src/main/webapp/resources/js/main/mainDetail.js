function loadPage(pageName) {
	let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
         	document.getElementById("content").innerHTML = this.responseText;
    	}
    };
    xhttp.open("GET", pageName, true);
    xhttp.send();
}

function select(selected) {

     if(selected=="group_category"){
		 document.querySelector("#group_category").classList.add("selected");
		 document.querySelector("#post_category").classList.remove("selected");
	 }
	 else if(selected=="post_category"){
		 document.querySelector("#group_category").classList.remove("selected");
		 document.querySelector("#post_category").classList.add("selected");
	 }
}
