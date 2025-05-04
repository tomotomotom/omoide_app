document.addEventListener("DOMContentLoaded", () => {
  document.body.addEventListener("ajax:success", (event) => {
    const [data, status, xhr] = event.detail;
    const postId = data.post_id;
    const container = document.querySelector(`#like-container-${postId}`);
    if (container) {
      container.innerHTML = xhr.responseText;
    }
  });
});
