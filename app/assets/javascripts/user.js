$(document).on('change','#avata_image', function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
    alert(I18n.t("admin.users.max_size_error"));
  }
});
