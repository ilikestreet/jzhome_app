import 'package:jzhome_app/model/card_items.dart';
import 'package:jzhome_app/actions/item_action.dart';

List<CartItem> cartItemsReducer(
    List<CartItem> items, dynamic action) {
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return new List.from(items)..add(action.item);
}
