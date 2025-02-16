class Validators {
  static String? validateNotEmpty(String? value) {
    return (value == null || value.isEmpty)
        ? "Field ini tidak boleh kosong"
        : null;
  }
}
