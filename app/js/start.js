/* globals Variables*/
var ROOT_URL        = 'http://localhost/budweiser_theremix/app/';
var PATH_DATA       = 'js/data.json';
var Model_Index     = 8;
var Frame_Index     = 1;
var Watermark_Index = 0;
var base64          = '';
var hasCamera       = true;
var hasTag          = '#TEMTHIEUBAOTRAM';
var playerName      = 'DUC VIET';

var objFrame;
/*TOOL Maker*/

var Tool = function (options) {
    this.name = 'budweiser theremix';
    this.version = '1.0';
    this.canvas = new fabric.Canvas('tool-canvas');
    this.max = {width: 1142, height: 599};
    this.ratioW = this.max.width / this.max.height;
    this.ratio = {width: 600, height: 315};

    this.pictureFile = {};
    this.imagesUp = {};
    this.typePicture = {frame: 0, model: 1, file: 2};
    this.typeVideo = {model: 0, capturing: 1};
    this.renderCanvas(this.max.width);
};
Tool.prototype.renderCanvas = function (width) {
    width = width || window.innerWidth;
    var w_height = width / this.ratioW;
    this.canvas.setWidth(width);
    this.canvas.setHeight(w_height);
    this.canvas.selection = false;
    this.canvas.renderAll();
}
Tool.prototype.addVideo = function (video, end, type) {
    var self = this;
    var _left = self.canvas.width / 2 - $(video).width() / 2;
    var _top = 0;
    var videoFrame = new fabric.Image(video, {
        top: _top,
        left: _left,
        width: $(video).width(),
        height: $(video).height()

    });
    videoFrame.selectable =  true;
    // self.canvas.add(videoFrame);
    self.canvas.insertAt(videoFrame, 0);
    videoFrame.getElement().play();
    var stop_end = false;
    videoFrame.getElement().onended = function() {
        if(end && typeof end == "function") {
            // end video
            stop_end = true;
            end();

        }
    };

    var render = function() {
        self.canvas.renderAll();
        if( stop_end == true) {
            fabric.util.cancelAnimationFrame(render);
        }else {
            fabric.util.requestAnimFrame(render);
        }

    }

    // video.play();
    fabric.util.requestAnimFrame(render);

}

