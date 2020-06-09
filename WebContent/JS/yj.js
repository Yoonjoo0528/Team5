// 윤주

$(document).ready(function() {

	// main js

	$("#main_top2-1").css("display", "none");
	$("#main_top2-3").css("display", "none");
	
	$("#main_a_comunity").mouseenter(function() {
		$("#main_top2-1").hide();
		$("#main_top2-3").hide();
		$("#main_top2-2").show()

	});
	
	$("#main_a_store").mouseenter(function() {
		$("#main_top2-2").hide();
		$("#main_top2-3").hide();
		$("#main_top2-1").show()
	});
	
	$("#main_a_cons").mouseenter(function() {
		$("#main_top2-1").hide();
		$("#main_top2-3").show();
		$("#main_top2-2").hide()
	});
	
	
	$("#main_user_menu_icon").mouseenter(function() {
		$("#main_user_menu").show();
	});
	$("#main_user_menu").mouseleave(function() {
		$("#main_user_menu").hide();

	});
	
//------------------------------------------------------
	
	//----------------------------------------------
	
	//aQuestionList
	// $('button[id^="main_qlist_answer_2_"]').hide();
	$('input[id^="main_qlist_input_"]').hide()
	
	$('button[id^="main_qlist_answer_1_"]').click(function() {
		var id = $(this).attr('id').split("_")[4];
		
		$('#main_qlist_input_' + id).show()
		$('#main_qlist_answer_1_' + id).hide();
		$('#main_qlist_answer_2_' + id).show();
		
	});
	$('button[id^="main_qlist_answer_2_"]').click(function() {
		var id = $(this).attr('id').split("_")[4];
		
		$('#main_qlist_input_' + id).hide()
		$('#main_qlist_answer_2_' + id).hide();
		$('#main_qlist_answer_1_' + id).show();
		
	});
	
	//------------------------------------------
	
	//-storemain
	$("#product_main_nav").slideUp(0);

	$("#category_li").mouseenter(function() {
		$("#product_main_nav").slideDown(300);

	});
	$("#product_main_nav").mouseleave(function() {
		$("#product_main_nav").slideUp(300);

	});
	//-----------------------------
	//store_main :category
	$('div[id^="category_"]').click(function() {
		var code = $(this).attr('id').split("_")[1];
		for (var i = 1; i <= 10; i++) {
			$('.category_code_' + i).hide()
		}
		$('.category_code_' + code).show(300)
	});
	
	//-------------------------------------
	
	//productview
	window.onscroll = function(){myFunction()};

	var div = document.getElementById("product_nav");
	var sticky = div.offsetTop;

	function myFunction() {
		alert("sticky")
	  if (window.pageYOffset > sticky) {
	    div.classList.add("sticky");
	  } else {
	    div.classList.remove("sticky");
	  }
	}
	//-----------------------------------


/*	
	 $('button[id^="main_qlist_answer_1_"]').click(function(){ var id =
	 $(this).attr('id').split("_")[4];
	 
	 var text = $(this).text().trim(); 
	 if(text=="등록 완료"){
	 $('#main_qlist_input_'+id).hide() $(this).text("답변 등록") }
	 else{
	 $('#main_qlist_input_'+id).show() $(this).text("등록 완료") }
	 
	 });
	 */

	/*
	 * var qcontent = $('input[id^="main_qlist_input_"]').val()
	 * if(qcontent==""){ var id = $(this).attr('id').split("_")[4]; //답변예쩡
	 * $('#A_status_'+id).css("background-color","#ccc") }else{ var id =
	 * $(this).attr('id').split("_")[4]; //답변완료
	 * $('#A_status_'+id).css("background-color","#FFB4B4") }
	 */

	var modal = document.getElementById('QModal')
	var btn = document.getElementById('detail_question_2')

	var span = document.getElementsByClassName('Qclose')[0]
	// TODO
	// 버튼 클릭하면 팝업 보이게 하기
	// 팝업의 x 버튼 누르면 닫히게 하기
	btn.onclick = function() {
		modal.style.display = "block"
	}
	span.onclick = function() {
		modal.style.display = 'none'
	}
	// 팝업창 바깥을 클릭해도 팝업이 닫히게 하기 (modal)<--->(반대 : modeless)
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = 'none'
		}

	}

	// store_main : category

	/*function page_move(url, pcuid) {
		var form = document.createElement("form");
		var parm = new Array();
		var input = new Array();

		form.action = url;
		form.method = "post";

		parm.push([ 'pcuid', pcuid ]);

		for (var i = 0; i < parm.length; i++) {
			input[i] = document.createElement("input");
			input[i].setAttribute("type", "hidden");
			input[i].setAttribute('name', parm[i][0]);
			input[i].setAttribute("value", parm[i][1]);
			form.appendChild(input[i]);
		}
		document.body.appendChild(form);
		form.submit();
	}*/
	
	//------------------------------------------
	//prductview nav

	var $menu = $('.floating-menu li.m'), 
		$contents = $('.scroll'), 
		$doc = $('html, body'); 
	$(function () { // 해당 섹션으로 스크롤 이동
		$menu.on('click','a',function(e){
			var $target = $(this).parent(), 
				idx = $target.index(), 
				section = $contents.eq(idx), 
				offsetTop = section.offset().top; 
			$doc.stop() 
				.animate({ 
					scrollTop :offsetTop 
					}, 800); 
			return false; }); 
		}); 
	// menu class 추가
	$(window).scroll(
			function(){ var scltop = $(window).scrollTop(); 
			$.each($contents, function(idx, item){ 
				var $target = $contents.eq(idx), 
					i = $target.index(), 
					targetTop = $target.offset().top; 
				if (targetTop <= scltop) { 
					$menu.removeClass('on'); 
					$menu.eq(idx).addClass('on'); } 
				if (!(200 <= scltop))
					{ $menu.removeClass('on'); 
					} 
			}) 
	});
	

	window.onscroll = function() {myFunction()};

	var header = document.getElementById("product_nav");
	var sticky = header.offsetTop;

	function myFunction() {
	  if (window.pageYOffset > sticky) {
	    header.classList.add("sticky");
	  } else {
	    header.classList.remove("sticky");
	  }
	}
//------------------------------------------------------
});

