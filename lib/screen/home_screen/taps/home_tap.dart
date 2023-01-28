import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({Key? key}) : super(key: key);

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:30 ,top: 10, bottom: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 95,
                  height: 50,
                  child: TextFormField(
                    readOnly: true,
                    onTap: (){},
                    decoration: InputDecoration(
                      hintText: "What's on your mind ?",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            padding:EdgeInsets.symmetric(horizontal: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: Colors.grey)),
              child: Container(

                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Manal Hemida',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text('Nov 13,2022'),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Text('11:41 PM'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'ربي اني مسني الضر وانت ارحم الراحمين',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.favorite_border_outlined),
                            const Text('50'),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: 2,
                            height: 25,
                            decoration:
                            const BoxDecoration(color: Colors.grey),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.mode_comment_outlined),
                            const Text('7'),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: 2,
                            height: 25,
                            decoration:
                            const BoxDecoration(color: Colors.grey),
                          ),
                        ),
                        const Icon(Icons.save),
                      ],
                    )
                  ],
                ),
              ),
            ),
            itemCount: 100,
          ),
        ],
      ),
    );
  }
}
