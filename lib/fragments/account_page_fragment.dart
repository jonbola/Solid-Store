import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:flutter/material.dart';

class AccountPageFragment extends StatefulWidget {
  final bool isLogin;
  const AccountPageFragment(this.isLogin, {super.key});

  @override
  State<AccountPageFragment> createState() => _AccountPageFragmentState();
}

class _AccountPageFragmentState extends State<AccountPageFragment> {
  late bool isEnabled;
  late List<String> countryList;
  late List<String> genderList;
  @override
  void initState() {
    super.initState();
    isEnabled = false;
    genderList = <String>['Nam', 'Nữ', 'Khác'];
    countryList = <String>[
      'Afghanistan',
      'Albania',
      'Algeria',
      'Andorra',
      'Angola',
      'Antigua and Barbuda',
      'Argentina',
      'Armenia',
      'Australia',
      'Austria',
      'Azerbaijan',
      'The Bahamas',
      'Bahrain',
      'Bangladesh',
      'Barbados',
      'Belarus',
      'Belgium',
      'Belize',
      'Benin',
      'Bhutan',
      'Bolivia',
      'Bosnia and Herzegovina',
      'Botswana',
      'Brazil',
      'Brunei',
      'Bulgaria',
      'Burkina Faso',
      'Burundi',
      'Cabo Verde',
      'Cambodia',
      'Cameroon',
      'Canada',
      'Central African Republic',
      'Chad',
      'Chile',
      'China',
      'Colombia',
      'Comoros',
      'Congo',
      'Democratic Republic of the',
      'Congo',
      'Republic of the',
      'Costa Rica',
      'Côte d Ivoire',
      'Croatia',
      'Cuba',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Djibouti',
      'Dominica',
      'Dominican Republic',
      'East Timor (Timor-Leste)',
      'Ecuador',
      'Egypt',
      'El Salvador',
      'Equatorial Guinea',
      'Eritrea',
      'Estonia',
      'Eswatini',
      'Ethiopia',
      'Fiji',
      'Finland',
      'France',
      'Gabon',
      'The Gambia',
      'Georgia',
      'Germany',
      'Ghana',
      'Greece',
      'Grenada',
      'Guatemala',
      'Guinea',
      'Guinea-Bissau',
      'Guyana',
      'Haiti',
      'Honduras',
      'Hungary',
      'Iceland',
      'India',
      'Indonesia',
      'Iran',
      'Iraq',
      'Ireland',
      'Israel',
      'Italy',
      'Jamaica',
      'Japan',
      'Jordan',
      'Kazakhstan',
      'Kenya',
      'Kiribati',
      'Korea',
      'North',
      'Korea',
      'South',
      'Kosovo',
      'Kuwait',
      'Kyrgyzstan',
      'Laos',
      'Latvia',
      'Lebanon',
      'Lesotho',
      'Liberia',
      'Libya',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Madagascar',
      'Malawi',
      'Malaysia',
      'Maldives',
      'Mali',
      'Malta',
      'Marshall Islands',
      'Mauritania',
      'Mauritius',
      'Mexico',
      'Micronesia',
      'Federated States of',
      'Moldova',
      'Monaco',
      'Mongolia',
      'Montenegro',
      'Morocco',
      'Mozambique',
      'Myanmar',
      'Namibia',
      'Nauru',
      'Nepal',
      'Netherlands',
      'New Zealand',
      'Nicaragua',
      'Niger',
      'Nigeria',
      'North Macedonia',
      'Norway',
      'Oman',
      'Pakistan',
      'Palau',
      'Panama',
      'Papua New Guinea',
      'Paraguay',
      'Peru',
      'Philippines',
      'Poland',
      'Portugal',
      'Qatar',
      'Romania',
      'Russia',
      'Rwanda',
      'Saint Kitts and Nevis',
      'Saint Lucia',
      'Saint Vincent and the Grenadines',
      'Samoa',
      'San Marino',
      'Sao Tome and Principe',
      'Saudi Arabia',
      'Senegal',
      'Serbia',
      'Seychelles',
      'Sierra Leone',
      'Singapore',
      'Slovakia',
      'Slovenia',
      'Solomon Islands',
      'Somalia',
      'South Africa',
      'Spain',
      'Sri Lanka',
      'Sudan',
      'Sudan',
      'South',
      'Suriname',
      'Sweden',
      'Switzerland',
      'Syria',
      'Taiwan',
      'Tajikistan',
      'Tanzania',
      'Thailand',
      'Togo',
      'Tonga',
      'Trinidad and Tobago',
      'Tunisia',
      'Turkey',
      'Turkmenistan',
      'Tuvalu',
      'Uganda',
      'Ukraine',
      'United Arab Emirates',
      'United Kingdom',
      'United States',
      'Uruguay',
      'Uzbekistan',
      'Vanuatu',
      'Vatican City',
      'Venezuela',
      'Vietnam',
      'Yemen',
      'Zambia',
      'Zimbabwe'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.isLogin
          ? Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: Visibility(
                        visible: isEnabled,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isEnabled = false;
                            });
                          },
                          icon: Image.asset('resources/icons/ic_cancel.png'),
                        )),
                    title: Container(
                      margin: const EdgeInsets.only(left: 80.0),
                      child: const Text(
                        'ACCOUNT',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    actions: <Widget>[
                      Visibility(
                        visible: isEnabled,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isEnabled = false;
                            });
                          },
                          icon: Image.asset('resources/icons/ic_check.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 170.0,
                            height: 170.0,
                            child: IconButton(
                              onPressed: null,
                              icon:
                                  Image.asset('resources/images/img_logo.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                CustomTextField(isEnabled, 'Tên tài khoản'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomTextField(isEnabled, 'Email'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35.0),
                        child: Row(
                          children: [
                            CustomTextField(isEnabled, 'Tên'),
                            const SizedBox(
                              width: 50.0,
                            ),
                            CustomTextField(isEnabled, 'Họ'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35.0),
                        child: Row(
                          children: [
                            CustomDropdownButton(
                                isEnabled, genderList, 120.0, 'Giới tính'),
                            const SizedBox(
                              width: 20.0,
                            ),
                            CustomDropdownButton(
                                isEnabled, countryList, 200.0, 'Quốc tịch'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: TextButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                          ),
                          onPressed: () {
                            setState(() {
                              isEnabled = true;
                            });
                          },
                          child: const Text(
                            'Thay đổi thông tin',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: TextButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage(false)),
                            );
                          },
                          child: const Text(
                            'Đăng xuất',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Scaffold(
              body: Container(
                margin: const EdgeInsets.only(left: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Đăng nhập để tiếp tục sử dụng',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  final bool isEnabled;
  final List<String> list;
  final double widthMenu;
  final String labelDropDownMenu;
  const CustomDropdownButton(
      this.isEnabled, this.list, this.widthMenu, this.labelDropDownMenu,
      {super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropdownButton> {
  String dropDownValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(widget.labelDropDownMenu),
        ),
        DropdownMenu<String>(
          enabled: widget.isEnabled,
          width: widget.widthMenu,
          initialSelection: widget.list.first,
          onSelected: (String? value) {
            setState(
              () {
                dropDownValue = value!;
              },
            );
          },
          dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>(
            (String value) {
              return DropdownMenuEntry(value: value, label: value);
            },
          ).toList(),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelTextField;
  final bool isEnabled;
  const CustomTextField(this.isEnabled, this.labelTextField, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelTextField,
            ),
          ),
          TextField(
            enabled: isEnabled,
            decoration: InputDecoration(
              hintText: labelTextField,
            ),
          ),
        ],
      ),
    );
  }
}
