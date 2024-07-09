// Select the input element for file selection
var fileInput = document.querySelector(".file-with-js > .file-label > .file-input");

// Bind a listener to onChange event of the file input
fileInput.onchange = function () {
	var files = fileInput.files;
	if (files.length > 0) {
		var fileNameContainer = document.querySelector(".file-with-js > .file-label > .file-name");
		// Set the inner text of fileNameContainer to the name of the file
		fileNameContainer.textContent = files[0].name;

		// Display image preview if the file is an image
		var imageType = /image.*/;
		if (files[0].type.match(imageType)) {
			var img = document.getElementById("thumbnail");
			img.file = files[0];
			var reader = new FileReader();
			reader.onload = function (e) {
				img.src = e.target.result;
			}
			reader.readAsDataURL(files[0]);
		}
	}
};

// Function for displaying image upload preview
function showMyImage(fileInput) {
	var files = fileInput.files;
	for (var i = 0; i < files.length; i++) {
		var file = files[i];
		var imageType = /image.*/;
		if (!file.type.match(imageType)) {
			continue;
		}
		var img = document.getElementById("thumbnail");
		img.file = file;
		var reader = new FileReader();
		reader.onload = function (e) {
			img.src = e.target.result;
		}
		reader.readAsDataURL(file);
	}
}
