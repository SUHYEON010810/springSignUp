<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="moreInfo" style="display:none">
         <div class="tab01 mar_t40">
            <ul class="tab-5">
               <li class ="on"><a href="#detail">상세정보</a></li>
               <li><a href="#usageHist">사용량이력</a></li>
               <li><a href="#modemHist">단말기이력</a></li>
               <li><a href="#memoHist">메모이력</a></li>
            </ul>
         </div> <!--End Of ".tab01 mar_t40"-->
         <div id="detail" class="tab_content">
            <table class="contTbl2 cT_line slim txtC">
               <colgroup>
               <col class="wp10">
               <col class="wp10">
               <col class="wp10">
               <col class="wp10">
               <col class="wp10">
               <col class="wp10">
               <col class="wp10">
               <col class="wp10">
               </colgroup>
               <tbody>
               <!-- js 로 넣을 공간 -->
               </tbody>
            </table>
         </div> <!-- End Of "#detail"-->
         </div> <!--End Of ".moreInfo"-->
         <!-- 로딩 popup  -->
         <div id="pop_loading" class="Pstyle">
         <div class="pop_content">
            <h1 class="tle_h4"><i class="fa fa-spinner fa-pulse"></i> 로딩중…</h1>
            <div>시간이 오래 걸릴 수도 있으니 잠시만 기다려주세요.</div>
         </div>
      </div>

<script>

   //상단 탭 클릭 이벤트
   $(function(){
      $('.tab_01 ul il').click(function(){
      $('.tab_01 ul li').removeClass('on');
      $(this).addClass('on');
      $('.tab_content').hide();

      //하단 탭 클릭 이벤트..."상세정보, 사용량이력, 단말기이력, 메모이력"
      var selectTab = $(this).find('a').attr("href");

      $(selectTab).show();
      if(selectTab == "#usageHist"){
         getDetail(selectTab);
         $('#usageHist .tabSide').show();  // #usageHist밑의 .tabSide 보이게함
      }
      // 생략
      return false;
      });
   });

   function getDetail(param){
      //값을 받기 ㅟ한 Object 선언
      var data = new Object();
      data.mngId = mngId;
      data.toDate = moment(getStandardDate()).format('yyy-m-dd hh:00'); // 추후에 hh:00 지워야함
      data.waterUserType = type;

      $.ajax({
      url: ,
      type: 'post',
      dataType: ,
      contentType: ,
      data: ,
      success: function(result){ //result : {mngId: 'mngId', waterUserType: 'waterUserType', consumerName: 'consumerName'}
      //상세정보 Tab
         if(param=="#detail"){
            $('$detail tbody').html(''); // 일단 비워
            if(result.length >0) { //값을 받아오면 0보단 커지지
            var detail_rt =  // tbody 내부에 넣을 html코드 작성
            '<tr>' + '<th scope="row">고객번호</th>' +
            '<td>' + result.mngId+ '</td>'+
            '<th scope="row">구분</th>' +
            '<td>' + result.waterUserType + '</td>'+
            '<th scope="row">성명</th>' +
            '<td>' + result.name + '</td>'+
            '</tr>' ;
            $('#detail tbody').append(detail_tr);
         }
      }
   },
   error: function {}
      });
   };
</script>
