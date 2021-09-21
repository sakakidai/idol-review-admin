import { imageFileInputHandler } from '../../module';

document.addEventListener("turbolinks:load", () => {
  const previewForms = document.querySelectorAll('.preview_form');
  previewForms.forEach(previewForm => {
    previewForm.addEventListener('change', e => imageFileInputHandler(e));
  });
});