﻿/*! Visit www.menucool.com for source code, other menu scripts and web UI controls
*  Please keep this notice intact. Thank you. */

var outerDiv = function () {
    // For the six color variables below, you can set one color for all menu tabs, or specify a list of colors for each menu tab.
    var fontColors = ["#FFFFFF", "#000000", "#FFFFFF", "#000000", "#FFFFFF"];
    var fontHoverColors = ["#FFFFFF"];

    var borderColors = ["#CC8300", "#9E0E87", "#D12E2E", "#0D507A", "#8B6846", "#74A824"];
    var borderHoverColors = ["black"];

    var bgColors = ["#0000FF", "#00FFFF", "#FF9900", "#00FFFF", "#0000FF"];
    var bgHoverColors = ["#FF3300"];

    var a;
    return {
        initMenu: function () {
            var m = document.getElementById('innerDiv');
            if (!m) return;
            m.style.width = m.getElementsByTagName("ul")[0].offsetWidth + 1 + "px";
            a = m.getElementsByTagName("a");
            var url = document.location.href.toLowerCase();
            var k = -1;
            var nLength = -1;

            //find current index: k
            for (i = 0; i < a.length; i++) {
                if (url.indexOf(a[i].href.toLowerCase()) != -1 && a[i].href.length > nLength) {
                    k = i;
                    nLength = a[i].href.length;
                }
                a[i].setAttribute("i", i);
            }
            if (k == -1 && /:\/\/(?:www\.)?[^.\/]+?\.[^.\/]+\/?$/.test) {
                for (var i = 0; i < a.length; i++) {
                    if (a[i].getAttribute("maptopuredomain") == "true") {
                        k = i;
                        break;
                    }
                }
                if (k == -1 && a[0].getAttribute("maptopuredomain") != "false")
                    k = 0;
            }

            for (i = 0; i < a.length; i++) {
                if (i != k) {
                    a[i].onmouseover = function () {
                        outerDiv.setColors(this.getAttribute("i"), true);
                    }
                    a[i].onmouseout = function () {
                        outerDiv.setColors(this.getAttribute("i"), false);
                    };
                }
                if (i == k)
                    outerDiv.setColors(i, true);
                else
                    outerDiv.setColors(i, false);
            }
        },

        setColors: function (i, hover) {
            if (hover) {
                a[i].style.color = fontHoverColors.length > 1 ? fontHoverColors[i] : fontHoverColors[0];
                a[i].style.borderTop = "solid 4px " + (borderHoverColors.length > 1 ? borderHoverColors[i] : borderHoverColors[0]);
                a[i].style.background = bgHoverColors.length > 1 ? bgHoverColors[i] : bgHoverColors[0];
            }
            else {
                a[i].style.color = fontColors.length > 1 ? fontColors[i] : fontColors[0];
                a[i].style.borderTop = "solid 4px " + (borderColors.length > 1 ? borderColors[i] : borderColors[0]);
                a[i].style.background = bgColors.length > 1 ? bgColors[i] : bgColors[0];
            }
        }
    };
} ();

if (window.addEventListener) {
    window.addEventListener("load", outerDiv.initMenu, false);
}
else if (window.attachEvent) {
    window.attachEvent("onload", outerDiv.initMenu);
}
else {
    window["onload"] = outerDiv.initMenu;
}