import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    super.initState();

    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
  }


  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentVal, Function update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentVal,
      onChanged: update,
    );
  }

  Map<String, bool> get filtersMap{
    return {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.saveFilters(filtersMap),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten-free',
                      'Only include gluten-free meals.', _glutenFree, (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian',
                      'Only include vegetarian meals.', _vegetarian, (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include vegan meals.', _vegan, (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-free',
                      'Only include Lactose-free meals.',
                      _lactoseFree, (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
