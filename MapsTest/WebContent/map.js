window.navigator.geolocation.getCurrentPosition((position) => {
    console.log(position);
    var coords = position.coords;
    var map = new MapmyIndia.Map('map', {
        center: [coords['latitude'], coords['longitude']],
        zoom: 15,
        zoomControl: true,
        hybrid: true,
        location:true
    });
    L.marker([coords['latitude'], coords['longitude']]).addTo(map);
    var bounds = map.getBounds();
    var map_sw = bounds.getSouthWest();
    var map_ne = bounds.getNorthEast();
    var lng_span = map_ne.lng - map_sw.lng;
    var lat_span = map_ne.lat - map_sw.lat;
    var markers = [];
    var pt = new L.LatLng(map_sw.lat + Math.random() * lat_span, map_sw.lng + Math.random() * lng_span);
    var markerClusters = L.markerClusterGroup({chunkedLoading: true,
    	maxClusterRadius: 100, 
    	disableClusteringAtZoom: 26, 
    	singleMarkerMode: false, 
    	addRegionToolTips: false});
    markerClusters.addLayers(markers); 
    map.addLayer(markerClusters);
});