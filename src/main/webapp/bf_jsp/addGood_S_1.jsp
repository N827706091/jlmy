<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>上传</title>
        <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="file-upload/css/default.css">
        <link rel="stylesheet" type="text/css" href="file-upload/css/fileinput.css" media="all"/>
        <link rel="stylesheet" type="text/css" href="css/back_css/style.css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="file-upload/js/fileinput.js" type="text/javascript"></script>
        <script src="file-upload/js/locales/zh.js" type="text/javascript"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <!-- 选择时间插件JS -->
        <script src="js/showdate.js" type="text/javascript"></script>
        
        <style type="text/css">
        	input[type="text"]{ height: 40px; font-size: 13px;}
        	/*pop*/
			.pop_bg{display:none;background:rgba(0,0,0,.35);width:100%;height:100%;position:fixed;top:0;left:0;z-index:999;}
			.pop_cont{background:white;min-width:300px;max-width:79%; height:auto;overflow:hidden;position:absolute;top:20%;left:20%; right:10%; margin-left:-150px;border-radius:5px 5px 0 0;}
			.chk_1 {
    			display: none; 
			}
 
			.chk_1 + label { 
			    background-color: #FFF; 
			    border: 1px solid #C1CACA; 
			    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05); 
			    padding: 9px; 
			    border-radius: 5px; 
			    display: inline-block; 
			    position: relative; 
			    margin-left:10px;
			} 
			 
			.chk_1:checked + label { 
			    background-color: #28bc52; 
			    border: 1px solid #92A1AC; 
			    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1); 
			    color: #243441; 
			} 
			 
			.chk_1:checked + label:after { 
			    content: '\2714'; 
			    position: absolute; 
			    top: 0px; 
			    left: 0px; 
			    color: #01fe50; 
			    width: 100%; 
			    text-align: center; 
			    font-size: 1.4em; 
			    padding: 1px 0 0 0; 
			    vertical-align: text-top; 
			} 
			#ImagesUL li{ margin-left:-35px; float: left;}
			#ImagesUL li img{ position:relative; z-index: 1; width: 300px;}
			#ImagesUL li span{
				visibility:hidden;
				display:block;
				position:relative;
				width: 50px;
				height: 50px;
				z-index:99;
				left:295px;
				top:5px;
				float:left;
				text-align:center;
				line-height:50px;
				color:#a01331;
				font-size:16px;
				font-weight:bold;
				background:url('images/back_images/icon/deleteIcon.png') no-repeat 0 0px;
			}
			#ImagesUL li span:hover{ cursor:pointer;}
		</style>
    </head>
    <script type="text/javascript">
    	//图片上传成功后传回的路径
    	var str='';
    		
    	function inputImageInput(){
    		var colourValue=$('#c_value').val();
    		if (colourValue=='') {
				alert("颜色名称不能为空！");
			}else {
				var oldValue=$('#old_c_value').val();
				if ('null'!=oldValue && null!=oldValue && ''!=oldValue) {
					if (oldValue!=colourValue) {
						$.post('Goods/updateColourDir.do',{
							'goodName':$('#goodName').val(),
							'id':$('#colourID').val(),
							'oldValue':oldValue,
							'newValue':colourValue
						},function(data){
							if ('true'==data || true==data) {
								alert("修改成功！");
							}
						});
					}
				}
	    		$('#c_Images').html('<input id="colourImage" type="file" name="file" multiple/>');
	    	    $('#colourImage').fileinput({
	    	        language: 'zh',
	    	        maxFileCount: 4,
	    	        uploadUrl: 'Goods/FileUpload.do?togo=0&goodName='+$('#goodName').val()+'&colourValue='+colourValue,
	    	        allowedFileExtensions : ['jpg', 'png','gif'],
	    	    });	
			}
    	}
    	
    	function detailsImage(){
    		var goodName=$('#goodName').val();
    		if (''==goodName) {
				alert("请输入商品名称！");
			}else{
				$('#detailsImage').html('<input id="file-zh" name="file" type="file" multiple/>');
				$('#file-zh').fileinput({
			        language: 'zh',
			        uploadUrl: 'Goods/FileUpload.do?togo=1&goodName='+goodName,
			        allowedFileExtensions : ['jpg', 'png','gif'],
			    });
			}
    	}

    	//商品提交
    	function submitGood(){
    		var toMarketTime=$('#toMarketTime').val();
    		if (''==$('#price').val()) {
    			alert("商品价格不能为空！");
    			return;
			}
    		if ('选择时间'==toMarketTime || ''==toMarketTime) {
				alert("请选择上市时间！");
			}else {
				var brand='';
				//var brand_s=;
				if ('选择品牌'==$('#brand_s').val()) {
					if (''!=$('#brand_i').val()) {
						brand=$('#brand_i').val();
					}else {
						alert("请选择或输入品牌！");
						return;
					}
				}else {
					brand=$('#brand_s').val();					
				}
				var ClassSecond_id=$('#ClassSelect').val();
				if (0==ClassSecond_id || '0'==ClassSecond_id) {
					alert("请选择商品分类！");
				}else {
					var chk_value =[];    
		    		$('input[name="colourValueList"]:checked').each(function(){    
		    			chk_value.push($(this).val());    
		    		});
		    		if (chk_value.length!=0) {
		    			//alert("777");
		    			var dataInfo=decodeURIComponent($('#addGoodInfo').serialize(),true)+'&colourValues='+chk_value+'&brand='+brand+'&ClassSecond_id='+ClassSecond_id;
		    			alert(dataInfo);
		        		$.post('Goods/addGood.do',dataInfo,function(data){
		        			if (data==true || data=='true') {
		    					alert("添加成功！");
		    				}else {
		    					alert("添加失败");
		    				}
		        		});
					}else {
						alert("你还没有添加任何颜色！");
					}	
				}
				
			}
    	}

    	function updateGoodInfo(){
    		var toMarketTime=$('#toMarketTime').val();
    		if (''==$('#price').val()) {
    			alert("商品价格不能为空！");
    			return;
			}
    		if ('选择时间'==toMarketTime || ''==toMarketTime) {
				alert("请选择上市时间！");
			}else {
				var brand='';
				if ('选择品牌'==$('#brand_s').val()) {
					if (''!=$('#brand_i').val()) {
						brand=$('#brand_i').val();
					}else {
						alert("请选择或输入品牌！");
						return;
					}
				}else {
					brand=$('#brand_s').val();
				}
				var ClassSecond_id=$('#ClassSelect').val();
				if (0==ClassSecond_id || '0'==ClassSecond_id) {
					alert("请选择商品分类！");
				}else {
					var chk_value = [];
		    		$('input[name="colourValueList"]:checked').each(function(){    
		    			chk_value.push($(this).val());    
		    		});
		    		if (chk_value.length!=0) {
		    			var dataInfo=decodeURIComponent($('#addGoodInfo').serialize(),true)+'&colourValues='+chk_value+'&brand='+brand+'&ClassSecond_id='+ClassSecond_id+'&old_goodName='+$('#old_goodName').val()+'&id='+$('#goodID').val();
		        		//alert(dataInfo);
		    			$.post('Goods/updateGood.do',dataInfo,function(data){
		        			if (data==true || data=='true') {
		    					alert("修改成功！");
		    				}else {
		    					alert("修改失败！");
		    				}
		        		});
					}else {
						alert("你还没有添加任何颜色！");
					}	
				}
				
			}
    	}
    	//获取商品上级分类
    	function getClassSecond(){
    		//alert("111");
    		$.get('Class/getClassSecond_ALL.do',function(data){
    			//alert(data);
    			if ('{}'==data) {
					alert("没有分类，请先添加分类！");
				}else {
					for(var key in data){  
	    	    		$('#ClassSelect').append('<option value="'+key+'">'+data[key]+'</option>');
	    	    	}
				}
    		});
    	}

    	//获取商品品牌
    	function getGoodBrands(){
    		$.get('Goods/getGoodBrands.do',function(data){
    			for (var i = 0; i < data.length; i++) {
					$('#brand_s').append('<option value="'+data[i]+'">'+data[i]+'</option>');
				}
    		})
    	}

    	function getGoodInfoByID() {
    		var id=$('#goodID',parent.document).val();
    		if (0!=id) {
    			$.get('Goods/getGoodID.do',{'id':id},function(data){
    				$('#goodID').val(data.id);
    				$('#old_goodName').val(data.goodName);
    				$('#goodName').val(data.goodName);
    				$('#price').val(data.price);
    				$('#ClassSelect option[value="'+data.classSecond.id+'"]').attr('selected',true);
    				$('#toMarketTime').val(data.upMarketDate);
    				$('#brand_s').val(data.brand);
    				$('input[name="expirationDate"]').val(data.expirationDate);
    				$('input[name="contents"]').val(data.contents);
    				$('input[name="fitSkin"]').val(data.fitSkin);
    				$('input[name="productFeature"]').val(data.productFeature);
    				$('input[name="specificationsAndTypes"]').val(data.specificationsAndTypes);
    				$('input[name="productionAddress"]').val(data.productionAddress);
    				$('input:radio[name="hot"]').get(data.hot).checked=true;
    				$('#old_c_value').val(data.goodColours.colourName);
    				var colours=data.goodColours;
    				for (var i = 0; i < colours.length; i++) {
    					var colours_id='colour_'+colours[i].id;
    					$('#colourList').append('<input name="colourValueList" type="checkbox" class="chk_1" checked="checked" id="'+colours_id+'" value="'+colours[i].colourName+'-'+colours[i].inventory+'"/><label onclick="updateOrAddImage(\''+data.goodName+'\',\''+colours[i].colourName+'\',\''+colours[i].inventory+'\','+colours[i].id+')">'+colours[i].colourName+'(库存：'+colours[i].inventory+')</label>');	
					}
    			});
    			$('#submitGoodInfo').attr('onclick','updateGoodInfo()');
			}			
		}
		
    	function updateOrAddImage(goodName,colourName,inventory,id){
    		$.post('Goods/getGoodColours.do',{'goodName':goodName,'colourName':colourName},function(data){
    			var imageInfo='<ul id="ImagesUL">';
    			for (var i = 0; i < data.length; i++) {
    				/* 解决src中文路径乱码	useBodyEncodingForURI="true" URIEncoding="UTF-8"*/
    				var path_before='/jlmytk/'+goodName+'/z/'+colourName;
    				var path_later=path_before+'/'+data[i];
    				imageInfo+='<li onmouseover="show(this)" onmouseout="hide(this)">';
    				imageInfo+='<span onclick="deleteImage(\''+path_before+'\',\''+data[i]+'\','+id+',this)">删除</span>';
    				imageInfo+='<img src="'+path_later+'"/></li>'
				}
    			imageInfo+='</ul>';
    			$('#add_colour_button').after('<button id="deleteColour" class="link_btn" onclick="deleteColour(\''+goodName+'\',\''+colourName+'\','+id+','+inventory+')">删除颜色</button>');
    			$('#colourID').val(id);
    			$('#old_c_value').val(colourName);
    			$('#c_value').val(colourName);
    			$('#repertory').val(inventory);
    			$('#c_Images').html(imageInfo);
    		});
    		$(".pop_bg").fadeIn();
    	}

    	function deleteColour(goodName,colourName,id,inventory) {
			$.post('Goods/deleteColour.do',{
				'goodName':goodName,
				'colourName':colourName,
				'id':id
			},function(data){
				alert(data);
				if (data==1) {
					alert("数据删除成功，文件夹删除失败，请手动操作！");
					
				}else if (data==2) {
					var old_value=colourName+'-'+inventory;
					var doc=$('input[name="colourValueList"][value="'+old_value+'"]');					
					//获取兄弟元素并删除(input后的label元素)
					doc.next().remove();
					doc.remove();
					$('#old_c_value').val('');
					$('#repertory').val(0);
					$('#deleteColour').remove();
					$(".pop_bg").fadeOut();
					alert("删除完成！");
				}else {
					alert("删除失败！");
					return;
				}
				$('#c_Images').html('');
				$('#old_c_value').val(null);
			});			
		}

    	function deleteImage(path,fileName,id,thisObj) {
			$.post('Goods/deleteGoodImage.do',{'path':path,'fileName':fileName,'id':id},function(data){
				if ('true'==data || true==data) {
					alert("删除成功！");
					//删除父元素
					$(thisObj).parent('li').remove();
				}else {
					alert("删除失败！");
				}
			});
		}

    	$(function(){
       		//根据ID获取商品信息（用于修改商品时）
    		getGoodInfoByID();
    		//获取分类
    		getClassSecond();
    		//获取品牌
    		getGoodBrands();
    		//验证是否输入商品名称
    		$("#addColour").click(function(){
    			var goodName=$('#goodName').val();
    			if (''==goodName) {
    				alert("请输入商品名称！");
    			}else{
    				$(".pop_bg").fadeIn();
    			}
    		});
    		//弹出：确认按钮
    		$(".trueBtn").click(function(){
    			$('#c_Images').html('');
    			var colourName=$('#c_value').val();
    			var repertory=$('#repertory').val();
    			var chk_value = new Array();
	    		$('input[name="colourValueList"]:checked').each(function(){    
	    			chk_value.push($(this).val());    
	    		});
				var result=0;
    			for (var i = 0; i < chk_value.length; i++) {
    				var old_value=chk_value[i];
    				var nameAndRep=old_value.split("-");;
    				if (colourName==nameAndRep[0]) {
						if (repertory==nameAndRep[1]) {
							result=2;
							break;
						}
						result=1;						
						break;
					}
    			}
    			var newDoc='';
    			if (result!=2) {
    				newDoc='<input name="colourValueList" type="checkbox" class="chk_1" checked="checked" value="'+colourName+'-'+repertory+'" onclick="return false"/><label>'+colourName+'(库存：'+repertory+')</label>';
				}
    			if (result==0) {
    				$('#colourList').append(newDoc);
				}else if (result==1) {
					//获取name=colourValueList并且value=old_value的input元素
					var doc=$('input[name="colourValueList"][value="'+old_value+'"]');
					//获取兄弟元素并删除(input后的label元素)
					doc.next().remove();
					//获取元素并替换元素
					$(doc).replaceWith(newDoc);	
				}
    			$('#old_c_value').val('');
    			$('#deleteColour').remove();
    			$(".pop_bg").fadeOut();
    		});
    		//弹出：取消或关闭按钮
    		$(".falseBtn").click(function(){
    			$('#c_Images').html('');
    			$('#deleteColour').remove();
    			$(".pop_bg").fadeOut();
    		});	
    	});
    	//显示图片右上角删除按钮
    	function show(thisObj){
    		$(thisObj).children('span').css('visibility','visible');
    	}
    	//隐藏图片右上角删除按钮
    	function hide(thisObj){
    		$(thisObj).children('span').css('visibility','hidden');
    	}
    </script>
