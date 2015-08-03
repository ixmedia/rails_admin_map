var googleMapsCoordinatesInputs,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

googleMapsCoordinatesInputs = (function() {
  function googleMapsCoordinatesInputs($el) {
    this.init = __bind(this.init, this);
    this.element = $el;
    this.readOnly = this.element.attr('data-readonly') && this.element.attr('data-readonly') === 'true' ? true : false;
    this.coordLatHiddenInput = this.coordLatInput = $('.js-lat-hidden');
    this.coordLngHiddenInput = this.coordLngInput = $('.js-lng-hidden');
    this.defaultZoom =parseInt($el.attr('data-zoom'))

    if (this.coordLngHiddenInput.length === 0 && this.coordLatHiddenInput.length === 0) {
      this.init(46.8130389, -71.2300141);
    } else {
      this.init(this.coordLatHiddenInput.val(), this.coordLngHiddenInput.val());
    }
  }

  googleMapsCoordinatesInputs.prototype.init = function(lat, lng) {
    var geoposition, mapinfo;
    geoposition = {
      lat: lat,
      lng: lng
    };
    mapinfo = this.initGoogleMap(geoposition, this.element);
    this.bindMapEvents(mapinfo);
  };

  googleMapsCoordinatesInputs.prototype.initGeoLocation = function(callback) {
    if (navigator.geolocation) {
      return navigator.geolocation.getCurrentPosition(function(position) {
        return callback(position.coords.latitude, position.coords.longitude);
      });
    } else {
      return callback(46.8130389, -71.2300141);
    }
  };

  googleMapsCoordinatesInputs.prototype.initGoogleMap = function(geoposition, mapContainer) {
    var initMarkerCoord, map, mapCenterCoord, mapOptions, marker, markerOption, pin;
    mapCenterCoord = new google.maps.LatLng(geoposition.lat, geoposition.lng);
    initMarkerCoord = new google.maps.LatLng(geoposition.lat, geoposition.lng);
    pin = {
      url: '/assets/icons/ico-marker-on-a32e9d343b766161f61d97c65f92feb7.png',
      size: new google.maps.Size(49, 42),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(16, 45)
    };
    mapOptions = {
      zoom: this.defaultZoom,
      center: mapCenterCoord,
      // styles: MAP_STYLES,
      panControl: false,
      scaleControl: false,
      streetViewControl: false,
      mapTypeControl: false,
      zoomControlOptions: {
        position: google.maps.ControlPosition.RIGHT_TOP
      }
    };
    map = new google.maps.Map(mapContainer[0], mapOptions);
    markerOption = {
      // icon: pin,
      draggable: !this.readOnly,
      animation: google.maps.Animation.DROP,
      position: initMarkerCoord,
      map: map
    };
    if (initMarkerCoord) {
      marker = new google.maps.Marker(markerOption);
      this.updateCoords(geoposition.lat, geoposition.lng);
    } else {
      marker = null;
    }
    return {
      map: map,
      marker: marker
    };
  };

  googleMapsCoordinatesInputs.prototype.updateCoords = function(lat, lng) {
    var value;
    lat = parseFloat(lat).toFixed(7);
    lng = parseFloat(lng).toFixed(7);
    this.coordLatInput.val(lat);
    this.coordLngInput.val(lng);
    value = lat + ", " + lng;
    return this.ajaxCallToUpdateCity(value);
  };

  googleMapsCoordinatesInputs.prototype.ajaxCallToUpdateCity = function(value) {
    var api, request;
    api = 'https://maps.googleapis.com/maps/api/geocode/json?address=';
    request = $.ajax({
      url: api + value,
      method: 'POST',
      dataType: 'json'
    });
    request.done((function(_this) {
      return function(data) {
        var city;
        city = data.results[0].formatted_address.split(',')[1];
      };
    })(this));
    return request.fail(function(textStatus) {
      console.log(textStatus);
    });
  };

  googleMapsCoordinatesInputs.prototype.bindMapEvents = function(mapInfo) {

    google.maps.event.addListener(mapInfo.map, 'click', (function(_this) {
      return function(e) {
        _this.updateCoords(e.latLng.lat(), e.latLng.lng());
        mapInfo.marker.setPosition(e.latLng);
      };
    })(this));
    return google.maps.event.addListener(mapInfo.marker, 'dragend', (function(_this) {
      return function(e) {
        _this.updateCoords(e.latLng.lat(), e.latLng.lng());
      };
    })(this));
  };

  return googleMapsCoordinatesInputs;

})();

var initMap = function() {
  var container = $('.js-rails-admin-map-div')
  if (container.length > 0) {
    var gmap = new googleMapsCoordinatesInputs(container)
  }
};
