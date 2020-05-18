var scrolled;
window.onscroll = function() {
    scrolled = window.pageYOffset || document.documentElement.scrollTop;
    if(scrolled > 1){
        $("menu").css({"border-bottom": "0.5px solid black"})
    }
    if(100 > scrolled){
        $("menu").css({"border-bottom": "none";})
    }

}
