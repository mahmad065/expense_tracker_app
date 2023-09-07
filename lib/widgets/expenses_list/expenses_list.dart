import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenses,
    required this.onRemoveExpense,
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
