// ============================================================= 
//                 ===== spherical 3D particles ===== 
// script written by Gerard Ferrandez - September 26, 2009 
// http://www.dhteumeuleu.com 
// ============================================================= 
 
function sphere3D(json){
	var tm = { 
		/* ==== variables ==== */ 
		O : [], 
		x  : 0, 
		y  : 0, 
		ax : 0, 
		ay : 0, 
	 
		/* ==== init script ==== */ 
		init : function () { 
			/* ==== screen ==== */ 
			tm.screen = document.getElementById('screen'); 
			tm.screen.onselectstart = function () { return false; } 
			tm.screen.ondrag        = function () { return false; } 
			onresize = tm.resize; 
			/* ==== create HTML elements ==== */ 
			for (var i = 0; i < 200; i++) { 
				o = {}; 
				/* ==== plot ==== */ 
				o.plo = document.createElement('div'); 
				o.plo.className = 'plo out'; 
				tm.screen.appendChild(o.plo); 
				/* ==== 3D coordinates ==== */ 
				if (i < 75) var r = 1; else var r = .33 
				var a = Math.random() * Math.PI * 2; 
				var b = Math.random() * Math.PI * 2; 
				o.x = Math.sin(a) * Math.sin(b) * r; 
				o.y = Math.cos(a) * Math.sin(b) * r; 
				o.z = Math.cos(b) * r; 
				/* ==== push object ==== */ 
				tm.O.push(o); 
				/* ==== 3D transform function ==== */ 
				o.transform = function () { 
					/* ==== Rotation ==== */ 
					var  z = this.y *  tm.sx + this.z *  tm.cx; 
					this.y = this.y *  tm.cx + this.z * -tm.sx; 
					this.z = this.x * -tm.sy + z * tm.cy; 
					this.x = this.x *  tm.cy + z * tm.sy; 
					/* ==== 3D to 2D ==== */ 
					var scale = 1 / (1 + this.z); 
					var x = this.x * scale * tm.screen.w * (tm.screen.h / tm.screen.w); 
					var y = this.y * scale * tm.screen.h; 
					var c = Math.round(256 + (-this.z * 256)); 
					/* ==== plot ==== */ 
					var p = this.plo.style; 
					p.left   = Math.round(x + tm.screen.w - scale * 2) + 'px'; 
					p.top    = Math.round(y + tm.screen.h - scale * 2) + 'px'; 
					p.width  = Math.round(scale * 4) + 'px'; 
					p.height = Math.round(scale * 4) + 'px'; 
					p.background = 'rgb('.concat((c),',',(c),',',(512 - c),')'); 
					p.zIndex = 200 + Math.floor(-this.z * 100); 
				} 
			} 
			/* ==== start script ==== */ 
			tm.resize(); 
			tm.run(); 
		}, 
	 
		/* ==== resize window ==== */ 
		resize : function () 
		{ 
			tm.screen.w = tm.screen.offsetWidth / 2; 
			tm.screen.h = tm.screen.offsetHeight / 2; 
		}, 
	 
		/* ==== main loop ==== */ 
		run : function () 
		{ 
			/* ==== mouse ==== */ 
			tm.x = mouse.x; 
			tm.y = mouse.y; 
			var sx = (tm.y - tm.ax) * (10  / tm.screen.h); 
			var sy = (tm.x - tm.ay) * (10 / tm.screen.w); 
			tm.ax += sx; 
			tm.ay += sy; 
			/* ==== angles sin and cos ==== */ 
			tm.cx = Math.cos( sx * .01); 
			tm.sx = Math.sin( sx * .01); 
			tm.cy = Math.cos(-sy * .01); 
			tm.sy = Math.sin(-sy * .01); 
			/* ==== loop through all points ==== */ 
			for (var i = 0, o; o = tm.O[i]; i++) o.transform(); 
			/* ==== loop ==== */ 
			setTimeout(tm.run, 16); 
		} 
	} 
}
/* ==== global mouse position ==== */ 
var mouse = { 
	x : 0, 
	y : 0 
} 
document.onmousemove = function(e) { 
	if (window.event) e = window.event; 
	mouse.x = e.clientX; 
	mouse.y = e.clientY; 
	return false; 
} 
 
/* ==== start script ==== */ 
onload = function () { 
	setTimeout(tm.init, 500); 
} 