import 'package:flutter/material.dart';

class UserInfo {
  final String name;
  final String position;
  final String company;
  final String phone;
  final String email;
  final String address;
  final List<EducationInfo> education;
  final List<ProjectInfo> projects;

  UserInfo({
    required this.name,
    required this.position,
    required this.company,
    required this.phone,
    required this.email,
    required this.address,
    required this.education,
    required this.projects,
  });
}

class EducationInfo {
  final String logo;
  final String name;
  final String gpa;

  EducationInfo({
    required this.logo,
    required this.name,
    required this.gpa,
  });
}

class ProjectInfo {
  final String title;
  final String description;

  ProjectInfo({
    required this.title,
    required this.description,
  });
}

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  UserInfoPage({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${userInfo.name}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Position: ${userInfo.position}'),
            Text('Company: ${userInfo.company}'),
            Text('Phone: ${userInfo.phone}'),
            Text('Email: ${userInfo.email}'),
            Text('Address: ${userInfo.address}'),
            SizedBox(height: 16.0),
            Text(
              'Education:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: userInfo.education
                  .map((edu) => ListTile(
                        leading: Image.asset(
                          edu.logo,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(edu.name),
                        subtitle: Text('GPA: ${edu.gpa.toString()}'),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Projects:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: userInfo.projects
                  .map((project) => ListTile(
                        title: Text(project.title),
                        subtitle: Text(project.description),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  UserInfo userInfo = UserInfo(
    name: 'Ronak Dhingra',
    position: 'Software Developer',
    company: 'Houzeo',
    phone: '+1-312-774-6579',
    email: 'ronaktsec@gmail.com',
    address: '500 E 33rd St, Chicago, IL 60616',
    education: [
      EducationInfo(
        logo: 'assets/images/iit.png',
        name: 'Illinois Institute of Technology',
        gpa: '3.8 GPA',
      ),
      EducationInfo(
        logo: 'assets/images/tsec.png',
        name: 'Thadomal Shahani Engineering College',
        gpa: '3.56 GPA',
      ),
    ],
    projects: [
      ProjectInfo(
        title: 'Reverse Ludo',
        description: 'Description of Project 1',
      ),
      ProjectInfo(
        title: 'Twitter Sentiment\n Analysis',
        description: 'Description of Project 1',
      ),
      ProjectInfo(
        title: 'Google Stock\n Price Prediction',
        description: 'Description of Project 1',
      ),
    ],
  );

  runApp(Myapp(userInfo: userInfo));
}

class Myapp extends StatelessWidget {
  final UserInfo userInfo;
  const Myapp({Key? key, required this.userInfo}) : super(key: key);
  // const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'images/Profile1.jpg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              userInfo.name,
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20,
                                color: Colors.teal.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              userInfo.position,
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20.0,
                                color: Colors.teal.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              userInfo.company,
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20.0,
                                color: Colors.teal.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.teal,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            userInfo.phone,
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.teal,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            userInfo.email,
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.teal,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            userInfo.address,
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          'Education',
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Icon(
                                  Icons.account_balance,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  userInfo.education[0].name,
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  userInfo.education[1].name,
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  userInfo.education[0].gpa,
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  userInfo.education[1].gpa,
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Container(
                        child: Text(
                          'Projects',
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 80,
                                height: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/ludo.png',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                  // padding: EdgeInsets.symmetric(),
                                  child: Text(
                                    userInfo.projects[0].title,
                                    // 'Hand Written \nDigit Prediction',
                                    style: TextStyle(
                                      color: Colors.teal.shade900,
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 80, // Set the desired width
                                height: 90, // Set the desired height
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/x.png',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                  padding: EdgeInsets.symmetric(),
                                  child: Text(
                                    userInfo.projects[1].title,
                                    style: TextStyle(
                                      color: Colors.teal.shade900,
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 80,
                                height: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/google.png',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                  padding: EdgeInsets.symmetric(),
                                  child: Text(
                                    userInfo.projects[2].title,
                                    style: TextStyle(
                                      color: Colors.teal.shade900,
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
