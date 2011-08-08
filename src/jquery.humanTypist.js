(function() {
  (function($) {
    return $.fn.humanTypist = function(options) {
      var humanize, make_mistake, settings, speed_options, type;
      settings = $.extend({
        speed: "beginner"
      }, options);
      speed_options = {
        grandma: 2000,
        beginner: 1500,
        upcomer: 1000,
        scriptkiddie: 500,
        secretary: 300,
        hacker: 200,
        elite: 150,
        computer: 50
      };
      humanize = function(speed) {
        return Math.floor(speed * Math.random());
      };
      make_mistake = function(obj, next) {
        var char, chars;
        chars = "abcdefghiklmnopqrstuvwxyz";
        char = chars[Math.random() * chars.length];
        $(obj).text(obj.substring(0, next));
        return $(obj).text(obj.substring(0, next - 1));
      };
      type = function(e, text, speed) {
        var next;
        next = $(e).text().length + 1;
        if (next < text.length) {
          $(e).text(text.substr(0, next));
          return setTimeout((function() {
            return type(e, text, speed);
          }), humanize(speed));
        }
      };
      return this.each(function() {
        var speed, text;
        speed = speed_options[settings.speed];
        text = $(this).text();
        $(this).text("");
        return type(this, text, speed);
      });
    };
  })(jQuery);
}).call(this);
