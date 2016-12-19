/* globals Variables*/
var ROOT_URL = 'http://localhost/budweiser_theremix/app/';
var PATH_DATA = 'js/data.json';
var Model_Index = 1;
var Frame_Index = 1;
var Watermark_Index = 0;
var base64 = '';
var hasCamera = true;
var playerName = '';

/*TOOL Maker*/

var Tool = function (options) {
    this.name = 'budweiser theremix';
    this.version = '1.0';
    this.canvas = new fabric.Canvas('tool-canvas');
    this.max = {width: 1920, height: 1080};
    this.ratioW = this.max.width / this.max.height;
    this.ratio = {width: 600, height: 315};

    this.pictureFile = {};
    this.imagesUp = {};
    this.groupItem = new fabric.Group();
    this.typePicture = {frame: 0, model: 1, file: 2};
    this.renderCanvas();
};
Tool.prototype.renderCanvas = function (width) {
    width = width || window.innerWidth;
    var w_height = width / this.ratioW;
    this.canvas.setWidth(width);
    this.canvas.setHeight(w_height);
    this.canvas.renderAll();
}
Tool.prototype.addVideo = function (video,end) {
    var self = this;
    var videoFrame = new fabric.Image(video, {
        top: 0,
        left: 0,
        width: $(video).width(),
        height: $(video).height()

    });
    videoFrame.selectable =  false;
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
    var request;
    var render = function() {
        self.canvas.renderAll();
        if( stop_end == true) {
            fabric.util.cancelAnimationFrame(render);
        }else {
            request = fabric.util.requestAnimFrame(render);
        }

    }

    // video.play();
    fabric.util.requestAnimFrame(render);



}

Tool.prototype.snapCamera = function (video, camera, err) {
    var self = this;
    var errorCallback = function(e) {
        alert('device not support camera!', e);
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
                self.addVideo(video_elm);

            };
        }, errorCallback);
    } else {
        $(video).src = ''; // fallback.

    }
}

Tool.prototype.addPicture = function (src, type) {
    var self = this;
    var canvas = self.canvas;
    var evented = type == self.typePicture.file ? false : false;
    var insertFront = type == self.typePicture.file || self.typePicture.model ? true : false;

    fabric.util.loadImage(src, function (img) {
        var object = new fabric.Image(img);
        object.selectable =  false;
        if(type == self.typePicture.frame) {
        }
        object.set({
            top: 0,
            left: 0,
            cornerSize: 0,
            allowTouchScrolling: true,
            evented: false,
            padding: 3,
            centeredRotation: true,
            centeredScaling: true,
            transparentCorners: false
        });
        if(type == self.typePicture.file) {
            self.imagesUp = object;
        }
        if(type == self.typePicture.model) {
            canvas.insertAt(object, 0);
        }else {
            object.set({width: self.canvas.width, height: self.canvas.height});
            canvas.add(object);
        }
        // canvas.insertAt(object, 0);
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
                self.canvas.renderAll();
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

Tool.prototype.selectedObject = function () {
    var self = this;

    self.canvas.on('object:selected', function (e) {
        self.drag = true;
        var obj = self.canvas.getActiveObject();

    });
}
Tool.prototype.getBase64 = function (success) {
    var request, end = false, base64 = '';
    var self= this;
    base64 = self.canvas.toDataURL("image/jpeg", 0.5);
    var renderBase64 = function() {
        if( base64 != '') {
            fabric.util.cancelAnimationFrame(renderBase64);
            if(success && typeof success == "function") {
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
            video_frame.src     = model_detail.video;
            var watermark       = WATERMARK[Watermark_Index];
            var src_watermark   = watermark.image;

            var addFrame        = 0;
            var addModel        = 1;
            // new Tool
            var TOOL            = new Tool({});

            // add video model
            var endVideoModel   = function () {
                $('.controll').show();
            }
            video_frame.onloadedmetadata = function() {
                TOOL.addVideo(video_frame, endVideoModel);
            };

            // live stream camera
            var CameraNotSupport = function () {
                hasCamera = false;
                // add frame model
                TOOL.addPicture(src_model, addModel);
                $('.link-snap').addClass('disable');
                $('.link-file').removeClass('disable');
            }
            var capturingStream = function() {
                hasCamera = true;
                $('.link-snap').removeClass('disable');
                $('.link-file').addClass('disable');
            }
            TOOL.snapCamera("#capturing", capturingStream, CameraNotSupport);

            // add load frame: logo
            TOOL.addPicture(src_frame,addFrame);


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
                });

            });

            // get base64 images
            $('.dow, .link-snap').on('click', function () {
                BudWeiser.beforeGetBase64();
                TOOL.getBase64(function (data_image) {
                    base64 = data_image;
                    BudWeiser.afterGetBase64();
                    window.open(base64);
                });


            })
        }
    };
    $.ajax(ajaxSettings);

};
