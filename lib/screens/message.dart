import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  static String tag = 'Message';

  @override
   State createState() => new MessageState();
}

class MessageState extends State<Message>{
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage> [];
void _handle(String text){
  _textController.clear();
  ChatMessage message =new ChatMessage(
    text: text,
  );
  setState(() {
    _message.insert(0, message);
  });
}
Widget _textComposerWidget(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: new  Container(
                  decoration: BoxDecoration(
                    
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.greenAccent,
                  ),
                
                 margin: const EdgeInsets.symmetric(horizontal: 8),
                 child: new Row(
                   children: <Widget>[
                     new Flexible(
                       child: Padding(
                         padding: const EdgeInsets.only(left: 10),
                         child: new TextField(
                           textInputAction: TextInputAction.send,
                           decoration: new InputDecoration.collapsed(
                             hintText: "Type Message"
                           ),
                           controller: _textController,
                           onSubmitted: _handle,
                         ),
                       )
                     ),
                       new Container(
                         margin: const EdgeInsets.symmetric(horizontal: 4),
                         child: new IconButton(
                           color: Colors.blue,
                           icon: Icon(Icons.send),
                           onPressed: (){
                             _handle(_textController.text);
                           },
                         ),
                       )
                   ],
                 ),
               ),
  );
}
  @override
      Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title:Text("Chat") ,
          
          ),
       body: new Column(
         children: <Widget>[
           new Flexible(
             child: new ListView.builder(
               padding: new EdgeInsets.all(8),
               reverse: true,
               itemBuilder: (_,int index)=> _message[index],
               itemCount: _message.length,
             ),
           ),
           new Divider(height: 1,),
           new Container(
             decoration:  new BoxDecoration(
               color: Theme.of(context).cardColor,
             ),
             child: _textComposerWidget(),
           )
         ],
       ),
            
         
        );
      
        }
        }
    class ChatMessage extends StatelessWidget {
    final String text;
   ChatMessage({this.text});
  @override
  Widget build(BuildContext context) {
    return new Container(
margin:  const EdgeInsets.symmetric(vertical: 10),
child: new Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(text)
      ],
    )
  ],
),
    );
  } 
    }