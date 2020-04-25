var scrolled;
window.onscroll = function() {
    scrolled = window.pageYOffset || document.documentElement.scrollTop;
    if(scrolled > 50){
        $("menu").css({"background": "black"})
    }
    if(100 > scrolled){
        $("menu").css({"background": "white"})
    }

}
