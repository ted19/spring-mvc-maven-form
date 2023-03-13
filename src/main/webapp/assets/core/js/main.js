function post(frm, path, params, method) {

	if (path.split('/')[3] == 'delete') {
		var result = confirm('Are you sure you want to delete?');
			
		if (!result) {
			frm.disabled=false;
			return;
		}
	}
	
	method = method || "post";

	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path);
	
	for (var key in params) {
		if (params.hasOwnProperty(key)) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);

			form.appendChild(hiddenField);
		}
	}

	document.body.appendChild(form);
	form.submit();
}