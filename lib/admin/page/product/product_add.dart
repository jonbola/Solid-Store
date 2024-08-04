import 'package:flutter/material.dart';
import '../../../database/model/product.dart';
import '../../../database/helper/db_helper.dart';
import '../../../database/model/category.dart';

class ProductAdd extends StatefulWidget {
  final bool isUpdate;
  final ProductModel? productModel;
  final VoidCallback? onProductAdded;

  const ProductAdd({
    Key? key,
    this.isUpdate = false,
    this.productModel,
    this.onProductAdded,
  }) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockQuantityController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final DatabaseHelper _databaseService = DatabaseHelper();

  bool _isLoading = false;
  int? _selectedCategoryId;
  List<CategoryModel> _categories = [];

  String get titleText => widget.isUpdate ? "Update Product" : "Add New Product";

  Future<void> _fetchCategories() async {
    try {
      final categories = await _databaseService.getCategories();
      setState(() {
        _categories = categories;
        if (widget.isUpdate && widget.productModel != null) {
          _selectedCategoryId = widget.productModel!.categoryId;
        } else if (_categories.isNotEmpty) {
          _selectedCategoryId = _categories.first.categoryId;
        }
      });
    } catch (e) {
      print('Error fetching categories: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching categories: $e')),
      );
    }
  }

  Future<void> _onSaveOrUpdate() async {
    setState(() {
      _isLoading = true;
    });

    final name = _nameController.text.trim();
    final price = double.tryParse(_priceController.text.trim()) ?? 0.0;
    final stockQuantity = int.tryParse(_stockQuantityController.text.trim()) ?? 0;
    final img = _imgController.text.trim();
    final description = _descController.text.trim();

    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    if (name.isEmpty || img.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name and Image URL are required')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final product = ProductModel(
      productId: widget.productModel?.productId,
      productName: name,
      categoryId: _selectedCategoryId!,
      price: price,
      stockQuantity: stockQuantity,
      description: description,
      img: img,
    );

    try {
      if (widget.isUpdate) {
        await _databaseService.updateProduct(product);
      } else {
        await _databaseService.addProduct(product);
      }
      Navigator.pop(context, true); // Return success indicator
    } catch (e) {
      print('Error saving/updating product: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving/updating product: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate && widget.productModel != null) {
      _nameController.text = widget.productModel!.productName;
      _priceController.text = widget.productModel!.price.toString();
      _stockQuantityController.text = widget.productModel!.stockQuantity.toString();
      _imgController.text = widget.productModel!.img;
      _descController.text = widget.productModel!.description;
      _selectedCategoryId = widget.productModel!.categoryId;
    }
    _fetchCategories();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockQuantityController.dispose();
    _imgController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter product name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter price',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _stockQuantityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter stock quantity',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _imgController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter image URL',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<int>(
              value: _selectedCategoryId,
              items: _categories.map((category) {
                return DropdownMenuItem<int>(
                  value: category.categoryId,
                  child: Text(category.categoryName ?? 'Unnamed Category'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategoryId = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Category',
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _onSaveOrUpdate,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Save',
                        style: TextStyle(fontSize: 16.0),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
