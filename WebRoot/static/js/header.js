$(function(){
	function init(){

		var $brand = $('#J_brand'),
		    $classify = $('#J_classify'),
		    $container = $('.container'),
		    $content = $container.find('.content'),
		    $brandBox = $container.find('.brand_submenubox'),
		    $classifyBox = $container.find('.classify_submenubox'),
		    $registrationWrap = $container.find('.registrationWrap'),
		    cTop = $content.position().top,
		    cLeft = $content.position().left,
		    $tip = $('#tip');

		 $brandBox.css({
			top:cTop + 60,
			left:cLeft+36
		});
	 	$classifyBox.css({
			top:cTop+60,
			left:cLeft+36
		});

	 	//点击导航
		$container.on('click','.nav',function(){
			var $this = $(this);
		    $container.find('.nav').removeClass('current');
		    $this.addClass('current');
		    $registrationWrap.hide();

			if($this.attr('id') === 'J_brand'){
				$brandBox.show();
				$classifyBox.hide();
			}else if($this.attr('id') === 'J_classify'){
				$classifyBox.show();
			    $brandBox.hide();
			}else{
				$classifyBox.hide();
			    $brandBox.hide();
			}
		});

		//分类 && 品牌
		$container.on('click','.nav_item',function(){
			var $this = $(this),
				$wrap = $this.parents('.wrap'),
				brandId = '',
				classifyId ='';
		    $container.find('.nav').removeClass('current');

			//品牌
			if($wrap.hasClass('brand_submenubox')){
				brandId = $this.attr('data-id');
				if(classifyId !='' && brandId !=''){
					window.location.href ='brand.do?action=detail&id='+brandId+'&categoryId='+classifyId;
				}else{
					$wrap.hide();
					$classifyBox.show();
					$classify.addClass('current');
				}
			//分类
			}else if($wrap.hasClass('classify_submenubox')){
				classifyId = $this.attr('data-id');
				if(classifyId !='' && brandId !=''){
					window.location.href ='brand.do?action=detail&id='+brandId+'&categoryId='+classifyId;
				}else{
					$wrap.hide();
					$brandBox.show();
					$brand.addClass('current');
				}
			}
		});

		//注册 && 登陆
		$container.on('click','.userBtn',function(){
			var $this = $(this);
			$registrationWrap.css({
				top:cTop +60
			}).show();

		});
		//密码
		$container.on('click','.submit',function(){
			var userName = $('.userName').val(),
				email = $('.email').val(),
				weiXin = $('.weiXin').val(),
				password = $('.password').val(),
				rePassword = $('.rePassword').val();

			$tip.hide();
			if(userName==''||email==''||weiXin==''||password==''){
				$tip.html('请检查必填项').show();
				return;
			}else if(password != rePassword){
				$tip.html('两次输入的密码不一致').show();
				return
			}
			$.post('register.do', {
				username: userName,
				email: email,
				weixin: weiXin,
				p: password,
				pc:rePassword,
				ajax:true
			}, function(json) {
				 json = $.parseJSON(json);
				if(!!json.success){
					//隐藏注册
					$registrationWrap.hide();
					window.location.reload(); 
				}else{
					$tip.html(json.message).show();
				}
			});
		});

		//左侧菜单
		$('.aside_nav').on({
			mouseenter:function(){
				var $this = $(this);
				$this.find('.classification').addClass('current');
				$this.find('.submenubox').show();
			},
			mouseleave:function(){
				var $this = $(this);
				$this.find('.classification').removeClass('current');
				$this.find('.submenubox').hide();
			},
			click:function(event){
				var target = $(event.target);
			    var currentTarget = $(event.currentTarget);
			    var $classification = currentTarget.find('.classification');
			    var className = $classification.attr('name');
			    var $submenubox = currentTarget.find('.submenubox');
			    var brandId ='';
			    var classifyId= '';
				if(className =='brand'){
					brandId = target.attr('id');
					if(classifyId !='' && brandId !=''){
						window.location.href ='brand.do?action=detail&id='+brandId+'&categoryId='+classifyId;
					}else{
						$classification.removeClass('current');
						currentTarget.siblings('.aside_nav').find('.classification').addClass('current');
						currentTarget.siblings('.aside_nav').find('.submenubox').show();
						$submenubox.hide();
					}
				}
				if(className =='classify'){
					classifyId = target.attr('id');
					if(classifyId !='' && brandId !=''){
						window.location.href ='brand.do?action=detail&id='+brandId+'&categoryId='+classifyId;
					}else{
						$classification.removeClass('current');
						currentTarget.siblings('.aside_nav').find('.classification').addClass('current');
						currentTarget.siblings('.aside_nav').find('.submenubox').show();
						$submenubox.hide();
					}
				}
			}
		});		
		
	}

	init();
})