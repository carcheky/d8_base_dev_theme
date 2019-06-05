(function ($, Drupal, drupalSettings) {

  Drupal.behaviors.LotusBehavior = {
    attach: function (context, settings) {
      // can access setting from 'drupalSettings';
      var mobile_menu_class = drupalSettings.themerepo.mobile_menu.mobile_menu_class;
      $(mobile_menu_class).addClass('mobile-menu');
    }
  };
})(jQuery, Drupal, drupalSettings);
