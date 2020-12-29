import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/category.dart';
import 'package:Demo/widgets/categoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_list_manager/flutter_bloc_list_manager.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

// Data, state, and event classes.

// Base data class that will be supplied by the source bloc.

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



// Render an input that will funnel the value into the SearchQueryCubit.
class SearchInput extends StatelessWidget {
  @override
  Widget build(_) {
    return BlocBuilder<SearchQueryCubit, String>(
      builder: (context, state) {
        return Flexible(
          child: TextField(
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              labelText: 'Search',
            ),
            textInputAction: TextInputAction.search,
            onChanged: (value) =>
                context.bloc<SearchQueryCubit>().setQuery(value),
          ),
        );
      },
    );
  }
}

// Render an icon button that will launch the filter conditions UI sheet
// into the current scaffold.
class FilterConditionsLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => FilterConditionsSheet(
            filterConditionsBloc: context.bloc<FilterConditionsBloc>(),
          ),
          elevation: 1,
        );
      },
    );
  }
}

// Hooks into the `FilterConditionsBloc` in order to render the filtering UI.
class FilterConditionsSheet extends StatelessWidget {
  // You must pass the FilterConditionsBloc to this widget, as the build
  // context will now belong to the Scaffold rendering the bottom sheet.
  final FilterConditionsBloc _filterConditionsBloc;

  const FilterConditionsSheet({@required filterConditionsBloc})
      : assert(filterConditionsBloc != null),
        _filterConditionsBloc = filterConditionsBloc;

  // Helper to avoid duplication in the child components and to avoid
  // having to pass the bloc down another level.
  // Handles toggling property/value pair in the filter conditions bloc.
  void _updateCondition(String property, String value, bool isChecked) {
    isChecked
        ? _filterConditionsBloc.add(AddCondition(
      property: property,
      value: value,
    ))
        : _filterConditionsBloc.add(RemoveCondition(
      property: property,
      value: value,
    ));
  }

