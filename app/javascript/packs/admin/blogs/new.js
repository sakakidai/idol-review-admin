import { imageFileInputHandler } from '../../module';
import Tagify from '@yaireo/tagify';

document.addEventListener("turbolinks:load", () => {
  const previewForms = document.querySelectorAll('.preview_form');
  previewForms.forEach(previewForm => {
    previewForm.addEventListener('change', e => imageFileInputHandler(e));
  });

  const input = document.querySelector("input[name='blog[tag_list]']");
  new Tagify(input);
});

jQuery(document).on('turbolinks:load', () => {
  $('#content_images').on('cocoon:before-insert', (_e, insertedItem) => {
    $(insertedItem).on('change', e => imageFileInputHandler(e, true));
  });
});