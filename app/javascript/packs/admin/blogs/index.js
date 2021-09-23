
import { tableDetailRedirectHandler } from '../../module';

document.addEventListener("turbolinks:load", () => {
  const tableList = document.querySelectorAll('.table_item');
  tableList.forEach(item => item.addEventListener('click', e => tableDetailRedirectHandler(e)))
});