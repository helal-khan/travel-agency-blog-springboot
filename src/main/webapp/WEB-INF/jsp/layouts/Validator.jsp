<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
	//Validation started
	$.validator.setDefaults({
		debug : true,
		success : "valid"
	});
	// Login
	$("#login").validate({
		submitHandler : function(form) {
			if ($(form).valid())
				form.submit();
			return false;
		},

		success : function(label, element) {
			label.parent().removeClass('error');
			label.remove();
		},

		rules : {
			username : {
				required : true
			},
			password : {
				required : true
			}
		},
		messages : {
			username : {
				required : "required"
			},
			password : {
				required : "<fmt:message key='NotEmpty.user.password' />"
			}
		}
	});
	
	
	// User Registration
	$.validator.addMethod("usernameRegex",function(value, element, regexp) {
		var patt1 = /^[a-zA-Z0-9_.]+$/;
		return value.match(patt1) != null? true:false;
	},"<fmt:message key='Pattern.user.username' />");
	
	$.validator.addMethod("whitespaceRegex",function(value, element, regexp) {
		var patt1 = /\s/g;
		return value.match(patt1) == null? true:false;
	},"<fmt:message key='Pattern.user.password' />");
	
	$.validator.addMethod("mobileNoRegex",function(value, element, regexp) {
		var patt1 = /^(01)(1|7|8|9|6)[0-9]{8}$/;
		return value.match(patt1) != null? true:false;
	},"<fmt:message key='Pattern.user.phone' />");
	
	$("#userRegistration").validate({
		submitHandler : function(form) {
			if ($(form).valid())
				form.submit();
			return false;
		},
		rules : {
			firstName : {
				required : true
			},
			lastName : {
				required : true
			},
			username : {
				required : true,
				usernameRegex: true,
				minlength: 6,
				maxlength: 30
				
			},
			password : {
				required : true,
				whitespaceRegex: true,
				minlength: 6,
				maxlength: 30
			},
			confirmPassword : {
				equalTo : "#password"
			},
			email : {
				required : true,
				email : true
			},
			phone : {
				required : true,
				number : true,
				mobileNoRegex: true
			}
		},
		messages : {
			firstName : {
				required : "<fmt:message key='NotEmpty.user.firstName' />"
			},
			lastName : {
				required : "<fmt:message key='NotEmpty.user.lastName' />"
			},
			username : {
				required : "<fmt:message key='NotEmpty.user.username' />",
				minlength: "<fmt:message key='Size.user.username' />",
				maxlength: "<fmt:message key='Size.user.username' />"
			},
			password : {
				required : "<fmt:message key='NotEmpty.user.password' />",
				minlength: "<fmt:message key='Size.user.password' />",
				maxlength: "<fmt:message key='Size.user.password' />"
			},
			confirmPassword : {
				equalTo : "Passwords do not match"
			},
			email : {
				required : "<fmt:message key='NotEmpty.user.email' />",
				email : "<fmt:message key='Email.user.email' />"
			},
			phone : {
				required : "<fmt:message key='NotEmpty.user.phone' />",
				number : "Phone must be numeric value"
			}
		}
	});
	
	$("#postStatus").validate({
		submitHandler : function(form) {
			if ($(form).valid())
				form.submit();
			return false;
		},
		rules : {
			status : {
				required : true
			},
			locationId : {
				required: true,
				integer: true
			}
		},
		messages : {
			status : {
				required : "Status write here<br/>"
			},
			locationId : {
				required : "Select location",
				integer : "Select location"
			}
		}
	});
	

	
	//Event based validation
	$(function() {
		$.validation = {
		    init: function () {
		    	this.events.bindEvent();
		    },
		    url:null,
		    events: {
		        bindEvent: function () {
		        	$.validation.events.checkExistance();
		        },
		        checkExistance: function(){
					$(document).off('blur', '#userRegistration #username').on('blur', '#userRegistration #username', function(e){
						$.validation.url = $('input[name="url-check-username"]').val();
						$.get($.validation.url, { username: this.value } )
						 .done(function( response ) {
							 if(JSON.parse(response).data){
								$('#userRegistration #username').next('label').remove();
		                		$('#userRegistration #username').after('<label id="username-error" class="error" for="username"><fmt:message key="DuplicateKey.user.username" /></label>');
					 		}
					  	  })
					  	 .fail(function() {
					  		 console.log("Username can't check");
					  	  });
					});
					$(document).off('blur', '#userRegistration #email').on('blur submit', '#userRegistration #email', function(e){
						$.validation.url = $('input[name="url-check-email"]').val();
						$.get($.validation.url, { email: this.value } )
						 .done(function( response ) {
							 if(JSON.parse(response).data){
							 	$('#userRegistration #email').next('label').remove();
		                		$('#userRegistration #email').after('<label id="email-error" class="error" for="email"><fmt:message key="DuplicateKey.user.email" /></label><br/>');
							 }
						 })
					  	 .fail(function() {
					  		 console.log("Email can't check");
					  	  });
					});
				}
			    
		    }
		}
		$.validation.init();
	});
</script>