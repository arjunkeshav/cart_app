///list of urls
class Urls {
  ///base urls
  static const String baseUrl = 'https://flatmates-dev.live.untanglestrategy.com';

//  static const String baseUrl = 'https://flatmates-central.live.untanglestrategy.com';

  /// urls
  static const String VERIFY = "/user/user-signup/";
  static const String ADD_MOBILE = "/user/update_phone/";
  static const String NOTIFICATION = "/notifications/notification-list/";
  static const String SEARCH_FLAT = "/flat/list-flat/?data=";
  static const String SEARCH_FLATMATE = "/flat/flatmate-list/?";
  static const String SEARCH_USER = "/user/search_user/?search_query=";
  static const String VIEW_FLAT_DETAILS = "/flat/view-flat/";
  static const String SEEKER_REQUESTS = "/flat/view-seeker-request/";
  static const String ACCEPT_REQUEST = "/flat/accept-seeker-request/";
  static const String CANCEL_REQUEST = "/flat/cancel-seeker-request/";
  static const String REJECT_REQUEST = "/flat/reject-seeker-request/";
  static const String MY_FLAT_DETAILS = "/flat/my-flat-details";
  static const String CHECK_USER_HAVE_FLAT = "/flat/check-flat/";
  static const String GET_OTP = "/user/send-user-otp";
  static const String VERIFY_OTP = "/user/verify-user-otp/";
  static const String SET_PASSWORD = "/user/set-user-password/";
  static const String REQUEST_ACCESS = "/flat/seeker-request-to-join/";
  static const String ADD_USER_TO_FLAT = "/flat/dweller-add-seeker/";
  static const String USER_LOGIN = "/user/user-login/";
  static const String USER_PHOTO = "/user/upload-profile-photo/";
  static const String USER_DETAILS = "/user/profile-details/";
  static const String EDIT_USER_DETAILS = "/user/update-user-profile/";
  static const String USER_GOOGLE_AUTH_LOGIN = "/user/google_auth/";
  static const String USER_FACEBOOK_AUTH_LOGIN = "/user/facebook_auth/";
  static const String ADD_FLAT = "/flat/add-flat/";
  static const String EDIT_FLAT = "/flat/edit-flat/";
  static const String EXIT_FLAT = "/flat/exit-flat/";
  static const String DELETE_FLAT = "/flat/remove-flat/";
  static const String DELETE_FLAT_TENANT = "/flat/remove-tenant/";
  static const String AMENITIES = "/master/view-amenity-list/";
  static const String MASTER_DATA = "/master/filter/";
  static const String PREFERENCES = "/master/view-preference-list/";
  static const String AGE_GROUP = "/master/view-age-group-list/";
  static const String TASK_ICON = "/master/view-task-icon/";
  static const String FORGOT_PASSWORD = "/user/forgot-password/";
  static const String SET_FORGOT_PASSWORD = "/user/change_password/";
  static const String VERIFY_FORGOT_PASSWORD_OTP = "/user/verify_otp/";
  ///Task
  static const String VIEW_TASK_IN_FLAT = "/task/view-task/?flat_id=";
  static const String VIEW_TASK_DETAILS = "/task/get-task-data/?task_id=";
  static const String ADD_TASK = "/task/add-task/";
  static const String DELETE_TASK = "/task/delete-task/";
  static const String UPDATE_TASK = "/task/update-task/";
  static const String UPDATE_TASK_STATUS = "/task/update-task-status/";
  ///Notice Board
  static const String FETCH_ALL_POST_IN_NOTICE_BOARD = "/notice/list-events/";
  static const String ADD_NOTICE = "/notice/create-event/";
  static const String UPDATE_NOTICE = "/notice/edit-event/";
  static const String PIN_UNPIN_NOTICE_IN_NOTICE_BOARD = "/notice/pin-unpin-events/";
  static const String DELETE_NOTICE_BY_ID = "/notice/remove-event/";
  static const String ADD_FEEDBACK = "/feedback/create-feedback/";

}
