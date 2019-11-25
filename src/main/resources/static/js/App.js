$(function() {
	$.toast = function(type,msg){
		toastr[type]("<h5><b>"+msg+"</b></h5>");
	}
	$.logout = function(){
		$( "#logoutForm" ).submit();
	}
	//User menu
	$(".dropdown-toggle").dropdown();
	$('.dropdown').on('show.bs.dropdown', function(e){
	  $(this).find('.dropdown-menu').first().stop(true, true).slideDown(300);
	});
	$('.dropdown').on('hide.bs.dropdown', function(e){
	  $(this).find('.dropdown-menu').first().stop(true, true).slideUp(200);
	});
	
	//Main App Script
	$.app = {
		version: 1.0,
		contextPath: $('#context-path').val(),
		init: function(){
			this.ajaxSetup();
			this.toast();
		},
		loadSelect: function(json, firstOption, select){
			
			select.find('option').remove();
            $('<option>').val("0").text(firstOption).appendTo(select);
            
            $.each(json,function(i,obj){
            	$('<option>').val(obj.upazilaId).text(obj.nameBan).appendTo(select);
            });
		},
        formByName: function (context) {
            var serializeArray = context;
            if (!$.isArray(context)) {
                var $input = $(context);
                var $disabled = $input.filter(':disabled').prop('disabled', 0);
                serializeArray = $input.serializeArray();
                $disabled.prop('disabled', 1);
            }
            return serializeArray.reduce(function (obj, item) {
            	obj[item.name] = item.value;
                return obj;
            }, {});
        },
		ajaxSetup: function() {
		    $.ajaxSetup({
		        beforeSend: function () {
		        	$.app.blockUI();
		        	console.log('ajax: Started');
		        },
		        complete: function () {
		        	$.app.unblockUI();
		            console.log('ajax: Completed');
		        },
		        success: function () {
		            console.log('ajax: Success');
		        },
		        error: function () {
		            console.log('ajax: Error');
		        }
		    });
		},
		convertDate: function(date) {
			return date.split("-")[2]+"/"+date.split("-")[1]+"/"+date.split("-")[0];
		},
		convertTimeStamp: function(createdDate) {
		    if (createdDate == null)
		        return "";
		    else
		        createdDate = new Date(createdDate);
		    var date = createdDate.toLocaleDateString(),
		            time = createdDate.toLocaleTimeString();
		    date = date.replace(/(\d+)\D(\d+)\D(\d+)/g, '$2/$1/$3');
		    time = time.replace(/(.*)\D\d+/, '$1');
		    return date + ' ' + time;
		},
		blockUI: function(){
        	$.blockUI({ 
        		css: { 
        			border: '5px solid #00A651', 
        			color: '#000',
    			    width: '30%',
    			    borderRadius: '10px'
        		}, 
        		message: '<h2><i class="fa fa-cog fa-spin" style="font-size:40px"></i> Just a moment...</h2>' 
        	});
		},
		unblockUI: function(){
			$.unblockUI({ fadeOut: 200 }); 
		},
		loadYear: function(context){
			$(context).find('option').remove();
		    for (i = new Date().getFullYear(); i > 1980; i--)
		    {
		        $(context).append($('<option />').val(i).html(this.e2b(i)));
		    }
		},
		toast: function() {
			toastr.options = {
	            "closeButton": true,
	            "debug": false,
	            "newestOnTop": false,
	            "progressBar": true,
	            "positionClass": "toast-top-right",
	            "preventDuplicates": true,
	            "onclick": null,
	            "showDuration": "300",
	            "hideDuration": "1000",
	            "timeOut": "3000",
	            "extendedTimeOut": "1000",
	            "showEasing": "swing",
	            "hideEasing": "linear",
	            "showMethod": "fadeIn",
	            "hideMethod": "fadeOut"
            };
		}
	};
	$.app.init();
});