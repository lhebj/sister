$(function(){
	var $toolControl  = $('.controlContainer').find('a');
	var $tool = $('.toolBarWrap').find('a');
	var len = $toolControl.length;
	var flag = false;
    var tmplIndex = 0;
	$toolControl.on('click',function(e){
		e.preventDefault();
		var $this = $(this);
		var index = $toolControl.index($this);
		if(index === (len-1) && !flag){
			for(var k=0 ;k<len ;k++){
				$toolControl.eq(k).attr('class','tool_control_open tool_control_open_'+(k+1));
				$tool.eq(k).attr('class','tool_open tool_open_'+(k+1));
			}
			flag = true;
			return;
		}else if(index === (len-1) && flag){
			if(index != tmplIndex){
				for(var n=0 ;n<len;n++){
					$toolControl.eq(n).attr('class','tool_control_open tool_control_open_'+(n+1));
					$tool.eq(n).attr('class','tool_open tool_open_'+(n+1));
				}

			}else{
				for(var n=0 ;n<len ;n++){
					$toolControl.eq(n).attr('class','tool_control tool_control_'+(n+1));
					$tool.eq(n).attr('class','tool tool_'+(n+1));
				}
			}
			tmplIndex=0;
			tmplIndex = index
			flag = false;
			return;
		}else if(index < (len-1)){
			if(tmplIndex != index){
				for(var i=0;i<len;i++){
					$toolControl.eq(i).attr('class','tool_control tool_control_'+(i+1));
					$tool.eq(i).attr('class','tool tool_'+(i+1));
				}
				$this.attr('class','tool_control_open tool_control_open_'+(index+1));
				$tool.eq(index).attr('class','tool_open tool_open_'+(index+1));
				flag = false;
				tmplIndex=0;
				tmplIndex = index;
			}else{
				tmplIndex=0;
				tmplIndex = index
			    if(flag){
					$this.attr('class','tool_control tool_control_'+(index+1));
					$tool.eq(index).attr('class','tool tool_'+(index+1));
					flag = false;
				}else{
					$this.attr('class','tool_control_open tool_control_open_'+(index+1));
					$tool.eq(index).attr('class','tool_open tool_open_'+(index+1));
					flag = true;
				}
			}
		}
		
		
	});

	
	
    //当前时间
    var year = new Date().getFullYear(),
    	month = new Date().getMonth()+1,
    	day = new Date().getDate(),
    	week = new Date().getDay(),
    	weeks = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
  	$weatherInfo = $('.weatherInfo');
  	$weatherInfo.find('.data').html(year+'-'+month+'-'+day+'  '+weeks[week]);
})