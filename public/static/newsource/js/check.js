//<script type="text/javascript">
		//1.成为焦点，错误提示隐藏
		//2.失去焦点
		  //1）为空判断
		  //2）正则匹配
		//3.提交获取数据AJAX
		$(function(){
			
//			$(".mobile").focus();
			//得到焦点
			$(".list li input").focus(function(){
				$(this).next().text('').hide();
			})
			//失去焦点
			//e == event对象
			$('.name').blur(function(e){
				var current = $(e.target)
				var value = current.val();
				var filter = /^[\u4e00-\u9fa5]{2,4}$/;//中文字符在2到4位
				formEvent(current,value,filter,'姓名不能为空','姓名格式错误')
			})
			
			$('.contact').blur(function(e){
				var current = $(e.target)
				var value = current.val();
				var filter = /^[1][3,4,5,7,8][0-9]{9}$/;
				formEvent(current,value,filter,'联系方式不能为空','联系方式错误')
			})
			
			$('.price').blur(function(e){
				var current = $(e.target)
				var value = current.val();
				var filter = /^$/;
				formEvent(current,value,filter,'价格不能为空','价格格式错误')
			})
			
			
			function formEvent(current,value,filter,text1,text2){
				if(value == ''){
					current.next().text(text1).show();
				}else if(filter.test(value)){
					//格式判断
					current.next().text("").hide()
				}else{
					current.next().text(text2).show()
				}
			}
			
			var inputs = $("input");
			inputs.eq(0).focus();
			inputs.each(function(i,e){
				$(e).keydown(function(ev){
					var ev = window.event || ev;
					var nextIndex=0;					
					if(ev.keyCode == 13 || ev.keyCode == 40){
						if(i<inputs.length-1){
							nextIndex=i+1;
						}else{
							i=-1;
							nextIndex=i+1;
						}
					}
					inputs.eq(nextIndex).focus();
					
					if(ev.keyCode == 38){
						 nextIndex;
						if(i<inputs.length){
							nextIndex = i-1;
						}
						i--;
						inputs.eq(nextIndex).focus();
						console.log(nextIndex);
						if(nextIndex = 0){
							inputs.eq(-1).focus();
						}
					}
					
				})
			})
		})
		
