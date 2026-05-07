function Banner(obj,allTime,interval,autoTime){
	this.allNode = {
		parent:document.getElementById(obj.parent),
		prev:document.getElementById(obj.prev),
		next:document.getElementById(obj.next),
		bannerImgs:obj.bannerImgs,
		bannerBtns:obj.bannerBtns
	};
	this.AllTime = allTime;//位移总时间
	this.Interval = interval;//位移间隔时间
	this.imgs = this.getClassName(this.allNode.bannerImgs)[0];
	this.Allbtn = this.getClassName(this.allNode.bannerBtns)[0];
	this.oUl = this.imgs.getElementsByTagName('ul')[0];
	this.oLi = this.imgs.getElementsByTagName('li');
	this.btns = this.Allbtn.getElementsByTagName('span');
	this.oUl.style.width = this.oLi[0].offsetWidth*this.oLi.length+'px';
	this.oUl.style.left=-this.oLi[0].offsetWidth+'px';
	this.oLiWidth = this.getStyle(this.oLi[0],'width');
	this.AutoTime = autoTime;//自动播放的时间
	this.index = 1;//轮播按钮索引
	this.onOff = false;//每次切换完成后才能切换下一张，解决连续点击bug
	this.timer = null;
	var me = this;
	
	//向上切换图片
	this.allNode.next.onclick=function(){
		me.index += 1;
		me.showBtn();
		if(!me.onOff){
			me.animate(-me.oLiWidth);
		};
	};
	//向下切换图片
	this.allNode.prev.onclick = function(){
		me.index -= 1;
		me.showBtn();
		if(!me.onOff){
			me.animate(me.oLiWidth);
		};
	};
	//按钮切换
	for(var i = 0;i < this.btns.length;i++){
		this.btns[i].index = i;
		this.btns[i].onclick=function(){
			var myIndex = this.index+1;
			var offset = -me.oLiWidth * (myIndex-me.index);
			me.animate(offset);
			me.index = myIndex;
			me.showBtn();
		};
	};
	this.autoPlay();
	this.imgs.onmouseover=function(){
		clearInterval(me.timer);
	};
	this.imgs.onmouseout=function(){
		me.autoPlay();
	};
};

Banner.prototype={
	//自动播放函数
	autoPlay:function(){
		var me = this;
		this.timer = setInterval(function(){
			me.allNode.next.onclick();
		},this.AutoTime);
	},
	//显示轮播按钮函数
	showBtn:function(){
		for(var i=0;i<this.btns.length;i++){
			if(this.btns[i].className == 'banner-on'){
				this.btns[i].className = '';
				break; 
			}
		};
		if( this.index < 1 ){
			this.index = this.btns.length;
		}else if(this.index > this.btns.length ){
			this.index = 1;
		};
		this.btns[this.index-1].className='banner-on';
	},
	//切换过渡函数
	animate:function(offset){
		var me = this;
		this.oUlLeft = this.getStyle(this.oUl,'left') + offset;
		this.speed = offset/(this.AllTime/this.Interval);
		this.onOff = true;

		function startPlay(){
			if((me.speed<0 && me.getStyle(me.oUl,'left')>me.oUlLeft)||me.speed>0 && me.getStyle(me.oUl,'left')<me.oUlLeft){
				me.oUl.style.left = me.getStyle(me.oUl,'left')+me.speed +'px';
				//递归方式去调用函数，直到条件不成立就结束
				setTimeout(startPlay,me.interval);
			}else{
				me.onOff = false;
				me.oUl.style.left = me.oUlLeft+'px';
				if(me.oUlLeft>-me.oLiWidth*1){
					me.oUl.style.left = -me.oLiWidth*(me.oLi.length-2)+'px';
				}else if(me.oUlLeft<-me.oLiWidth*(me.oLi.length-2)){
					me.oUl.style.left = -me.oLiWidth*1 +'px';
				};
			};
		};
		startPlay();
	},
	getClassName:function(cls){
		this.nodes = this.allNode.parent.getElementsByTagName('*');
		var i =0;
		var result = [];
		for(;i<this.nodes.length;i++){
			if(this.nodes[i].className==cls){
				result.push(this.nodes[i]);
			}
		};
		return result;
	},
	getStyle:function(obj,attr){
		 if(obj.currentStyle){  
	        return parseInt(obj.currentStyle[attr]);  
	     }else{  
	        return parseInt(getComputedStyle(obj,false)[attr]);  
	     };
	}
};