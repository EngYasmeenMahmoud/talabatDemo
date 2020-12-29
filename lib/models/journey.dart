import 'package:flutter/material.dart';
import 'package:flutter_bloc_list_manager/flutter_bloc_list_manager.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class JournalEntry extends Equatable implements ItemClassWithAccessor {
  final String author;
  final String category;
  final String content;
  final String description;
  final String id;
  final String title;
  final bool isPublished;

  const JournalEntry({
    this.author,
    this.category,
    this.content,
    this.description,
    this.id,
    this.title,
    this.isPublished,
  });

  // Every prop intended to be used in a filtering or sorting operation
  // should be included in this operator overload.
  dynamic operator [](String prop) {
    switch (prop) {
      case 'author':
        return author;
        break;
      case 'category':
        return category;
        break;
      case 'content':
        return content;
        break;
      case 'description':
        return description;
        break;
      case 'title':
        return title;
        break;
      case 'isPublished':
        return isPublished;
        break;
      default:
        throw ArgumentError('Property `$prop` does not exist on JournalEntry.');
    }
  }

  @override
  List<Object> get props =>
      [author, content, description, id, title, isPublished];
}

// The base state for the source bloc.
abstract class JournalEntryState extends Equatable {
  const JournalEntryState();
}

// State of the source bloc where items have not yet been loaded.
class Loading extends JournalEntryState {
  @override
  List<Object> get props => ['Loading'];
}

// State of the source bloc that indicates items have been loaded
// and are ready for further processing.
class Loaded extends JournalEntryState implements ItemSourceState<JournalEntry> {
  final List<JournalEntry> items;

  const Loaded(this.items);

  @override
  List<Object> get props => [items];
}

// Just a stub event for example purposes.
// Your actual source bloc would have more logic.
enum _journalEntryEvent { load }

class JournalEntryBloc extends Bloc<_journalEntryEvent, JournalEntryState> {
  JournalEntryBloc() : super(Loading());

  @override
  Stream<JournalEntryState> mapEventToState(_journalEntryEvent event,) async* {
    if (event == _journalEntryEvent.load) {
      // Stub data for the example, you would likely be using some sort
      // of repository here to fetch your data.
      yield Loaded([
        JournalEntry(
          author: 'Author 1',
          category: 'Category 1',
          content: 'Content 1',
          description: 'Description 1',
          id: '1',
          title: 'Title 1',
          isPublished: true,
        ),
        JournalEntry(
          author: 'Author 2',
          category: 'Category 2',
          content: 'Content 2',
          description: 'Description 2',
          id: '2',
          title: 'Title 2',
          isPublished: false,
        ),
        JournalEntry(
          author: 'Author 3',
          category: 'Category 3',
          content: 'Content 3',
          description: 'Description 3',
          id: '3',
          title: 'Title 3',
          isPublished: true,
        )
      ]);
    }
  }
}
