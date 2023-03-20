import 'package:flutter/material.dart';


class Advice extends StatefulWidget {
  const Advice({Key? key}) : super(key: key);

  @override
  State<Advice> createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).splashColor,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).secondaryHeaderColor,
            size: 28,
          ),
        ),
        title: Text(
          'Advices',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('asset/Images/b.png'), opacity: 0.3),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    ' يجب الالتزام بالرضاعه الطبيعية او الحليب الصناعي ..',
                    maxLines: 9,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          itemCount: 100,
        ),
      ),
    );
  }
}
