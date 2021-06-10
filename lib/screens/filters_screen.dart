import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersSCreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersSCreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersSCreenState createState() => _FiltersSCreenState();
}

class _FiltersSCreenState extends State<FiltersSCreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    // _glutenfree = widget.currentFilters['gluten'];
    // _vegetarian = widget.currentFilters['vegeterian'];
    // _vegan = widget.currentFilters['vegan'];
    // _lactoseFree = widget.currentFilters['lactoseFree'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
      value: currentValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter settings'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactoseFree,
                  'vegeterian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenfree, (bool newValue) {
                  setState(() {
                    _glutenfree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian-free',
                    'Only include vegetarian-free meals',
                    _vegetarian, (bool newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan-free', 'Only include vegan-free meals', _vegan,
                    (bool newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'LactoseFree-free',
                    'Only include lactoseFree-free meals',
                    _lactoseFree, (bool newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
