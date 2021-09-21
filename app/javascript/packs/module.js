export const tableDetailRedirectHandler = (event) => {
  const element = event.currentTarget;
  const href = element.dataset.href
  document.location.href = href;
};

export const imageFileInputHandler = (event, jquery=false) => {
  const currnetElement = jquery ? event.target : event.currentTarget;
  const defaultUrl = currnetElement.dataset.defaultUrl;
  const parentElement = currnetElement.closest('label');
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