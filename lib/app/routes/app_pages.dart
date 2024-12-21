import 'package:get/get.dart';
import 'package:sophie/app/modules/sub_profile/views/add_sub_profile.dart';

import '../modules/add_profile/bindings/add_profile_binding.dart';
import '../modules/add_profile/views/add_profile_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/forgot_password_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/reset_password_view.dart';
import '../modules/login/views/verify_otp_view.dart';
import '../modules/login_social/bindings/login_social_binding.dart';
import '../modules/login_social/views/login_social_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/create_password.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register/views/verify_register_otp_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/select_profile/bindings/select_profile_binding.dart';
import '../modules/select_profile/views/select_profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/sub_profile/bindings/sub_profiles_binding.dart';
import '../modules/sub_profile/views/sub_profiles_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOtpView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SOCIAL,
      page: () => const LoginSocialView(),
      binding: LoginSocialBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_REGISTER_OTP,
      page: () => const VerifyRegisterOtpView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PASSWORD,
      page: () => const CreatePasswordView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => const SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROFILE,
      page: () => const AddProfileView(),
      binding: AddProfileBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_PROFILE,
      page: () => const SelectProfileView(),
      binding: SelectProfileBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: _Paths.SUB_PROFILES,
      page: () => const SubProfileView(),
      binding: SubProfilesBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SUB_PROFILE,
      page: () => const AddSubProfileView(),
      binding: SubProfilesBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING_CALL,
      page: () => const AddSubProfileView(),
      binding: SubProfilesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SUB_PROFILE,
      page: () => const AddSubProfileView(),
      binding: SubProfilesBinding(),
    ),
  ];
}
