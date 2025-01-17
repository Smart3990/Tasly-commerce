import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, esText, frText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Start
  {
    'ogc6h2r9': {
      'en': 'Welcome.',
      'ar': 'مرحبا بكم في 👋',
      'es': 'Bienvenido a 👋',
      'fr': 'Bienvenue sur 👋',
    },
    '4iq7slee': {
      'en': 'The best health commerce app for your healthy life!',
      'ar': 'أفضل تطبيق للتجارة الإلكترونية في القرن لتلبية احتياجاتك اليومية!',
      'es':
          '¡La mejor aplicación de comercio electrónico del siglo para tus necesidades diarias!',
      'fr':
          'La meilleure application e-commerce du siècle pour vos besoins quotidiens !',
    },
    'ieysq8ov': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OnBoarding
  {
    'ed1dmv8p': {
      'en': 'Start Your Health ',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    'tn23k12k': {
      'en': 'Journey with Tasly Today!',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    'bfduqmwz': {
      'en': 'Tasly\'s natural formulas for a life  in balance. ',
      'ar':
          'نظام إرسال الهدايا المباشر، ما عليك سوى شرائه وسنقوم بتوصيلها إلى أحبائك.',
      'es':
          'Sistema de envío directo de regalos, solo necesitas comprarlo y nosotros se lo entregamos a tus seres queridos.',
      'fr':
          'Système d\'envoi direct de cadeaux, il vous suffit de l\'acheter, nous le livrons à vos proches.',
    },
    'u34o44uc': {
      'en': 'Tasly pharmaceutical ',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    'yfunzik5': {
      'en': 'products',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    'skp6w3j7': {
      'en': 'the first step towards a healthier, happier life!',
      'ar':
          'نظام إرسال الهدايا المباشر، ما عليك سوى شرائه وسنقوم بتوصيلها إلى أحبائك.',
      'es':
          'Sistema de envío directo de regalos, solo necesitas comprarlo y nosotros se lo entregamos a tus seres queridos.',
      'fr':
          'Système d\'envoi direct de cadeaux, il vous suffit de l\'acheter, nous le livrons à vos proches.',
    },
    '32r935dx': {
      'en': 'TASLY',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '39yd2a4n': {
      'en': 'Creating Health',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    '322fkqon': {
      'en': 'Achieving Future',
      'ar': 'الهدايا هنا',
      'es': 'Los regalos estan aqui',
      'fr': 'Les cadeaux sont ici',
    },
    'ztazuz7n': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
    },
    '3tja30tz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Login
  {
    'ze3m37np': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    '497xdiy9': {
      'en': 'Welcome  back',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'm5qo8hnd': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'eefxbplv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yikxp0nv': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '7v52ifuz': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
    },
    'nflzaz0l': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    '1d0ycpt5': {
      'en': 'Forgot the password?',
      'ar': 'هل نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Mot de passe oublié ?',
    },
    'vpd2uinh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'cf6o6r5k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'sapcnpa8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'qhxn38kh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w1zmrs5c': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    '64p75hm8': {
      'en': '   Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'f4f5yys3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // onBoard_Profile
  {
    '91bw3rji': {
      'en': 'Complete Your Profile',
      'ar': 'أكمل ملفك الشخصي',
      'es': 'Completa tu perfil',
      'fr': 'Complète ton profil',
    },
    '0j9b3tya': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    '6pd5svw3': {
      'en': 'User Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'jkvasdhi': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'igy2xsyx': {
      'en': '+233756746744',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tmuiwm99': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    '5n8x2g4l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'wkhri8fk': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'oaisacjy': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'r08pyo3b': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
    },
    '5r0pz2l0': {
      'en': 'Distributor Id',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '73r0stny': {
      'en': '2395XXX',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '9dyjpeqh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'x0bohqc8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ndlygltm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '64m1o5fr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qemubkgi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '3tzewo4c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'b1bjuo7w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '2qey04bw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qpeypoks': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'lnb8l6m1': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // pinCodeSet
  {
    '5d0y4e1q': {
      'en': 'Set you app pin code',
      'ar': 'قم بتعيين الرمز السري للتطبيق الخاص بك',
      'es': 'Configura el código PIN de tu aplicación',
      'fr': 'Définir le code PIN de votre application',
    },
    'pewldnzf': {
      'en': 'Add a PIN number to make your account more secure.',
      'ar': 'أضف رقم PIN لجعل حسابك أكثر أمانًا.',
      'es': 'Agregue un número PIN para que su cuenta sea más segura.',
      'fr': 'Ajoutez un code PIN pour rendre votre compte plus sécurisé.',
    },
    'qju1ouas': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
    },
    '5dbtzo9n': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'dq8nxll0': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // BiometricSet
  {
    'r383okhi': {
      'en': 'Set Your Fingerprint',
      'ar': 'تعيين بصمة الإصبع الخاصة بك',
      'es': 'Establece tu huella digital',
      'fr': 'Définir votre empreinte digitale',
    },
    'w6hnxwg3': {
      'en': 'Please put your finger on the fingerprint scanner to get started.',
      'ar': 'يرجى وضع إصبعك على الماسح الضوئي لبصمات الأصابع للبدء.',
      'es': 'Coloque su dedo en el escáner de huellas digitales para comenzar.',
      'fr':
          'Veuillez mettre votre doigt sur le scanner d\'empreintes digitales pour commencer.',
    },
    'c2puqt79': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    '1aj8l8ph': {
      'en': 'You want to enable the biometric as your second security level?',
      'ar': 'هل تريد تمكين القياسات الحيوية كمستوى الأمان الثاني لديك؟',
      'es':
          '¿Quiere habilitar la biometría como su segundo nivel de seguridad?',
      'fr':
          'Vous souhaitez activer la biométrie comme deuxième niveau de sécurité ?',
    },
  },
  // ForgotPass
  {
    '77w38e6m': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    '8xwi23a0': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
    },
    'ax3mwrz0': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '0lpnh5xu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '0qht8p3m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8nrbmp0g': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    '42pnql6x': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    '24g3kmmn': {
      'en': 'Welcome.',
      'ar': 'صباح الخير 👋',
      'es': 'Buenos días 👋',
      'fr': 'Bonjour 👋',
    },
    'f3cyodoy': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'zo7i4vob': {
      'en': 'Top Products',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    'qnlsh580': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    'h33nnah4': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    '9pj7tagr': {
      'en': 'Most Popular',
      'ar': 'الأكثر شعبية',
      'es': 'Más popular',
      'fr': 'Le plus populaire',
    },
    'eyna5twi': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'gzq2lmhb': {
      'en': 'Hot Items',
      'ar': 'العناصر الساخنة',
      'es': 'Artículos calientes',
      'fr': 'Articles chauds',
    },
    'd17piusd': {
      'en': 'See All',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'okl5cw0v': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'mqvueu06': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Cart
  {
    'ga7suyqp': {
      'en': 'My Cart',
      'ar': 'سلة التسوق الخاصة بي',
      'es': 'Mi carrito',
      'fr': 'Mon panier',
    },
    'm0wx4dh4': {
      'en': 'Cart',
      'ar': 'عربة التسوق',
      'es': 'Carro',
      'fr': 'Chariot',
    },
  },
  // Notifications
  {
    '03vq7asq': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'gnsmzrop': {
      'en': 'New',
      'ar': 'جديد',
      'es': 'Nuevo',
      'fr': 'Nouveau',
    },
    'z5cmvjlf': {
      'en': 'Seen',
      'ar': 'مرئي',
      'es': 'Visto',
      'fr': 'Vu',
    },
    'mk8tsw4k': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // WishLIst
  {
    'i9uwytp0': {
      'en': 'My Wishlist',
      'ar': 'قائمة امنياتي',
      'es': 'mi lista de deseos',
      'fr': 'Ma liste d\'envies',
    },
    'eh0ixqg8': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SpecialOffers
  {
    'h7pm8ha0': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    'drtfgb0f': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Products
  {
    '8upw0qut': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Search
  {
    '0qzixbfu': {
      'en': 'Search in products',
      'ar': 'البحث في المنتجات',
      'es': 'Buscar en productos',
      'fr': 'Rechercher dans les produits',
    },
    'j78klw2g': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '2i311bt7': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
    },
    'u2ud0w1d': {
      'en': 'Recent',
      'ar': 'مؤخرًا',
      'es': 'Reciente',
      'fr': 'Récent',
    },
    'fovdu1w3': {
      'en': 'Clear All',
      'ar': 'امسح الكل',
      'es': 'Limpiar todo',
      'fr': 'Tout effacer',
    },
    'ja6kvgid': {
      'en': 'Set Silter',
      'ar': 'تعيين سيلتر',
      'es': 'Establecer filtro',
      'fr': 'Définir le filtre',
    },
    'w1d1a58b': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    'uowa8nmy': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'w57psrgq': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
    },
    'p7nrhsmv': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
    },
    'jx7t74kq': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
    },
    'ex9mvks4': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Rango de precios',
      'fr': 'Échelle des prix',
    },
    'saebe8dt': {
      'en': ' Bigger than',
      'ar': 'أكبر من',
      'es': 'Más grande que',
      'fr': 'Plus grand que',
    },
    'gb5tjvja': {
      'en': 'Rating',
      'ar': 'تقييم',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    '6he5ti4q': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    'i61rorb6': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
    },
    '5xuhsyxb': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ProductDetail
  {
    '7jqfore6': {
      'en': 'Description',
      'ar': 'وصف',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'bnz5xjzq': {
      'en': 'Last 3 reviews',
      'ar': 'آخر 3 مراجعات',
      'es': 'Últimas 3 reseñas',
      'fr': '3 derniers avis',
    },
    '30bcdsfv': {
      'en': 'See All Review',
      'ar': 'شاهد كل المراجعة',
      'es': 'Ver toda la reseña',
      'fr': 'Voir tous les avis',
    },
    'poz96xwz': {
      'en': 'Give Review',
      'ar': 'إعطاء مراجعة',
      'es': 'Dar reseña',
      'fr': 'Donner un avis',
    },
    'wnmcztiz': {
      'en': 'Total price',
      'ar': 'السعر الكلي',
      'es': 'Precio total',
      'fr': 'Prix ​​total',
    },
    'raq04bgk': {
      'en': 'Add To Cart',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'aumv8dq8': {
      'en': 'Add To Cart',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'oi35mceo': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Reviews
  {
    'zcp7cypr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CheckOut
  {
    'lcnyw3hc': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'cr0qzef5': {
      'en': 'Address',
      'ar': 'عنوان الشحن',
      'es': 'Dirección de envío',
      'fr': 'adresse de livraison',
    },
    'q65z9dgb': {
      'en': 'Add address',
      'ar': 'اضف عنوان',
      'es': 'Añadir dirección',
      'fr': 'Ajoutez l\'adresse',
    },
    'soey72ow': {
      'en': 'You don\'t have an address you need to add one',
      'ar': 'ليس لديك عنوان تحتاج إلى إضافته',
      'es': 'No tienes una dirección, necesitas agregar una.',
      'fr': 'Vous n\'avez pas d\'adresse, vous devez en ajouter une',
    },
    'gxxkgt1t': {
      'en': 'Add Address',
      'ar': 'اضف عنوان',
      'es': 'Añadir dirección',
      'fr': 'Ajoutez l\'adresse',
    },
    'zchnfbgp': {
      'en': 'Order List',
      'ar': 'لائحة الطلبات',
      'es': 'Lista de orden',
      'fr': 'Liste de commande',
    },
    '1tzdw8n3': {
      'en': 'Choose Shipping ',
      'ar': 'اختر الشحن',
      'es': 'Elige Envío',
      'fr': 'Choisissez l\'expédition',
    },
    '63ukigmn': {
      'en': 'Delievery Type',
      'ar': 'نوع الشحن',
      'es': 'Tipo de envío',
      'fr': 'Type d\'expédition',
    },
    'hpkhn6l4': {
      'en': 'Promo Code',
      'ar': 'رمز ترويجي',
      'es': 'Código promocional',
      'fr': 'Code promo',
    },
    'zoauj27p': {
      'en': 'Add promo code',
      'ar': 'أضف الرمز الترويجي',
      'es': 'Agregar código de promoción',
      'fr': 'Ajouter un code promotionnel',
    },
    'l3ywbl1a': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'faj38kvq': {
      'en': 'Discount Promo',
      'ar': 'عرض ترويجي للخصم',
      'es': 'Promoción de descuento',
      'fr': 'Promotion de réduction',
    },
    '2z3oxb96': {
      'en': 'Charges',
      'ar': 'ضريبة',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    'py9hn48c': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
    },
    '1ra0ur6u': {
      'en': 'Continue to Payment',
      'ar': 'الاستمرار في الدفع',
      'es': 'Continuar con el pago',
      'fr': 'Continuer vers le paiement',
    },
    'godk3op1': {
      'en': 'Continue to Payment',
      'ar': 'الاستمرار في الدفع',
      'es': 'Continuar con el pago',
      'fr': 'Continuer vers le paiement',
    },
    'edogkbdu': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ShippingMethods
  {
    'l1dhmm8m': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'es': 'Métodos de envío',
      'fr': 'méthodes de livraison',
    },
    '8fd1mbm0': {
      'en': 'Default shipping method',
      'ar': 'طريقة الشحن الافتراضية',
      'es': 'Método de envío predeterminado',
      'fr': 'Méthode d\'expédition par défaut',
    },
    'yedvbog3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginSecure
  {
    '8sxihnt1': {
      'en': 'Enter Your PIN',
      'ar': 'أدخل الكود الشخصي التعريفي',
      'es': 'Introduce tu PIN',
      'fr': 'Entrez votre code PIN',
    },
    'g7bnztdx': {
      'en':
          'Enter your pin number\n\n\nYou can enable/disable pincode secure layer in profile page / security',
      'ar':
          'أدخل الرقم السري الخاص بك\n\nملاحظة: الرمز السري التجريبي هو 1111\n\nيمكنك تمكين/إلغاء تمكين الطبقة الآمنة للرمز السري في صفحة الملف الشخصي/الأمان',
      'es':
          'Introduce tu número pin\n\nNota: el código PIN de demostración es 1111\n\nPuede habilitar/deshabilitar la capa segura de código PIN en la página de perfil/seguridad',
      'fr':
          'Entrez votre code PIN\n\nRemarque : le code PIN de la démo est 1111.\n\nVous pouvez activer/désactiver la couche sécurisée par code PIN dans la page de profil/sécurité',
    },
    'aoo8d89i': {
      'en': 'Forget pin',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4gjcta9j': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
    },
    'sn8b4cor': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OrderHistory
  {
    'h91dyz18': {
      'en': 'My Orders',
      'ar': 'طلباتي',
      'es': 'Mis ordenes',
      'fr': 'Mes commandes',
    },
    'irz85r12': {
      'en': 'Ongoing',
      'ar': 'جاري التنفيذ',
      'es': 'En curso',
      'fr': 'En cours',
    },
    'm3zjlodp': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    'gujt0dxc': {
      'en': 'Track Order',
      'ar': 'ترتيب المسار',
      'es': 'Orden de pista',
      'fr': 'Suivi de commande',
    },
    'kn1523mk': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    'ih5vjybb': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    'oqduju2y': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
    },
    'p1a2sd5k': {
      'en': 'Orders',
      'ar': 'طلبات',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // Wallet
  {
    'h22regvw': {
      'en': 'My E-Wallet',
      'ar': 'محفظتي الإلكترونية',
      'es': 'Mi billetera electrónica',
      'fr': 'Mon portefeuille électronique',
    },
    'rc1yod64': {
      'en': 'Transaction History',
      'ar': 'تاريخ المعاملات',
      'es': 'Historial de transacciones',
      'fr': 'Historique des transactions',
    },
    'wfy9x3xk': {
      'en': 'See all',
      'ar': 'اظهار الكل',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'iub39qmr': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
    'jtx8cfu7': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
  },
  // TrackOrder
  {
    '0fdxovbj': {
      'en': 'Track Order',
      'ar': 'ترتيب المسار',
      'es': 'Orden de pista',
      'fr': 'Suivi de commande',
    },
    'iutxeqb9': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    'dg29me9q': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
    },
    'vd90fj5x': {
      'en': 'Packet In Delivery',
      'ar': 'الحزمة في التسليم',
      'es': 'Paquete en entrega',
      'fr': 'Paquet en livraison',
    },
    'nj6cdd5z': {
      'en': 'Order Status Details',
      'ar': 'تفاصيل حالة الطلب',
      'es': 'Detalles del estado del pedido',
      'fr': 'Détails de l\'état de la commande',
    },
    'csopoxiy': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TopUp
  {
    '3d3aqmtv': {
      'en': 'Top Up E-Wallet',
      'ar': 'تعبئة المحفظة الإلكترونية',
      'es': 'Recargar billetera electrónica',
      'fr': 'Recharger le portefeuille électronique',
    },
    'pzupt8m5': {
      'en': 'Enter the amount of top up',
      'ar': 'أدخل مبلغ التعبئة',
      'es': 'Introduce el importe de la recarga',
      'fr': 'Entrez le montant de la recharge',
    },
    'cnnh6e81': {
      'en': '0.0',
      'ar': '0.0',
      'es': '0.0',
      'fr': '0,0',
    },
    'jsvfx8p6': {
      'en': '5',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    'z9h65pf4': {
      'en': '10',
      'ar': '10',
      'es': '10',
      'fr': 'dix',
    },
    'b1o1gw6t': {
      'en': '20',
      'ar': '20',
      'es': '20',
      'fr': '20',
    },
    '7i1itpc8': {
      'en': '50',
      'ar': '50',
      'es': '50',
      'fr': '50',
    },
    'mcp6h3ns': {
      'en': '100',
      'ar': '100',
      'es': '100',
      'fr': '100',
    },
    'rxbiahry': {
      'en': '200',
      'ar': '200',
      'es': '200',
      'fr': '200',
    },
    'xzqdetmv': {
      'en': '500',
      'ar': '500',
      'es': '500',
      'fr': '500',
    },
    'g27pv8ec': {
      'en': '750',
      'ar': '750',
      'es': '750',
      'fr': '750',
    },
    'jptmy9nn': {
      'en': '1000',
      'ar': '1000',
      'es': '1000',
      'fr': '1000',
    },
    'mnc7keh8': {
      'en': 'Top Up',
      'ar': 'فوق حتى',
      'es': 'Completar',
      'fr': 'Recharger',
    },
    '4b5l85ur': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Transactions
  {
    '8sx1aoam': {
      'en': 'Transaction History',
      'ar': 'تاريخ المعاملات',
      'es': 'Historial de transacciones',
      'fr': 'Historique des transactions',
    },
    '0vdt33tx': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // E-Receipt
  {
    '4pnbmsvt': {
      'en': 'E-Receipt',
      'ar': 'الإيصال الإلكتروني',
      'es': 'Recibo electrónico',
      'fr': 'Reçu électronique',
    },
    'rku8ashr': {
      'en': 'Products',
      'ar': 'منتجات',
      'es': 'Productos',
      'fr': 'Des produits',
    },
    'juoncty0': {
      'en': 'Amount',
      'ar': 'كمية',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'bgfj2b8l': {
      'en': 'Discount Promo',
      'ar': 'عرض ترويجي للخصم',
      'es': 'Promoción de descuento',
      'fr': 'Promotion de réduction',
    },
    'zlo1vf83': {
      'en': 'Tax',
      'ar': 'ضريبة',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    'qybu93v0': {
      'en': 'Total',
      'ar': 'المجموع',
      'es': 'Total',
      'fr': 'Total',
    },
    'zw5b09tu': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    'ekgrm4n3': {
      'en': 'Date',
      'ar': 'تاريخ',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '1c2rw0yq': {
      'en': ' | ',
      'ar': '|',
      'es': '|',
      'fr': '|',
    },
    '8ztetcy5': {
      'en': 'Transaction ID',
      'ar': 'رقم المعاملة',
      'es': 'ID de transacción',
      'fr': 'identifiant de transaction',
    },
    'lt24pjd9': {
      'en': 'Status',
      'ar': 'حالة',
      'es': 'Estado',
      'fr': 'Statut',
    },
    'ikue898l': {
      'en': 'Export Options',
      'ar': 'خيارات التصدير',
      'es': 'Opciones de exportación',
      'fr': 'Options d\'exportation',
    },
    '531ilq7y': {
      'en': 'Print',
      'ar': 'مطبعة',
      'es': 'Imprimir',
      'fr': 'Imprimer',
    },
    'qcgia77v': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Profile
  {
    'x822uhsy': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'q4zj3jy0': {
      'en': 'Customer Chat Support',
      'ar': 'دعم دردشة العملاء',
      'es': 'Atención al cliente por chat',
      'fr': 'Assistance par chat client',
    },
    'x2llmv2u': {
      'en': 'Addresses',
      'ar': 'عناوين',
      'es': 'Direcciones',
      'fr': 'Adresses',
    },
    'ote9d9i8': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    '4kp4sbuq': {
      'en': 'walet',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    'wajvm8iv': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'es': 'Métodos de envío',
      'fr': 'méthodes de livraison',
    },
    '48m6c0zu': {
      'en': 'Notification Setting',
      'ar': 'إعداد الإخطار',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    'f6fyav1f': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '0rumd0pk': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'dbzxin7z': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    '0ipgjiew': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    '9afh9kgi': {
      'en': 'Message Developer',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    'hpalaw3l': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    '197fiunp': {
      'en': 'Invite Friends',
      'ar': 'ادعو أصدقاء',
      'es': 'Invitar a amigos',
      'fr': 'Inviter des amis',
    },
    '1tw19m51': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'i1heuel7': {
      'en': 'Tasly ecommerce  version 2.2',
      'ar': 'إيفيرا الإصدار 1.0.01 البناء 21',
      'es': 'Evira Versión 1.0.01 Compilación 21',
      'fr': 'Evira Version 1.0.01 Construire 21',
    },
    'wfwrzw0c': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'ksujdsg6': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // ProfileEdit
  {
    'tottirw2': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'jusrtbjm': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'pzwy4ayf': {
      'en': 'User Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'aekq22u1': {
      'en': 'Email',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'xue1vzm6': {
      'en': '+233241269XXX',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '692cwoph': {
      'en': '23920000',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'lqwznadd': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    'exh54exr': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'ymwhud55': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'xywk2uk2': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'k4opv0hy': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
    },
    'luoj2o3j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'cm344mut': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w3pxefrr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'imu046hc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'q6q7tf4d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    't1u4ox74': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9imci6ne': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'fm7iixkz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'x0wogarh': {
      'en': 'Update',
      'ar': 'تحديث',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
    },
    '8gdcsc2y': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Address
  {
    'c7ly452e': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
      'es': 'Dirección de envío',
      'fr': 'adresse de livraison',
    },
    'fb0n9snd': {
      'en': 'Your Shipping Address',
      'ar': 'عنوان الشحن الخاص بك',
      'es': 'Tu Dirección de Envío',
      'fr': 'Votre adresse de livraison',
    },
    'sw58aq4r': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
    },
    'ze2rpmir': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SettingNotification
  {
    '5o6xxes2': {
      'en': 'Notification',
      'ar': 'إشعار',
      'es': 'Notificación',
      'fr': 'Notification',
    },
    'u75lm5yr': {
      'en': 'Configure Notification',
      'ar': 'تكوين الإخطار',
      'es': 'Configurar notificación',
      'fr': 'Configurer les notifications',
    },
    'bmzfuj0j': {
      'en': 'General Notification',
      'ar': 'إشعار عام',
      'es': 'Notificación general',
      'fr': 'Notification générale',
    },
    '3pb2p19r': {
      'en': 'Sound',
      'ar': 'صوت',
      'es': 'Sonido',
      'fr': 'Son',
    },
    'sv3dtx8s': {
      'en': 'Vibrate',
      'ar': 'تذبذب',
      'es': 'Vibrar',
      'fr': 'Vibrer',
    },
    '88hrozp4': {
      'en': 'Special Offers',
      'ar': 'عروض خاصة',
      'es': 'Ofertas especiales',
      'fr': 'Offres spéciales',
    },
    '9xke2qz8': {
      'en': 'Promo & Discount',
      'ar': 'الترويجي والخصم',
      'es': 'Promoción y descuento',
      'fr': 'Promotion et réduction',
    },
    '4h1tco6v': {
      'en': 'Payments',
      'ar': 'المدفوعات',
      'es': 'Pagos',
      'fr': 'Paiements',
    },
    '08nzc77s': {
      'en': 'Cashback',
      'ar': 'استرداد النقود',
      'es': 'Devolución de dinero',
      'fr': 'Remise en argent',
    },
    'chd8b0nf': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'es': 'Actualizaciones de aplicaciones',
      'fr': 'Mises à jour de l\'application',
    },
    '05bcm3xa': {
      'en': 'New Service Available',
      'ar': 'خدمة جديدة متاحة',
      'es': 'Nuevo servicio disponible',
      'fr': 'Nouveau service disponible',
    },
    'yojei26s': {
      'en': 'New Tips Available',
      'ar': 'نصائح جديدة متاحة',
      'es': 'Nuevos consejos disponibles',
      'fr': 'Nouveaux conseils disponibles',
    },
    'k1bv65hz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PaymentMethods
  {
    'bev5ue3s': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'es': 'Métodos de pago',
      'fr': 'méthodes de payement',
    },
    'fcu8uthh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // NewCard
  {
    'rolsy80a': {
      'en': 'New Card',
      'ar': 'بطاقة جديدة',
      'es': 'Nueva tarjeta',
      'fr': 'Nouvelle carte',
    },
    '9aaitteo': {
      'en': 'Card Name',
      'ar': 'اسم البطاقة',
      'es': 'Nombre de tarjeta',
      'fr': 'Nom de la carte',
    },
    '1gd0l5o1': {
      'en': 'Andrew Ainsley',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'bw3zj64t': {
      'en': 'Card Number',
      'ar': 'رقم البطاقة',
      'es': 'Número de tarjeta',
      'fr': 'Numéro de carte',
    },
    '7dh33brk': {
      'en': '2672 4738 7837 7285',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'vs071uch': {
      'en': 'Expiry Date',
      'ar': 'تاريخ الانتهاء',
      'es': 'Fecha de caducidad',
      'fr': 'Date d\'expiration',
    },
    '2syiaj3p': {
      'en': '09 27',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'o6v55o1p': {
      'en': 'CVV',
      'ar': 'CVV',
      'es': 'CVV',
      'fr': 'CVV',
    },
    'kls0u6i8': {
      'en': '699',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'o80vxr8j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'eg6finlp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jsy8ld9s': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'loayp4l4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5kpb65hf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'i17iku7a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'it1l2wpy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'zxx0bgkl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'tseibstk': {
      'en': 'Add Card',
      'ar': 'تغيير الرمز السري',
      'es': 'Cambiar código PIN',
      'fr': 'Changer le code PIN',
    },
    'u2qza7xq': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
  },
  // Security
  {
    'b1nflqgx': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '1w8hfj8z': {
      'en': 'Security',
      'ar': 'حماية',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'ar0kdv8s': {
      'en': 'Security Layer',
      'ar': 'طبقة الأمان',
      'es': 'Capa de seguridad',
      'fr': 'Couche de sécurité',
    },
    'riyxv8j2': {
      'en': 'Pin Code',
      'ar': 'الرمز السري',
      'es': 'Código PIN',
      'fr': 'Code PIN',
    },
    'm98d4gqt': {
      'en': 'Biometric ID',
      'ar': 'معرف البيومترية',
      'es': 'Identificación biométrica',
      'fr': 'ID biométrique',
    },
    'c9mprpxi': {
      'en': 'Google Authenticator',
      'ar': 'أداة مصادقة جوجل',
      'es': 'Autenticador de Google',
      'fr': 'Authentificateur Google',
    },
    'srv17ln0': {
      'en': 'Change Pin code',
      'ar': 'تغيير الرمز السري',
      'es': 'Cambiar código PIN',
      'fr': 'Changer le code PIN',
    },
    'ar8maxfm': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Language
  {
    '5fhgfbyz': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'ekmdo5ts': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'es': 'Cambiar idioma',
      'fr': 'Changer de langue',
    },
    'c49dobms': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PrivacyPolicy
  {
    '04ty6g4f': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'xltlyert': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // InviteContacts
  {
    'j5qxl9gm': {
      'en': 'Invite Friends In Your Contacts',
      'ar': 'دعوة الأصدقاء في جهات الاتصال الخاصة بك',
      'es': 'Invita amigos a tus contactos',
      'fr': 'Invitez des amis dans vos contacts',
    },
    'xandwufc': {
      'en': 'Sync Contacts',
      'ar': 'مزامنة جهات الاتصال',
      'es': 'Sincronizar contactos',
      'fr': 'Synchroniser les contacts',
    },
    'a2v5ibvi': {
      'en': 'Start Sync your conatcts now.',
      'ar': 'ابدأ مزامنة جهات الاتصال الخاصة بك الآن.',
      'es': 'Comience a sincronizar sus contactos ahora.',
      'fr': 'Commencez à synchroniser vos contacts maintenant.',
    },
    'lq22x372': {
      'en': 'Sync Your Contacts',
      'ar': 'مزامنة جهات الاتصال الخاصة بك',
      'es': 'Sincroniza tus contactos',
      'fr': 'Synchronisez vos contacts',
    },
    '3hhwynae': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpCenter
  {
    '0z4kt7o4': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    'p4i85uig': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    '3r368foz': {
      'en': 'Customer Service',
      'ar': 'خدمة الزبائن',
      'es': 'Servicio al Cliente',
      'fr': 'Service client',
    },
    '5l5shah5': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'dryehphj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CustomerSupport
  {
    '86er6dcw': {
      'en': 'Customer Service',
      'ar': 'خدمة الزبائن',
      'es': 'Servicio al Cliente',
      'fr': 'Service client',
    },
    'n8zkrsnu': {
      'en': 'Message...',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'u2xnl1e6': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Signup
  {
    'qoeoz6qe': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    's7bqyqpk': {
      'en': 'Create new account',
      'ar': 'انشاء حساب جديد',
      'es': 'Crear una nueva cuenta',
      'fr': 'Créer un nouveau compte',
    },
    '9bakqz1g': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'u9etdywn': {
      'en': 'Password',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'u2wxlynf': {
      'en': 'Retry Password',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '5akph81w': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'ysut8ogx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'q9u655km': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yha59gtw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '17i9h1gu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6nugwj54': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '9e8matkp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    't5r24t2l': {
      'en': 'Have an account?',
      'ar': 'هل لديك حساب؟',
      'es': '¿Tener una cuenta?',
      'fr': 'Avoir un compte?',
    },
    '8jt08qlz': {
      'en': '  Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    '4kthvvdn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SecurityChoice
  {
    'vkbumnqp': {
      'en': 'Set Second Security Mesure',
      'ar': 'ضبط مقياس الأمان الثاني',
      'es': 'Establecer una segunda medida de seguridad',
      'fr': 'Définir une deuxième mesure de sécurité',
    },
    'bbjvse3n': {
      'en':
          'If you want you can set another layer of security, Choice one or skip',
      'ar':
          'إذا أردت، يمكنك تعيين طبقة أخرى من الأمان، اختر طبقة واحدة أو تخطيها',
      'es':
          'Si lo desea, puede establecer otra capa de seguridad, elija una u omita',
      'fr':
          'Si vous le souhaitez, vous pouvez définir un autre niveau de sécurité, en choisir un ou ignorer',
    },
    'edlk8l7s': {
      'en': 'Pin code',
      'ar': 'رمز التعريف الشخصي',
      'es': 'Código PIN',
      'fr': 'Code PIN',
    },
    'z1ie4cqr': {
      'en': 'Set a 4 digit number as your pincode',
      'ar': 'قم بتعيين رقم مكون من 4 أرقام ليكون الرمز السري الخاص بك',
      'es': 'Establece un número de 4 dígitos como tu código PIN',
      'fr': 'Définissez un numéro à 4 chiffres comme code PIN',
    },
    'b4t3pggm': {
      'en': 'Biometrics',
      'ar': 'القياسات الحيوية',
      'es': 'Biometría',
      'fr': 'Biométrie',
    },
    '3pfvop1f': {
      'en': 'We use your device biometric hardware',
      'ar': 'نحن نستخدم الأجهزة البيومترية الخاصة بجهازك',
      'es': 'Utilizamos el hardware biométrico de tu dispositivo',
      'fr': 'Nous utilisons le matériel biométrique de votre appareil',
    },
    '5tpg8kvu': {
      'en': 'Skip, No need',
      'ar': 'تخطي، لا حاجة',
      'es': 'Saltar, no es necesario',
      'fr': 'Sauter, pas besoin',
    },
    'qf0t8unz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // loginMethod
  {
    'xwmbw5vw': {
      'en': 'Welcome ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '7zv8jm2x': {
      'en': 'Signin with Google',
      'ar': 'الدخول مع جوجل',
      'es': 'Inicia sesión con Google',
      'fr': 'Connectez-vous avec Google',
    },
    'lchbkv2a': {
      'en': 'Signin with Apple',
      'ar': 'تسجيل الدخول مع أبل',
      'es': 'Iniciar sesión con Apple',
      'fr': 'Connectez-vous avec Apple',
    },
    'lxl9kzwa': {
      'en': 'or',
      'ar': 'أو',
      'es': 'o',
      'fr': 'ou',
    },
    'c3i9f2dr': {
      'en': 'Sign in with email',
      'ar': 'قم بتسجيل الدخول باستخدام البريد الإلكتروني',
      'es': 'Iniciar sesión con correo electrónico',
      'fr': 'Connectez-vous avec e-mail',
    },
    '6ooqu2ht': {
      'en': 'Don’t have an account?',
      'ar': 'ليس لديك حساب؟',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'cdz5tgkf': {
      'en': '  Sign up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'kypeyngn': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Cartdis
  {
    'hdsv095x': {
      'en': 'My Cart',
      'ar': 'سلة التسوق الخاصة بي',
      'es': 'Mi carrito',
      'fr': 'Mon panier',
    },
    '61lehtd1': {
      'en': 'Cart',
      'ar': 'عربة التسوق',
      'es': 'Carro',
      'fr': 'Chariot',
    },
  },
  // developer
  {
    'nse61f87': {
      'en': 'www.kiyutech.com',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dpawytxp': {
      'en': 'Copy',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'vbzpnah2': {
      'en': 'cv',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'shjvuahl': {
      'en': 'LinkedIn',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qzt2ihiv': {
      'en': 'X',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dmmxminf': {
      'en': 'example.info@example.com',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6s726gu8': {
      'en': 'Copy',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'cup099vu': {
      'en': 'CV',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'frhug5fc': {
      'en': 'LinkedIn',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fuyqmbat': {
      'en': 'X',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'm1013u4b': {
      'en':
          'Innovative Solutions in Web & Mobile Development for Seamless User Experiences',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qasbw74a': {
      'en': 'BIOGRAPHY',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'u0ew8hnt': {
      'en':
          'full-stack developer specializing in web and mobile apps, focusing on intuitive design and innovative AI solutions',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'weyxiheh': {
      'en': 'SERVICES',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wtzx0nsw': {
      'en':
          'Custom app development\nWeb development\nUI/UX design\nAI and automation solutions',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'l7bb0gff': {
      'en': 'Hi, I\'m Sam Matter',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'h5rgaczz': {
      'en': 'YEARS OF \nEXPERIENCE',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rqjmmoql': {
      'en': '10',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qslwrapg': {
      'en': 'CLIENTS \nSATISFACTION',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qfxgm0le': {
      'en': '100%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3dewn4sx': {
      'en': 'PROJECTS DONE',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ix15ejy7': {
      'en': '100%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tnczw2ai': {
      'en': 'Selected works',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zs9qvnb1': {
      'en': 'Foodie Finder',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'u45jqbqw': {
      'en': 'Web & Mobile Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6oyphk4w': {
      'en': 'August 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'vi9kuhjv': {
      'en':
          'An innovative application designed to help users discover nearby restaurants and food joints based on their preferences. Built using Flutter and integrated with Google Maps API, this app delivers location-based recommendations in real-time. The user interface focuses on a seamless experience for both food lovers and restaurant owners, including features like user reviews, real-time wait times, and delivery options.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6comxrf7': {
      'en': 'Button',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hrsptrln': {
      'en': 'HealthTrack',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'i3j09v5r': {
      'en': 'Mobile Health App',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'x0576yni': {
      'en': 'June 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'aw1yfvyj': {
      'en':
          'A personal health tracking app designed for Android and iOS. The app uses machine learning to predict and monitor user health metrics, providing insights into physical activity, sleep patterns, and heart rate. Built with Flutter and Firebase, the app integrates with wearable devices to provide real-time health updates.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '260tm2jn': {
      'en': 'ShopEasy',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5637dw1h': {
      'en': 'E-commerce Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fbngwxj7': {
      'en': 'July 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '30jg43tn': {
      'en':
          'A powerful yet minimalist e-commerce platform built using React and Node.js, focused on providing a smooth shopping experience. The platform allows multiple vendors to upload and manage their own products while using AI-driven recommendations to suggest products to customers. With Stripe integration for secure payments.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tnjvhxhg': {
      'en': 'EduLearn',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2p86l84m': {
      'en': 'Web Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2jth6oyr': {
      'en': 'April 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'la1sa275': {
      'en':
          'A dynamic online learning platform for students and teachers. Built using Vue.js and Firebase, it offers video tutorials, assignments, and real-time quizzes. The platform provides an easy-to-use content management system for educators to create and upload learning materials. It features real-time communication.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3zmz12cl': {
      'en': 'Services',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hdlf1ncv': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3n1qpgvp': {
      'en': 'Software Development Services',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'kwldmeep': {
      'en':
          'Offering full-stack web and mobile application development with a focus on building scalable, efficient, and user-friendly software. Services include backend development, API integration, and database management.\nNote: Specializing in technologies like Flutter, Firebase, React, and Node.js for robust application performance.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'aq5uxt2e': {
      'en': 'UI/UX Design Consulting',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'j4pn48dm': {
      'en':
          'Providing expert consulting in user interface and user experience design to ensure that applications are not only functional but also intuitive and engaging. Focus on creating user-centric designs that enhance usability.\nNote: Custom wireframes and interactive prototypes available upon request.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qei5asn7': {
      'en': 'API Integration & Automation',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6saolpw4': {
      'en':
          'Specializing in the integration of third-party APIs, such as payment gateways, social media, and cloud services. Automate processes and streamline operations with custom API solutions tailored to your business needs.\nNote: API solutions are scalable and built to handle high-traffic environments.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rfbrtt2r': {
      'en': 'Cloud Deployment & DevOps',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '32h1odlw': {
      'en':
          'Helping businesses deploy their applications on the cloud, leveraging platforms like AWS, Google Cloud, and Azure for scalability and performance. Offering continuous integration (CI) and continuous deployment (CD) pipelines to streamline development workflows.\nNote: Assistance in selecting the best cloud solution for your needs.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '90bso1qx': {
      'en': 'Project Management & Consulting',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rf590ov6': {
      'en':
          'With experience in managing large-scale projects, offering consulting services to help businesses plan, strategize, and execute software development projects. Skilled in Agile methodologies, working with tools like Jira, ClickUp, and Trello for smooth project execution.\nNote: Available for both short-term and long-term consulting engagements.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    't5rnrcat': {
      'en': 'Achievement',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'nilq5mrt': {
      'en': '2st Place',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wjysdeiu': {
      'en': 'Achievement',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '06m5mcw0': {
      'en': 'App of the Year Award\n- 2023',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zom2ipqg': {
      'en': 'Mobile Application Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'a40rpka5': {
      'en': '1st Place',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'n16zi4fr': {
      'en': 'Design Challenge',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'lcqhor5z': {
      'en': 'Top 10 on App Store for \nTech Apps',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '29xuswah': {
      'en': 'Top 10 on appstore',
      'ar': '',
      'es': '',
      'fr': '',
    },
    't602n16x': {
      'en': '2st Place',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0b3rbq8a': {
      'en': 'Design Challenge',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4elj27or': {
      'en': 'Best Developer Award',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'og5lfyi9': {
      'en': 'Web & Mobile Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ea38grkq': {
      'en': 'Success Stories',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'p5ew3i06': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '9o0t7tb4': {
      'en': 'Project 1',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'lgyaoax2': {
      'en': 'Project 2',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'jss35cqr': {
      'en': 'Project 3',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tuck5nc9': {
      'en': '6000',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'gfgcuvrq': {
      'en': 'A robust AI-powered platform designed ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'vz3nwiuq': {
      'en': '300',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ccozwmzm': {
      'en': 'Over 300 successful projects delivered',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fmdoro2j': {
      'en': '90%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ztrosv0u': {
      'en': 'Maintained a 90% customer satisfaction rate across all projects',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pk8g08m7': {
      'en': '10%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wpvzw66v': {
      'en': 'Thanks to strong word-of-mouth recommendations and high-quality',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '17ev4rw4': {
      'en': 'S',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bz6yp4vo': {
      'en': 'Let\'s Collaborate!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'y28qqzjo': {
      'en': 'Got an idea? Let’s bring it to life, together!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'o8ct919e': {
      'en': 'With a deep passion for technology and user-centric design',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'o1u1565g': {
      'en': 'Design Inquiry',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'w6a2d3lj': {
      'en':
          'Need design help? Reach out now before your great idea fades into oblivion!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3r3h3yz0': {
      'en': 'Name',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tovwcdp9': {
      'en': 'TextField',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'juejqqn9': {
      'en': ' ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ddm1ff3z': {
      'en': 'Email',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qz2md5wo': {
      'en': 'TextField',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '1cgadlw7': {
      'en': ' ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ysxf2yib': {
      'en': 'Message',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ht7c4bsb': {
      'en':
          'Tell us all about your project, or at least enough to make us say, “Wow, let’s build this!”',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'usds2quo': {
      'en':
          'Innovative Solutions in \nWeb & Mobile \nDevelopment for \nSeamless User Experiences',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ho0c8c6f': {
      'en': 'Hi, I\'m Yussif Nuhu',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wew5nju0': {
      'en': 'BIOGRAPHY',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'crr8q3qf': {
      'en':
          'full-stack developer specializing in web and mobile apps, focusing on intuitive design and Cybersecurity',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'p7arlwt2': {
      'en': 'SERVICES',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bodq7sgj': {
      'en':
          'Custom app development\nWeb development\nUI/UX design\nGraphic design\nCyber security\nDigital Training\nComputer accessories sales',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ntdss0e0': {
      'en': 'YEARS OF \nEXPERIENCE',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4ttae042': {
      'en': '5+',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '8axsm5rk': {
      'en': 'CLIENTS \nSATISFACTION',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pppk22en': {
      'en': '100%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3t8o6y36': {
      'en': 'PROJECTS \nDONE',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hp1v7309': {
      'en': '100%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dx48l4zw': {
      'en': 'Selected works',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bxmykq5z': {
      'en': 'Foodie Finder',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'a5bcfrx0': {
      'en': 'Web & Mobile Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hae4dfam': {
      'en': 'August 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'eiwofqlc': {
      'en':
          'An innovative application designed to help users discover nearby restaurants and food joints based on their preferences. Built using Flutter and integrated with Google Maps API, this app delivers location-based recommendations in real-time. The user interface focuses on a seamless experience for both food lovers and restaurant owners, including features like user reviews, real-time wait times, and delivery options.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6pa8hb3k': {
      'en': 'HealthTrack',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'kwyx8h3r': {
      'en': 'Mobile Health App',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hqnlubvs': {
      'en': 'June 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '1md2444z': {
      'en':
          'A personal health tracking app designed for Android and iOS. The app uses machine learning to predict and monitor user health metrics, providing insights into physical activity, sleep patterns, and heart rate. Built with Flutter and Firebase, the app integrates with wearable devices to provide real-time health updates.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xggp2us4': {
      'en': 'ShopEasy',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mlgqkeda': {
      'en': 'E-commerce Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'otoorq2f': {
      'en': 'July 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'cqplan5n': {
      'en':
          'A powerful yet minimalist e-commerce platform built using React and Node.js, focused on providing a smooth shopping experience. The platform allows multiple vendors to upload and manage their own products while using AI-driven recommendations to suggest products to customers. With Stripe integration for secure payments.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '85rrbuuy': {
      'en': 'EduLearn',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'b63hwntf': {
      'en': 'Web Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ou62dqv5': {
      'en': 'April 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rpc0iun3': {
      'en':
          'A dynamic online learning platform for students and teachers. Built using Vue.js and Firebase, it offers video tutorials, assignments, and real-time quizzes. The platform provides an easy-to-use content management system for educators to create and upload learning materials. It features real-time communication.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zewq26lf': {
      'en': 'Services',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'eum502my': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile\n applications that offer both functionality ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'jrivdj23': {
      'en': 'Software Dev',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'sqj926tb': {
      'en':
          'Offering full-stack web and mobile application development with a focus on building scalable, efficient, and user-friendly software. Services include backend development, API integration, and database management.\nNote: Specializing in technologies like Flutter, Firebase, React, and Node.js for robust application performance.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wdoknz2l': {
      'en': 'UI/UX Design Consulting',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '72zj887v': {
      'en':
          'Providing expert consulting in user interface and user experience design to ensure that applications are not only functional but also intuitive and engaging. Focus on creating user-centric designs that enhance usability.\nNote: Custom wireframes and interactive prototypes available upon request.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'l587jezl': {
      'en': 'API Integration & Automation',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dd9qu02x': {
      'en':
          'Specializing in the integration of third-party APIs, such as payment gateways, social media, and cloud services. Automate processes and streamline operations with custom API solutions tailored to your business needs.\nNote: API solutions are scalable and built to handle high-traffic environments.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'a4njr8b1': {
      'en': 'Project Management',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ci6u4gm5': {
      'en':
          'With experience in managing large-scale projects, offering consulting services to help businesses plan, strategize, and execute software development projects. Skilled in Agile methodologies, working with tools like Jira, ClickUp, and Trello for smooth project execution.\nNote: Available for both short-term and long-term consulting engagements.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'kqd7cr3w': {
      'en': 'Success Stories',
      'ar': '',
      'es': '',
      'fr': '',
    },
    's01q14z5': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hju2v65o': {
      'en': 'project 3',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hxg8rre7': {
      'en': 'project 1',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yt5yqevr': {
      'en': 'project 2',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'lr35bsen': {
      'en': '2+',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wlq8eex1': {
      'en': 'help small businesses automate',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'x8ohckya': {
      'en': '10',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'imkshkxo': {
      'en': 'Over 10successful projects delivered ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5bust5lf': {
      'en': '90%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'trthxz2c': {
      'en': 'Maintained a 90% customer satisfaction rate across all projects',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '7wrkrp1i': {
      'en': '10%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fw3verlb': {
      'en': 'Thanks to strong word-of-mouth recommendations and high-quality',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'jtdai924': {
      'en': 'S',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ktcw20w3': {
      'en': 'Let\'s Collaborate!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xdin1ba8': {
      'en': 'Got an idea? Let’s bring it to life, together!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'k0p7tn9h': {
      'en': 'With a deep passion for technology \nand user-centric design',
      'ar': '',
      'es': '',
      'fr': '',
    },
    't9ih89m5': {
      'en': 'Design Inquiry',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'kngpvv8k': {
      'en':
          'Need design help? Reach out now before your great idea fades into oblivion!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6wd64xu9': {
      'en': 'Name',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tom2pkr4': {
      'en': 'TextField',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2jhgluuw': {
      'en': ' ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'isfxctzc': {
      'en': 'Email',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '1ca3cy86': {
      'en': 'TextField',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mfwtmmuv': {
      'en': ' ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0azb8i0l': {
      'en': 'Message',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0toughpm': {
      'en':
          'Tell us all about your project, or at least enough to make us say, “Wow, let’s build this!”',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'br1rz535': {
      'en':
          'Innovative Solutions in \nWeb & Mobile \nDevelopment for \nSeamless User Experiences',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5q3a46yn': {
      'en': 'Hi, I\'m Sam Matter',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '1wb49dyz': {
      'en': 'YEARS OF \nEXPERIENCE',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wwb963yt': {
      'en': '10',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'cm7wyj8d': {
      'en': 'CLIENTS \nSATISFACTION',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'n4fvlbl4': {
      'en': '100%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wekuz953': {
      'en': 'PROJECTS \nDONE',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dq4pipu9': {
      'en': '100%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'f968ikvf': {
      'en': 'BIOGRAPHY',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'e7ndm0rh': {
      'en':
          'full-stack developer specializing in web and mobile apps, focusing on intuitive design and innovative AI solutions',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pxgzxl75': {
      'en': 'SERVICES',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'msr5mom0': {
      'en':
          'Custom app development\nWeb development\nUI/UX design\nAI and automation solutions',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'j64ksy93': {
      'en': 'Selected works',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '48hqhhaj': {
      'en': 'Foodie Finder',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wrg1v7fb': {
      'en': 'Web & Mobile Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'je7lbfat': {
      'en': 'August 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'l4cb6tmh': {
      'en':
          'An innovative application designed to help users discover nearby restaurants and food joints based on their preferences. Built using Flutter and integrated with Google Maps API, this app delivers location-based recommendations in real-time. The user interface focuses on a seamless experience for both food lovers and restaurant owners, including features like user reviews, real-time wait times, and delivery options.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5x2iwj4x': {
      'en': 'Button',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'j59c5tjq': {
      'en': 'HealthTrack',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'khdp33fx': {
      'en': 'Mobile Health App',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '9iwnsv8f': {
      'en': 'June 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rv0vqrab': {
      'en':
          'A personal health tracking app designed for Android and iOS. The app uses machine learning to predict and monitor user health metrics, providing insights into physical activity, sleep patterns, and heart rate. Built with Flutter and Firebase, the app integrates with wearable devices to provide real-time health updates.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5jos6loj': {
      'en': 'ShopEasy',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pve6f8rd': {
      'en': 'E-commerce Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tttha34w': {
      'en': 'July 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '16g4hocg': {
      'en':
          'A powerful yet minimalist e-commerce platform built using React and Node.js, focused on providing a smooth shopping experience. The platform allows multiple vendors to upload and manage their own products while using AI-driven recommendations to suggest products to customers. With Stripe integration for secure payments.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '9joy1zdg': {
      'en': 'EduLearn',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'krmhcfsx': {
      'en': 'Web Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'thaf841l': {
      'en': 'April 2024',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dkb2qcl2': {
      'en':
          'A dynamic online learning platform for students and teachers. Built using Vue.js and Firebase, it offers video tutorials, assignments, and real-time quizzes. The platform provides an easy-to-use content management system for educators to create and upload learning materials. It features real-time communication.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '94i832d8': {
      'en': 'Services',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'eq191bv0': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile\n applications that offer both functionality ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xptt0uzm': {
      'en': 'Software Dev',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '9ghi0mqq': {
      'en':
          'Offering full-stack web and mobile application development with a focus on building scalable, efficient, and user-friendly software. Services include backend development, API integration, and database management.\nNote: Specializing in technologies like Flutter, Firebase, React, and Node.js for robust application performance.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '85c9gwdd': {
      'en': 'UI/UX Design Consulting',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'wvt4kflf': {
      'en':
          'Providing expert consulting in user interface and user experience design to ensure that applications are not only functional but also intuitive and engaging. Focus on creating user-centric designs that enhance usability.\nNote: Custom wireframes and interactive prototypes available upon request.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qwd7035e': {
      'en': 'API Integration & Automation',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '8tn8ckkn': {
      'en':
          'Specializing in the integration of third-party APIs, such as payment gateways, social media, and cloud services. Automate processes and streamline operations with custom API solutions tailored to your business needs.\nNote: API solutions are scalable and built to handle high-traffic environments.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ma6ljod1': {
      'en': 'Cloud Deployment & DevOps',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'k3dj6jdz': {
      'en':
          'Helping businesses deploy their applications on the cloud, leveraging platforms like AWS, Google Cloud, and Azure for scalability and performance. Offering continuous integration (CI) and continuous deployment (CD) pipelines to streamline development workflows.\nNote: Assistance in selecting the best cloud solution for your needs.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rf0w58g0': {
      'en': 'Project Management',
      'ar': '',
      'es': '',
      'fr': '',
    },
    't2hhb5gq': {
      'en':
          'With experience in managing large-scale projects, offering consulting services to help businesses plan, strategize, and execute software development projects. Skilled in Agile methodologies, working with tools like Jira, ClickUp, and Trello for smooth project execution.\nNote: Available for both short-term and long-term consulting engagements.',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'slibiwml': {
      'en': 'Achievement',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'incwqbvm': {
      'en': '2st Place',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zf9j10ts': {
      'en': 'Achievement',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'apkzclvw': {
      'en': 'App of the Year Award - 2023',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rpgqj0cy': {
      'en': 'Mobile Application Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bbzuui0y': {
      'en': '1st Place',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'lre4nw89': {
      'en': 'Design Challenge',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '8g2y41ye': {
      'en': 'Top 10 on App Store for \nTech Apps',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6r2rw5sr': {
      'en': 'Top 10 on appstore',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2pdcf9eb': {
      'en': '2st Place',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'h763ujrq': {
      'en': 'Design Challenge',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'o7ua4p6w': {
      'en': 'Best Developer Award',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '40tq7uca': {
      'en': 'Web & Mobile Development',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'habwxfc7': {
      'en': 'Success Stories',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hh8ki63c': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4pag4lpn': {
      'en': 'Hello World',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'o2j90l28': {
      'en': 'Hello World',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'quv8mlvc': {
      'en': 'Hello World',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'tmjibn1r': {
      'en': '6000',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bfwa9guc': {
      'en': 'help small businesses automate',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '28otgsj3': {
      'en': '300',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6veqtny8': {
      'en': 'Over 300 successful projects delivered to  globe',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'jbdhz837': {
      'en': '90%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'uosmh07p': {
      'en': 'Maintained a 90% customer satisfaction rate across all projects',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'r86irkty': {
      'en': '10%',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'nvsul9rz': {
      'en': 'Thanks to strong word-of-mouth recommendations and high-quality',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '26tnokjz': {
      'en': 'S',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xe8k4bhx': {
      'en': 'Let\'s Collaborate!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'w76jccco': {
      'en': 'Got an idea? Let’s bring it to life, together!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '18gy8ok7': {
      'en': 'With a deep passion for technology \nand user-centric design',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fn4hhr83': {
      'en': 'Design Inquiry',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'n6sx3jj5': {
      'en':
          'Need design help? Reach out now before your great idea fades into oblivion!',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mnhpe0yi': {
      'en': 'Name',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '01eub3f9': {
      'en': 'TextField',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'shvbnews': {
      'en': ' ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '97tdh9sr': {
      'en': 'Email',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3a8h8vci': {
      'en': 'TextField',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6uh7z2mm': {
      'en': ' ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'y4k9fyeb': {
      'en': 'Message',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ekrujtbz': {
      'en':
          'Tell us all about your project, or at least enough to make us say, “Wow, let’s build this!”',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5emxxobj': {
      'en': 'Home',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
  // ContactUs
  {
    'v907izvz': {
      'en': 'Contact Us',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
    },
    'v3z34hnw': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'lw2jy31k': {
      'en': 'Manager',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'r2inuv0w': {
      'en': 'Office line',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'ynggzjhj': {
      'en': 'taslyghana346@gmail.com',
      'ar': 'اتصل بنا',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    '1ypzudtf': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // scan
  {
    'dmrr8i33': {
      'en': 'Scan QR Code',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zuuq0vob': {
      'en': 'Position the QR code within the frame to scan',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'b8b37id5': {
      'en': 'Scanning...',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '8028kx3e': {
      'en': 'Recent Scans',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'dmtghg3y': {
      'en': 'Product #A12345',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mb2zd1f7': {
      'en': 'Scanned 2 minutes ago',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yrhjaga9': {
      'en': 'Upload QR Code',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
  // loginsecurebiometric
  {
    'uutz0tmu': {
      'en': 'Scan Fingerprint',
      'ar': 'تعيين بصمة الإصبع الخاصة بك',
      'es': 'Establece tu huella digital',
      'fr': 'Définir votre empreinte digitale',
    },
    '7fx4pm5v': {
      'en': 'Please put your finger on the fingerprint scanner to unlock',
      'ar': 'يرجى وضع إصبعك على الماسح الضوئي لبصمات الأصابع للبدء.',
      'es': 'Coloque su dedo en el escáner de huellas digitales para comenzar.',
      'fr':
          'Veuillez mettre votre doigt sur le scanner d\'empreintes digitales pour commencer.',
    },
    'njftok0u': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    '1fhj7wxn': {
      'en': 'You want to enable the biometric as your second security level?',
      'ar': 'هل تريد تمكين القياسات الحيوية كمستوى الأمان الثاني لديك؟',
      'es':
          '¿Quiere habilitar la biometría como su segundo nivel de seguridad?',
      'fr':
          'Vous souhaitez activer la biométrie comme deuxième niveau de sécurité ?',
    },
  },
  // Forgetpin
  {
    'gph7k0ks': {
      'en': 'Enter the Security pass you set during account setup',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'g9ogdqk2': {
      'en': 'Enter your Security pass',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'iqpb8jji': {
      'en': 'Send ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mj5fi781': {
      'en': 'Can\'t remember your pass?',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4bnoti5o': {
      'en': 'continue',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
  // RequestPin
  {
    'rw57kflt': {
      'en': 'Request for Pin',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'm6c0aw54': {
      'en': 'Upload  your National identification card to verify our Identity',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '6sw90rhz': {
      'en': 'Request',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
  // onBoardComplete_modal
  {
    'prn4cih5': {
      'en': 'Congratulations!',
      'ar': 'تهانينا!',
      'es': '¡Felicidades!',
      'fr': 'Toutes nos félicitations!',
    },
    '7y5lbqhc': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. ستتم إعادة توجيهك إلى الصفحة الرئيسية خلال ثوانٍ قليلة.',
      'es':
          'Su cuenta está lista para usar. Serás redirigido a la página de inicio en unos segundos.',
      'fr':
          'Votre compte est prêt à être utilisé. Vous serez redirigé vers la page d\'accueil dans quelques secondes.',
    },
  },
  // HeaderProfile
  {
    'kpcuyrzl': {
      'en': 'Good Morning 👋',
      'ar': 'صباح الخير 👋',
      'es': 'Buenos días 👋',
      'fr': 'Bonjour 👋',
    },
    'xeo7oa3y': {
      'en': 'Andrew Ainsley',
      'ar': 'أندرو أينسلي',
      'es': 'Andres Ainsley',
      'fr': 'Andrew Ainsley',
    },
  },
  // ProductItem
  {
    'fquf478k': {
      'en': ' sold',
      'ar': 'مُباع',
      'es': 'vendido',
      'fr': 'vendu',
    },
  },
  // SpecialOffersItem
  {
    'r2kf44eg': {
      'en': ' %',
      'ar': '%',
      'es': '%',
      'fr': '%',
    },
  },
  // SortAndFilterModal37
  {
    't4fcdpd6': {
      'en': 'Sort & Filter',
      'ar': 'فرز وتصفية',
      'es': 'Filtro de clasificación',
      'fr': 'Trier et filtrer',
    },
    'ul0qwfmp': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Rango de precios',
      'fr': 'Échelle des prix',
    },
    '3dznnynk': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'bycm9h11': {
      'en': 'Sort By',
      'ar': 'ترتيب حسب',
      'es': 'Ordenar por',
      'fr': 'Trier par',
    },
    'pdnb4849': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
    'e7l9xvaw': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Más reciente',
      'fr': 'Le plus récent',
    },
    '8hnkgb4f': {
      'en': 'Rating',
      'ar': 'تقييم',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    'rohyjnig': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'cq6n9owh': {
      'en': '5',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    '08bjsrur': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    '528bcv9p': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
    },
  },
  // Review
  {
    'ivxsdktc': {
      'en': '4.4',
      'ar': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
  },
  // RemoveFromCardConfirm
  {
    'pq99mh1o': {
      'en': 'Remove Product?',
      'ar': 'هل ترغب في إزالة المنتج؟',
      'es': '¿Quitar producto?',
      'fr': 'Supprimer le produit ?',
    },
    'dhnacgix': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'es0xob3g': {
      'en': 'Yes, Remove',
      'ar': 'نعم، إزالة',
      'es': 'Sí, eliminar',
      'fr': 'Oui, supprimer',
    },
  },
  // ShippingItemRadioBTn
  {
    'lkvkur3i': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
    },
  },
  // AddPromoItem
  {
    'm6adkvge': {
      'en': 'Default',
      'ar': 'تقصير',
      'es': 'Por defecto',
      'fr': 'Défaut',
    },
  },
  // CheckOutSuccessfulModal65
  {
    'huy1t7vw': {
      'en': 'Order Successful!',
      'ar': 'تم الطلب بنجاح!',
      'es': '¡Orden exitosa!',
      'fr': 'Commande réussie !',
    },
    'onl8csfz': {
      'en': 'You have successfully made order',
      'ar': 'لقد قمت بالطلب بنجاح',
      'es': 'Has realizado el pedido correctamente',
      'fr': 'Vous avez passé commande avec succès',
    },
    '5nsud8h1': {
      'en': 'View Order',
      'ar': 'مشاهدة الطلب',
      'es': 'Ver pedido',
      'fr': 'Voir l\'ordre',
    },
    '6pgr229g': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
    },
  },
  // OrderOngoingItem
  {
    'hb6m693k': {
      'en': 'GHC ',
      'ar': '\$',
      'es': 'ps',
      'fr': '\$',
    },
    'vu1v94o2': {
      'en': 'GHC ',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '4tzvev7a': {
      'en': 'Leave Review',
      'ar': 'اترك مراجعة',
      'es': 'Deje opinión',
      'fr': 'Laisser un avis',
    },
  },
  // OrderTrackItem
  {
    'gjoytiwi': {
      'en': 'GHC ',
      'ar': '\$',
      'es': 'ps',
      'fr': '\$',
    },
    'h2uagotm': {
      'en': 'GHC ',
      'ar': '\$',
      'es': 'ps',
      'fr': '\$',
    },
  },
  // ReviewGive
  {
    'b167nkp3': {
      'en': 'Leave a Review',
      'ar': 'ترك التعليق',
      'es': 'Dejar un comentario',
      'fr': 'Laisser un commentaire',
    },
    'p4v8fyel': {
      'en': 'Please give your rating & also your review...',
      'ar': 'يرجى إعطاء تقييمك وأيضا رأيك ...',
      'es': 'Por favor dé su calificación y también su opinión...',
      'fr': 'Veuillez donner votre note et également votre avis...',
    },
    'j2v4qpw3': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'نص Smoe مثل: منتج جيد جدًا وتسليم سريع!',
      'es': 'Smoe texto como: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte smoe comme : Très bon produit et livraison rapide !',
    },
    'pmb9suod': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'zjspktyl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'oe33acjy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zs6j4hc7': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
  },
  // TopUpSuccessfulModal75
  {
    '4szqetn3': {
      'en': 'Top Up Successful!',
      'ar': 'تم تعبئة الرصيد بنجاح!',
      'es': '¡Recarga exitosa!',
      'fr': 'Recharge réussie !',
    },
    'ewdqtrqz': {
      'en': 'You have successfully top up\ne-wallet for \$500',
      'ar': 'لقد قمت بتعبئة الرصيد بنجاح\nالمحفظة الإلكترونية بمبلغ 500 دولار',
      'es': 'Has recargado correctamente\nbilletera electrónica por \$500',
      'fr':
          'Vous avez réussi à recharger\nportefeuille électronique pour 500 \$',
    },
    'en793tfo': {
      'en': 'View E-Receipt',
      'ar': 'عرض الإيصال الإلكتروني',
      'es': 'Ver recibo electrónico',
      'fr': 'Afficher le reçu électronique',
    },
    'u3wurren': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // E-ReceiptItem
  {
    'ln03i5vy': {
      'en': 'Qty = ',
      'ar': 'الكمية =',
      'es': 'Cantidad =',
      'fr': 'Quantité =',
    },
  },
  // InviteItem
  {
    'sp71eqpn': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
    },
    'egrx7d3t': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
    },
  },
  // LogoutConfirm_Modal
  {
    'a68c7jwy': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '50ivrv6h': {
      'en': 'Are you sure you want to log out?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
    },
    'p0z4sjdl': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'a6j51z22': {
      'en': 'Yes, Logout',
      'ar': 'نعم، تسجيل الخروج',
      'es': 'Sí, cerrar sesión',
      'fr': 'Oui, déconnexion',
    },
  },
  // InfoConfirm_Modal
  {
    '82i39xhd': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'x4zkf56d': {
      'en': 'Ok, I Undrestand!',
      'ar': 'حسنًا، أنا أفهم!',
      'es': '¡Vale, lo entiendo!',
      'fr': 'Ok, je comprends !',
    },
  },
  // MoneyCard
  {
    'gvgaw7l9': {
      'en': '**** **** **** ****',
      'ar': '**** **** **** ****',
      'es': '**** **** **** ****',
      'fr': '**** **** **** ****',
    },
    'hqwtcgfn': {
      'en': 'Your balance',
      'ar': 'رصيدك',
      'es': 'Tu balance',
      'fr': 'Votre solde',
    },
    '41nrmwbi': {
      'en': 'Top Up',
      'ar': 'فوق حتى',
      'es': 'Completar',
      'fr': 'Recharger',
    },
  },
  // AddressAdd
  {
    'bxpbj9fp': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'es': 'Agregar nueva dirección',
      'fr': 'Ajouter une nouvelle adresse',
    },
    'eb9q3bg6': {
      'en': 'Address Name',
      'ar': 'اسم عنوان',
      'es': 'Nombre de la dirección',
      'fr': 'Nom de l\'adresse',
    },
    'frnvw3qd': {
      'en': 'Address name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'ndpl9q5e': {
      'en': 'Address Details',
      'ar': 'تفاصيل العنوان',
      'es': 'detalles de dirección',
      'fr': 'Détails de l\'adresse',
    },
    'qb3e65w0': {
      'en': 'Select Location',
      'ar': 'اختر موقعا',
      'es': 'Seleccionar Ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    '2xpzfut9': {
      'en': 'Make this as the default address',
      'ar': 'اجعل هذا هو العنوان الافتراضي',
      'es': 'Establecer esta como la dirección predeterminada',
      'fr': 'Faites-en l\'adresse par défaut',
    },
    '5d9gdpwi': {
      'en': 'Add',
      'ar': 'يضيف',
      'es': 'Agregar',
      'fr': 'Ajouter',
    },
  },
  // PromoAdd
  {
    'vzaa7mk1': {
      'en': 'Select your promo',
      'ar': 'حدد العرض الترويجي الخاص بك',
      'es': 'Selecciona tu promoción',
      'fr': 'Sélectionnez votre promotion',
    },
    '1phps44x': {
      'en': 'Available',
      'ar': 'متاح',
      'es': 'Disponible',
      'fr': 'Disponible',
    },
  },
  // securityPass
  {
    '1n8hoye5': {
      'en': 'Set Security Pass',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'gopo2zqd': {
      'en': 'Create a security pass to protect your account',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'y99jew8i': {
      'en': 'Enter Security Pass',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zj4dqzg8': {
      'en': 'Continue',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
  },
  // Miscellaneous
  {
    '3xcyhsnv': {
      'en': 'Next',
      'ar': 'تغيير الرمز السري',
      'es': 'Cambiar código PIN',
      'fr': 'Changer le code PIN',
    },
    'wdaunoqs': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    '2dwdc8yl': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    '9cp9tnq9': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'r0k6dvu6': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '3ndtzya4': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
    },
    'swm6319t': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'gpzu150f': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'ip2a2o8v': {
      'en': 'All',
      'ar': 'مزامنة جهات الاتصال الخاصة بك',
      'es': 'Sincroniza tus contactos',
      'fr': 'Synchronisez vos contacts',
    },
    '95svkunb': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
    },
    'p3v8uoen': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
    },
    '1iw4e130': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Más reciente',
      'fr': 'Le plus récent',
    },
    'dk7ex8cx': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
    },
    'a5iqoo0f': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'نص Smoe مثل: منتج جيد جدًا وتسليم سريع!',
      'es': 'Smoe texto como: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte smoe comme : Très bon produit et livraison rapide !',
    },
    'lkrp1j91': {
      'en': '\$10',
      'ar': '10 دولارات',
      'es': '\$10',
      'fr': '10 \$',
    },
    '6mrgpbz0': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
    },
    'kvc2fy4j': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
    },
    'zwg93n13': {
      'en': '2899 Summer Drive Taylor, PC 48180',
      'ar': '2899 سمر درايف تايلور، الكمبيوتر 48180',
      'es': '2899 Verano Drive Taylor, PC 48180',
      'fr': '2899, promenade Summer Taylor, PC 48180',
    },
    'b3knti0s': {
      'en': 'All',
      'ar': '5',
      'es': '5',
      'fr': '5',
    },
    'xvif1n69': {
      'en': 'Cloths',
      'ar': '10',
      'es': '10',
      'fr': 'dix',
    },
    '251gk4uv': {
      'en': 'Shoes',
      'ar': '20',
      'es': '20',
      'fr': '20',
    },
    'rh97ml0k': {
      'en': 'House',
      'ar': '50',
      'es': '50',
      'fr': '50',
    },
    'rtt0s3ia': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'v3sxop9c': {
      'en': '111111',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qx03qhyp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'yern1xc3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'qpnabqqh': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'p22sdi5k': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'zjkwl8p2': {
      'en': 'This app requires contacts access to function properly.',
      'ar': 'يتطلب هذا التطبيق الوصول إلى جهات الاتصال ليعمل بشكل صحيح.',
      'es':
          'Esta aplicación requiere acceso a los contactos para funcionar correctamente.',
      'fr':
          'Cette application nécessite un accès aux contacts pour fonctionner correctement.',
    },
    'd87k0ap6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '5uwt6n9y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'l46gqdxp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'hxhmmu6e': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'ag0mlb7c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'fcu9zsgb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mi1gwhj1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'vhpv466y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '0tfvavw5': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mqo0fjf7': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'pbruw4is': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '2ds938sx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'f8wsmlub': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'aa27z1n2': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'rz28dduj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'cq43nzjx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'bpv17yg3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'xw4eb2cb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'h9ohlmo6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'expiyj8r': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'mbakdgif': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    '3ystj7r4': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
    'y65cdfga': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
