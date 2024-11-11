import 'package:flutter/material.dart';
import 'package:ftptester/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../components/urlbox.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> urls = [
    "http://10.20.30.40/",
    "http://172.27.27.84/",
    "http://172.27.27.84/",
    "http://172.16.50.4/",
    "http://10.16.100.244/",
    "http://www.takdhum.net:8096/",
    "http://ftpbd.net/",
    "http://103.58.73.10/",
    "http://server4.ftpbd.net/",
    "http://103.170.204.84/",
    "http://new.circleftp.net/",
    "http://media.ftpbd.net:8096",
    "http://103.170.204.84/",
    "http://15.1.1.4",
    "http://emby.circleftp.net:8096",
    "http://172.16.50.4/",
    "http://khulnaflix.net",
    "http://103.153.175.254/NAS1",
    "http://103.120.165.196",
    "http://cds1.discoveryftp.net",
    "http://10.100.100.10",
    "http://103.77.252.113",
    "http://10.100.100.12",
    "http://www.ddnbd.fun/",
    "http://fs.ebox.live",
    "http://103.49.168.107",
    "http://10.16.100.244",
    "http://10.16.100.202/ftps10",
    "http://10.16.100.206/ftps3",
    "http://103.237.37.181",
    "http://dhakamovie.com",
    "http://103.43.148.68",
    "http://dhakamovie.com",
    "http://103.200.36.250",
    "http://www.timepassbd.live",
    "http://ftp.timepassbd.live",
    "http://11.11.11.11",
    "http://103.204.244.70",
    "http://103.204.244.70/Data/Data",
    "http://www.nagordola.com.bd",
    "http://www.elaach.com",
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FTP Tester"),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          // add more IconButton
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: urls.length,
              itemBuilder: (context, index) {
                return Urlbox(
                  key: ValueKey(index), // Assigning unique keys to each item
                  url: urls[index],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                //  open
              },
              child: const Text('Made By Shaon An Nafi ❤'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Home()), // this mainpage is your page to refresh
            (Route<dynamic> route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Refreshed!'),
            ),
          );
        }, // Call this function to refresh URLs
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
