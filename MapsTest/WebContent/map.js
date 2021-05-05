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
});