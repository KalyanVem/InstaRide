window.navigator.geolocation.getCurrentPosition((position) => {
    var coords = position.coords;
    var map = new MapmyIndia.Map('map', {
        center: [coords['latitude'], coords['longitude']],
        zoom: 15,
        zoomControl: true,
        hybrid: true,
        location:true
    });
    L.marker([coords['latitude'], coords['longitude']]).addTo(map);
     var LatLng = [
        ["marker1",15.6018668,79.6059204],
        ["marker2",15.6018668,79.6037317]
        ];

        /*iterate on size of latitiude longitude set*/
        for (var i = 0; i < LatLng.length; i++) {
        new L.marker([LatLng[i][1],LatLng[i][2]])
                .bindPopup(LatLng[i][0])
                .addTo(map);
        }
});