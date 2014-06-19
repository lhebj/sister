function messageSubmit() {
	var message = $('#message').val();
	var $loginError = $('#error_message');
	if (message == '') {
		$loginError.html('请输入留言').show();
		return;
	}
	$.post('message.do?action=save', {
		message : message
	}, function(json) {
		json = $.parseJSON(json);
		if (!!json.success) {
			alert("感谢您留言！");
			$('#message').val("");
			$loginError.hide();
//			window.location.reload();
		} else {
			$loginError.html(json.message).show();
		}
	});
}
