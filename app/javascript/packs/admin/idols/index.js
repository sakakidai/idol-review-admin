import { tableDetailRedirectHandler } from '../../module';

document.addEventListener("turbolinks:load", () => {
  const tableList = document.querySelector('.table_list');
  tableList.addEventListener('click', e => tableDetailRedirectHandler(e));
});