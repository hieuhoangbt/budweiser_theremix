BudWeiser.beforeStart=function(){
    var ROOT_URL=URL_ROOT;
    var PATH_DATA="index.php?option=com_budweiser_theremix&task=getAllData";
};
BudWeiser.afterGetBase64=function(base64){
    $('#base64_image').val(base64);
    var title_share = "";
    var caption = "";
    var desc_share = "";
    var url_img="";
    $.ajax({
        type: "POST",
        url: "index.php?option=com_budweiser_theremix&task=saveImageResult",
        data: $(".upload-image").serialize(), // serializes the form's elements.
        success: function (data) {
            data = JSON.parse(data);
            url_img=data.url_share;

        }
    });
    $('.link-share').click(function () {
        shareImage(url_img, title_share, caption, desc_share);
    });
};
$(document).ready(function () {

});