import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/recruit/recruit_controller.dart';

class RecruitEdit extends StatelessWidget {
  const RecruitEdit(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.help,
      required this.isMust,
      required this.validator,
      this.maxLines,
      this.maxWord});

  final String title;
  final String hint;
  final String? help;
  final bool isMust;
  final int? maxLines;
  final int? maxWord;
  final String? Function(String) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.onSurface,
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              if (isMust)
                const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red, fontSize: 20)),
              TextSpan(
                text: title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ])),
            SizedBox(
              height: help == null ? 0 : 15,
            ),
            help == null
                ? const SizedBox(
                    height: 15,
                  )
                : Text(
                    help!,
                    style: const TextStyle(color: Colors.grey),
                  ),
            SizedBox(
              height: help == null ? 0 : 15,
            ),
            TextFormField(
              validator: (v) {
                return validator(v!.trim());
              },
              controller: controller,
              maxLines: maxLines,
              maxLength: maxWord,
              decoration: InputDecoration(
                labelText: hint,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecruitSelect extends StatefulWidget {
  const RecruitSelect(
      {super.key,
      required this.title,
      this.help,
      required this.isMust,
      required this.boolOrString,
      required this.selectContent});

  final String title;
  final String? help;
  final int boolOrString;
  final List<String> selectContent;
  final bool isMust;

  @override
  State<RecruitSelect> createState() => _RecruitSelectState();
}

class _RecruitSelectState extends State<RecruitSelect> {
  RecruitController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.onSurface,
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              if (widget.isMust)
                const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red, fontSize: 20)),
              TextSpan(
                text: widget.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ])),
            SizedBox(
              height: widget.help == null ? 0 : 15,
            ),
            widget.help == null
                ? const SizedBox(
                    height: 0,
                  )
                : Text(
                    widget.help!,
                    style: const TextStyle(color: Colors.grey),
                  ),
            SizedBox(
              height: widget.help == null ? 0 : 15,
            ),
            ...widget.selectContent.map<RadioListTile>((e) {
              return RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue:
                      widget.boolOrString == 0 ? c.isManager : c.learnDirection,
                  onChanged: (value) {
                    setState(() {
                      if (widget.boolOrString == 0) {
                        c.isManager = value!;
                      } else {
                        c.learnDirection = value!;
                      }
                    });
                  });
            }),
          ],
        ),
      ),
    );
  }
}
