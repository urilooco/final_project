import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["video", "startButton", "canvas", "photo", "imageFileField"];

  width = 320;
  height = 0;
  streaming = false;

  connect() {

    navigator.mediaDevices
      .getUserMedia({ video: true, audio: false })
      .then( (stream) => {
        this.videoTarget.srcObject = stream;
        this.videoTarget.play();
      })
      .catch( (err) => {
        alert("An error occurred: " + err);
      });

      this.videoTarget.addEventListener(
      "canplay",
      (ev) => {
        if (!this.streaming) {
          this.height = this.videoTarget.videoHeight / (this.videoTarget.videoWidth / this.width);

          if (isNaN(this.height)) {
            this.height = this.width / (4 / 3);
          }

          this.videoTarget.setAttribute("width", this.width);
          this.videoTarget.setAttribute("height", this.height);
          this.canvasTarget.setAttribute("width", this.width);
          this.canvasTarget.setAttribute("height", this.height);
          this.streaming = true;
        }
      },
      false
    );

    this.startButtonTarget.addEventListener(
      "click",
      (ev) => {
        this.takepicture();
        ev.preventDefault();
      },
      false
    );

    this.clearphoto();
  }

  clearphoto() {
    const context = this.canvasTarget.getContext("2d");
    context.fillStyle = "#AAA";
    context.fillRect(0, 0, this.canvasTarget.width, this.canvasTarget.height);

    const data = this.canvasTarget.toDataURL("image/png");
    this.photoTarget.setAttribute("src", data);
  }

  takepicture() {
    const context = this.canvasTarget.getContext("2d");
    if (this.width && this.height) {
      this.canvasTarget.width = this.width;
      this.canvasTarget.height = this.height;
      context.drawImage(this.videoTarget, 0, 0, this.width, this.height);

      const data = this.canvasTarget.toDataURL("image/png");
      this.photoTarget.setAttribute("src", data);
      this.canvasTarget.toBlob(
        (blob) => {
          const myFile = new File([blob], "image.jpeg", {
            type: blob.type,
            size: blob.size,
          });
          let container = new DataTransfer();
          container.items.add(myFile);
          this.imageFileFieldTarget.files = container.files;
        },
        "image/jpeg",
        0.95
      );
    } else {
      this.clearphoto();
    }
  }
}
