import 'package:flutter/material.dart';
import 'package:synlink_app/theme.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('Recent', style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact('Himanshu', context),
                _buildRecentContact('Younus', context),
                _buildRecentContact('Ankit', context),
                _buildRecentContact('Anshika', context),
                _buildRecentContact('Shrestha', context),
                _buildRecentContact('Jai', context),
                _buildRecentContact('Aryaman', context),
              ],
            ),
          ),

          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  _buildMessageTile(
                    'Himanshu',
                    'Hey, how are you?',
                    '10:30 AM',
                    context,
                  ),
                  _buildMessageTile(
                    'Younus',
                    'Are you coming to the party?',
                    '9:45 AM',
                    context,
                  ),
                  _buildMessageTile(
                    'Ankit',
                    'Let\'s catch up sometime.',
                    '8:15 AM',
                    context,
                  ),
                  _buildMessageTile(
                    'Anshika',
                    'Can you send me the report?',
                    '7:00 AM',
                    context,
                  ),
                  _buildMessageTile(
                    'Shrestha',
                    'Good morning!',
                    '6:30 AM',
                    context,
                  ),
                  _buildMessageTile('Jai', 'What\'s up?', '5:00 AM', context),
                  _buildMessageTile(
                    'Aryaman',
                    'Did you finish the project?',
                    '4:45 AM',
                    context,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMessageTile(
  String name,
  String message,
  String time,
  BuildContext context,
) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage('https://example.com/image.jpg'),
    ),
    title: Text(name, style: Theme.of(context).textTheme.bodyLarge),
    subtitle: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    ),
    trailing: Text(time, style: Theme.of(context).textTheme.bodySmall),
  );
}

Widget _buildRecentContact(String name, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://example.com/image.jpg'),
        ),
        SizedBox(height: 5),
        Text(name, style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}
