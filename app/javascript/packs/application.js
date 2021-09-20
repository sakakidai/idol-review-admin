// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import '../stylesheets/application';

require("jquery")
require("@nathanvda/cocoon")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const imageFileInputHandler = (event, jquery=false) => {
  const currnetElement = jquery ? event.target : event.currentTarget;
  const defaultUrl = currnetElement.dataset.defaultUrl;
  const parentElement = currnetElement.parentNode;
  const previewElement = parentElement.querySelector('img.preview');
  const fileNameElement = parentElement.querySelector('span.preview_filename');
  const selectedfiles = currnetElement.files;

  if (selectedfiles.length === 0) {
    previewElement.src = defaultUrl;
    fileNameElement.textContent = 'No Image';
    return;
  }

  for (let i = 0; i < selectedfiles.length; i++) {
    const file = selectedfiles[i];
    const reader = new FileReader();
    reader.onloadend = () => previewElement.src = reader.result;
    reader.readAsDataURL(file);
    fileNameElement.textContent = file.name;
  };
};

document.addEventListener("turbolinks:load", () => {
  const previewForms = document.querySelectorAll('.preview_form');
  previewForms.forEach(previewForm => {
    previewForm.addEventListener('change', e => imageFileInputHandler(e));
  });
});

jQuery(document).on('turbolinks:load', () => {
  $('#content_images').on('cocoon:before-insert', (_e, insertedItem) => {
    $(insertedItem).on('change', e => imageFileInputHandler(e, true));
  });
});

