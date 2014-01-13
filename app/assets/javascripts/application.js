// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min.js
//= require underscore-min.js
//= require_tree .

$(document).ready(function() {
  event.preventDefault();
  var map = L.map('map', {
      center:[37.7749295,-122.4194155],
      zoom: 11,
    // layers: [school_group]
    });
    L.tileLayer('http://{s}.tile.cloudmade.com/f6c127adc91a47f1b4a73837013ed783/998/256/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18,
      minZoom: 1,
      maxBounds: [[-85, -180], [85, 180]]
    }).addTo(map);

  $('#submit_search').click(function(){
    var address_search = $('#address_search').val();
    updateMap(map, address_search);
  })
  // var school_group = new L.LayerGroup();
  // var url = "/offline_schools.json?lat=37.7749295&lng=-122.4194155";
  createMap(map);
  // var overlays = {
  //   "school_group": school_group
  // }
  // L.control.layers(overlays).addTo(map);
});

var updateMap = function(map, address_search){
  $.ajax({
    type: "GET",
    url: "/offline_schools.json?address_search=" + address_search
  }).done(function (data) {
    var lat = data.lat;
    var lng = data.lng;
    map.setView(new L.LatLng(lat, lng));
    // layers: [school_group]
  });
};

var createMap = function(map){
  var address_search = address_search;
  $.ajax({
    type: "GET",
    url: "/offline_schools.json"
  }).done(function (data) {
    // for (var i = 0; i < response.length; i++) {
    //   L.marker([response[i].latitude,response[i].longitude])
    //     .openPopup('click').bindPopup(
    //     "<strong>" + response[i]["name"] + "</strong>" + "<br>"
    //     + response[i]["street"] + "<br>" + response[i]["bio"]
    //   ).addTo(school_group);
  });
};

