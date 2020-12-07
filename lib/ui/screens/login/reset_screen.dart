import 'package:flutter/material.dart';

import 'package:mimi/ui/screens/login/widgets/reset_card.dart';

class ResetScreen extends StatefulWidget {
  ResetScreen({Key key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop()),
      title: Text('Réinitialisation',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: _buildAppBar(),
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Theme.of(context).primaryColor, Color(0xFF373794)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(height: 100.0),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: ResetCard(),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
