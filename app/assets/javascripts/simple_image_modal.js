$(function(){
    $('#simpleImageModal').on('shown.bs.modal', function (e) {
        $('#simpleImageModal .simple_image_block .simage_picture img').one('load',function(){
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
        $('#simpleImageModal .modal-footer').animate().scrollLeft( $("#simpleImageModal .simple_image_block.active").position().left-($("#simpleImageModal .modal-footer").width()/2) );
    });
    
    $(".simple_images_container").on("click", ".simple_image_block", function(){
        console.log("asd");
        var id = $(this).attr('data-id');
        var title = $(this).find(".simage_title").text();
        var description = $(this).find(".simage_description").text();
        var src = $(this).find(".simage_picture img").prop('src');
        
        $("#simpleImageModal .modal-title").text(title);
        $("#simpleImageModal .modal-description").text(description);
        $("#simpleImageModal .modal-picture").prop("src", src);
        $("#simpleImageModal .simple_image_block").removeClass("active");
        $("#simpleImageModal .simple_image_block[data-id="+id+"]").addClass("active");
        $("#simpleImageModal").modal("show");
        console.log(src);
    });
    
    $('#simpleImageModal').on("click", ".simple_image_block", function(){
        $('#simpleImageModal .scale_animation').css("display", "block");
        var id = $(this).attr('data-id');
        var title = $(this).find(".simage_title").text();
        var description = $(this).find(".simage_description").text();
        var src = $(this).find(".simage_picture img").prop('src');
        
        $("#simpleImageModal .modal-title").text(title);
        $("#simpleImageModal .modal-description").text(description);
        $("#simpleImageModal .simple_image_block").removeClass("active");
        $("#simpleImageModal .simple_image_block[data-id="+id+"]").addClass("active");
        
        $('#simpleImageModal .modal-footer').animate().scrollLeft( $("#simpleImageModal .simple_image_block.active").position().left-($("#simpleImageModal .modal-footer").width()/2) );
        
        $('#simpleImageModal .scale_animation').prop("src", src);
        $('#simpleImageModal .scale_animation').addClass("fire");
        setTimeout(function() {
            $("#simpleImageModal .modal-picture").prop("src", src);
            $('#simpleImageModal .scale_animation').css("display", "none");
            $('#simpleImageModal .scale_animation').removeClass("fire");
        }, 1000);
    });
    
    $('#simpleImageModal').on("click", ".modal_controller", function(){
        $('#simpleImageModal .scale_animation').css("display", "block");
        var active = $("#simpleImageModal .simple_image_block.active");
        if($(this).hasClass("left")){
            active = $("#simpleImageModal .simple_image_block.active").prev();
            if($(active).length ==0){
                active = $("#simpleImageModal .simple_image_block").last();
            }
        }
        else{
            active = $("#simpleImageModal .simple_image_block.active").next();
            if($(active).length ==0){
                active = $("#simpleImageModal .simple_image_block").first();
            }
        }
        console.log(active);
        $("#simpleImageModal .simple_image_block.active").removeClass("active");
        $(active).addClass("active");
        
        var title = $(active).find(".simage_title").text();
        var description = $(active).find(".simage_description").text();
        var src = $(active).find(".simage_picture img").prop('src');
        
        $("#simpleImageModal .modal-title").text(title);
        $("#simpleImageModal .modal-description").text(description);
        
        $('#simpleImageModal .modal-footer').animate().scrollLeft( $("#simpleImageModal .simple_image_block.active").position().left-($("#simpleImageModal .modal-footer").width()/2) );
        $('#simpleImageModal .scale_animation').prop("src", src);
        $('#simpleImageModal .scale_animation').addClass("fire");
        setTimeout(function() {
            $("#simpleImageModal .modal-picture").prop("src", src);
            $('#simpleImageModal .scale_animation').css("display", "none");
           $('#simpleImageModal .scale_animation').removeClass("fire");
        }, 1000);
    });
});