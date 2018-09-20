class CartItem {
  String ip;
  bool checked;

  CartItem(this.ip, this.checked);

  @override
  String toString() {
    return "$ip: $checked";
  }
}
