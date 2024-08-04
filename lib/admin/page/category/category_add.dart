import 'package:flutter/material.dart';
import '../../../database/helper/db_helper.dart';
import '../../../database/model/category.dart';

class CategoryAdd extends StatefulWidget {
  final bool isUpdate;
  final CategoryModel? categoryModel;

  const CategoryAdd({Key? key, this.isUpdate = false, this.categoryModel}) : super(key: key);

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final TextEditingController _nameController = TextEditingController();
  final DatabaseHelper _databaseService = DatabaseHelper();

  Future<void> _onSave() async {
    final name = _nameController.text;

    if (name.isNotEmpty) {
      await _databaseService.insertCategory(
        CategoryModel(categoryName: name),
      );

      setState(() {});
      Navigator.pop(context);
    }
  }

  Future<void> _onUpdate() async {
    final name = _nameController.text;

    if (name.isNotEmpty) {
      await _databaseService.updateCategory(
        CategoryModel(categoryId: widget.categoryModel!.categoryId, categoryName: name),
      );

      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.categoryModel != null && widget.isUpdate) {
      _nameController.text = widget.categoryModel!.categoryName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? "Update Category" : "Add New Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter category name',
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {
                  widget.isUpdate ? _onUpdate() : _onSave();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
