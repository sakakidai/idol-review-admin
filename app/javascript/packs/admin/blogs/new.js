import { imageFileInputHandler } from '../../module';
import '@nathanvda/cocoon';
import Tagify from '@yaireo/tagify';

document.addEventListener("turbolinks:load", () => {
  const previewForms = document.querySelectorAll('.preview_form');
  previewForms.forEach(previewForm => {
    previewForm.addEventListener('change', e => imageFileInputHandler(e));
  });

  const GenreInput = document.querySelector("input[name='blog[genre_list]']");
  const SaleInput = document.querySelector("input[name='blog[sale_list]']");
  new Tagify(GenreInput, {
    originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
  });
  new Tagify(SaleInput, {
    originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
  });
});

jQuery(document).on('turbolinks:load', () => {
  $('#content_images').on('cocoon:before-insert', (_e, insertedItem) => {
    $(insertedItem).on('change', e => imageFileInputHandler(e, true));
  });
});