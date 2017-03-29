$(function(){
	// 详情数量减少
	$('.details_con .minus,.cart_count .minus').click(function(){
		var _index=$(this).parent().parent().index()-1;
		var _count=$(this).parent().find('.count');
		var _val=_count.val();
		if(_val>1){
			_count.val(_val-1);
			$('.details_con .selected span').eq(_index).text(_val-1);
			
		}
		if(_val<=2){
			$(this).addClass('disabled');
		}
		
	});

	// 详情数量添加
	$('.details_con .add,.cart_count .add').click(function(){
		var _index=$(this).parent().parent().index()-1;
		var _count=$(this).parent().find('.count');
		var _val=_count.val();
		$(this).parent().find('.minus').removeClass('disabled');
		_count.val(_val-0+1);
		$('.details_con .selected span').eq(_index).text(_val-0+1);
		
	});

	//详情属性选择
	$('.details_con ul li dd').click(function(e) {
		clickChoose(this);
	});
	
	//处理默认选中的
	$('.details_con ul li dd[class="check"]').each(function(){
		clickChoose(this);
	});
});

//获取属性值图片
function getPropValImgs(valId){
	 for(var i=0;i<propValueImgList.length;i++){
		  if(propValueImgList[i].valueId==valId){
			  var imgList = propValueImgList[i].imgList;
			  var str = "";
			  var strCounts = "";
			  for(var j=0;j<imgList.length;j++){

				  str+= '<li style="display: table-cell; vertical-align: middle; max-width: 768px;">';
				  str+= '<a href="#"><img style="max-width:100vw;max-height:80vw;margin:auto;" src="'+photoPath+imgList[j]+'"></a>';
				  str+= '</li>';
				  
				  strCounts+= '<li></li>';
			  }
			  
			  $("#slide .tempWrap ul").html(str);
			  $("#slide .hd ul").html(strCounts);
			  
			//插件：图片轮播
			 TouchSlide({
			  	slideCell:"#slide",
			  	titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
			  	mainCell:".bd ul",
			  	effect:"left",
			  	autoPlay:false,//自动播放
			  	autoPage:true, //自动分页
			  	switchLoad:"_src" //切换加载，真实图片路径为"_src"
			  });

			  break;
		  }
	  }
}

//选中属性
function clickChoose(object){
	if (!$(object).hasClass('attr_sold_out')) {
		$(object).addClass('check').siblings().removeClass('check');
	}
}

//获取参数页面
function queryParameter(element,prodId){
	element.addClass('hadGoodsContent');
 }
 