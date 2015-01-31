$(document).ready(function(){
    var templates = {};
    _.each($('script[type="underscore-template"]'), function(t) {
        var $t = $(t);
        templates[$t.attr('id')] = _.template($t.html());
    });

    var bugs = [
        {src: 'beetle.png', x: 20, y: 0},
        {src: 'redblack.png', x: 30, y: -10},
        {src: 'ladybug.png', x: -30, y: 30} ];
    var $playground = $('#bugs-playground');

    var bug = function(img_src, step) {
        var bug_html = templates.bug({ src: 'img/' + img_src });
        var $bug = $(bug_html);
        $bug.css('left', '200px');
        $bug.css('top', '100px');
        $bug.on('click', function() {
            var old_x = parseInt($bug.css('left'));
            var old_y = parseInt($bug.css('top'));
            var new_x = old_x + step.x;
            var new_y = old_y + step.y; 
            $bug.animate({left: new_x + 'px', top: new_y + 'px'});
        });
        return $bug;
    };

    _.each(bugs, function(b) {
        $playground.append(bug(b.src, b));
    });
});
