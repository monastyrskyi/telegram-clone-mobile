import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_clone_mobile/business_logic/models/country.dart';
import 'package:telegram_clone_mobile/business_logic/view_models/choose_country.dart';
import 'package:telegram_clone_mobile/util/sticky_sliver.dart';

class CountryGroupListItem extends StatelessWidget {
  const CountryGroupListItem({
    Key? key,
    required this.countryGroup,
  }) : super(key: key);

  final CountryGroup countryGroup;

  @override
  Widget build(BuildContext context) {
    return StickySliver(
      overlapsContent: true,
      leading: _buildLeading(context),
      content: _buildContent(context),
    );
  }

  Widget _buildLeading(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 6.0),
        height: 50,
        width: 50,
        child: Center(
          child: Text(
            countryGroup.group,
            style: TextStyle(
              color: theme.textTheme.headline3!.color,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);

    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          for (var country in countryGroup.countries)
            Container(
              height: 50,
              child: InkWell(
                onTap: () {
                  context.read<ChooseCountryProvider>().selectCountry(country);
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 72, right: 36),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          country.name,
                          style: TextStyle(
                            color: theme.textTheme.headline1!.color,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        '+${country.code}',
                        style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
