/* globals Variables*/
var ROOT_URL = 'http://localhost/budweiser_theremix/app/';
var PATH_DATA = 'js/data.json';
var COUNTDOWN_OPT = 10;
var Model_Index = 11;
var Frame_Index = 0;
var base64 = '';
var hasCamera = true;
var hasTag = '#TEMTHIEUBAOTRAM';
var playerName = 'DUC VIET';
var zoom_canvs = 0.7;
var trackCamera = false;
/*TOOL Maker*/

var Tool = function (options) {
    this.name = 'budweiser theremix';
    this.version = '1.0';
    this.canvas = new fabric.Canvas('canvas');
    this.max = {width: $(window).width(), height: $(window).height()};
    this.ratioW = this.max.width / this.max.height;
    this.pictureFile = {};
    this.imagesUp = {};
    this.imagesUpNew = {};
    this.typePicture = {frame: 0, model: 1, file: 2};
    this.typeVideo = {model: 0, capturing: 1};
    this.renderCanvas(this.max.width);
};
Tool.prototype.renderCanvas = function (width) {
    var w_width = width || window.innerWidth;
    if($('body').hasClass('fa')) {
        w_width = 810;
        this.max = {width: 1920, height: 1080};
        this.ratioW = this.max.width / this.max.height;
    }
    var w_height = w_width / this.ratioW;

    this.canvas.setWidth(w_width);
    this.canvas.setHeight(w_height);
    this.canvas.backgroundColor = "#dfe7e9";
    this.canvas.renderAll();
}
Tool.prototype.addVideo = function (video, end, type) {
    var self = this;
    var _left = 0;
    var _top = 0;
    var ratio_video = $(video).width() / $(video).height();
    var _width = self.canvas.width;
    var _height = _width / ratio_video;
    var videoFrame = new fabric.Image(video, {
        top: _top,
        left: _left,
        width: _width,
        height: _height,
        flipX: true

    });
    videoFrame.selectable = false;
    // self.canvas.add(videoFrame);
    self.canvas.insertAt(videoFrame, 0);
    videoFrame.getElement().play();
    var stop_end = false;
    videoFrame.getElement().onended = function () {
        if (end && typeof end == "function") {
            // end video
            stop_end = true;
            end();

        }
    };

    var render = function () {
        self.canvas.renderAll();
        if (stop_end == true) {
            fabric.util.cancelAnimationFrame(render);
        } else {
            fabric.util.requestAnimFrame(render);
        }

    }

    // video.play();
    fabric.util.requestAnimFrame(render);

}

Tool.prototype.snapCamera = function (video, camera, err) {
    var self = this;
    var isIE = detectIE();
    var errorCallback = function (e) {
        // alert('PC không hỗ trợ Camera! :( ');
        $('.up_file').addClass('ie');
        err(isIE);
    };
    if (isIE != false)
        return err(isIE);

    navigator.getUserMedia = navigator.getUserMedia ||
            navigator.webkitGetUserMedia ||
            navigator.mozGetUserMedia ||
            navigator.msGetUserMedia;
    if (navigator.getUserMedia) {
        // var video = $(video);
        navigator.getUserMedia({audio: false, video: true}, function (stream) {
            var track = stream.getTracks()[0];  // if only one media track

            if (camera && typeof camera == "function") {
                camera(track);
            }
            var video_elm = document.querySelector(video);
            video_elm.src = window.URL.createObjectURL(stream);
            video_elm.onloadedmetadata = function (e) {
                // Ready to go. Do some stuff.
                self.addVideo(video_elm, self.typeVideo.capturing);
            };

        }, errorCallback);
    } else {
        $(video).src = ''; // fallback.

    }
}

