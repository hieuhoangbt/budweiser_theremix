$(document).ready(function () {
    jQuery("#login-fb").click(function () {
        jQuery(this).attr("disabled", "disabled").addClass("disable");
        if (res_status.status === 'connected' && res_status.authResponse) {
            saveInfoLoginFB();
        } else {
            loginFB();
        }
    });

//Login FB
    function loginFB() {
        FB.login(function (response) {
            if (response.authResponse != null) {
                saveInfoLoginFB();
            } else {
                jQuery().removeAttr("disabled").removeClass("disable");
            }
        }, {scope: 'email'});
    }

    function saveInfoLoginFB() {
        FB.api('/me', {fields: 'name, email, gender'}, function (response) {
            var gender = '';
            if (response.gender == 'male') {
                gender = 1;
            } else {
                gender = 2;
            }
            var url_save = URL_ROOT + "index.php?option=com_budweiser_theremix&task=user.saveLoginFB";
            jQuery.getJSON(url_save, {
                name: response.name,
                scope_id: response.id,
                email: response.email,
                gender: gender
            }, function (result) {
                if (result != null) {
                    //Do something...
                }
            });
        });
    }
});