/*TOOL Maker*/
var Tool = function (options) {
    this.name = 'budweiser theremix';
    this.version = '1.0';
    this.canvas = new fabric.Canvas('tool-canvas');

    this.canvas.renderAll();
};

Tool.prototype.addPicture = function () {
    var self = this;
    var canvas = self.canvas;
    console.log(self.ratio);
    // clear picture old
    var src_img = self.typeImage == FRAME ? self.img.src : self.picture.src;
    var slected_img = self.typeImage == FRAME ? false : true;
    var width_img = self.typeImage == PICTURE ? self.picture.width : self.ratio.width;
    var height_img = self.typeImage == PICTURE ? self.picture.height : self.ratio.height;
    var top_img = self.typeImage == PICTURE ? self.picture.top : 0;
    var left_img = self.typeImage == PICTURE ? self.picture.left : 0;

    fabric.util.loadImage(src_img, function (img) {
        var object = new fabric.Image(img);
        object.selectable = self.typeImage == FRAME ? false : true;
        object.set({
            top: top_img,
            left: left_img,
            width: width_img,
            height: height_img,
            borderColor: 'red',
            cornerColor: 'green',
            cornerSize: 0,
            allowTouchScrolling: true,
            evented: slected_img,
            borderColor         : 'rgba(255,255,255,1)',
                    padding: 3,
            centeredRotation: true,
            centeredScaling: true,
            transparentCorners: false
        });
        // canvas.add(object);
        canvas.insertAt(object, 0);
        canvas.renderAll();
        if (self.typeImage == PICTURE) {
            self.objPicture = object;

        }
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
    BudWeiser.baseUrl = 'http://localhost/budweiser';
    BudWeiser.beforeStart();
    /*Action Page init*/
    actionPage();

    /*Ajax Tool*/
    console.log(BudWeiser);

};


