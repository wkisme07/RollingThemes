(function(a){function b(b,c){return parseInt(a.css(b[0],c))||0}function c(a){return a[0].offsetWidth+b(a,"marginLeft")+b(a,"marginRight")}function d(a){return a[0].offsetHeight+b(a,"marginTop")+b(a,"marginBottom")}a.fn.jCarouselLite=function(b){return b=a.extend({btnPrev:null,btnNext:null,btnGo:null,mouseWheel:!1,auto:null,speed:200,easing:null,vertical:!1,circular:!0,visible:3,start:0,scroll:1,beforeStart:null,afterEnd:null},b||{}),this.each(function(){function t(){return m.slice(p).slice(0,l)}function u(c){if(!e){b.beforeStart&&b.beforeStart.call(this,t());if(b.circular)c<=b.start-l-1?(i.css(f,-((n-l*2)*q)+"px"),p=c==b.start-l-1?n-l*2-1:n-l*2-b.scroll):c>=n-l+1?(i.css(f,-(l*q)+"px"),p=c==n-l+1?l+1:l+b.scroll):p=c;else{if(c<0||c>n-l)return;p=c}e=!0,i.animate(f=="left"?{left:-(p*q)}:{top:-(p*q)},b.speed,b.easing,function(){b.afterEnd&&b.afterEnd.call(this,t()),e=!1}),b.circular||(a(b.btnPrev+","+b.btnNext).removeClass("disabled"),a(p-b.scroll<0&&b.btnPrev||p+b.scroll>n-l&&b.btnNext||[]).addClass("disabled"))}return!1}var e=!1,f=b.vertical?"top":"left",g=b.vertical?"height":"width",h=a(this),i=a("ul",h),j=a("li",i),k=j.size(),l=b.visible;b.circular&&(i.prepend(j.slice(k-l-1+1).clone()).append(j.slice(0,l).clone()),b.start+=l);var m=a("li",i),n=m.size(),p=b.start;h.css("visibility","visible"),m.css({overflow:"hidden","float":b.vertical?"none":"left"}),i.css({margin:"0",padding:"0",position:"relative","list-style-type":"none","z-index":"1"}),h.css({overflow:"hidden",position:"relative","z-index":"2",left:"0px"});var q=b.vertical?d(m):c(m),r=q*n,s=q*l;m.css({width:m.width(),height:m.height()}),i.css(g,r+"px").css(f,-(p*q)),h.css(g,s+"px"),b.btnPrev&&a(b.btnPrev).click(function(){return u(p-b.scroll)}),b.btnNext&&a(b.btnNext).click(function(){return u(p+b.scroll)}),b.btnGo&&a.each(b.btnGo,function(c,d){a(d).click(function(){return u(b.circular?b.visible+c:c)})}),b.mouseWheel&&h.mousewheel&&h.mousewheel(function(a,c){return c>0?u(p-b.scroll):u(p+b.scroll)}),b.auto&&setInterval(function(){u(p+b.scroll)},b.auto+b.speed)})}})(jQuery);