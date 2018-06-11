$(function(){

//		$(".tab_menu li").on('click',function(){
//			$(this).addClass('active').siblings('li').removeClass('active');
//			$('.jump_class span').html($(this).text())
//		})
		$(".ym_close").append("<div class='done'></div>");
		//下拉框选择
		$(".select_class").on('click',function(){
				$(".select_box").toggle()
		})
		$(".select_box span").on('click',function(){
			$(this).css('color','#FF4800');
			var mytext = $(this).text();
			var newtext = $(".select_class").text();
			$(".select_class").text(mytext)
		})
		
		$('body').click(function(e) {
	    var target = $(e.target);
	    if(!target.is('.select_box') && !target.is('.select_class')) {
	       if ( $('.select_box').is(':visible') ) {  
	            $('.select_box').hide();                                                    
	       }
	    }
	});
	$(".buy_btn").click(function(){
		$("#submitModal").modal()
	})
	$("#submitBtn").click(function(){
//		$("#submitModal").modal("hide")
//		$("#successModal").modal()
	})
			
			
			prefect();
			$(window).resize(function(){
				if($(".prefact_title").length){
					location.reload();
				}
				prefect();
			});
			function prefect(){
				var swiper = new Swiper();
				var slidesPerView=0;
				if($(window).width()>=992){
					slidesPerView=4;
			    }else if($(window).width()<992&&$(window).width()>=768){
			    	slidesPerView=3;
			    	
			    }else if($(window).width()<768){
			    	slidesPerView=2;
			    }
			    swiper = new Swiper('.domain_class .swiper-container', {
					slidesPerView: slidesPerView,
					slidesPerColumn: 2,
					slidesPerColumnFill:"row",
					slidesPerGroup:slidesPerView,
					pagination: {
						el: '.swiper-pagination',
						clickable: true,
					},
					navigation: {
					    nextEl: '.swiper-button-next',
					    prevEl: '.swiper-button-prev',
					},
			    });
			    $(".domain_class .swiper-container").hover(function(){
			    	if($(this).find(".swiper-slide").length>slidesPerView*2){
			    		$(this).find(".swiper-button-next,.swiper-button-prev").show();
			    	}else{
			    		$(this).find(".swiper-button-next,.swiper-button-prev").hide();
			    	}
			    },function(){
			    	$(this).find(".swiper-button-next,.swiper-button-prev").hide();
			    });
			    
			    $(".domain_class .swiper-container").each(function(){
			    	if($(window).width()<768&&$(this).find(".swiper-slide").length>slidesPerView*2){
				    	$(this).find(".swiper-button-next,.swiper-button-prev").css({"display":"block"})
				    }else if($(window).width()<768&&$(this).find(".swiper-slide").length<=slidesPerView*2){
				    	$(this).find(".swiper-button-next,.swiper-button-prev").css({"display":"none"});
				    }
			    });
			    $(".ad_box1 .swiper-container .swiper-slide img").css({"height":$(".ad_box1 .swiper-container .swiper-slide img").outerWidth()*158/1200});
				$(".ad_box2 .swiper-container .swiper-slide img").css({"height":$(".ad_box1 .swiper-container .swiper-slide img").outerWidth()*120/1200});
		    }
			header();
			$(window).resize(header);
			function header(){
//				console.log($(window).width());
				if($(window).width()>=992&&!$(".search_area").hasClass("pull-right")){
					$(".search_area").addClass("pull-right");
//					$(".service_tel").css({"float":"left"})
				}
				else if($(window).width()<992&&$(".search_area").hasClass("pull-right")){
					$(".search_area").removeClass("pull-right").css({"display":"inline-block"}).parents(".col-lg-6").css({"text-align":"center"});
					$(".service_tel").css({"float":"right","margin-left":"32px"})
				}
			}
			

		$(".zb_div").mouseenter(function(){
			$(this).children('.zb_content').stop().animate({right:'56px'})
		}).mouseleave(function(){
			$(this).children('.zb_content').stop().animate({right:'-300px'})
		})
		$('.zb_top').click(function(){
			 $("html,body").animate({scrollTop:0}, 300);
		})
		$(document).scroll(function(){  
		　　var distance = $(document).scrollTop();  
			var height = $('.nav-tab').offset().top;
		    
		　　if(distance >= height  ) {  
			   $(".zb_top").fadeIn()
		　　} else {
			   $(".zb_top").fadeOut()
		　　}
		
		})
		
		var swiper = new Swiper('.ad_box .swiper-container', {
	      pagination: {
	        el: '.swiper-pagination',
	        clickable :true,
	      },
	      loop:true,
	      autoplay:{
	      	disableOnInteraction: false,
	      	delay:5000,
	      },
	    });
		
});
