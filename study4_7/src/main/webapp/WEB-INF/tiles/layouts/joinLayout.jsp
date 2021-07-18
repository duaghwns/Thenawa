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
	<!-- 다음주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function execDaumPostcode() {
    	event.preventDefault();
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
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
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
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
    		alert("아이디를 입력해주세요.");
    	}else{ 

	        $.ajax({
	
	            url : "/join/idChk",
	            
	            type : "post",
	            
	            data : {"memId":$("#memId").val()},
	
	            success : function(data){
	
	                if(data == 1){
	                	$("#idCheck").attr("value", "N");
	                    alert($("#memId").val()+"는 사용불가능한 아이디입니다.");
	
	                }else if(data == 0){
	
	                    $("#idCheck").attr("value", "Y");
	
	                    alert($("#memId").val()+"는 사용가능한 아이디입니다.");
	                }
	            }
	        })
    	}
    }
    //부트스트랩 validate
    
    $(function() { 
    	$.extend( $.validator.messages, { 
    		required: "필수 항목입니다.", 
    		remote: "항목을 수정하세요.", 
    		email: "유효하지 않은 E-Mail주소입니다.", 
    		url: "유효하지 않은 URL입니다.", 
    		date: "올바른 날짜를 입력하세요.", 
    		dateISO: "올바른 날짜(ISO)를 입력하세요.", 
    		number: "유효한 숫자가 아닙니다.", 
    		digits: "숫자만 입력 가능합니다.", 
    		creditcard: "신용카드 번호가 바르지 않습니다.", 
    		equalTo: "값이 다릅니다.", 
    		extension: "올바른 확장자가 아닙니다.", 
    		maxlength: $.validator.format( "{0}자를 넘을 수 없습니다. " ), 
    		minlength: $.validator.format( "{0}자 이상 입력하세요." ), 
    		rangelength: $.validator.format( "글자 길이가 {0}부터 {1}인 값을 입력하세요." ), 
    		range: $.validator.format( "{0} 에서 {1} 사이의 값을 입력하세요." ), 
    		max: $.validator.format( "{0} 이하의 값을 입력하세요." ), 
    		min: $.validator.format( "{0} 이상의 값을 입력하세요." ) } );

    	});
    
	// 이메일 인증 스크립트
    function fn_emailSend(){
    	event.preventDefault();
    	if($("#memMail").val() == ""){
    		alert("이메일을 입력해주세요.");
    	}else{
    		alert("인증메일을 발송했습니다. 메일을 확인해주세요");
        	var param={email : $("#memMail").val()};
        	$.ajax({
        		url : "email",
        		type : "post",
        		data : param,
        		success : function (data){	//data가 생성된 6자리 숫자 랜덤키
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