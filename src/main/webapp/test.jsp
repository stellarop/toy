<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

td{
   text-align: center
}
table, td, th {
  border : 1px solid black;
  border-collapse : collapse;
}
input{
   	width : 500px;
   	
 	position: absolute;
  	width: 1px; height: 1px;
  	margin: -1px;
	overflow: hidden;
	clip-path: polygon(0 0, 0 0, 0 0);
	
}
#inputId{


}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 4 -->

<script src="jquery/jquery-3.6.0.min.js"></script>
<script src="dataTable/datatable-editor.js"></script>
<script src="dataTable/datatables.min.js"></script>


<script>

var rfid = {
   init : function(){
      //rfid.tabInit();
      rfid.btnInit();
      rfid.inputInit();
      rfid.loop();
   },
   loop : function() {
       setInterval(function() {
          rfid.tabInit();
          $('#tbody1').toggle();
         
       }, 3000);
   },
    tabInit : function(){
   
	   /*
       $('#Table').DataTable({
         searching: false,
         paging: false,

         columns: [
              { title: "Name" ,width:"80%"},
              { title: "Gender" , width:"10%"},
              { title: "Age" , width:"10%"},
          ],
          columnDefs: [
                 { targets: 0     ,className: "dt-head-center dt-body-center"}
                ,{ targets: 1     ,className: "dt-head-center dt-body-center"}
                ,{ targets: 2     ,className: "dt-head-center dt-body-center"}
          ]
      });
	  */
	  $.ajax({
		  url : 'displayData.do',
          type : 'get',
          dataType : 'json',
          async : false,
          success : function(data){
        	  
        	  table1 = '';
        	  table2 = '';
        	  const arr1 = data.slice(0,5);
        	  const arr2 = data.slice(5,10);
        	  //console.log(data);
        	  //$('#tbody1').toggle();
        	  $('#tbody2').toggle();
        	 
        	 
        	  $(arr1).each(function(key, value){
            	  table1 +='<tr>';
                  table1 +='<td>' + value.name + '</td>';
                  table1 +='<td>' + value.gender + '</td>';
                  table1 +='<td>' + value.data + '</td>';
                  table1 +='</tr>';
                 
              });
        	  $(arr2).each(function(key, value){
            	  table2 +='<tr>';
                  table2 +='<td>' + value.name + '</td>';
                  table2 +='<td>' + value.gender + '</td>';
                  table2 +='<td>' + value.data + '</td>';
                  table2 +='</tr>';
              });
        	  $('#tbody1').html(table1);
        	  $('#tbody2').html(table2);
          }
	 
	  })
			
          
   },
	
   btnInit : function(){
      $('#testBtn').click(function() {
         var successCallback =  function(result){
            alert(result.a);
         }

         var resultCallback = function(result){
            alert("테이블 오류1");
         }
         ajaxCall('/Test/ajaxtest',successCallback, resultCallback);

      });

      $('#testBtn2').click(function() {
         var successCallback =  function(result){
            alert(result.a);
         }

         var resultCallback = function(result){
            alert("테이블 오류1");
         }
         ajaxCall('/Test/ajaxtest2',successCallback, resultCallback);
      });

   },
   inputInit : function() {
      $("#inputId").keydown(function(key){
           if(key.keyCode == 13) {
              	var inputId = $('#inputId').val();
             rfid.sendData(inputId)
           }
       });
   },
   sendData : function(data){
      //alert(data + '고객님 전송성공')
      var inputId = data;
      alert('입력값 : ' + inputId);
      var a;
	  $.ajax({
		  url : 'testData.do',
		  type : 'post',
		  datatype : 'json',
		  data : {data : data},
		  async : false,
		  success : function(data){
			 //alert('success');
			  //alert(data.toData);
			  a = data.toData;
		  },
		  error : function(data) {
				alert('error');
		} 
		 
	  })
	   //return a;
      // 여기서 서버에서 호출해서 데이터를 받아옵니다.
      $('#inputId').val('');
      //alert('ajax 밖에서 호출 : ' + a);
      // ajax로 데이터 호출
      
   }

}

$(function(){
   rfid.init();
	$('#inputId').focus();

});


function ajaxCall( url, successCallback, resultCallback){
  
   $.ajax({
      url : url,
      type : 'get',
      dataType : 'json',
      success : function(data) {
         successCallback(data);
      }
      ,error: function(data) {
         resultCallback(data);

      }
   })
}

/*
var table = $('#Table').DataTable({
    //language : table_lang_option_eng(),
    processing : true, //처리중 대기상태가 발생 시 processing의 로딩표시를 보여줌
    sDom: '<f>t<"row"<"paging-position"p>>', //Info, Filter, Search, page 등의 UI를 커스텀
    data:dataSet,
    fnRowCallback: function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        if(aData.no == null){
            $('td', nRow).css('background-color', '#FFFF99');
        }
    },
    scrollY:'55vh',
    destroy: true,
    select: true,
    searching: false,
    bSort: false,
    paging: false,
    pageLength:20,
    columns: [
        { title: "<spring:message code='lis.no' />"            , data: "no"    ,width:'30px'    },
        { title: "<spring:message code='lis.clientCo' />"      , data: "deptNm"  , width:"200px"     },
        { title: "<spring:message code='lis.examCd' />"        , data: "prscCd"  , width:"200px"     },
        { title: "<spring:message code='lis.examNm' />"        , data: "prscNm"                      },
        { title: "<spring:message code='lis.nmOfreq' />"       , data: "cnt"     , width: "50px"     },
        { title: "<spring:message code='lis.price' />"         , data: "amt"     , width: "50px"  ,render : $.fn.dataTable.render.intlNumber('us')  },
    ],
    columnDefs: [
           { targets: 0     ,className: "dt-head-center dt-body-center"  }
          ,{ targets: 1     ,className: "dt-head-center dt-body-center"  }
          ,{ targets: 2     ,className: "dt-head-center dt-body-center"  }
          ,{ targets: 3     ,className: "dt-head-center dt-body-left"    }
          ,{ targets: 4     ,className: "dt-head-center dt-body-center"  }
          ,{ targets: 5     ,className: "dt-head-center dt-body-right"   }
    ]
});
*/



</script>
</head>
<body>
<!--
   <h1>test</h1>
   <button type="button" id="testBtn">test</button>
   <button type="button" id="testBtn2">test</button>
-->

   <p>Room Name : <input type="text" id="inputId"></input></p>
   <table id="Table" style="border: 1px solid #444444;" width="100%" >
		<thead>
        	<tr>
            	<th>Name</th>
            	<th>Gender</th>
            	<th>Age</th>
        	</tr>
        	<tbody id="tbody1">
        		
        	</tbody>
        	
        	<tbody id="tbody2">
        		
        	</tbody>
        	 
   </table>


</body>
</html>