var URL_IMAGE = '';
BudWeiser.beforeStart = function () {
    ROOT_URL = URL_ROOT;
    PATH_DATA = "index.php?option=com_budweiser_theremix&task=getAllData";
    Frame_Index = 0;
    playerName = USERNAME;
};
BudWeiser.beforeGetBase64=function(){
    $('.link-snap-prev').hide();
    $('.link-share').hide();
}
BudWeiser.getDataBeforeAjax = function (data) {
    $.each(data, function (index, obj) {
        if (obj.id == CELEB_ID) {
            Model_Index = index;
        }
    });
};
BudWeiser.afterGetBase64 = function (base64) {
    $('#base64_image').val(base64);
    BudWeiser.saveImageResult();
};
BudWeiser.saveImageResult = function () {
    $.ajax({
        type: "POST",
        url: "index.php?option=com_budweiser_theremix&task=saveImageResult",
        data: $(".form-upload").serialize(), // serializes the form's elements.
        success: function (data) {
            data = (typeof data == 'string') ? JSON.parse(data) : data;
            console.log(data);
            URL_IMAGE = data.url_share;
            $('.link-snap-prev').show();
            $('.link-share').show();
        }
    });
};
BudWeiser.shareImage = function () {
    FB.ui({
        method: 'feed',
        name: TITLE_SHARE,
        caption: TITLE_SHARE,
        description: DESC_SHARE,
        link: URL_ROOT,
        picture: URL_ROOT + URL_IMAGE,
        hashtag: HASHTAG,
        display: 'popup'
    }, function (response) {
        if (response && response.post_id) {
            BudWeiser.handlerAfterShare(1);
            window.location = "/thanks";
        } else {
            BudWeiser.handlerAfterShare(0);
        }
    });
};
BudWeiser.handlerAfterShare = function (state) {
    $.ajax({
        type: "POST",
        url: "index.php?option=com_budweiser_theremix&task=updateState",
        data: {
            img: URL_IMAGE,
            state: state
        }
    });
}
$(document).ready(function () {
    $('.link-share').click(function () {
        BudWeiser.shareImage();
    });
});