Tool.prototype.addPicture = function (src, type, end) {
    var self = this;
    var canvas = self.canvas;
    fabric.Image.fromURL(src, function (img) {
        if (type == self.typePicture.file) {
            var ratio_w = img.width / img.height;

            var w_img = self.canvas.width;
            var h_img = w_img / ratio_w;
            img.set({
                width: w_img,
                height: h_img,
                top: 0,
                left: 0,
                evented: true,
                selectable: true,
                centeredScaling: true,
                opacity: 0,
                cornerColor: 'rgba(255,255,255,0)',
                hasBorders: false
            });
            self.imagesUp = img;
            img.clone(function (obj) {
                obj.set({
                    opacity: 1,
                    evented: false,
                    selectable: false
                });
                self.imagesUpNew = obj;
                canvas.insertAt(obj, 0);
            })
            canvas.insertAt(img, 0);
            img.on('moving', function (e) {
                var top = img.getTop();
                var left = img.getLeft();
                var width = img.getWidth();
                var height = img.getHeight();
                var options = {top: top, left: left, width: width, height: height};
                self.resetObject(self.imagesUpNew, options);
            });
            img.on('scaling', function (e) {
                var top = img.getTop();
                var left = img.getLeft();
                var width = img.getWidth();
                var height = img.getHeight();
                var options = {top: top, left: left, width: width, height: height};
                self.resetObject(self.imagesUpNew, options);
            });
        }
        if (type == self.typePicture.model) {
            var _w = self.canvas.width, _ratio = img.width / img.height, _h = _w/_ratio;
            img.set({width: _w, height: _h, evented: false, selectable: false});

            self.imagesframe = img;
            canvas.insertAt(img, 0);

        }
        if (type == self.typePicture.frame) {

            if(img.width)
            img.set({width: self.canvas.width, height: self.canvas.height, evented: false, selectable: false });

            canvas.add(img);
            if (end && typeof end == "function") {
                end();
            }
        }

        canvas.renderAll();

    });

}
Tool.prototype.fileRead = function (_event, pos, sucess) {
    var self = this;
    var imgUpload = new Image();

    if (window.File && window.FileReader && window.FileList && window.Blob) {
        var files = _event.target.files;
        var file = files[0];
        if (!file.type.match("image"))
            return;
        var picReader = new FileReader;
        picReader.addEventListener("load", function (event) {
            var picFile = event.target;
            imgUpload.onload = function () {
                var ratio_imageUp = imgUpload.width / imgUpload.height;

                /*
                 var fitimg = self.fitImageOn(imgUpload, self.canvas.width, self.canvas.height);
                 self.pictureFile.width = fitimg.width;
                 self.pictureFile.height = fitimg.height;
                 */
                var type_file = 2;
                self.canvas.remove(self.imagesUp);
                self.addPicture(self.pictureFile.src, type_file);
                if (typeof sucess == "function") {
                    sucess();
                }
            }
            imgUpload.src = picFile.result;
            self.pictureFile.src = imgUpload.src;

        });

        picReader.readAsDataURL(file);

    } else {
        alert("Your browser does not support File API");
    }
}
Tool.prototype.fitImageOn = function (imageObj, canvasWidth, canvasHeight) {
    var imageAspectRatio = imageObj.width / imageObj.height;
    var canvasAspectRatio = canvasWidth / canvasHeight;
    var renderableHeight, renderableWidth;

    if (imageAspectRatio < canvasAspectRatio) {
        renderableHeight = canvasHeight;
        renderableWidth = imageObj.width * (renderableHeight / imageObj.height);

    } else if (imageAspectRatio > canvasAspectRatio) {
        renderableWidth = canvasWidth;
        renderableHeight = imageObj.height * (renderableWidth / imageObj.width);

    } else {
        renderableHeight = canvasHeight;
        renderableWidth = canvasHeight;

    }
    return {
        width: renderableWidth,
        height: renderableHeight
    };
}
Tool.prototype.addText = function (hastag, playerName) {
    var self = this;
    var fontsizePlayername = 30;
    var fontsizeHastag = 20;

    if(self.max.width >= 1600) {
        fontsizePlayername = 50;
        fontsizeHastag = 30;
    }
    if(self.max.width <= 1366 && self.max.width >= 1280) {
        fontsizePlayername = 40;
        fontsizeHastag = 25;
    }
    if(self.max.width <= 810) {
        fontsizePlayername = 34;
        fontsizeHastag = 17;
    }

    var config_hastag = {
        fontFamily: 'BudBold',
        // fontSize: 18,
        fontSize: fontsizeHastag,
        top: 0,
        left: 0,
        fill: '#ffffff',
        color: 'blue',
        textAlign: "right",
        evented: false,
        fontWeight: 'bold'
    };
    var config_playerName = {
        fontFamily: 'BudBold',
        // fontSize: 24,
        fontSize: fontsizePlayername,
        top: 0,
        left: 0,
        fill: '#ffffff',
        color: 'blue',
        textAlign: "right",
        fontWeight: 'bold',
        evented: false
    };
    var title_hastag = new fabric.Text(hastag, config_hastag);
    var title_player = new fabric.Text(playerName, config_playerName);
    this.canvas.add(title_player);
    this.canvas.add(title_hastag);

    title_player.set({
        left: self.canvas.width - title_player.width - 80,
        top: self.canvas.height - title_player.height - 6
    });
    title_hastag.set({
        left: self.canvas.width - title_hastag.width - title_player.width - 80 - 10,
        top: self.canvas.height - title_hastag.height - 10
    });
    this.canvas.renderAll();
}
Tool.prototype.zoomIt = function (canvas, factor, success) {
    canvas.setHeight(canvas.getHeight() * factor);
    canvas.setWidth(canvas.getWidth() * factor);
    if (canvas.backgroundImage) {
        // Need to scale background images as well
        var bi = canvas.backgroundImage;
        bi.width = bi.width * factor;
        bi.height = bi.height * factor;
    }
    var objects = canvas.getObjects();
    for (var i in objects) {
        var scaleX = objects[i].scaleX;
        var scaleY = objects[i].scaleY;
        var left = objects[i].left;
        var top = objects[i].top;

        var tempScaleX = scaleX * factor;
        var tempScaleY = scaleY * factor;
        var tempLeft = left * factor;
        var tempTop = top * factor;

        objects[i].scaleX = tempScaleX;
        objects[i].scaleY = tempScaleY;
        objects[i].left = tempLeft;
        objects[i].top = tempTop;

        objects[i].setCoords();
    }
    canvas.renderAll();
    canvas.calcOffset();
    if (success && typeof success == "function") {
        success();
    }
}
Tool.prototype.resetObject = function(obj, options) {
    if(options && typeof options === "object") {
        obj.set(options);
    }

}
var setCdOption = function(cd){
    COUNTDOWN_OPT = parseInt(cd) >= 3 ? parseInt(cd) : 0;
}

