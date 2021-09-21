import { imageFileInputHandler } from '../../module';

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