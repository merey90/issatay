function  fixRatio(){
  $('.simple_images_container .simple_image_block .simage_picture img').one('load',function(){
    var width = $(this).closest(".simple_image_block").width();
    var height = $(this).closest(".simple_image_block").height();
    var ratio = width/height;
    var w =$(this).width();
    var h =$(this).height();
    var img_r = w/h;
    if(img_r >= ratio){
      $(this).css("height", height);
    }
    else{
      $(this).css("width", width);
    }
    
  })
    .filter(function(){
      return this.complete;
  })
  .load();
}