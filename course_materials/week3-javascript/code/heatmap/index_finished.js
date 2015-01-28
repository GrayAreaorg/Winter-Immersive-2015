window.onload = function() {

    var heatGradient = ['transparent','#AF6100','#703E00','#633700','#492900','#381F00'];
    var mapOptions = {
        center: {lat: 37.7833, lng: -122.4167},
        zoom: 12,
        styles: [{"stylers":[{"hue":"#ff8800"},{"gamma":0.4}]}]
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var request = new XMLHttpRequest();
    request.open('GET', 'human-waste-data.json', true);
    request.onload = function() {
        console.log('request onload', request);
        var data = JSON.parse(request.responseText);
        console.log('data', data);

        var print_data = document.getElementById('print-data');
        var data_display = '';
        _.each(data, function(d) {
            data_display += d[13];
            data_display += '<br><br>';
        });
        print_data.innerHTML = data_display;

        // parsing poop data
        var coordinates = _.map(data, function(d) {
            return [d[21][1], d[21][2]];
        });

        // parsing sfpd data
        /*
        var coordinates = _.map(data.data, function(d) {
            return [d[18], d[17]];
        });
        */

        // convert to Google formatted LatLng objects
        var google_lat_longs = _.map(coordinates, function(c) {
            return new google.maps.LatLng(c[0], c[1]);
        });

        var heatmap = make_heat_map(google_lat_longs);
        //var markers = make_markers(google_lat_longs);
    };
    request.onerror = function() {
        console.log('request onerror', request);
        // There was a connection error of some sort
    };
    request.send();

    var make_heat_map = function(google_lat_longs) {
        var heat_array = new google.maps.MVCArray(google_lat_longs);
        var heatmap = new google.maps.visualization.HeatmapLayer({
            data: heat_array,
            map: map,
            radius: 25,
            opacity: 0.95,
            gradient: heatGradient
        });
        return heatmap;
    };

    var make_markers = function(google_lat_longs) {
        return _.each(google_lat_longs, function(c) {
            return new google.maps.Marker({
                map: map,
                position: c,
                icon: 'poo.png',
            });
        });
    };
};

