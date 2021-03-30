import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDAddPost2 extends StatelessWidget {
  XDAddPost2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Container(),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(40.0, 35.0, 168.0, 39.0),
            size: Size(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
            pinLeft: true,
            pinTop: true,
            fixedWidth: false,
            fixedHeight: false,
            child: Text(
              'Share a post',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
                color: const Color(0xff2e2e2e),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(34.0, 722.0, 360.0, 31.0),
            size: Size(428.0, 926.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Caption Part' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 29.0, 360.0, 2.0),
                  size: Size(360.0, 31.0),
                  pinLeft: true,
                  pinRight: true,
                  pinBottom: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'Rectangle' (shape)
                      Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffcccccc),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(3.0, 0.0, 69.0, 26.0),
                  size: Size(360.0, 31.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Caption',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: const Color(0xffcccccc),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(26.0, 102.0, 376.0, 237.0),
            size: Size(428.0, 926.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 376.0, 237.0),
                  size: Size(376.0, 237.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child:
                      // Adobe XD layer: 'pexels-joey-kyber-1…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(31.0),
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(37.0, 798.0, 115.0, 45.0),
            size: Size(428.0, 926.0),
            pinLeft: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 115.0, 45.0),
                  size: Size(115.0, 45.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: const Color(0xffa20202),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(10.5, 7.7, 94.0, 28.0),
                  size: Size(115.0, 45.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Container(),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 65.0, 28.0),
                        size: Size(94.0, 28.0),
                        pinLeft: true,
                        pinTop: true,
                        pinBottom: true,
                        fixedWidth: true,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(287.0, 798.0, 115.0, 45.0),
            size: Size(428.0, 926.0),
            pinRight: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 115.0, 45.0),
                  size: Size(115.0, 45.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: const Color(0xff18573a),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(22.0, 8.2, 72.0, 26.0),
                  size: Size(115.0, 45.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Container(),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 41.0, 26.0),
                        size: Size(72.0, 26.0),
                        pinLeft: true,
                        pinTop: true,
                        pinBottom: true,
                        fixedWidth: true,
                        child: Text(
                          'Post',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(54.0, 629.0, 313.0, 69.0),
            size: Size(428.0, 926.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Location Group' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 117.0, 39.0),
                  size: Size(313.0, 69.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      color: const Color(0xff2e2e2e),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(192.0, 6.0, 21.0, 30.0),
                  size: Size(313.0, 69.0),
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'location_on-24px (2)' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 21.0, 30.0),
                        size: Size(21.0, 30.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          _svg_x83wrg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(286.0, 6.0, 27.0, 30.0),
                  size: Size(313.0, 69.0),
                  pinRight: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'location_off-24px' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 27.0, 30.0),
                        size: Size(27.0, 30.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          _svg_g8ov48,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(48.0, 456.0, 333.0, 130.0),
            size: Size(428.0, 926.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Explanation' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 333.0, 130.0),
                  size: Size(333.0, 130.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color: const Color(0xffcccccc),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(26.0, 7.0, 30.0, 30.0),
                  size: Size(333.0, 130.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'info-24px' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                        size: Size(30.0, 30.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          _svg_hj3tpl,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(2.0, 2.0, 26.0, 26.0),
                        size: Size(30.0, 30.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          _svg_n9a0zn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(69.0, 7.0, 241.0, 26.0),
                  size: Size(333.0, 130.0),
                  pinRight: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Activity feature is a feature',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(19.0, 37.0, 292.0, 26.0),
                  size: Size(333.0, 130.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Text(
                    'used to announce environmental',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(19.0, 97.0, 160.0, 26.0),
                  size: Size(333.0, 130.0),
                  pinLeft: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'date and location.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(19.0, 67.0, 296.0, 26.0),
                  size: Size(333.0, 130.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Text(
                    'protection activities on a specific',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(203.0, 385.0, 51.0, 26.0),
            size: Size(428.0, 926.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              '20:30',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: const Color(0xffcccccc),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(272.0, 385.0, 127.0, 26.0),
            size: Size(428.0, 926.0),
            pinRight: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              '20 / 03 / 2001',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: const Color(0xffcccccc),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_x83wrg =
    '<svg viewBox="5.0 2.0 21.0 30.0" ><path  d="M 15.5 2 C 9.695000648498535 2 5 6.695000648498535 5 12.50000095367432 C 5 20.37500190734863 15.5 32 15.5 32 C 15.5 32 26.00000190734863 20.37500190734863 26.00000190734863 12.50000095367432 C 26.00000190734863 6.695000648498535 21.30500030517578 2 15.5 2 Z M 15.5 16.25000190734863 C 13.43000030517578 16.25000190734863 11.75000095367432 14.57000160217285 11.75000095367432 12.50000095367432 C 11.75000095367432 10.43000030517578 13.43000030517578 8.750000953674316 15.5 8.750000953674316 C 17.57000160217285 8.750000953674316 19.25 10.43000030517578 19.25 12.50000095367432 C 19.25 14.57000160217285 17.57000160217285 16.25000190734863 15.5 16.25000190734863 Z" fill="#2e2e2e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g8ov48 =
    '<svg viewBox="2.4 2.4 27.0 30.0" ><path transform="translate(0.36, 0.36)" d="M 17 8.75 C 19.06999969482422 8.75 20.75000190734863 10.42999935150146 20.75000190734863 12.49999904632568 C 20.75000190734863 13.60999870300293 20.2549991607666 14.58499908447266 19.5049991607666 15.27499866485596 L 24.94999885559082 20.72000122070313 C 26.42000007629395 17.93000030517578 27.5 15.02000045776367 27.5 12.49999904632568 C 27.5 6.695000171661377 22.80500030517578 1.99999988079071 17 1.99999988079071 C 14.02999973297119 1.99999988079071 11.35999870300293 3.244999647140503 9.439998626708984 5.224999904632568 L 14.22499847412109 10.00999927520752 C 14.91499900817871 9.229999542236328 15.88999843597412 8.75 17 8.75 Z M 23.55499839782715 23.15000152587891 L 16.60999870300293 16.20499992370605 L 16.44499969482422 16.04000091552734 L 3.904999732971191 3.5 L 1.99999988079071 5.40500020980835 L 6.770000457763672 10.17499828338623 C 6.605000495910645 10.92499828338623 6.5 11.70499992370605 6.5 12.49999904632568 C 6.5 20.37500190734863 17 31.99999809265137 17 31.99999809265137 C 17 31.99999809265137 19.5049991607666 29.22499847412109 22.06999969482422 25.47499847412109 L 27.09499931335449 30.5 L 29 28.59499931335449 L 23.55499839782715 23.14999580383301 Z" fill="#2e2e2e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hj3tpl =
    '<svg viewBox="0.0 0.0 30.0 30.0" ><path  d="M 0 0 L 30 0 L 30 30 L 0 30 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n9a0zn =
    '<svg viewBox="2.0 2.0 26.0 26.0" ><path transform="translate(0.0, 0.0)" d="M 13.69999885559082 8.499999046325684 L 16.29999923706055 8.499999046325684 L 16.29999923706055 11.09999942779541 L 13.69999885559082 11.09999942779541 L 13.69999885559082 8.499999046325684 Z M 13.69999885559082 13.69999885559082 L 16.29999923706055 13.69999885559082 L 16.29999923706055 21.49999809265137 L 13.69999885559082 21.49999809265137 L 13.69999885559082 13.69999885559082 Z M 14.99999904632568 1.99999988079071 C 7.823999881744385 1.99999988079071 1.99999988079071 7.823999881744385 1.99999988079071 14.99999904632568 C 1.99999988079071 22.17599868774414 7.823999881744385 27.99999809265137 14.99999904632568 27.99999809265137 C 22.17599868774414 27.99999809265137 27.99999809265137 22.17599868774414 27.99999809265137 14.99999904632568 C 27.99999809265137 7.823998928070068 22.17599868774414 1.99999988079071 14.99999904632568 1.99999988079071 Z M 14.99999904632568 25.39999961853027 C 9.266999244689941 25.39999961853027 4.599999904632568 20.73299789428711 4.599999904632568 14.99999904632568 C 4.599999904632568 9.266999244689941 9.266999244689941 4.599999904632568 14.99999904632568 4.599999904632568 C 20.73299789428711 4.599999904632568 25.39999961853027 9.266999244689941 25.39999961853027 14.99999904632568 C 25.39999961853027 20.73299789428711 20.73299789428711 25.39999961853027 14.99999904632568 25.39999961853027 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
