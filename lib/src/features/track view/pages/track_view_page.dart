import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:last_fm/src/constants.dart';
import 'package:last_fm/src/core/domain/entities/Tag.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/utils/sized_cofig.dart';
import 'package:last_fm/src/features/track%20view/bloc/track_view_bloc.dart';
import 'package:last_fm/src/style.dart';

class TrackViewpage extends StatefulWidget {
  const TrackViewpage({Key? key, required this.track}) : super(key: key);
  final Track track;

  @override
  _TrackViewpageState createState() => _TrackViewpageState();
}

class _TrackViewpageState extends State<TrackViewpage> {
  final TrackViewBloc bloc = TrackViewBloc();
  @override
  void initState() {
    bloc.add(GetTrackInfoEvent(
        widget.track.mbid, widget.track.name, widget.track.artist));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is LoadingInfo) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is ErrorInInfo) {
                  return Expanded(
                    child: Center(
                      child: Text(state.error),
                    ),
                  );
                }
                if (state is InfoReady) {
                  return Expanded(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                height: SizeConfig.h(250),
                                width: SizeConfig.screenWidth,
                                child: Image.network(
                                  state.track.album?.image?[2].text ??
                                      AppConstants.placholderImageUrl,
                                  fit: BoxFit.cover,
                                )),
                            BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 8.0,
                                sigmaY: 8.0,
                              ),
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                            SizedBox(
                                height: SizeConfig.h(225),
                                width: SizeConfig.screenWidth,
                                child: Image.network(
                                    state.track.album?.image?[2].text ??
                                        AppConstants.placholderImageUrl)),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.h(15),
                        ),
                        Text(
                          state.track.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.h(25)),
                        ),
                        Wrap(
                          spacing: SizeConfig.h(4),
                          children: [
                            for (Tag tag in state.track.toptags?.tag ?? [])
                              Chip(
                                  backgroundColor: AppColors.subtitleColor,
                                  padding: EdgeInsets.zero,
                                  elevation: 5,
                                  label: Text(
                                    tag.name,
                                    style:
                                        TextStyle(fontSize: SizeConfig.h(10)),
                                  ))
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.h(15),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("Artist: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: SizeConfig.h(15),
                                    ),
                                    Text(state.track.artist.name)
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.h(15),
                                ),
                                Row(
                                  children: [
                                    const Text("Album: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: SizeConfig.h(15),
                                    ),
                                    Text(state.track.album?.title ?? "")
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.h(15),
                                ),
                                Row(
                                  children: [
                                    const Text("Listeners: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: SizeConfig.h(15),
                                    ),
                                    Text(state.track.listeners)
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.h(15),
                                ),
                                Row(
                                  children: [
                                    const Text("Play count: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: SizeConfig.h(15),
                                    ),
                                    Text(state.track.playcount ?? "")
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.h(15),
                                ),
                                Row(
                                  children: [
                                    const Text("Wiki: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.h(15),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Html(
                                              data: state.track.wiki?.summary ??
                                                  ""))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              })
        ],
      ),
    ));
  }
}
