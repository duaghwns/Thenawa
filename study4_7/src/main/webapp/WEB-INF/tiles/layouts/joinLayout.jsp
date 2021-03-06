<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<tiles:insertAttribute name="header" />
<title><tiles:getAsString name="title" /></title>
</head>
<style>
      .error {
         color: #ff0000;
      }

      .errorblock {
         color: #000;
         background-color: #ffEEEE;
         border: 3px solid #ff0000;
         padding: 8px;
         margin: 16px;
      }
   </style>
<body class="vertical  light  ">
	<tiles:insertAttribute name="top" />
	<div class="wrapper">
		<tiles:insertAttribute name="body" />
	</div>
	<!-- .container -->
	<!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/simplebar.min.js"></script>
    <script src='<%=request.getContextPath() %>/resources/js/daterangepicker.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/jquery.stickOnScroll.js'></script>
    <script src="<%=request.getContextPath() %>/resources/js/tinycolor-min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/config.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/d3.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/topojson.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/datamaps.all.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/datamaps-zoomto.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/datamaps.custom.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/Chart.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gauge.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.sparkline.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/apexcharts.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/apexcharts.custom.js"></script>
    <script src='<%=request.getContextPath() %>/resources/js/jquery.mask.min.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/select2.min.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/jquery.steps.min.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/jquery.validate.min.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/jquery.timepicker.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/dropzone.min.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/uppy.min.js'></script>
    <script src='<%=request.getContextPath() %>/resources/js/quill.min.js'></script>
	<!-- ????????????api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function execDaumPostcode() {
    	event.preventDefault();
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // ????????? ???????????? ????????? ????????????.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
	<script>
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
     (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })(); 
    </script>
    <script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We???ve uploaded these files:', result.successful)
        });
      }
    </script>
    <script src="<%=request.getContextPath() %>/resources/js/apps.js"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
    <script>
    $("#memId").keyup(function(){
    	$("#idCheck").attr("value", "N");
    });
    function fn_idChk(){
    	event.preventDefault();
    	if ($("#memId").val() == ""){
    		$("#idCheck").attr("value", "N");
    		alert("???????????? ??????????????????.");
    	}else{ 

	        $.ajax({
	
	            url : "/join/idChk",
	            
	            type : "post",
	            
	            data : {"memId":$("#memId").val()},
	
	            success : function(data){
	
	                if(data == 1){
	                	$("#idCheck").attr("value", "N");
	                    alert($("#memId").val()+"??? ?????????????????? ??????????????????.");
	
	                }else if(data == 0){
	
	                    $("#idCheck").attr("value", "Y");
	
	                    alert($("#memId").val()+"??? ??????????????? ??????????????????.");
	                }
	            }
	        })
    	}
    }
    //??????????????? validate
    
    $(function() { 
    	$.extend( $.validator.messages, { 
    		required: "?????? ???????????????.", 
    		remote: "????????? ???????????????.", 
    		email: "???????????? ?????? E-Mail???????????????.", 
    		url: "???????????? ?????? URL?????????.", 
    		date: "????????? ????????? ???????????????.", 
    		dateISO: "????????? ??????(ISO)??? ???????????????.", 
    		number: "????????? ????????? ????????????.", 
    		digits: "????????? ?????? ???????????????.", 
    		creditcard: "???????????? ????????? ????????? ????????????.", 
    		equalTo: "?????? ????????????.", 
    		extension: "????????? ???????????? ????????????.", 
    		maxlength: $.validator.format( "{0}?????? ?????? ??? ????????????. " ), 
    		minlength: $.validator.format( "{0}??? ?????? ???????????????." ), 
    		rangelength: $.validator.format( "?????? ????????? {0}?????? {1}??? ?????? ???????????????." ), 
    		range: $.validator.format( "{0} ?????? {1} ????????? ?????? ???????????????." ), 
    		max: $.validator.format( "{0} ????????? ?????? ???????????????." ), 
    		min: $.validator.format( "{0} ????????? ?????? ???????????????." ) } );

    	});
    
	// ????????? ?????? ????????????
    function fn_emailSend(){
    	event.preventDefault();
    	if($("#memMail").val() == ""){
    		alert("???????????? ??????????????????.");
    	}else{
    		alert("??????????????? ??????????????????. ????????? ??????????????????");
        	var param={email : $("#memMail").val()};
        	$.ajax({
        		url : "email",
        		type : "post",
        		data : param,
        		success : function (data){	//data??? ????????? 6?????? ?????? ?????????
        			alert(data);
        			$("#emailKey").val(data);
        		}
        	});	
    	}	
    }
    
    if($(".nextBtn").text()=="Finish"){
    	$(document).on("click",".nextBtn",function(){
    		$(".nextBtn").submit();
    	});
    }
    </script>
</body>
</html>