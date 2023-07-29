import 'package:flutter/material.dart';
import './labeled_container.dart';

class FlexScreen extends StatelessWidget {
  const FlexScreen({super.key});

  Iterable<Widget> _header(BuildContext context, String text) {
    return [
      SizedBox(
        height: 20,
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      )
    ];
  }

  Widget _buildExpanded(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: LabeledContainer(
                color: Colors.deepOrange,
                text: 'The Remainder',
                textColor: Colors.white,
              )),
          Expanded(
              flex: 1,
              child: LabeledContainer(
                color: Colors.deepOrange,
                text: 'The Remainder',
                textColor: Colors.white,
              )),
          // LabeledContainer(width: 100, color: Colors.green, text: '100'),
          Expanded(
              flex: 2,
              child: LabeledContainer(
                color: Colors.purple,
                text: 'The Remainder',
                textColor: Colors.white,
              )),
          // LabeledContainer(
          //   width: 40,
          //   color: Colors.green,
          //   text: '40',
          // )
        ],
      ),
    );
  }

  Widget _buildFlexible(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          // Text('1000000000000'),
          Flexible(
            // fit: FlexFit,
              flex: 1,
              child: LabeledContainer(
                color: Colors.deepOrange,
                text: '25%',
              )),
          Flexible(
              flex: 1,
              child: LabeledContainer(
                color: Colors.deepOrange,
                text: '25%',
              )),

          // Flexible(
          //     flex: 2,
          //     child: LabeledContainer(
          //       color: Colors.blue,
          //       text: '50%',
          //     ))
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            'Pinned to the Bottom',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded and Flexible'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._header(context, 'Expanded'),
          _buildExpanded(context),
          ..._header(context, 'Flexible'),
          _buildFlexible(context)
        ],
      ),
    );
  }
}
