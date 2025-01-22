document.addEventListener('DOMContentLoaded', function() {
  const textareas = document.querySelectorAll('.dynamic-textarea');

  textareas.forEach(textarea => {
    textarea.addEventListener('input', autoResize);
  });

  function autoResize() {
    this.style.height = 'auto'; // Reset height to auto to calculate the new height properly
    this.style.height = this.scrollHeight + 'px'; // Set height to the scrollHeight to fit the content
  }
});
