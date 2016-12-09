// "use strict";
/*TOOL Maker*/
var Tool = function (options) {
    this.name = 'budweiser theremix';
    this.version = '1.0';
    this.canvas = new fabric.Canvas('tool-canvas');
    this.ratio = {width: 600, height: 315};
    this.canvas.setWidth(this.ratio.width);
    this.canvas.setHeight(this.ratio.height);
    this.pictureFile = {};
    this.videoFrame = {};
    this.imagesUp = {};
    this.typePicture = {frame: 0, model: 1, file: 2};
    // this.canvas.renderAll();
};
Tool.prototype.addVideo = function (video,end) {
    var self = this;
    var videoFrame = new fabric.Image(video, {
        top: 0,
        left: 0,
        width: $(video).width(),
        height: $(video).height()

    });
    videoFrame.selectable =  false;
    self.canvas.add(videoFrame);
    videoFrame.getElement().play();
    videoFrame.getElement().onended = function() {
        if(typeof end == "function") {
            // end video
            end();
        }
    };
    self.canvas.insertAt(videoFrame, 0);
    var request;
    var render = function() {
        self.canvas.renderAll();
        request = fabric.util.requestAnimFrame(render);
    }

    // video.play();
    fabric.util.requestAnimFrame(render);


}

Tool.prototype.snapCamera = function (video, err) {
    var errorCallback = function(e) {
        console.log('device not support camera!', e);
        err();
    };
    navigator.getUserMedia  = navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia;
    if (navigator.getUserMedia) {
        var video = $(video);
        navigator.getUserMedia({audio: false, video: true}, function(stream) {
            video.src = window.URL.createObjectURL(stream);
            video.play();
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
        object.set({
            top: 0,
            left: 0,
            /*width: 300,
            height: 200,*/
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
    var baseUrl = BudWeiser.baseUrl;
    var id_Model = 2;
    var id_Frame = 1;
    var ajaxSettings = {
        "url": baseUrl+'js/data.json',
        "type": "post",
        "async": true,
        success: function (data) {
            var frames =  data[0].frame;
            var getFrameById = function (id, frames) {
                for(var i = 0; i < frames.length; i++) {
                    if(frames[i].id == id) {
                        return frames[i];
                    }
                }
            }
            var frame_detail = getFrameById(id_Frame, frames);
            var src_frame = baseUrl+frame_detail.image;

            var models =  data[0].models;
            var getModelById = function(id, models) {
                for(var i = 0; i < models.length; i++) {
                    if(models[i].id == id) {
                        return models[i];
                    }
                }
            }
            var model_detail = getModelById(id_Model, models);
            var FRAME = 0;



            var tool = new Tool({});

            // add video
            var video_frame = document.getElementById('video_frame');
            video_frame.src = model_detail.video;
            video_frame.onloadedmetadata = function() {
                // add load frame
                tool.addPicture(src_frame,FRAME);

                // add video model
                tool.addVideo(video_frame, function () {
                    tool.snapCamera("#capturing", function () {
                        $('.controll').show();
                        $('.link-snap').addClass('disable');
                        $('.link-file').removeClass('disable');
                        // add frame model
                        var src_model = baseUrl+model_detail.image;
                        var model_type = 1;
                        tool.addPicture(src_model,model_type);
                    });
                });
            };

            // add picture file
            $('#file_upload').on('change', function (event) {
                /*Add Upload Picture*/
                var x = 0;
                var y = 0;
                var pos = {top: y, left: x};
                var _event = event;
                tool.fileRead(_event, pos, function () {
                    $('.link-file span').text('Đổi ảnh');
                });

            });
            $('.dow').on('click', function () {
                var base64 = tool.canvas.toDataURL("image/jpeg", 0.5);
                window.open(base64);
                console.log(base64);
            })
        }
    };
    $.ajax(ajaxSettings);

};


