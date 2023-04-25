import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:sosta/pages/auth/resetPassword/change_password_page.dart';
import 'package:sosta/pages/auth/resetPassword/otp_page.dart';
import 'package:sosta/pages/dashboard/BillsPayment/bill_payment.dart';
import 'package:sosta/pages/dashboard/BillsPayment/recharge_screen1.dart';
import 'package:sosta/pages/service_provider_signup/dashboard/settings.dart';
import 'package:sosta/pages/service_provider_signup/signup/signup.dart';

import '../components/Navigation/sidebar_page.dart';
import '../components/Navigation/vendor_sidebar_page.dart';
import '../models/service_providers_model.dart';
import '../pages/auth/login/login_page.dart';
import '../pages/auth/login/password_page.dart';
import '../pages/auth/login/retrieve_password.dart';
import '../pages/auth/overview_page.dart';
import '../pages/auth/signup/complete_registration.dart';
import '../pages/auth/signup/mobile_number.dart';
import '../pages/auth/signup/signup_name.dart';
import '../pages/auth/signup/signup_page.dart';
import '../pages/auth/signup/signup_password.dart';
import '../pages/auth/signup/verify_number.dart';
import '../pages/dashboard/bookings/bookings.dart';
import '../pages/dashboard/call.dart';
import '../pages/dashboard/categories.dart';
import '../pages/dashboard/chat/chat.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/dashboard/map.dart';
import '../pages/dashboard/profile.dart';
import '../pages/dashboard/settings.dart';
import '../pages/dashboard/vendors/all_vendor_merchant.dart';
import '../pages/dashboard/vendors/service_search.dart';
import '../pages/dashboard/vendors/vendor_profile.dart';
import '../pages/dashboard/wallet/wallet.dart';
import '../pages/home/home_page.dart';
import '../pages/service_provider_signup/dashboard/bookings/bookings.dart';
import '../pages/service_provider_signup/dashboard/chat/chat.dart';
import '../pages/service_provider_signup/dashboard/dashboard.dart';
import '../pages/service_provider_signup/dashboard/profile/business_profile.dart';
import '../pages/service_provider_signup/dashboard/profile/profile.dart';
import '../pages/service_provider_signup/dashboard/profile/profile_info.dart';
import '../pages/service_provider_signup/dashboard/reviews/complete_reviews.dart';
import '../pages/service_provider_signup/dashboard/reviews/reviews_page.dart';
import '../pages/service_provider_signup/signup/steps/account.dart';
import '../pages/service_provider_signup/signup/steps/account_password.dart';
import '../pages/service_provider_signup/signup/steps/business.dart';
import '../pages/service_provider_signup/signup/steps/business_final.dart';
import '../pages/service_provider_signup/signup/upload.dart';
import '../pages/service_provider_signup/signup/verify-upload.dart';

class CustomRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardPage(),
        routes: <GoRoute>[
          GoRoute(
              path: 'signup',
              builder: (BuildContext context, GoRouterState state) =>
                  const SignupPage(),
              routes: [
                GoRoute(
                  path: 'verify-number',
                  builder: (BuildContext context, GoRouterState state) =>
                      VerifyNumberPage(phone: state.extra.toString()),
                ),
                GoRoute(
                  path: 'mobile-number',
                  builder: (BuildContext context, GoRouterState state) =>
                      const MobileNumberPage(),
                ),
                GoRoute(
                  path: 'name',
                  builder: (BuildContext context, GoRouterState state) =>
                      SignupNamePage(phone: state.extra.toString()),
                ),
                GoRoute(
                  path: 'password',
                  builder: (BuildContext context, GoRouterState state) =>
                      // RegisterName personalDetails = state.extra as RegisterName,
                      SignupPasswordPage(details: state.extra as RegisterName),
                ),
                GoRoute(
                  path: 'complete',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CompleteRegistrationPage(),
                ),
              ]),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) =>
                const LoginPage(),
          ),
          GoRoute(
            path: 'password',
            builder: (BuildContext context, GoRouterState state) =>
                PasswordPage(email: state.extra.toString()),
            routes: <GoRoute>[
              GoRoute(
                path: 'retrieve-password',
                builder: (BuildContext context, GoRouterState state) =>
                    RetrievePasswordPage(password: state.extra.toString()),
                routes: <GoRoute>[
                  GoRoute(
                    path: 'otp',
                    builder: (BuildContext context, GoRouterState state) =>
                        OtpPage(email: state.extra.toString()),
                  ),
                  GoRoute(
                    path: 'change',
                    builder: (BuildContext context, GoRouterState state) =>
                        ChangePasswordPage(token: state.extra.toString()),
                  )
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) =>
                const MyHomePage(),
          ),
          GoRoute(
              path: 'dashboard',
              builder: (BuildContext context, GoRouterState state) =>
                  const DashboardPage(),
              routes: <GoRoute>[
                GoRoute(
                  path: 'categories',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CategoryPage(),
                  routes: <GoRoute>[
                    GoRoute(
                      path: ':id',
                      builder: (BuildContext context, GoRouterState state) =>
                          AllVendorMerchantPage(
                        id: state.extra as String,
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'billpayment',
                  builder: (BuildContext context, GoRouterState state) =>
                      const BillPayment(),
                  routes: <GoRoute>[
                    GoRoute(
                      path: ':id',
                      builder: (BuildContext context, GoRouterState state) =>
                          AllVendorMerchantPage(
                        id: state.extra as String,
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'settings',
                  builder: (BuildContext context, GoRouterState state) =>
                      const SettingsPage(),
                ),
                GoRoute(
                  path: 'sidebar',
                  builder: (BuildContext context, GoRouterState state) =>
                      const SidebarPage(),
                ),
                GoRoute(
                  path: 'profile',
                  builder: (BuildContext context, GoRouterState state) =>
                      const ProfilePage(),
                ),
                GoRoute(
                    path: 'service-search',
                    builder: (BuildContext context, GoRouterState state) =>
                        ServiceSearchPage(search: state.extra.toString()),
                    routes: <GoRoute>[
                      GoRoute(
                        path: 'vendor',
                        builder: (BuildContext context, GoRouterState state) =>
                            VendorProfile(
                                details: state.extra as ServiceProviderModel),
                      ),
                    ]),
                GoRoute(
                  path: 'wallet',
                  builder: (BuildContext context, GoRouterState state) =>
                      const UserWalletPage(),
                ),
                GoRoute(
                  path: 'chat',
                  builder: (BuildContext context, GoRouterState state) =>
                      const ChatPage(),
                ),
                GoRoute(
                  path: 'service-map',
                  builder: (BuildContext context, GoRouterState state) =>
                      MapPage(details: state.extra as ServiceProviderModel),
                ),
                GoRoute(
                  path: 'bookings',
                  builder: (BuildContext context, GoRouterState state) =>
                      const BookingPage(),
                ),
                GoRoute(
                  path: 'call',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CallScreen(),
                ),
                GoRoute(
                    path: 'reviews',
                    builder: (BuildContext context, GoRouterState state) =>
                        const ReviewPage(),
                    routes: [
                      GoRoute(
                        path: 'complete',
                        builder: (BuildContext context, GoRouterState state) =>
                            const CompleteReviewPage(),
                      ),
                    ]),
              ]),
          GoRoute(
              path: 'provider',
              builder: (BuildContext context, GoRouterState state) =>
                  const VendorSignupPage(),
              routes: <GoRoute>[
                GoRoute(
                    path: 'dashboard',
                    builder: (BuildContext context, GoRouterState state) =>
                        const VendorDashboardPage(),
                    routes: <GoRoute>[
                      GoRoute(
                        path: 'sidebar',
                        builder: (BuildContext context, GoRouterState state) =>
                            const VendorSidebarPage(),
                      ),
                      GoRoute(
                        path: 'bookings',
                        builder: (BuildContext context, GoRouterState state) =>
                            const VendorBookingPage(),
                      ),
                      GoRoute(
                        path: 'settings',
                        builder: (BuildContext context, GoRouterState state) =>
                            const VendorSettingsPage(),
                      ),
                      GoRoute(
                        path: 'chat',
                        builder: (BuildContext context, GoRouterState state) =>
                            const VendorChatPage(),
                      ),
                      GoRoute(
                          path: 'profile',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  const ProfileInfoPage(),
                          routes: <GoRoute>[
                            GoRoute(
                              path: 'update',
                              builder:
                                  (BuildContext context, GoRouterState state) =>
                                      const VendorProfilePage(),
                            ),
                            GoRoute(
                              path: 'business',
                              builder:
                                  (BuildContext context, GoRouterState state) =>
                                      const VendorBusinessProfilePage(),
                            )
                          ]),
                    ]),
                GoRoute(
                    path: 'account',
                    builder: (BuildContext context, GoRouterState state) =>
                        const Account(),
                    routes: <GoRoute>[
                      GoRoute(
                          path: 'password',
                          builder:
                              (BuildContext context, GoRouterState state) =>
                                  const AccountPassword(),
                          routes: <GoRoute>[
                            GoRoute(
                                path: 'business',
                                builder: (BuildContext context,
                                        GoRouterState state) =>
                                    const Business(),
                                routes: <GoRoute>[
                                  GoRoute(
                                      path: 'business-details',
                                      builder: (BuildContext context,
                                              GoRouterState state) =>
                                          BusinessFinal(),
                                      routes: <GoRoute>[
                                        GoRoute(
                                            path: 'upload-document',
                                            builder: (BuildContext context,
                                                    GoRouterState state) =>
                                                UploadDocument(),
                                            routes: <GoRoute>[
                                              GoRoute(
                                                path: 'verify-documents',
                                                builder: (BuildContext context,
                                                        GoRouterState state) =>
                                                    UploadDocumentVerify(),
                                              ),
                                            ]),
                                      ]),
                                ]),
                          ]),
                    ]),
              ]),
        ],
      ),
    ],
  );
}
