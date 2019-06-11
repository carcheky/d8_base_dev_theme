(function ($, Drupal, drupalSettings) {

  Drupal.behaviors.LotusBehavior = {
    attach: function (context, settings) {
      // can access setting from 'drupalSettings';
      var mobile_menu_class = drupalSettings.centrogarrigues.mobile_menu.mobile_menu_class;
      var mobile_menu_class_place = drupalSettings.centrogarrigues.mobile_menu.mobile_menu_class_place;
      $(mobile_menu_class).addClass('mobile-menu');
      $(mobile_menu_class).attr('id', 'mobile-menu');
      $('#mobile-menu').slicknav({
        appendTo: mobile_menu_class_place,
        allowParentLinks: true,
        showChildren: true,
        nestedParentLinks: false,
        closedSymbol: '',
        openedSymbol: '',
      });
    }
  };
})(jQuery, Drupal, drupalSettings);
