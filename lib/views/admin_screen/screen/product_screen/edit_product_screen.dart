import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/product_view_model/admin_product_viewmodel.dart';

class EditProductScreen extends StatefulWidget {
  final String productId;
  final String categoryId;

  const EditProductScreen({
    required this.productId,
    required this.categoryId,
    super.key,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();

  String? selectedColor;
  String? selectedGender;

  final List<String> genderOptions = ['Both', 'Men', 'Women'];
  final List<String> colorOptions = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Purple'
  ];

  bool _isLoading = true;
  Map<String, dynamic>? product;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final loadedProduct =
        await AdminProductViewmodel().getProduct(widget.productId);
    if (loadedProduct != null) {
      setState(() {
        product = loadedProduct;
        _nameController.text = loadedProduct['name'] ?? '';
        _imageController.text = loadedProduct['image'] ?? '';
        _priceController.text = loadedProduct['price'].toString();
        _countController.text = loadedProduct['count']?.toString() ?? '';
        _ratingController.text = loadedProduct['rating']?.toString() ?? '';
        final String? productColor = loadedProduct['color'];
        final String? productGender = loadedProduct['gender'];

        selectedColor =
            colorOptions.contains(productColor) ? productColor : null;
        selectedGender =
            genderOptions.contains(productGender) ? productGender : null;
        _descriptionController.text = loadedProduct['description'] ?? '';
        _materialController.text =
            loadedProduct['specifications']?['material'] ?? '';
        _sizeController.text = loadedProduct['specifications']?['size'] ?? '';
        _isLoading = false;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final specifications = <String, dynamic>{};
      if (_materialController.text.isNotEmpty) {
        specifications['material'] = _materialController.text.trim();
      }
      if (_sizeController.text.isNotEmpty) {
        specifications['size'] = _sizeController.text.trim();
      }

      await AdminProductViewmodel().editProduct(
        productId: widget.productId,
        categoryId: widget.categoryId,
        name: _nameController.text.trim(),
        image: _imageController.text.trim(),
        price: double.tryParse(_priceController.text.trim()) ?? 0.0,
        color: selectedColor ?? '',
        gender: selectedGender ?? '',
        count: int.tryParse(_countController.text.trim()) ?? 0,
        rating: double.tryParse(_ratingController.text.trim()) ?? 0.0,
        description: _descriptionController.text.trim(),
        specifications: specifications,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product updated successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_nameController, 'Name', true),
              _buildTextField(_imageController, 'Image URL', true),
              _buildTextField(_priceController, 'Price', true,
                  type: TextInputType.number),
              _buildTextField(_countController, 'Stock Count', false,
                  type: TextInputType.number),
              _buildTextField(_ratingController, 'Rating', false,
                  type: TextInputType.number),

              // Color Dropdown
              DropdownButtonFormField<String>(
                value: selectedColor,
                items: colorOptions.map((color) {
                  return DropdownMenuItem(value: color, child: Text(color));
                }).toList(),
                onChanged: (value) => setState(() => selectedColor = value),
                decoration: InputDecoration(labelText: 'Color'),
              ),
              SizedBox(height: 16),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: genderOptions.map((gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (value) => setState(() => selectedGender = value),
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 16),

              _buildTextField(_descriptionController, 'Description', false),
              _buildTextField(_materialController, 'Material', false),
              _buildTextField(_sizeController, 'Size', false),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _submitForm, child: Text('Update Product')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, bool isRequired,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          if (isRequired && (value == null || value.trim().isEmpty)) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }
}
