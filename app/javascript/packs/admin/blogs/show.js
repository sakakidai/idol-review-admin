import Tagify from '@yaireo/tagify';

document.addEventListener("turbolinks:load", () => {
  const GenreInput = document.querySelector("input[name='blog[genre_list]']");
  const DistributorInput = document.querySelector("input[name='blog[distributor_list]']");
  new Tagify(GenreInput);
  new Tagify(DistributorInput);
});