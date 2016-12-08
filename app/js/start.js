"use strict";
/*TOOL Maker*/
var Tool = function (options) {
    this.name = 'budweiser theremix';
    this.version = '1.0';
    this.canvas = new fabric.Canvas('tool-canvas');
    this.ratio = {width: 600, height: 315};
    this.canvas.setWidth(this.ratio.width);
    this.canvas.setHeight(this.ratio.height);
    this.typePicture = true;
    this.canvas.renderAll();
};
Tool.prototype.addVideo = function (video) {
    
}
Tool.prototype.snapCamera = function (video, callback) {
    var errorCallback = function(e) {
        console.log('device not support camera!', e);
        callback();
    };
    navigator.getUserMedia  = navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia;
    if (navigator.getUserMedia) {
        var video = $(video);
        navigator.getUserMedia({audio: false, video: true}, function(stream) {
            video.src = window.URL.createObjectURL(stream);
            console.log(video);
        }, errorCallback);
    } else {
        $(video).src = ''; // fallback.

    }
}

Tool.prototype.addPicture = function (src, type) {
    var self = this;
    var canvas = self.canvas;

    fabric.util.loadImage(src, function (img) {
        var object = new fabric.Image(img);
        object.selectable =  true;
        object.set({
            top: 0,
            left: 0,
            width: 300,
            height: 200,
            borderColor: 'red',
            cornerColor: 'green',
            cornerSize: 0,
            allowTouchScrolling: true,
            evented: false,
            borderColor         : 'rgba(255,255,255,1)',
            padding: 3,
            centeredRotation: true,
            centeredScaling: true,
            transparentCorners: false
        });
        // canvas.add(object);
        canvas.insertAt(object, 0);
        canvas.renderAll();

    });
}
Tool.prototype.fileRead = function (_event, pos) {
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
                self.picture.width = fitimg.width;
                self.picture.height = fitimg.height;
                self.picture.width = fitimg.width;
                self.picture.height = fitimg.height;
                self.picture.top = pos.top;
                self.picture.left = pos.left - fitimg.width;
                self.typeImage = PICTURE;
                self.addPicture();
                self.canvas.renderAll();

            }
            imgUpload.src = picFile.result;
            self.picture.src = imgUpload.src;

            // hidden title
            $('.img_title._pos, .img_title._success').addClass('hidd');
            $('.img_title._after').removeClass('hidd');
            $('.controll-maker').removeClass('hidd');
            $('.btn-upload').addClass('confirm').text('chấp nhận');
        });

        picReader.readAsDataURL(file);

    } else {
        console.log("Your browser does not support File API");
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
        renderableHeight = canvas.height;
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
        console.log(obj.getAngle());
        // return obj;
    });
}

function actionPage() {

}

/*Ready document Window*/

window.onload = function () {

    BudWeiser.beforeStart();
    /*Action Page init*/
    actionPage();

    /*Ajax Tool*/
    var ajaxSettings = {
        "url": BudWeiser.baseUrl,
        "type": "post",
        /*data: {
         cat_id: id_frame
         },*/
        "async": true,
        success: function (data) {
            console.log("data here!", JSON.stringify(data[0].frame[0], null, 2));
            var frame_first = data[0].frame[0];
            var frame_second = data[0].frame[1];
            var FRAME = true;
            var tool = new Tool({});
            // add frame
            tool.addPicture(frame_first,FRAME);

            tool.snapCamera("#capturing", function () {
                $('.link-snap').addClass('disable');
                alert('device not support camera!');
            });
        }
    };
    $.ajax(ajaxSettings);

};