var getCdOption = function(){
    return COUNTDOWN_OPT;
};
var setTrackCamera = function(track) {
    trackCamera = track;
}
var getTrackCamera = function(){
    return trackCamera;
};

function isPortrait(img) {
    var w = img.naturalWidth || img.width,
        h = img.naturalHeight || img.height;
    return (h > w);
}
var getBase64 = function (canvas, process, success) {
    var i = getCdOption(); // default = 3
    $('.timeCoundow').show().text(i);

    var coundow_snap = setInterval(function () {
        i--;
        if (i == 0 || i < 0) {
            $('.timeCoundow').addClass('disable');
            clearInterval(coundow_snap);
            var request, end = false;
            var base64 = canvas.toDataURL("image/jpeg", 0.5);

            var renderBase64 = function () {
                /*Process*/
                process();
                if (base64 != '') {
                    fabric.util.cancelAnimationFrame(renderBase64);
                    if (success && typeof success == "function") {
                        /*Success*/
                        success(base64);
                    }
                    return base64;
                }

            }
            fabric.util.requestAnimFrame(renderBase64);

        }

        $('.timeCoundow').show().text(i);
    }, 1000);

}

function ImgLoader(sources, onProgressChanged, onCompleted) {
    this.images = {};
    var loadedImages = 0;
    var totalImages = 0;
    // get num of sources
    if (onProgressChanged || onCompleted)
        for (var src in sources) {
            totalImages++;
        }
    var self = this;
    for (var src in sources) {
        this.images[src] = new Image();
        this.images[src].onload = function () {
            loadedImages++;
            if (onProgressChanged) {
                var percent = Math.floor((loadedImages / totalImages) * 100);
                onProgressChanged(this, percent);
            }
            if (onCompleted && loadedImages >= totalImages)
                onCompleted(self.images);
        }
        this.images[src].src = sources[src];
    }
}
// Load font
function loadFont(success) {
    fontLoader = new FontLoader(['BudBold'], {
        fontLoaded: function (font) {

        },
        complete: function (error) {
            if (error == null && success && typeof success == "function") {
                success();
            }
        }
    }, 3000);
    fontLoader.loadFonts();
}
function detectIE() {
    var ua = window.navigator.userAgent;
    var isbrowser = false;
    // Test values; Uncomment to check result …

    // IE 10
    // ua = 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)';

    // IE 11
    // ua = 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko';

    // Edge 12 (Spartan)
    // ua = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36 Edge/12.0';

    // Edge 13
    // ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586';
    var safari = ua.indexOf("Safari") > -1;
    var msie = ua.indexOf('MSIE ');
    var chrome   = navigator.userAgent.indexOf('Chrome') > -1;
    var trident = ua.indexOf('Trident/');
    var edge = ua.indexOf('Edge/');
    if (!(chrome) && (safari)) {
        isbrowser = true;
    }
    if (msie > 0 || isbrowser == true || trident > 0 || edge > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    if (edge > 0) {
        // Edge (IE 12+) => return version number
        return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    // other browser
    return false;
}

/*Ready document Window*/

window.onload = function () {

    if(!$('.wrapper.page-tool').length) {
        $('.loadding-page').addClass('fade_out');
    }
    $('.loadding-page').addClass('fade_out');
    BudWeiser.beforeStart();
    /*Action Page init*/

    var video_frame = document.getElementById('video_frame');

    /*Ajax Tool*/

    var ajaxSettings = {
        "url": ROOT_URL + PATH_DATA,
        "type": "post",
        "async": true,
        success: function (data) {
            var data = (typeof data == 'string') ? JSON.parse(data) : data;

            /*get data json ajax*/
            BudWeiser.getDataBeforeAjax(data.models);
            /**/
            var FRAMES = data.frame;
            var MODELS = data.models;

            var frame_detail = FRAMES[Frame_Index];
            var src_frame = frame_detail.image;
            var model_detail = MODELS[Model_Index];
            var src_model = model_detail.image;
            var addFrame = 0;
            var addModel = 1;


            /*Load assets*/
            var sources = {
                img1: frame_detail.image,
                img2: model_detail.image

            };
            var foo = new ImgLoader(sources,
                    function (image, percent) {

                    },
                    function (images) {
                        // completed
                        // load font
                        loadFont(function () {
                            // init fonts
                            $('.loadder').hide();
                            initTool();
                        })
                    }
            );

            function initTool() {
                // new Tool
                var TOOL = new Tool({});

                // scale canvas
                scaleCanvas();
                function scaleCanvas() {
                    var s = 0;
                    var timeScale = setInterval(function () {
                        s++;
                        if (s == 2) {
                            if ($('body').hasClass('fa')) {

                            }
                            zoom_canvs = 1;
                            TOOL.zoomIt(TOOL.canvas, zoom_canvs, function () {
                                // $('.controll .form-upload').width(TOOL.canvas.width);
                                // $('.controll .form-upload').height(TOOL.canvas.height);
                                var h_slider = (TOOL.canvas.height * 33 / 100);
                                $('#slider-zoom').height(h_slider);
                            });
                            clearInterval(timeScale);
                        }

                    }, 0);
                }

                // add frame model
                TOOL.addPicture(src_model, addModel);
                // MOUSE weel
                $(TOOL.canvas.wrapperEl).on('mousewheel', function(e) {
                    var target = TOOL.canvas.findTarget(e);
                    var delta = e.originalEvent.wheelDelta / 1000;

                    if (target && target == TOOL.imagesUp) {

                        target.scaleX += delta;
                        target.scaleY += delta;

                        // constrain
                        if (target.scaleX < 0.1) {
                            target.scaleX = 0.1;
                            target.scaleY = 0.1;
                        }
                        // constrain
                        if (target.scaleX > 10) {
                            target.scaleX = 10;
                            target.scaleY = 10;
                        }
                        var top     = target.getTop();
                        var left    = target.getLeft();
                        var width   = target.getWidth();
                        var height  = target.getHeight();
                        var options = {top: top, left: left, width: width, height: height};
                        TOOL.resetObject(TOOL.imagesUpNew, options);
                        TOOL.imagesUpNew.center();
                        target.center();
                        target.setCoords();
                        TOOL.canvas.renderAll();
                        return false;
                    }
                });
                // live stream camera
                var CameraNotSupport = function (ie) {
                    hasCamera = false;
                    if (ie == false) {
                        $('.btn-form.link-file').addClass('no_ie');

                    }
                    $('.link-snap').addClass('disable');
                    $('.link-file').removeClass('disable');
                }
                var capturingStream = function (track) {
                    setTrackCamera(track);
                    hasCamera = true;
                    // show edit zoom
                    zoomEdit();
                    $('.btn-form.link-file').addClass('no_ie');
                    $('.link-file').addClass('disable');
                }

                TOOL.snapCamera("#capturing", capturingStream, CameraNotSupport);
                // add load frame
                TOOL.addPicture(src_frame, addFrame, function () {
                    // add hastag, playerName
                    TOOL.addText(hasTag, playerName);
                });



                // add picture file when camera not exits
                $('#file_upload').on('change', function (event) {
                    /*before submit upload file*/
                    BudWeiser.beforeUploadFile();
                    /*Add Upload Picture*/
                    var x = 0;
                    var y = 0;
                    var pos = {top: y, left: x};
                    var _event = event;
                    TOOL.fileRead(_event, pos, function () {
                        $('.link-file span').text('Đổi ảnh');
                        var new_bg = $('.link-file .up_file').attr('change_src');
                        // $('.link-file .img-link').attr('src', new_bg) ;
                        $('.snap_file').removeClass('disable');
                        $('.link-file, .up_file').addClass('disable');
                        zoomEdit();
                    });

                });
                // Edit zoom In-Out image upload
                function zoomEdit() {
                    $('.edit-controll').removeClass('disable');
                    // slider
                    $('#slider-zoom').slider({
                        orientation: "vertical",
                        value: 50,
                        slide: function (event, ui) {
                            zoomRatio(ui.value, zoom_canvs);
                        }
                    });

                    function zoomRatio(precent, zoom_canvas) {
                        var zoom = ((precent-50) / 100) + zoom_canvas;
                        TOOL.imagesframe.scale(zoom);
                        TOOL.imagesframe.center();
                        var topPos = TOOL.canvas.getHeight() - TOOL.imagesframe.getHeight();
                        TOOL.imagesframe.set({"top": topPos});
                        TOOL.imagesframe.setCoords();
                        TOOL.canvas.renderAll();
                    }

                    // controll edit
                    $('.zoom_in').on('click', function () {
                        var current_zoom = $("#slider-zoom").slider("value");
                        if (current_zoom == 100) {
                            current_zoom = 100;
                        } else {
                            current_zoom++;
                        }
                        $("#slider-zoom").slider("value", current_zoom);
                        zoomRatio(current_zoom, zoom_canvs);

                    });
                    $('.zoom_out').on('click', function () {
                        var current_zoom = $("#slider-zoom").slider("value");
                        if (current_zoom == 0) {
                            current_zoom = 0;
                        } else {
                            current_zoom--;
                        }
                        $("#slider-zoom").slider("value", current_zoom);
                        zoomRatio(current_zoom, zoom_canvs);

                    });

                    // confirm edit
                    $('.confirm_edit').on('click', function () {
                        $('.link-file, .edit-controll').addClass('disable');
                        if (hasCamera == false) {

                            $('.link-file').removeClass('disable');
                        } else {
                            $('.link-snap').removeClass('disable');
                        }

                    })

                }

                // snap image file
                $('.img-link.snap_file').on('click', function () {
                    $('.snap_file').addClass('disable');
                    $('.link-snap').click();
                })

                // prev Snap camera Click
                $('.link-snap-prev').on('click', function () {

                    $('.timeCoundow').hide();
                    $('.image-output').html('');
                    $('.link-after').addClass('disable');
                    if (hasCamera == true) {
                        $('.link-snap, .edit-controll').removeClass('disable');
                        $('.link-snap').addClass('disable');
                        TOOL.snapCamera("#capturing", capturingStream, CameraNotSupport);
                    } else {
                        document.getElementById("change_img").reset();

                        $('.link-file, .up_file').removeClass('disable');
                        TOOL.canvas.remove(TOOL.imagesUp, TOOL.imagesUpNew);
                    }
                })


                // get base64 images
                $('.link-snap').on('click', function () {
                    $('.link-snap, .edit-controll').addClass('disable');
                    $('.time_option').removeClass('disable');
                });
                // snap image
                function snapImage() {
                    BudWeiser.beforeGetBase64();
                    getBase64(TOOL.canvas, process, sucessBase);
                    function process() {
                        $('.timeCoundow').removeClass('disable');
                    }

                    function sucessBase(source) {
                        $('.loadder').show();
                        $('.link-snap, .edit-controll, .timeCoundow').addClass('disable');

                        var src_base64 = source;
                        var img_output = new Image();
                        img_output.onload = function () {
                            $('.image-output').html(img_output);
                            // draw base 64

                            drawBase64(img_output, function (canvas_base) {
                                setCdOption(0);
                                imageFacebook(canvas_base, function () {
                                    // success + hide loadding
                                    $('.loadder').hide();
                                    // turn off camera
                                    var trackingCamera = getTrackCamera();
                                    trackingCamera.stop();
                                });
                            });
                        }
                        img_output.src = src_base64;

                    }
                }

                // time_option click time option
                $('.icon_time').on('click', function () {
                    BudWeiser.beforeCounTime();
                    $('.time_option').addClass('disable');
                    $('.timeCoundow').removeClass('disable');
                    var time_option = $(this).attr('option_time');
                    setCdOption(parseInt(time_option));
                    snapImage();
                })
                function drawBase64(src_image, complete) {
                    var canvas_base = document.getElementById("canvas_base");
                    var ctx = canvas_base.getContext("2d");
                    canvas_base.width = 600;
                    canvas_base.height = 315;
                    var imgx = new Image();
                    imgx.onload= function () {
                        ctx.drawImage(imgx, 0, 0, 600, 315);
                        if (complete && typeof complete == "function") {
                            complete(canvas_base);

                        }


                    }
                    imgx.src = src_image.src;

                }
                function imageFacebook(canvas, success) {
                    getBase64(canvas,
                            function () {

                            },
                            function (base_img) {
                                // complete
                                var soucre_face = base_img;
                                base64 = soucre_face;
                                var image_facebook = new Image();
                                image_facebook.onload = function () {
                                    $('.link-after').removeClass('disable');
                                    $('.image-facebook').attr('src', base_img);
                                    BudWeiser.afterGetBase64(base_img);
                                    if(success && typeof success ==="function") {
                                        success();
                                    }
                                }
                                image_facebook.src = base_img;

                            }
                    )
                }

            }

        }
    };
    $.ajax(ajaxSettings);

};