  bool _isOptionActive(String property, String value) {
    return _filterConditionsBloc.isConditionActive(property, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BlocBuilder<FilterConditionsBloc, FilterConditionsState>(
        cubit: _filterConditionsBloc,
        builder: (_, state) {
          if (state is ConditionsInitialized) {
            // This could be further optimized by removing
            // the `FilterConditionGroup` all together and conditionally
            // rendering title or option rows.
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.availableConditions.length,
              itemBuilder: (_, index) {
                final condition =
                state.availableConditions.entries.elementAt(index);
                return FilterConditionGroup(
                  condition: condition,
                  isOptionActive: _isOptionActive,
                  updateCondition: _updateCondition,
                );
              },
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// As we've built a UI around filtering, we need display-friendly
// labels for the underlying property names.
// This could easily be provided statically by the base item class instead.
const _filterPropertyLabelMap = {
  'author': 'Author',
  'category': 'Category',
  'isPublished': 'Published',
};

// Essentially just a pass-through widget to simplify the rendering
// of each condition group.
class FilterConditionGroup extends StatelessWidget {
  final MapEntry<String, List<String>> condition;
  final Function(String property, String value) isOptionActive;
  final Function updateCondition;

  FilterConditionGroup({
    Key key,
    @required this.condition,
    @required this.isOptionActive,
    @required this.updateCondition,
  }) : super(key: key);

  @override
  Widget build(_) {
    return Container(
      key: ValueKey(condition.key),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _filterPropertyLabelMap[condition.key],
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ...condition.value.map(
                (option) => CheckboxListTile(
              key: ValueKey(option),
              title: Text(option),
              value: isOptionActive(condition.key, option),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (isChecked) =>
                  updateCondition(condition.key, option, isChecked),
            ),
          ),
        ],
      ),
    );
  }
}

// Hooks into the state from the `ItemListBloc` and renders the list
// portion of the UI.
class ItemListRenderer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      builder: (_, state) {
        if (state is NoSourceItems) {
          return Text('No source items');
        }

        if (state is ItemEmptyState) {
          return Text('No matching results');
        }

        if (state is ItemResults<JournalEntry>) {
          return ListView(
            children: state.items
                .map(
                  (entry) => ListTile(
                key: ValueKey(entry.id),
                title: Text(entry.title),
                subtitle: Text(entry.description),
              ),
            )
                .toList(),
          );
        }
        return Container();
      },
    );
  }
}
class foodDetailsPage extends StatefulWidget {
  @override
  _foodDetailsPageState createState() => _foodDetailsPageState();
}

class _foodDetailsPageState extends State<foodDetailsPage> {
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {

    return BlocProvider<JournalEntryBloc>(
      create: (_) => JournalEntryBloc()..add(_journalEntryEvent.load),
      child:  Scaffold(
          appBar:customAppBar(),
          body: ListManager<JournalEntry, Loaded, JournalEntryBloc>(
            filterProperties: ['author', 'category', 'isPublished'],
            searchProperties: ['content', 'description', 'title'],
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                filterSection(),
                SizedBox(height: 20,),
                horizontalList(),
                SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchInput(),
                    FilterConditionsLauncher(),
                  ],
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: ItemListRenderer(),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget customAppBar(){
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title:GestureDetector(
        onTap: () =>moveToSearchPlacePage() ,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                getTranslated(context,'deleverTo'),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.normal,
                    color:Colors.grey,fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                  getTranslated(context,'selectPlace'),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.normal,
                        color:Colors.deepOrange,fontSize: 14),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.deepOrange,
                  ),

                ],
              ),
            ]),
      ),
    );
  }
  Widget filterSection(){
    Map<int, Widget> _children = {
      0: RichText(textAlign:TextAlign.center,text: TextSpan(
        children: [
          WidgetSpan(child: Icon(Icons.filter_list_outlined, size: 14,color: Colors.black,),),
          TextSpan(text: " "),
          TextSpan(text: getTranslated(context, "filter"),style: TextStyle(fontSize: 10,color: Colors.black),),
        ],),),
      1:RichText(textAlign:TextAlign.center,text: TextSpan(
        children: [
          WidgetSpan(child: Icon(Icons.merge_type, size: 14,color: Colors.black,),),
          TextSpan(text: " "),
          TextSpan(text: getTranslated(context, "cuisines"),style: TextStyle(fontSize: 10,color: Colors.black),),
        ],),),
      2: RichText(textAlign:TextAlign.center,text: TextSpan(
        children: [
          WidgetSpan(child: Icon(Icons.search, size: 14,color: Colors.black,),),
          TextSpan(text: " "),
          TextSpan(text: getTranslated(context, "search"),style: TextStyle(fontSize: 10,color: Colors.black),),
        ],),),
    };
    return  Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            child: MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: Colors.white,
              unselectedColor: Colors.white,
              borderRadius: 5.0,
              onSegmentChosen: (index) {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return FilterConditionsSheet(
                        filterConditionsBloc: context.bloc<FilterConditionsBloc>(),
                      );
                        Container(
                        height: MediaQuery.of(context).size.height  * 0.4,
                        child: Center(
                          child: Text("Welcome to AndroidVille!"),
                        ),
                      );
                    });
              },
  ),
          ),
        ),
      ],
    );}
  Widget horizontalList(){
    return Container(
      height: 100,
      color: Colors.transparent,
      child: AnimationLimiter(
        child:ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categoryItemList.CategoryItems.length,
          separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey,),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: cart(index),
                ),
              ),
            );
          },
        ),
      ),
    );

  }
  Widget cart(int index) {
    return categoryWidget(categoryItem:categoryItemList.CategoryItems[index]);
  }
  moveToSearchPlacePage() {}
}

class filterationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (_) =>
          FilterConditionsSheet(
            filterConditionsBloc: context.bloc<FilterConditionsBloc>(),
          ),
      elevation: 1,
    );
  }
}