jQuery(function($) {
    setTimeout(function() {
        if ( jQuery('.fl-node-585a7bf3ce12c .fl-post-grid').length > 0 ) 
        {
            jQuery('.fl-node-585a7bf3ce12c .fl-post-grid').masonry();
        }

        if ( jQuery('.fl-node-586e11decfe96 .fl-post-grid').length > 0 ) 
        {
            jQuery('.fl-node-586e11decfe96 .fl-post-grid').masonry();            
        }
    }, 1000)

    //convert to tel
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {

        var selector_tel_container = Array('.call-num');
        jQuery.each(selector_tel_container, function(index, value) {

            jQuery.each(jQuery(value), function(indexInner, valueInner) {
                var tel_selector = jQuery(valueInner);
                var selector_html = tel_selector.html();
                var numberPattern = /\d+/g;
                var number_list = selector_html.match(numberPattern);
                number_list = number_list.join('');

                tel_selector.html('<a href="tel:' + number_list + '">' + selector_html + '</a>');
            });

            //
            jQuery('.call-quote-text').each(function() {
                var plain_number = jQuery(this).find('span.call-num').text();
                jQuery(this).find('.request-callbk-box').wrap('<a href="tel:' + plain_number + '"></a>');
            });

        });
    }

    // Testimonials carousel on Homepage
    if ($('#carousel-testimonials').length) {
        setTimeout(function() {
            $('#carousel-testimonials').carouFredSel({
                auto: 10000,
                responsive: true,
                width: '100%',
                scroll: 1,
                animation: 2000,
                easing: 'linear',
                items: {
                    width: 400,
                    visible: {
                        max: 1
                    }
                },
                pagination: '#pager-testimonials'
            });

        }, 800)

        //$('#carousel-testimonials').carouFredSel();
    }

    // google Analytics: Goal tracking
    function triggerGoalScript(category, eventLabel) {
        //you should first check if ga is set
        if (typeof ga !== 'undefined') {
            ga('send', 'event', category, 'Click', eventLabel);
        }
        //check if _gaq is set too
        if (typeof _gaq !== 'undefined') {
            _gaq.push(['_trackEvent', category, 'Click', eventLabel]);
        }
    }
    jQuery(document).on('click', ".call-num", function() {
        triggerGoalScript('Phone', 'Phone Number');
    });

    var cancelRedirect = false;
    jQuery(".open-redirect-msg").on('click', function(e) {
        cancelRedirect = false;
        e.preventDefault();
        var link = (jQuery(this).attr('href')) ? jQuery(this).attr('href') : jQuery(this).find('a').attr('href');
        jQuery('.redirect-msg').show();
        jQuery('.redirect-msg-overlay').show();
        setTimeout(function() {
            if (!cancelRedirect) {
                window.location.href = link;
            } else {
                console.log('canceled');
            }
        }, 5000)

    });

    jQuery('#cancel-redirect').on('click', function() {
        cancelRedirect = true;
        jQuery('.redirect-msg').hide();
        jQuery('.redirect-msg-overlay').hide();
    });

});