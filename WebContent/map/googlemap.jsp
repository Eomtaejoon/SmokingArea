
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml"> 
 <head>   
 <meta http-equiv="content-type" content="text/html; charset=euc-kr"/>
 <meta name="description" content="������ �ּ�ǥ�� ���� �浵 ã�� " />
 <meta name="keywords" content="����, �浵, ���۸�API, ���۸� �ּ�ǥ��"/>
 <meta name="robots" content="ALL">
 <meta name="revisit-after" content="1 week">
 <meta name="rating" content="general">
  
 <style>
 body, p, input, button { font-family:Tahoma,����; font-size:9pt; color:#222222; }
 form { margin:0px; }
 </style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAd__vmykq3JcA7a9ShGUDZhS50Xx4Z3zP04LdqhrP0d9llY9WRxTPgmyCgKWPwRehkzze0rD1r88ngg" type="text/javascript"></script>    
     <script type="text/javascript">
    
    

     var map;
     var geocoder;
     var lng;
     var lat;
     function initialize() {
         if (navigator.geolocation){
             navigator.geolocation.getCurrentPosition(showPosition1);
       }
       function showPosition1(position){
            lat = position.coords.latitude;
            lng = position.coords.longitude;
             map = new GMap2(document.getElementById('map_canvas'));
                map.setCenter(new GLatLng(lat,lng), 15);
             geocoder = new GClientGeocoder();
             
             
             point = new GLatLng(lat, lng);
             marker = new GMarker(point);
             map.addOverlay(marker);
       }
     }
 // ������

    function addAddressToMap(response) {
       map.clearOverlays();
       if (!response || response.Status.code != 200) {
         alert("Sorry, �ּҸ� Ȯ���� �ּ���!!");
       } else {
         place = response.Placemark[0];
         point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);
         marker = new GMarker(point);
         map.addOverlay(marker);
         marker.openInfoWindowHtml(
         '<b>����,�浵:</b>' + place.Point.coordinates[1] + "," + place.Point.coordinates[0] + '<br>' +
         '<b>�ּ�:</b>' + place.address);
         return place.Point.coordinates[2];
       }
     }
  
     function showLocation() {
       var address = document.forms[0].q.value;
       geocoder.getLocations(address, addAddressToMap);
     }
         
     </script>
   </head>

 <body onload="initialize()">
 <form onsubmit="showLocation(); return false;" method = "post" name = "google_s">
       <p>
         <b>�ּ��Է�:</b>
         <input type="text" name="q"  class="address_input" size="40"/>
           
         <input type="submit" name="find" value="Search" />
       </p>
     </form>
     <div id="map_canvas" style="width:100%; height:100%; max-width: 500px; max-height: 400px; margin: auto;">
 
  </div>
  </body>
 </html>