import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

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
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'ukyad98l': {
      'en': 'Login',
      'hi': '',
    },
    'czn8hkn1': {
      'en': 'Email Address',
      'hi': '',
    },
    '3aw87gbn': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    'hdmzxqm6': {
      'en': 'Password',
      'hi': '',
    },
    'yaylqga5': {
      'en': 'Enter your password here...',
      'hi': '',
    },
    'nxb522m3': {
      'en': 'Forgot Password?',
      'hi': '',
    },
    'l26mv2rl': {
      'en': 'Login',
      'hi': '',
    },
    'k8q3nzbw': {
      'en': 'Don\'t have an account?',
      'hi': '',
    },
    'df7bxpax': {
      'en': 'Create Account',
      'hi': '',
    },
    'qghnc2cz': {
      'en': 'Kisaan मित्र',
      'hi': '',
    },
    '8r1b48y6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // createAccount
  {
    '7mj2kt34': {
      'en': 'Get Started Below,',
      'hi': '',
    },
    '9tfzmzs8': {
      'en': 'Email Address',
      'hi': '',
    },
    'zysaeq0x': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    'n7nkc3pa': {
      'en': 'Password',
      'hi': '',
    },
    'fxeudhqn': {
      'en': 'Enter your email here...',
      'hi': '',
    },
    '2mvlnxq6': {
      'en': 'Create Account',
      'hi': '',
    },
    '55y7ft0q': {
      'en': 'Already have an account?',
      'hi': '',
    },
    't3jtdnjm': {
      'en': 'Login',
      'hi': '',
    },
    'upcp8q9z': {
      'en': 'Home',
      'hi': '',
    },
  },
  // homePage_MAIN
  {
    'atacyu76': {
      'en': 'Kisaan मित्र',
      'hi': '',
    },
    'v7g8rrhf': {
      'en': 'Search your product here',
      'hi': '',
    },
    'tbffa5eg': {
      'en': 'Search',
      'hi': '',
    },
    'vxpo5fmn': {
      'en': '27 Oct, 2023',
      'hi': '',
    },
    'lqebkufl': {
      'en': 'Jaipur',
      'hi': '',
    },
    'wrhi7p0q': {
      'en': 'Today',
      'hi': '',
    },
    'q0wcn9tu': {
      'en': '20°C',
      'hi': '',
    },
    'k43fiu0t': {
      'en': '46 %',
      'hi': '',
    },
    'mc3uxyss': {
      'en': 'It is clear today',
      'hi': '',
    },
    'awo7pdzh': {
      'en': 'Market Place',
      'hi': '',
    },
    'y5tnmzxc': {
      'en': 'Farmers can sell their product',
      'hi': '',
    },
    'wf03mlui': {
      'en': 'Sell',
      'hi': '',
    },
    'ysl8pdvj': {
      'en': 'Buy the Farming products',
      'hi': '',
    },
    'fq758luu': {
      'en': 'Buy',
      'hi': '',
    },
    'qpk1kl2v': {
      'en': 'Mandi Prices',
      'hi': '',
    },
    'ljp2kc38': {
      'en': 'Soyabean',
      'hi': '',
    },
    'sjvgidb2': {
      'en': 'Jaipur',
      'hi': '',
    },
    'tiyqb5cv': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'dg9b7xrh': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'yth1b95d': {
      'en': '↑₹192',
      'hi': '',
    },
    'ky1trhjn': {
      'en': 'Paddy(Dhan)',
      'hi': '',
    },
    '0jsokql8': {
      'en': 'Jaipur',
      'hi': '',
    },
    'pj6rwgc4': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    '3235h569': {
      'en': '₹ 3225/Q',
      'hi': '',
    },
    'q66ighkt': {
      'en': '↓ ₹188',
      'hi': '',
    },
    '0tqac8vz': {
      'en': 'Wheat',
      'hi': '',
    },
    'unb9o5qh': {
      'en': 'Jaipur',
      'hi': '',
    },
    '66y2igel': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'hu4wy5ld': {
      'en': '₹ 2382/Q',
      'hi': '',
    },
    'bsk0nxer': {
      'en': '↑ ₹92',
      'hi': '',
    },
    'k9haxw69': {
      'en': 'See more',
      'hi': '',
    },
    '6gblrjmi': {
      'en': 'News',
      'hi': '',
    },
    'lv29au0c': {
      'en': 'The indian express',
      'hi': '',
    },
    '2nn21cph': {
      'en': 'Amit Shah bats for natural farming\n practices, local hiring',
      'hi': '',
    },
    '6k2fm5hy': {
      'en': 'The times of india',
      'hi': '',
    },
    'jiwu72bd': {
      'en': 'Cotton, soya rates upset farmers',
      'hi': '',
    },
    'ijc9apdn': {
      'en': 'News 18',
      'hi': '',
    },
    'rh6u8q2p': {
      'en':
          'Transforming India: How Agriculture \nSector & Farmers Are Getting Top Priority',
      'hi': '',
    },
    'hf9wwv1f': {
      'en': 'Kisaan 1',
      'hi': '',
    },
    'gxy8p6rs': {
      'en': 'test@gmail.com',
      'hi': '',
    },
    'dwvv3c4x': {
      'en': 'Account Details',
      'hi': '',
    },
    'gj0o34g4': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'tpj8nv0z': {
      'en': 'Payment Information',
      'hi': '',
    },
    'bcns9c11': {
      'en': 'Change Password',
      'hi': '',
    },
    '40p2tsbt': {
      'en': 'My Commodities',
      'hi': '',
    },
    'gtzlq1kk': {
      'en': 'Log Out',
      'hi': '',
    },
    'iq2xbioq': {
      'en': 'Home',
      'hi': '',
    },
  },
  // changePassword
  {
    'wsi4hu1t': {
      'en': 'Email Address',
      'hi': '',
    },
    'srshkpqo': {
      'en': 'Your email..',
      'hi': '',
    },
    'idc12nyv': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'hi': '',
    },
    'cwca8z0j': {
      'en': 'Send Reset Link',
      'hi': '',
    },
    'r7gprc92': {
      'en': 'Change Password',
      'hi': '',
    },
    '58412nh5': {
      'en': 'Home',
      'hi': '',
    },
  },
  // MandiPrices
  {
    'pmii6il6': {
      'en': 'Soyabean',
      'hi': '',
    },
    'c2znkain': {
      'en': 'Jaipur',
      'hi': '',
    },
    'fxiwwouo': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    '7l58s5gr': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'f6rx2mbe': {
      'en': '↑₹192',
      'hi': '',
    },
    'izpue6qf': {
      'en': 'Soyabean',
      'hi': '',
    },
    'cyy6acq2': {
      'en': 'Jaipur',
      'hi': '',
    },
    'sc30k7ft': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    '5p5ladtr': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'hi7cbxaw': {
      'en': '↑₹192',
      'hi': '',
    },
    '9b70eanj': {
      'en': 'Soyabean',
      'hi': '',
    },
    'ucmsvyst': {
      'en': 'Jaipur',
      'hi': '',
    },
    'd4k1s4k2': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'k4juyokz': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'xksxpppj': {
      'en': '↑₹192',
      'hi': '',
    },
    'uqotd409': {
      'en': 'Soyabean',
      'hi': '',
    },
    '2uejpkra': {
      'en': 'Jaipur',
      'hi': '',
    },
    'wtzphanr': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'q5z6swhi': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'mtvv8qx3': {
      'en': '↑₹192',
      'hi': '',
    },
    'm87lj3ik': {
      'en': 'Soyabean',
      'hi': '',
    },
    'g5xgsg93': {
      'en': 'Jaipur',
      'hi': '',
    },
    '20kivbln': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'ogtwslsx': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'g427kqgq': {
      'en': '↑₹192',
      'hi': '',
    },
    '4fqjqvrf': {
      'en': 'Mandi Prices',
      'hi': '',
    },
    'so8c5h70': {
      'en': 'Market Prices',
      'hi': '',
    },
  },
  // Charts
  {
    '40rgcvt4': {
      'en': 'Soyabean',
      'hi': '',
    },
    'pp2wftdz': {
      'en': 'Jaipur',
      'hi': '',
    },
    'qejcuhrq': {
      'en': '27 Oct,2023',
      'hi': '',
    },
    'u0hrlza6': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'oc6iinds': {
      'en': '↑₹192',
      'hi': '',
    },
    'nsw0h6hq': {
      'en': 'Dates',
      'hi': '',
    },
    'ishasvug': {
      'en': 'Prices',
      'hi': '',
    },
    'cf044mv4': {
      'en': 'Soyabean',
      'hi': '',
    },
    '4zgvhbwt': {
      'en': 'Past Prices',
      'hi': '',
    },
    '04je44fm': {
      'en': '26 Oct 2023',
      'hi': '',
    },
    'njz1h81k': {
      'en': '₹ 4642/Q',
      'hi': '',
    },
    'pbey8596': {
      'en': '23 Oct 2023',
      'hi': '',
    },
    'o2rhr2i1': {
      'en': '₹ 4700/Q',
      'hi': '',
    },
    '8sz0g1ft': {
      'en': '12 Oct 2023',
      'hi': '',
    },
    'awunddls': {
      'en': '₹ 4122/Q',
      'hi': '',
    },
    'zp82fod2': {
      'en': '11 Oct 2023',
      'hi': '',
    },
    'fkurovdz': {
      'en': '₹ 3864/Q',
      'hi': '',
    },
    'x2fb0sqs': {
      'en': '10 Oct 2023',
      'hi': '',
    },
    'kx5kpl4b': {
      'en': '₹ 4012/Q',
      'hi': '',
    },
    '6x3lcn4t': {
      'en': '9 Oct 2023',
      'hi': '',
    },
    'cpc9mj0t': {
      'en': '₹ 3851/Q',
      'hi': '',
    },
    'r62xf53k': {
      'en': 'Chart ',
      'hi': '',
    },
    'qtna1dbm': {
      'en': 'Home',
      'hi': '',
    },
  },
  // SellComodity
  {
    'gmn3zksz': {
      'en': 'Post commodity',
      'hi': '',
    },
    'jq61yqwa': {
      'en': 'My Posted Commodities',
      'hi': '',
    },
    '7xt6mmo7': {
      'en': 'Black Gram',
      'hi': '',
    },
    '62af0kvc': {
      'en': 'Asking price: 60/kg',
      'hi': '',
    },
    '35d0xx9x': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    '1lspde51': {
      'en': 'Call Now',
      'hi': '',
    },
    'l0qtwgo6': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '8y061ji4': {
      'en': 'Mustard',
      'hi': '',
    },
    'w1bnyrjz': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    'i6cjzlg8': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'z684k3gd': {
      'en': 'Call Now',
      'hi': '',
    },
    '98w2dtbw': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '8h58ckmz': {
      'en': 'Sell',
      'hi': '',
    },
    '88xcb3c3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Sell_new_commodity
  {
    'fo32823a': {
      'en': 'Crop Name',
      'hi': '',
    },
    'r68ojadu': {
      'en': 'Enter Here',
      'hi': '',
    },
    '0sod3ros': {
      'en': 'Quality',
      'hi': '',
    },
    'ua9v9jf5': {
      'en': 'High',
      'hi': '',
    },
    'dmwjx5uk': {
      'en': 'Medium',
      'hi': '',
    },
    '12nyxfmg': {
      'en': 'Low',
      'hi': '',
    },
    'e07ttujy': {
      'en': 'Please select...',
      'hi': '',
    },
    '4er6f94o': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '2zdnpaut': {
      'en': 'Variant',
      'hi': '',
    },
    'bpzdugbx': {
      'en': 'Enter Here',
      'hi': '',
    },
    '4bwwfp3v': {
      'en': 'Quantity',
      'hi': '',
    },
    'w0pacu99': {
      'en': 'Enter Here',
      'hi': '',
    },
    'dxn7fzl0': {
      'en': 'Price',
      'hi': '',
    },
    'z0w61bjz': {
      'en': 'Enter Here',
      'hi': '',
    },
    'p9rm7ldy': {
      'en': 'Phone No',
      'hi': '',
    },
    'mc7wv9ht': {
      'en': 'Enter Here',
      'hi': '',
    },
    '01ee2xae': {
      'en': 'Pin Code',
      'hi': '',
    },
    '6cturm2m': {
      'en': 'Enter Here',
      'hi': '',
    },
    'pon0mrj7': {
      'en': 'Post commodity',
      'hi': '',
    },
    'ltd1j3m8': {
      'en': 'Sell Commodity',
      'hi': '',
    },
    'fy0ykh7p': {
      'en': 'Home',
      'hi': '',
    },
  },
  // buyCommodity
  {
    '68ylx79w': {
      'en': 'Sell your produce',
      'hi': '',
    },
    'kp597kwk': {
      'en': 'Mustard',
      'hi': '',
    },
    'cacyezm1': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    '8rkr4tj1': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'tjyhcn0i': {
      'en': 'Call Now',
      'hi': '',
    },
    'h2bnzrrp': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '8ve1708g': {
      'en': 'Sugarcane',
      'hi': '',
    },
    'j40zl67c': {
      'en': 'Asking price: 4/kg',
      'hi': '',
    },
    'jmjg5o5s': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'xgltt2gq': {
      'en': 'Call Now',
      'hi': '',
    },
    '0lhn0exr': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '59uemxrs': {
      'en': 'Drumstick',
      'hi': '',
    },
    'jmdll8v6': {
      'en': 'Asking price: 2500/kg',
      'hi': '',
    },
    '57qssnkx': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'fipl5ih1': {
      'en': 'Call Now',
      'hi': '',
    },
    '9tjrn5kg': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'c2fgk7nn': {
      'en': 'Mariegold',
      'hi': '',
    },
    'r6rfkblw': {
      'en': 'Asking price: 45/kg',
      'hi': '',
    },
    'v2fphx4e': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'upjqupot': {
      'en': 'Call Now',
      'hi': '',
    },
    '8gk11p4q': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'fnijq9bz': {
      'en': 'Paddy',
      'hi': '',
    },
    '1bfn3fx3': {
      'en': 'Asking price: 40/kg',
      'hi': '',
    },
    'dapg2ovq': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'pa5tfwi2': {
      'en': 'Call Now',
      'hi': '',
    },
    'xlby1ugl': {
      'en': 'Whatsapp',
      'hi': '',
    },
    '3k0ajncy': {
      'en': 'Potato',
      'hi': '',
    },
    'w8sry6b4': {
      'en': 'Asking price: 12/kg',
      'hi': '',
    },
    'nm4yi3gx': {
      'en': 'Location: Jaipur',
      'hi': '',
    },
    'r7btg0lb': {
      'en': 'Call Now',
      'hi': '',
    },
    'g2pvwsmf': {
      'en': 'Whatsapp',
      'hi': '',
    },
    'dl0yprii': {
      'en': 'Buy Commodities',
      'hi': '',
    },
    'l3663vsi': {
      'en': 'Marketplace',
      'hi': '',
    },
  },
  // Community
  {
    'qpzuje6n': {
      'en': 'Blogs',
      'hi': '',
    },
    'babvpejn': {
      'en': 'Today\'s Blogs',
      'hi': '',
    },
    'h7tmcvai': {
      'en': 'Rising deamnd of wheat, right time to sell?',
      'hi': '',
    },
    'ctalsjah': {
      'en':
          'We are  analyzing the surging demand for wheat. Uncover market trends, global influences, and crucial indicators that might signal the perfect moment to sell your wheat harvest.',
      'hi': '',
    },
    '5kfkmnet': {
      'en':
          'Empowering Farmers: The Role of Mobile Apps in Agricultural Development',
      'hi': '',
    },
    'ogbyh6js': {
      'en':
          'Navigate the landscape of agricultural mobile applications. From weather forecasting to market information, discover how mobile technology is empowering farmers and reshaping traditional farming practices.',
      'hi': '',
    },
    'q44jno5i': {
      'en': 'Weathering the Storm: How Climate Change Affects Agriculture',
      'hi': '',
    },
    'zz5e269a': {
      'en':
          'Examine the intersection of climate change and agriculture. Learn about the challenges farmers face due to shifting weather patterns and explore innovative solutions to adapt to and mitigate the impact of climate change.',
      'hi': '',
    },
    'r90ple64': {
      'en':
          'The Digital Frontier: Transforming Agriculture with Smart Technology',
      'hi': '',
    },
    '5s221nbo': {
      'en':
          'Explore the cutting-edge technologies shaping modern agriculture. From precision farming to IoT-enabled machinery, discover how agritech is revolutionizing the way we cultivate and harvest crops.',
      'hi': '',
    },
    '4mxpf5zs': {
      'en': 'Expert Advice',
      'hi': '',
    },
    'j54gkoxm': {
      'en': 'Premium Plan',
      'hi': '',
    },
    '80pbhmui': {
      'en': 'This Plan includes',
      'hi': '',
    },
    'ni0niva5': {
      'en':
          '◈ Chat with expert\n◈ Phone calls with Expert\n◈ Priority in Marketplace\n◈ 24*7 Helpline\n◈ Expret Advice',
      'hi': '',
    },
    'xxeerjhf': {
      'en': 'Buy To Unlock',
      'hi': '',
    },
    'hbrylor0': {
      'en': 'Community',
      'hi': '',
    },
    'ts7z29q2': {
      'en': 'Community',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'jmg0fkm4': {
      'en': '',
      'hi': '',
    },
    'nhldtsmz': {
      'en': '',
      'hi': '',
    },
    '8gmfzjjx': {
      'en': '',
      'hi': '',
    },
    'uaqzykq5': {
      'en': '',
      'hi': '',
    },
    '9bm5abxh': {
      'en': '',
      'hi': '',
    },
    'mb3q85s8': {
      'en': '',
      'hi': '',
    },
    'kjnxuojq': {
      'en': '',
      'hi': '',
    },
    'q357pxvy': {
      'en': '',
      'hi': '',
    },
    'nfnhvkxm': {
      'en': '',
      'hi': '',
    },
    'rn0ykpv1': {
      'en': '',
      'hi': '',
    },
    'y5z1pjzn': {
      'en': '',
      'hi': '',
    },
    'tdkmgl6h': {
      'en': '',
      'hi': '',
    },
    'm7shlbvs': {
      'en': '',
      'hi': '',
    },
    '6dsqvzq4': {
      'en': '',
      'hi': '',
    },
    'zqghyupv': {
      'en': '',
      'hi': '',
    },
    'r5dlp1yu': {
      'en': '',
      'hi': '',
    },
    'k74mrd50': {
      'en': '',
      'hi': '',
    },
    'dgqmm4bb': {
      'en': '',
      'hi': '',
    },
    'kwiism4k': {
      'en': '',
      'hi': '',
    },
    'xbpa84zh': {
      'en': '',
      'hi': '',
    },
    '0h16y1j7': {
      'en': '',
      'hi': '',
    },
    'nvbt9z05': {
      'en': '',
      'hi': '',
    },
    '5cdq795p': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
