import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 13.999,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movie',
      amount: 5.6,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openAddExpenseOverlay() {
    showModalBottomSheet(
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: deviceWidth < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
