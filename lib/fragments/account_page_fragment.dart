import 'package:flutter/material.dart';

const List<String> countryList = <String>[
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
const List<String> genderList = <String>['Nam', 'Nữ', 'Khác'];

class AccountPageFragment extends StatelessWidget {
  const AccountPageFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          margin: const EdgeInsets.only(
            top: 50.0,
          ),
          child: const Center(
            child: Text(
              'ACCOUNT',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: Image.asset('resources/images/img_logo.png'),
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      const Column(
                        children: <Widget>[
                          CustomTextField('Tên tài khoản'),
                          SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField('Email'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Row(
                    children: <Widget>[
                      CustomTextField('Tên'),
                      SizedBox(
                        width: 50.0,
                      ),
                      CustomTextField('Họ'),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Row(
                    children: [
                      MyDropDownButton(genderList, 100.0,'Giới tính'),
                      SizedBox(
                        width: 20.0,
                      ),
                      MyDropDownButton(countryList, 200.0, 'Quốc tịch'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyDropDownButton extends StatefulWidget {
  final List<String> list;
  final double widthMenu;
  final String labelDropDownMenu;
  const MyDropDownButton(this.list, this.widthMenu, this.labelDropDownMenu,
      {super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String dropDownValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.labelDropDownMenu),
          ),
          DropdownMenu<String>(
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
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String labelTextField;
  const CustomTextField(this.labelTextField, {super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.labelTextField,
            ),
          ),
          TextField(
            decoration: InputDecoration(hintText: widget.labelTextField),
          ),
        ],
      ),
    );
  }
}
