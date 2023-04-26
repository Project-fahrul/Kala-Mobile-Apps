import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingWrapper extends StatefulWidget {
  const LoadingWrapper(
      {super.key, required this.widget, this.loadingWrapperController});
  final Widget widget;
  final LoadingWrapperController? loadingWrapperController;
  @override
  State<LoadingWrapper> createState() => _LoadingWrapperState();
}

class LoadingWrapperController {
  LoadingWrapperController({this.listener});
  bool _load = false, _error = false;
  Function? listener, _callback;

  void toggleLoading() {
    _load = !_load;
    if (listener != null) {
      listener!.call();
    }
  }

  void setLoading(bool state) {
    _load = state;
    if (listener != null) {
      listener!.call();
    }
  }

  void setCallback(c) => _callback = c;
  get getCallback => _callback;

  bool get isLoad => _load;
  get error => _error;
}

class _LoadingWrapperState extends State<LoadingWrapper> {
  bool showLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.loadingWrapperController != null) {
      showLoading = widget.loadingWrapperController!.isLoad;
      widget.loadingWrapperController!.listener = () {
        setState(() {
          showLoading = widget.loadingWrapperController!.isLoad;
        });
      };
    }
  }

  Widget _wrapper(BuildContext ctx) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(ctx).size.height,
      width: MediaQuery.of(ctx).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Loading",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.widget,
        if (showLoading) _wrapper(context),
      ],
    );
  }
}
