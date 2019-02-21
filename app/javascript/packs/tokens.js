const copyTokenToClipboard = () => {
  if (!document.getElementById("copy-token")) {
    return;
  }

  const button = document.getElementById("copy-token");
  button.addEventListener("click", (e) => {
    const copyText = document.getElementById("token")
    copyText.select();
    document.execCommand("copy");
    e.preventDefault();
  });
};

document.addEventListener("DOMContentLoaded", () => {
  copyTokenToClipboard();
});

document.addEventListener("turbolinks:load", () => {
  copyTokenToClipboard();
});
