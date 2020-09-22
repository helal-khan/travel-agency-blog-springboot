<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/layouts/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
body {
	padding-right: 0 !important
}
.post-footer {
	display: none;
}
.text-success{
	color: #1CA651;
}
.text-danger{
	color: #C9302C;
}
.radio label{
	font-size: 17px;
}
</style>
<div class="page">
	<div class="container">
		<input type="hidden"
			value="${pageContext.request.contextPath}/change-status"
			name="change-status"> <input type="hidden"
			value="${pageContext.request.contextPath}/profile"
			name="createStatuss">
		<div class="row profile">
			<div class="col-md-12 success-alert">
				<div class="alert alert-success alert-dismissible fade in center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Success!</strong> Your status has been created.
				</div>
			</div>
			<div class="col-md-12 error-alert">
				<div
					class="alert alert-danger center alert-dismissible fade in center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Sorry!</strong> Something went wrong, try later.
				</div>
			</div>
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="img/user.png" class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${user.firstName}
							${user.lastName}</div>
						<div class="profile-usertitle-job-">
							<i class="fa fa-envelope-o" aria-hidden="true"></i> Email:
							${user.email}
						</div>
						<div class="profile-usertitle-job-">
							<i class="fa fa-clock-o" aria-hidden="true"></i> Join: <span
								id="join-info">${user.createdDate}</span>
						</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">Follow</button>
						<button type="button" class="btn btn-danger btn-sm">Message</button>
					</div>
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <i
									class="far fa-user-circle user-icon"></i> Profile
							</a></li>
							<li><a href="#"> <i class="fa fa-users"
									aria-hidden="true"></i> Friends
							</a></li>
							<li><a href="#" target="_blank"> <i class="fa fa-camera"
									aria-hidden="true"></i> Photos
							</a></li>
							<li><a href="#"> <i class="fa fa-info-circle"
									aria-hidden="true"></i> About
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>

			<div class="col-md-9">
				<form action="profile" method="POST" name="statusForm">
					<fieldset>
						<div class="section postdetails">
							<h4>Create a new post</h4>
							<div class="row form-group item-description">
								<label class="col-sm-12 label-title">Status<span
									class="required">*</span></label>
								<div class="col-sm-12">
									<textarea name="content" id="content" class="form-control"
										placeholder="Write status here" rows="4"></textarea>
								</div>
								<label class="col-sm-12 label-title">Choose privacy<span
									class="required">*</span></label>
								<div class="col-sm-12"
									style="margin-bottom: 7px; margin-top: -4px;">
									<label class="radio-inline"><input type="radio"
										name="access" value="1" checked>Public </label> <label
										class="radio-inline"><input type="radio" name="access"
										value="0">private </label>
								</div>
								<label class="col-sm-12 label-title">Check in<span
									class="required">*</span></label>
								<div class="col-sm-12">
									<select class="form-control select2 select2-hidden-accessible"
										name="location"
										style="width: 100%; margin-right: 30px !important;"
										tabindex="-1" aria-hidden="true">
										<option selected="selected" value="">Type your
											location here</option>
										<c:if test="${fn:length(locations) gt 0}">
											<c:forEach var="location" items="${locations}">
												<option value="${location.id}">${location.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
								<div class="col-md-3 post-submit pull-right">
									<button type="submit"
										class="btn btn-primary btn-post-submit btn-xs pull-right">
										<i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;Post
									</button>
								</div>
							</div>
						</div>
					</fieldset>

				</form>
				<c:forEach var="s" items="${listOfStatus}" varStatus="loop">
					<div class="media">
						<div class="pull-left" style="padding: 8px;">
							<img class="media-object"
								src="https://invatar0.appspot.com/svg/${fn:substring(s.user.firstName, 0, 1)}${fn:substring(s.user.lastName, 0, 1)}.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">
								${user.firstName} ${user.lastName}
								<div class="dropdown pull-right clickable">
									<p class="dropdown-toggle" type="button" data-toggle="dropdown">
										<i class="fa fa-ellipsis-h" aria-hidden="true"></i>
									</p>
									<ul class="dropdown-menu">
										<li><a id="changePrivacy" data-info='{"statusId": ${s.id}, "access": ${s.access}}'><i class="fa fa-unlock-alt" aria-hidden="true"></i> Privacy</a></li>
										<li><a onclick="myFunction(this, ${s.id})"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a></li>
										<li><a id="deletStatus" data-info='{"statusId": ${s.id}}'><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a></li>
									</ul>
								</div>
							</h4>
							<ul class="list-inline list-unstyled">
								<li><i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;${s.location.name}</li>
								<li><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;<span class="createDate${loop.index}">${s.createdDate}</span></li>
								<li><i class="fa fa-globe" aria-hidden="true"></i> &nbsp; <span id="access${s.id}"><c:out value="${s.access eq 0 ? 'Private': 'Public'}" /></span></li>
							</ul>
							<p id="post${s.id}" contenteditable="false">${s.content}</p>
							<div class="media-footer pull-right post-footer"
								id="postUpdateBtn${s.id}">
								<button type="button" class="btn btn-default bold"
									data-dismiss="modal">Cancel</button>
								<button type="button" class="btn btn-success bold"
									id="submitAccessChange"
									data-loading-text="<i class='fa fa-spinner fa-pulse'></i> Changing">Update</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- Change privacy modal -->
<div class="modal fade" id="privacyModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close bold" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
				<h4 class="modal-title bold text-success center">Change privacy</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<div class="radio">
							<label><input type="radio" name="updateAccess" value="1" id="publicEdit">Public</label>&nbsp;&nbsp;
							<label><input type="radio" name="updateAccess" value="0" id="privateEdit">Private</label> 
							<input type="hidden" id="updateStatusId">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer center">
				<button type="button" class="btn btn-default bold" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-success bold" id="submitChangePrivacy" data-loading-text="<i class='fa fa-spinner fa-pulse'></i> Changing">Change</button>
			</div>
		</div>
	</div>
</div>
<!--Post DELETE modal-->
<div class="modal fade" id="deleteModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close bold" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
				<h4 class="modal-title bold text-danger center">Confirm deletion</h4>
			</div>
			<div class="modal-body">
				<h4 class="center">
					<i class="fa fa-question-circle-o" aria-hidden="true"></i> Do you agree with this?
				</h4>
				<input type="hidden" id="deleteStatusId">
			</div>
			<div class="modal-footer center">
				<button type="button" class="btn btn-default bold" data-dismiss="modal">Cancel</button>
				<button type="button" id="submitDeleteStatus" data-loading-text="<i class='fa fa-spinner fa-pulse'></i> Deleting" class="btn btn-danger bold">Delete</button>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/jsp/layouts/Footer.jsp"%>
<script>
	function myFunction(btn, id) {
		var x = document.getElementById("post"+id);
		x.contentEditable = "true";
		document.getElementById("postUpdateBtn"+id).style.display = "block";
	}
	$(function() {
		$.profile = {
            currAccess: null,
            init: function () {
                $('.select2').select2();
                $('#join-info').text($.app.convertTimeStamp($('#join-info').text()));
                for(var i=0;i<'${fn:length(listOfStatus)}';i++){
    				$('.createDate'+i).html($.app.convertTimeStamp($('.createDate'+i).html()));
    			}
                $.profile.events.bindEvent();
            },
            events: {
                bindEvent: function () {
                	$.profile.events.createStatus();
                    $.profile.events.changePrivacy();
                    $.profile.events.submitChangePrivacy();
                    $.profile.events.deleteStatus();
                    $.profile.events.submitDeleteStatus();
                },
                createStatus: function () {
                	$('button[type=submit]').click(function(e) {
                		e.preventDefault();
                		$('.error').remove();
                		var data  = $('form[name=statusForm]').serialize();
                		$.ajax({
                            url: "/profile",
                            type: "POST",
                            data: $('form[name=statusForm]').serialize(),
                            success: function (res) {
                            	console.log(res);
	                             if (res.validated) {
	                            	$(".success-alert").fadeIn();
	                            	$('[name=statusForm]').after($.profile.updateUI(res.status));
	                            	setTimeout(function(){ $(".success-alert").fadeOut(); }, 4000);
	                            	//Reset create new form
	                            	
	                            } else {
	                                $.each(res.errorMessages, function (key, value) {
	                                    $('[name=' + key + ']').before('<label class="error">' + value + '</label>');
	                                });
	                            }
                            },
                            error: function (error) {
                            	$(".errror-alert").fadeIn();
                            }
                        });
                	});
                },
                changePrivacy: function () {
					$(document).off('click', '#changePrivacy').on('click', '#changePrivacy', function (e) {
						$('#publicEdit').prop('checked', $(this).data("info").access==1 ? true:false);
						$('#privateEdit').prop('checked', $(this).data("info").access==0 ? true:false);
						$("#updateStatusId").val($(this).data("info").statusId);
						$('#privacyModal').modal('show');
					 });
                },
                submitChangePrivacy: function () {
                    $(document).off('click', '#submitChangePrivacy').on('click','#submitChangePrivacy', function (e) {
						var btn = $(this).button('loading');
                    	var access = $("input[name='updateAccess']:checked").val();
                    	var id = $("#updateStatusId").val();
                    	var selector = "#access"+id;
                    	
                		$.ajax({
                            url: "/update-privacy",
                            type: "POST",
                            data: {"id": id, "access": access},
                            success: function (res) {
                            	if (res.validated) {
                            		btn.button('reset'); 
                           		 	$('#privacyModal').modal('hide');
                           		 	$(selector).text($.profile.access[access]);                    		 
                           		 	$(selector).parent().parent().parent().find('#changePrivacy').data('info',{"statusId": id, "access": access});
                           		 	Notiflix.Notify.Success('Privacy has been changed');
	                            } else {
	                            	Notiflix.Notify.Failure('Somthing went wrong');
	                            }
                            },
                            error: function (error) {
                            	Notiflix.Notify.Failure('Somthing went wrong');
                            }
                        });
                	});
                },
                deleteStatus: function () {
					$(document).off('click', '#deletStatus').on('click', '#deletStatus', function (e) {
						$("#deleteStatusId").val($(this).data("info").statusId);
						$('#deleteModal').modal('show');
					 });
                },
                submitDeleteStatus: function () {
                    $(document).off('click', '#submitDeleteStatus').on('click','#submitDeleteStatus', function (e) {
						var btn = $(this).button('loading');
                    	var id = $("#deleteStatusId").val();
                    	var selector = "#access"+id;
                    	
                		$.ajax({
                            url: "/delete-status",
                            type: "POST",
                            data: {"id": id},
                            success: function (res) {
                            	if (res.validated) {
                            		btn.button('reset'); 
                           		 	$('#deleteModal').modal('hide');
                           		 	$(selector).parent().parent().parent().parent().slideUp();
                           		 	Notiflix.Notify.Success('Status has been removed');
	                            } else {
	                            	Notiflix.Notify.Failure('Somthing went wrong');
	                            }
                            },
                            error: function (error) {
                            	Notiflix.Notify.Failure('Somthing went wrong');
                            }
                        });
                	});
                }
            },
            updateUI: function (status) {
            	var name = $('.profile-usertitle-name').text();
            	var photo = $('.media-object ').attr('src');
            	var location = $("[name='location'] option:selected").text();
            	return '<div class="media">\
							<div class="pull-left" style="padding: 8px;">\
							<img class="media-object" src="'+photo+'">\
						</div>\
						<div class="media-body">\
							<h4 class="media-heading">\
								'+name+' \
								<div class="dropdown pull-right clickable">\
									<p class="dropdown-toggle" type="button" data-toggle="dropdown">\
										<i class="fa fa-ellipsis-h" aria-hidden="true"></i>\
									</p>\
									<ul class="dropdown-menu">\
										<li><a id="changePrivacy" data-info="'+{"statusId": 1, "access": 1}+'"><i class="fa fa-unlock-alt" aria-hidden="true"></i> Privacy</a></li>\
										<li><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a></li>\
										<li><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a></li>\
									</ul>\
								</div>\
							</h4>\
							<ul class="list-inline list-unstyled">\
								<li><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;'+location+'</li>\
								<li><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;'+$.app.convertTimeStamp(status.createdDate)+'</li>\
								<li><i class="fa fa-globe" aria-hidden="true"></i>&nbsp;<span id="access'+status.id+'">'+$.profile.access[status.access]+'</span></li>\
							</ul>\
							<p>'+status.content+'</p>\
						</div>\
					</div>';      
           	},
           	access: {
           		0: "Private",
           		1: "Public"
           	},
           	
        };
$.profile.init();
});
</script>
