# Version:     1.0.0
# Author:      Kenny Meyer
# Contact:     knny.myer@gmail.com
#
# Copyright (c) 2011 Kenny Meyer
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

(($) ->
  $.fn.humanTypist = (options) ->
    settings = $.extend(speed: "beginner", options)
    speed_options =
      grandma: 2000
      beginner: 1500
      upcomer: 1000
      scriptkiddie: 500
      secretary: 300
      hacker: 200
      elite: 150
      computer: 50

    humanize = (speed) ->
      Math.floor speed * Math.random()

    make_mistake = (obj, next) ->
      chars = "abcdefghiklmnopqrstuvwxyz"
      char = chars[Math.random() * chars.length]
      $(obj).text obj.substring(0, next)
      $(obj).text obj.substring(0, next - 1)

    type = (e, text, speed) ->
      next = $(e).text().length + 1
      if next < text.length
        $(e).text text.substr(0, next)
        setTimeout (->
          type e, text, speed
        ), humanize(speed)

    @each ->
      speed = speed_options[settings.speed]
      text = $(this).text()
      $(this).text ""
      type this, text, speed
) jQuery
