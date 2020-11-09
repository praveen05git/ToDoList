import 'package:flutter/material.dart';
import 'package:flutter_plugin/models/category.dart';
import 'package:flutter_plugin/pages/homePage.dart';
import 'package:flutter_plugin/services/category_service.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var _categoryNameController = TextEditingController();
  var _categoryDescController = TextEditingController();
  var _category = Category();
  var _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  List<Category> _categoryList = List<Category>();

  getAllCategories() async {
    _categoryList = List<Category>();
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['NAME'];
        categoryModel.description = category['DESCRIPTION'];
        categoryModel.id = category['ID'];
        _categoryList.add(categoryModel);
      });
    });
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                  onPressed: () async {
                    _category.name = _categoryNameController.text;
                    _category.description = _categoryDescController.text;
                    var result = await _categoryService.saveCategory(_category);
                    print(result);
                  },
                  child: Text('Save')),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              )
            ],
            title: Text('Categories'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(labelText: 'Enter Categories'),
                  ),
                  TextField(
                    controller: _categoryDescController,
                    decoration: InputDecoration(hintText: 'Description'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage())),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
          elevation: 0.0,
        ),
        title: Text('Categories'),
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0),
              child: Card(
                child: ListTile(
                  leading: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_categoryList[index].name),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  //subtitle: Text(_categoryList[index].description),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
