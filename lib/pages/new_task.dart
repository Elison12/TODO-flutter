import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: TextField(
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "O que você está planejando ?",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(14))),
            )),
            Container(
              child: TextButton(onPressed: () {
                DatePicker.showDatePicker(context, showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2022, 12, 12), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.pt);
              }, child: const Text("Conclusão")),
            ),
            Container(child: TextField(
              decoration: InputDecoration(hintText: "Titulo", border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),)
          ],
        ),
      ),
    );
  }
}