<body>

	<section style="margin-left: 10px" class="rt_wrap content mCustomScrollbar">
	<div class="rt_content">
		<section class="pop_bg">
	    <div class="pop_cont">
	    <!--title-->
	    	<h3>弹出提示标题</h3>
	       	<!--content-->
	       	<div class="pop_cont_input"><span>颜色：</span>
	       		<input type="hidden" id="colourID" value="0"/>
	       		<input type="hidden" id="old_c_value" value="null"/>
	       		<input class="textbox" id="c_value" type="text" placeholder="请输入颜色分类名称"/> 
	       		<span class="item_name" style="margin-left: 100px">库存：</span>
        		<input id="repertory" style="height: 40px" type="number" value="0" class="textbox" placeholder="请输入库存数"/>
	       		<button style="margin-left: 100px;margin-right: 20px" id="add_colour_button" class="link_btn" onclick="inputImageInput()">添加图片</button>
	       		<p style="font-size: 11px;color: red;margin-left: 10px">*温馨提示，更改颜色名称后需重新点击添加图片按钮*</p>
	       	</div>
	       	<!--以pop_cont_text分界-->
	       	<div id="c_Images" class="pop_cont_text">
	       		<!-- <ul id="ImagesUL">
	       			<li onmouseover="show(this)" onmouseout="hide(this)">
	       				<span onclick="deleteImage('/jlmytk/123/z/123/20170216175554859100.jpg')">删除</span>
	       				<img src="/jlmytk/123/z/123/20170216175554859100.jpg"/>
	       			</li>
	       		</ul> -->
	       	</div>
	       	<div style="clear: both;"></div>
	       	<!--bottom:operate->button-->
	       	<div style="float: none;" class="btm_btn">
	        	<input type="button" value="确认" class="input_btn trueBtn"/>
	       	   	<input type="button" value="关闭" class="input_btn falseBtn"/>
	       	</div>
	    </div>
	    </section>
	     <!--结束：弹出框效果-->
		<h1 style="color:red;font-size:20px;font-weight:bold;text-align:center;">添加商品</h1>
		
    	<section>
    	
      		<h2><strong style="color:grey;">分列内容布局</strong></h2>
      		<form id="addGoodInfo" method="post">
      		<ul class="ulColumn2">
      		    <li>
        			<span class="item_name" style="width:120px;">商品名称：</span>
        			<input type="hidden" id="goodID"/>
        			<input type="hidden" id="old_goodName"/>
        			<input name="goodName" id="goodName" type="text" class="textbox textbox_295" placeholder="请输入商品名称"/>
        			<span class="errorTips">请输入商品名称</span>
       			</li>
	   			<li>
        			<span class="item_name" style="width:120px;">商品价格：</span>
        			<input name="price" id="price" type="text" class="textbox" placeholder="请输入价格"/> 元
        			<!-- <span class="errorTips">请输入价格</span> -->
       			</li>
	   			<li>
        			<span class="item_name" style="width:120px;">商品分类：</span>
        			<select class="select" id="ClassSelect">
        				<option value="0" selected="selected">选择分类</option>
        				<!-- <option>指甲油</option>
        				<option>美容面膜</option> -->
        			</select>
        			<span class="item_name" style="width:120px;">上市时间：</span>
        			<input name="upMarketDate" style="height: 40px" id="toMarketTime" value="选择时间" onClick="return Calendar('toMarketTime');" class="textbox"/>
       			</li>
       			<li id="brandInfo">
        			<span class="item_name" style="width:120px;">品牌：</span>
        			<select id="brand_s" class="select">
        				<option selected="selected">选择品牌</option>
        				<!-- <option>指甲油</option>
        				<option>美容面膜</option> -->
        			</select>
					<span class="item_name" style="width:120px;">或输入品牌：</span>
					<input id="brand_i" type="text" class="textbox" placeholder="选择品牌后无需输入"/>
					<!-- <span class="errorTips">错误提示信息...</span>  -->
       			</li>
       			<li>
       				
        			<span class="item_name" style="width:120px;">保质期：</span>
        			<input name="expirationDate" type="text" class="textbox textbox_50" placeholder="-月-"/> 月
        			<span class="item_name" style="width:120px;">净含量：</span>
        			<input name="contents" type="text" class="textbox textbox_50" placeholder="-Kg-"/> Kg	
        		</li>
        		<li>
        			<span class="item_name" style="width:120px;">适合肤质：</span>
        			<input name="fitSkin" type="text" class="textbox" placeholder="请输入信息"/>
        			<span class="item_name" style="width:120px;">化妆品特性：</span>
        			<input name="productFeature" type="text" class="textbox" placeholder="请输入信息"/>
        		</li>
        		<li>
        			<span class="item_name" style="width:120px;">规格类型：</span>
        			<input name="specificationsAndTypes" type="text" class="textbox" placeholder="请输入信息"/>
        		</li>
        		<li>
        			<span class="item_name" style="width:120px;">生产地址：</span>
        			<input name="productionAddress" type="text" class="textbox textbox_295" placeholder="请输入地址"/>
        		</li>
        		<li>
        			<span class="item_name" style="width:120px;">是否热销：</span>
        			<label class="single_selection"><input type="radio" name="hot" value="0"/>不推荐</label>
        			<label class="single_selection"><input type="radio" name="hot" value="1"/>推荐</label>
       			</li>
      		</ul>
      		</form>
      		<ul class="ulColumn2">
      			<li id="colourList">
        			<span class="item_name" style="width:120px;">颜色分类：</span>
      				<button id="addColour" class="link_btn">添加颜色</button>
       			</li>
       			<li>
       				<span class="item_name" style="width:120px;">详情图：</span>
        			<button class="link_btn" onclick="detailsImage()">添加图片</button>
        			<div id="detailsImage" style="margin-left: 123px;margin-top: 10px;max-width: 80%">			
        			
        			</div>
       			</li>
       			<li>
        			<span class="item_name" style="width:120px;"></span>
        			<input id="submitGoodInfo" type="button" onclick="submitGood()" value="提交" class="link_btn"/>
       			</li>
      		</ul>
      	</section>
    </div>
 	</section>
    </body>
</html>