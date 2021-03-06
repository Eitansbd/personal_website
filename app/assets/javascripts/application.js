// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require bootstrap-sprockets
document.addEventListener("turbolinks:load", function() {
    $(document).ready(function(){
        $('.modal').on('show.bs.modal', function () { // on opening the modal
            $iframe = $(this).find("iframe");
            $iframe.attr("src", $iframe.attr("src") + "?autoplay=1");
        });
        $('.modal').on('hidden.bs.modal', function (e) {
            $iframe = $(this).find("iframe");
            $iframe.attr("src", $iframe.attr("src").split("?")[0]);
            console.log($iframe.attr("src").split("?")[0])
        });
        
        $('.card-col').hover(
            function() {
                $(this).animate({
                    marginTop: "-=1%"
                }, 200);
            },
            
            function(){
                $(this).animate({
                    marginTop: "0%"
                }, 200);
            }
        );
    });
});

