BudWeiser.beforeStart = function () {
    ROOT_URL = URL_ROOT;
    PATH_DATA = "index.php?option=com_budweiser_theremix&task=getAllData";
    Frame_Index = 0;
    playerName = USERNAME;
};
BudWeiser.getDataBeforeAjax = function (data) {
    $.each(data, function (index, obj) {
        if (obj.id == CELEB_ID) {
            Model_Index = index;
        }
    });
};
BudWeiser.afterGetBase64 = function (base64) {
    $('#base64_image').val(base64);
};
BudWeiser.saveImageResult = function (callback) {
    $.ajax({
        type: "POST",
        url: "index.php?option=com_budweiser_theremix&task=saveImageResult",
        data: $(".form-upload").serialize(), // serializes the form's elements.
        success: function (data) {
            data = (typeof data == 'string') ? JSON.parse(data) : data;
            var URL_IMAGE = data.url_share;
            if (typeof callback == 'function')
                callback(URL_IMAGE);
        }
    });

};
BudWeiser.shareImage = function () {
    BudWeiser.saveImageResult(function (URL_IMAGE) {
        BudWeiser.handleShare(URL_IMAGE);
    });

};
BudWeiser.handleShare = function (URL_IMAGE) {
    FB.ui({
        method: 'feed',
        name: TITLE_SHARE,
        caption: TITLE_SHARE,
        description: DESC_SHARE,
        link: URL_ROOT,
        picture: URL_IMAGE,
        hashtag: HASHTAG,
        display: 'popup'
    }, function (response) {
        if (response && response.post_id) {
           window.location="/thanks";
        } else {
            console.log('error');
        }
    });
}
$(document).ready(function () {
    $('.link-share').click(function () {
        BudWeiser.shareImage();
    });
});