Tool.prototype.snapCamera = function (video, camera, err) {
    var self = this;
    var errorCallback = function(e) {
        // alert('PC không hỗ trợ Camera! :( ');
        err();
    };
    navigator.getUserMedia  = navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia;
    if (navigator.getUserMedia) {
        // var video = $(video);
        navigator.getUserMedia({audio: false, video: true}, function(stream) {
            if(camera && typeof camera == "function") {
                camera();
            }
            var video_elm = document.querySelector(video);
            video_elm.src = window.URL.createObjectURL(stream);
            video_elm.onloadedmetadata = function(e) {
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
        if(type == self.typePicture.file) {
            img.set({
               top: self.canvas.height / 2 - img.height / 2,
               left: self.canvas.width / 2 - img.width / 2
            });
            canvas.insertAt(img, 0);
            self.imagesUp = img;
        }
        if(type == self.typePicture.model) {
            canvas.insertAt(img, 0);
        }
        if(type == self.typePicture.frame) {
            img.set({width: self.canvas.width, height: self.canvas.height});
            canvas.add(img);
            if( end && typeof end == "function") {
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
                var fitimg = self.fitImageOn(imgUpload, self.canvas.width, self.canvas.height);
                self.pictureFile.width = fitimg.width;
                self.pictureFile.height = fitimg.height;
                self.pictureFile.top = pos.top;
                self.pictureFile.left = pos.left - fitimg.width;
                var type_file = 2;
                self.canvas.remove(self.imagesUp);
                self.addPicture(self.pictureFile.src, type_file);
                if(typeof sucess == "function") {
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
    var config_hastag       = {
        fontFamily: 'BudBold',
        fontSize: 18,
        top: 0,
        left: 0,
        fill: '#ffffff',
        color: 'blue',
        textAlign : "right",
        fontWeight: 'bold'
    };
    var config_playerName   = {
        fontFamily: 'BudBold',
        fontSize: 24,
        top: 0,
        left: 0,
        fill: '#ffffff',
        color: 'blue',
        textAlign : "right",
        fontWeight: 'bold'
    };
    var title_hastag = new fabric.Text(hastag, config_hastag);
    var title_player = new fabric.Text(playerName, config_playerName);
    title_player.set({
       left :  self.canvas.width - title_player.width - 80,
       top: self.canvas.height - title_player.height - 10
    });
    title_hastag.set({
        left: self.canvas.width - title_hastag.width - title_player.width - 80 - 10,
        top: self.canvas.height - title_hastag.height - 10
    })
    this.canvas.add(title_hastag, title_player);
    this.canvas.renderAll();
}

Tool.prototype.getBase64 = function (process, success) {
    var request, end = false, base64 = '';
    var self= this;
    base64 = self.canvas.toDataURL("image/jpeg", 0.5);

    var renderBase64 = function() {
        /*Process*/
        process();

        if( base64 != '') {
            fabric.util.cancelAnimationFrame(renderBase64);
            if(success && typeof success == "function") {
                /*Success*/
                success(base64);
            }
            return base64;
        }else {
            request = fabric.util.requestAnimFrame(renderBase64);
        }

    }
    fabric.util.requestAnimFrame(renderBase64);
}

function actionPage() {

}

/*Ready document Window*/

window.onload = function () {

    BudWeiser.beforeStart();
    /*Action Page init*/
    actionPage();
    var video_frame = document.getElementById('video_frame');

    /*Ajax Tool*/

    var ajaxSettings = {
        "url": ROOT_URL+PATH_DATA,
        "type": "post",
        "async": true,
        success: function (data) {
            /*get data json ajax*/
            BudWeiser.getDataBeforeAjax();
            /**/
            var FRAMES          =  data[0].frame;
            var MODELS          =  data[0].models;
            var WATERMARK       = data[0].watermark;

            var frame_detail    = FRAMES[Frame_Index];
            var src_frame       = frame_detail.image;
            var model_detail    = MODELS[Model_Index] ;
            var src_model       = model_detail.image;

            var watermark       = WATERMARK[Watermark_Index];
            var src_watermark   = watermark.image;

            var addFrame        = 0;
            var addModel        = 1;
            // new Tool
            var TOOL            = new Tool({});
            $('.controll .form-upload').width(TOOL.max.width);
            $('.controll .form-upload').height(TOOL.max.height);

            // add frame model
            TOOL.addPicture(src_model, addModel);

            // live stream camera
            var CameraNotSupport = function () {
                hasCamera = false;
                $('.link-snap').addClass('disable');
                $('.link-file').removeClass('disable');
            }
            var capturingStream = function() {
                hasCamera = true;
                $('.link-snap').removeClass('disable');
                $('.link-file').addClass('disable');
            }
            TOOL.snapCamera("#capturing", capturingStream, CameraNotSupport);

            // add load frame
            TOOL.addPicture(src_frame,addFrame, function () {
                // add hastag
                TOOL.addText(hasTag, playerName);
                var i = 0;
                var it = setInterval(function () {
                    i++;
                    TOOL.canvas.renderAll();
                    if(i == 5) {
                        clearInterval(it);
                    }
                },1000)

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
                    zoomEdit();
                });

            });
            // Edit zoom In-Out image upload

            function zoomEdit() {
                $('.edit-controll').removeClass('disable');

                // slider
                $('#slider-zoom').slider({
                    orientation: "vertical",
                    slide: function( event, ui ) {
                        zoomRatio(ui.value);
                    }
                });
                function zoomRatio(precent) {
                    var zoom = (precent / 100 ) * 1;
                    if(zoom < 1) {
                        zoom = 1 + zoom;
                    }
                    if(precent == 100) zoom = 2;

                    TOOL.imagesUp.scale(zoom);
                    TOOL.canvas.renderAll();
                }
                // controll edit
                $('.zoom_in').on('click', function() {
                    var current_zoom = $( "#slider-zoom" ).slider( "value");
                    if(current_zoom == 100) {
                        current_zoom = 100;
                    }else {
                        current_zoom++;
                    }
                    $( "#slider-zoom" ).slider( "value", current_zoom);
                    zoomRatio(current_zoom);

                })
                $('.zoom_out').on('click', function() {
                    var current_zoom = $( "#slider-zoom" ).slider( "value");
                    if(current_zoom == 0) {
                        current_zoom = 0;
                    }else {
                        current_zoom--;
                    }
                    $( "#slider-zoom" ).slider( "value", current_zoom);
                    zoomRatio(current_zoom);

                })

                // confirm edit
                $('.confirm_edit').on('click', function() {
                    $('.link-file, .edit-controll, .link-snap-prev').addClass('disable');
                    $('.link-snap').click();
                })

            }

            // prev Snap camera Click
            $('.link-snap-prev').on('click', function () {
                $('.link-snap').removeClass('disable');
                $('.link-after').addClass('disable');
                $('.image-output').html('');
                $('.timeCoundow').hide();
            })

            // get base64 images
            $('.link-snap').on('click', function () {

                BudWeiser.beforeGetBase64();
                TOOL.getBase64(process, sucessBase);
                function process() {
                    $('.loadder').css('display','table');
                }
                function sucessBase(source) {
                    $('.link-snap').addClass('disable');
                    $('.loadder').hide();
                    base64 = source;
                    var i = 4;
                    var coundow_snap = setInterval(function () {
                        i--;
                        if(i == 0) {
                            var img_output = new Image();
                            img_output.onload = function() {
                                $('.image-output').html(img_output);
                            }
                            img_output.src = base64;
                            $('.link-after').removeClass('disable');
                            BudWeiser.afterGetBase64();
                            i = 1;

                            clearInterval(coundow_snap);
                        }

                        $('.timeCoundow').show().text(i);
                    },1200);
                }


            });
        }
    };
    $.ajax(ajaxSettings);

};
