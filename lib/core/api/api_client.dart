import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiConstants {
  ApiConstants._();

  static const baseUrl = 'http://192.168.11.103:8080/api';
  // iOS simulateur → 'http://localhost:8080/api'
  // Device physique → 'http://<IP_machine>:8080/api'

  // ── Auth — /api/auth ──────────────────────────────────────────────────
  static const login    = '/auth/login';    // POST — permitAll
  static const register = '/auth/register'; // POST — permitAll
  static const me       = '/auth/me';       // GET  — authenticated
  static const logout   = '/auth/logout';   // POST — authenticated
  static const registerPrestataire = '/auth/register/prestataire'; // POST — permitAll

  // ── Compte — /api/account ─────────────────────────────────────────────
  static const changePassword = '/account/password'; // PATCH
  static const updateProfile  = '/account/profile';  // PUT
  static const deleteAccount  = '/account';          // DELETE

  // ── Profil prestataire — /api/prestataire ─────────────────────────────
  static const prestataireProfile = '/prestataire/profile'; // GET + PUT

  // ── Upload fichiers — /api/prestataire ───────────────────────────────
  static const uploadPhoto        = '/prestataire/upload/photo';
  static const uploadJustificatif = '/prestataire/upload/justificatif';

  // ── Services — /api/prestataire/services ─────────────────────────────
  static const services = '/prestataire/services'; // GET + POST

  // ── Disponibilités — /api/prestataire/availabilities ─────────────────
  static const availabilities = '/prestataire/availabilities'; // GET
  static const availabilitiesBulk = '/prestataire/availabilities/bulk'; // PUT

  // ── Indisponibilités — /api/prestataire/unavailabilities ─────────────
  static const unavailabilities = '/prestataire/unavailabilities'; // GET + POST

  // ── Rendez-vous — /api/appointments ──────────────────────────────────
  static const myAppointments = '/appointments/prestataire/me'; // GET

  // ── Stats — /api/prestataire/stats ───────────────────────────────────
  static const stats = '/prestataire/stats'; // GET

  // ── Catégories (pour profil) — /api/categories ───────────────────────
  static const categories = '/categories'; // GET
}

// ── Endpoints dynamiques ──────────────────────────────────────────────────────

class ApiEndpoints {
  ApiEndpoints._();

  // Services
  static String serviceById(int id)    => '/prestataire/services/$id'; // PUT + DELETE

  // Indisponibilités
  static String unavailabilityById(int id) => '/prestataire/unavailabilities/$id'; // DELETE

  // Rendez-vous — actions
  static String confirmAppointment(int id) => '/appointments/$id/confirm'; // PATCH
  static String refuseAppointment(int id)  => '/appointments/$id/refuse';  // PATCH ?motif=
  static String clotureAppointment(int id) => '/appointments/$id/cloture'; // PATCH ?present=
}

// ── Provider Dio ──────────────────────────────────────────────────────────────

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl:        ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      contentType:    'application/json',
    ),
  );

  final cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  dio.interceptors.add(LogInterceptor(
    requestBody:  true,
    responseBody: true,
    logPrint: (o) => debugLog(o.toString()),
  ));

  return dio;
});

void debugLog(String msg) {
  assert(() {
    // ignore: avoid_print
    print('[API] $msg');
    return true;
  }());
}
