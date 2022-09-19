import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10.0,
          margin: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const Image(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/beautiful-young-brunette-woman-with-pleasant-appearance-tender-smile_273609-18319.jpg?w=996&t=st=1663559798~exp=1663560398~hmac=08a5c5360441701d6ae92f99cfbd630d5603e1dcb5399a702ae2a826555b193a',
                ),
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'communicate with friends',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-dark-skinned-cheerful-woman-with-curly-hair-touches-chin-gently-laughs-happily-enjoys-day-off-feels-happy-enthusiastic-hears-something-positive-wears-casual-blue-turtleneck_273609-43443.jpg?w=996&t=st=1663560966~exp=1663561566~hmac=2a2a63fb4fd72117248905b2205e6c1b48e26b6540b39c39bc33b63284bcba37',
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Emma Stone',
                                style: TextStyle(
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 16.0,
                              ),
                            ],
                          ),
                          Text(
                            'January 21, 2022 at 11:00 pm',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      height: 1.4,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                          ),
                          iconSize: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et mollis metus. Nam non finibus nulla, id accumsan leo. Fusce quis massa cursus, mattis mauris vitae, lacinia velit. Sed vel lacinia ipsum. Quisque vitae congue mauris. Vestibulum et nulla risus.',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '#software',
                    ),
                  ),
                ),
                Container(
                  height: 140.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/beautiful-young-brunette-woman-with-pleasant-appearance-tender-smile_273609-18319.jpg?w=996&t=st=1663559798~exp=1663560398~hmac=08a5c5360441701d6ae92f99cfbd630d5603e1dcb5399a702ae2a826555b193a',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
