// Hide alert boxes
$(document).on('turbolinks:load', function(){
    const alert = $("#app_alert");
    const notice = $("#app_notice")

    if ($.trim(alert.text()).length > 0) {
      alert.show()
    } else if ($.trim(notice.text()).length > 0) {
      notice.show()
    } else {
    //   alert.hide()
    //   notice.hide()
    }
    
});