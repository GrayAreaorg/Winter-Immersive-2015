$(window).load(function() {
    var context = new AudioContext();

    $('.pad').each(function() { // for each HTML element with CSS class "pad"...
        // 'this' is the object representing the HTML element,
        // like what we get from document.getElementById
        addAudioProperties(this);
    });

    $('.pad').click(function() {
        this.play();
    });

    $('.wave').each(function() {
        this.is_playing = false;
    });

    $('.wave').click(function() {
        if (this.is_playing) {
            this.oscillator.stop();
        } else {
            this.oscillator = context.createOscillator(); 
            this.oscillator.type = $(this).data('type');
            this.oscillator.frequency.value = $(this).data('freq');
            this.oscillator.connect(context.destination);
            this.oscillator.start(0);
            console.log('playing oscillator', this.oscillator);
        }
        this.is_playing = !this.is_playing;
    });

    function addAudioProperties(object) {
        object.name = object.id; // the "id" attribute of the HTML element
        object.source = $(object).data('sound'); // the "data-sound" attribute of the HTML element
        loadAudio(object, object.source);
        object.play = function () {
            var s = context.createBufferSource();
            s.buffer = object.buffer;
            s.connect(context.destination);
            s.start(0);
            object.s = s;
        }
    }

    function loadAudio(object, url) {
        // similar to $.ajax, but I am not sure that $.ajax
        // allows responseType 'arraybuffer'
        var request = new XMLHttpRequest();
        request.open('GET', url, true);
        request.responseType = 'arraybuffer';
        // request.onload is like the $.ajax 'success' callback function
        request.onload = function() {
            context.decodeAudioData(request.response, function(buffer) {
                object.buffer = buffer;
                console.log('buffer', buffer, 'channel data', buffer.getChannelData(0));
            });
        }
        request.send();
    }
});
