define(var g=function(){},h={pageName:"page",pageClass:"ajaxpage-wrapper",pageHalf:2,tpl:{page:'<a href="#" class="page">{page}</a>',current:'<a href="#" class="page current">{page}</a>',next:'<a href="#" class="page">下一页</a>',prev:'<a href="#" class="page">上一页</a>',ellipsis:'<span class="ellipsis">...</span>',go:'<form class="form">跳转到第<input type="text" class="num" />页<input type="submit" class="btn" value="go" /></form>'}},a={render:function(k){var q=parseInt(k.config.pageHalf,10)||2,l,m=[],o=k.config.tpl,f=k.config.pageWrapper,n=k.total,p=k.current;function j(r,i){if(r){m.push(a.replace(r,{page:i}))}}j(o.prev);if(p>q+2){j(o.page,1);j(o.ellipsis);for(l=p-q;l<p;l++){j(o.page,l,l)}}else{for(l=1;l<p;l++){j(o.page,l)}}j(o.current,p);if(p+q+1<n){for(l=p+1;l<=p+q;l++){j(o.page,l)}j(o.ellipsis)}else{for(l=p+1;l<n;l++){j(o.page,l)}}if(p<n){j(o.page,n)}j(o.next);j(o.go);f.html(m.join(""))},replace:function(j,i){var f=/\{[^\}]+\}/g;j=j.replace(f,function(k){k=k.slice(1,-1);return i[k]||""});return j}};function d(f){this.config=$.extend({},h);$.extend(this.config.tpl,f.tpl);delete f.tpl;$.extend(this.config,f);this.current=1;this._idle=true;this.config.pageWrapper=$(this.config.pageWrapper);this.config.pageWrapper.addClass(this.config.pageClass);if($.isFunction(this.config.ajax.data)){this._getAjaxData=this.config.ajax.data}this._init();this._fixTPL()}d.prototype={_init:function(){var i=this,k=i.config.ajax,j=k.success||g,f=k.complete||g;k.complete=function(){i._idle=true;f.apply(i,arguments)};k.success=function(m){var l=i.config.getTotalPage;i._idle=true;if($.isFunction(l)){i.total=l(m)}else{i.total=m.data.totalPage}if(j.apply(i,arguments)!==false){i.config.pageWrapper.show();a.render(i)}else{i.config.pageWrapper.hide()}};k.cache=false;this._bind()},_fixTPL:function(){var j=/^<[^>]*/,i=this.config.tpl,k,l;function f(n,m){return n.replace(j,function(o){return o+' data-page="'+m+'"'})}for(var k in i){l=i[k];if(i.hasOwnProperty(k)&&l&&l.indexOf("data-page")===-1){switch(k){case"next":l=f(l,"next");break;case"prev":l=f(l,"prev");break;case"page":l=f(l,"{page}");break;case"current":l=f(l,"{page}");break}i[k]=l}}},_bind:function(){var f=this;this.config.pageWrapper.delegate("[data-page]","click",function(i){var k=$(i.target),j=k.attr("data-page");if(j){i.preventDefault()}switch(j){case"next":f.next();break;case"prev":f.prev();break;default:f.go(j);break}});this.config.pageWrapper.delegate("form","submit",function(i){i.preventDefault();var j=$("input[type=text]",this).val();f.go(j)})},reset:function(){this.current=1;this.request()},go:function(f){f=parseInt(f,10);if(f<=this.total&&f>=1){this.current=f;this.request()}},next:function(){this.current=this.current+1;if(this.current>this.total){this.current=this.total}this.request()},prev:function(){this.current=this.current-1;if(this.current<1){this.current=1}this.request()},request:function(){if(this._idle){this._idle=false;if(this._getAjaxData){this.config.ajax.data=this._getAjaxData()}this.config.ajax.data[this.config.pageName]=this.current;$.ajax(this.config.ajax)}}};return d});
