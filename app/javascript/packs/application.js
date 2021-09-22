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
import '@yaireo/tagify';
import '@yaireo/tagify/src/tagify.scss';
import 'jquery';
import '@nathanvda/cocoon';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const sidebarCollapseHandler = (event) => {
  const currnetElement = event.currentTarget;
  const sidebarElement = document.getElementById('sidebar');
  currnetElement.classList.toggle('active');
  sidebarElement.classList.toggle('active');
};

document.addEventListener("turbolinks:load", () => {
  const sidebarCollapse = document.getElementById('sidebar_collapse');
  sidebarCollapse.addEventListener('click', e => sidebarCollapseHandler(e));
});


