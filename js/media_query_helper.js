/**
 * @file
 */
(function ($, Drupal, drupalSettings) {
  Drupal.behaviors.global = {
    attach: function (context, settings) {
      /* START */
      $('body').append('<div class="media_query_helper"></div>');
      /* END */
    }
  };
})(jQuery, Drupal, drupalSettings);
