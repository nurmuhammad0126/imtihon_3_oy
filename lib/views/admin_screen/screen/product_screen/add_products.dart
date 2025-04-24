import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/category_model.dart';
import 'package:flutter_3_oy_imtixon/view_model/category_view_model.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/product_view_model/admin_product_viewmodel.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  String? selectedColor;
  String? selectedGender;
  String? selectedCategoryId;

  final List<String> genderOptions = ['Both', 'Men', 'Women'];
  final List<String> colorOptions = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Purple'
  ];

  List<CategoryModel> categories = [];
  bool isLoadingCategories = true; // Loading state for categories
  final CategoryViewModel _categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    getCategories(); 
  }

  Future<void> getCategories() async {
    try {
      final categoryList = await _categoryViewModel.getCategories();
      setState(() {
        categories = categoryList ?? [];
        isLoadingCategories = false;
      });
    } catch (e) {
      setState(() {
        isLoadingCategories = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                  controller: _nameController,
                  label: 'Product Name',
                  required: true),

              // Category Dropdown
              isLoadingCategories
                  ? Center(child: CircularProgressIndicator())
                  : categories.isEmpty
                      ? Text('No categories available')
                      : DropdownButtonFormField<String>(
                          value: selectedCategoryId,
                          decoration: InputDecoration(labelText: 'Category'),
                          items: categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category
                                  .name, 
                              child: Text(category.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategoryId = categories
                                  .firstWhere(
                                      (category) => category.name == value)
                                  .name;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Category is required';
                            }
                            return null;
                          },
                        ),
              _buildTextField(
                  controller: _imageController,
                  label: 'Image URL',
                  required: true),
              _buildTextField(
                  controller: _priceController,
                  label: 'Price',
                  required: true,
                  keyboardType: TextInputType.number),
              _buildTextField(
                  controller: _countController,
                  label: 'Stock Count',
                  required: true,
                  keyboardType: TextInputType.number),
              _buildTextField(
                  controller: _ratingController,
                  label: 'Rating',
                  required: true,
                  keyboardType: TextInputType.number),

              // Color Dropdown
              DropdownButtonFormField<String>(
                value: selectedColor,
                items: colorOptions.map((color) {
                  return DropdownMenuItem(value: color, child: Text(color));
                }).toList(),
                onChanged: (value) => setState(() => selectedColor = value),
                decoration: InputDecoration(labelText: 'Color (optional)'),
              ),
              SizedBox(height: 16),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: genderOptions.map((gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (value) => setState(() => selectedGender = value),
                decoration: InputDecoration(labelText: 'Gender (optional)'),
              ),
              SizedBox(height: 16),

              _buildTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  required: false),
              _buildTextField(
                  controller: _materialController,
                  label: 'Material',
                  required: false),
              _buildTextField(
                  controller: _sizeController, label: 'Size', required: false),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool required,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: required ? 'This field is required' : 'Optional',
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final image = _imageController.text.trim();
      final price = double.tryParse(_priceController.text.trim()) ?? 0.0;
      final count = int.tryParse(_countController.text.trim()) ?? 0;
      final rating = double.tryParse(_ratingController.text.trim()) ?? 0.0;
      final color = selectedColor ?? '';
      final gender = selectedGender ?? '';
      final description = _descriptionController.text.trim();
      final material = _materialController.text.trim();
      final size = _sizeController.text.trim();

      final specifications = {
        if (material.isNotEmpty) 'material': material,
        if (size.isNotEmpty) 'size': size,
      };


      await AdminProductViewmodel().addProduct(
        categoryId: selectedCategoryId ?? '', 
        name: name,
        image: image,
        price: price,
        color: color,
        gender: gender,
        count: count,
        rating: rating,
        description: description,
        specifications: specifications,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully!')),
      );

      // Clear form
      _formKey.currentState?.reset();
      _nameController.clear();
      _priceController.clear();
      _countController.clear();
      _imageController.clear();
      _descriptionController.clear();
      _materialController.clear();
      _sizeController.clear();
      _ratingController.clear();
      setState(() {
        selectedColor = null;
        selectedGender = null;
        selectedCategoryId = null;
      });
    }
  }
}
