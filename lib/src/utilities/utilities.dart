import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:moviiku_app/src/blocs/poin_cubit.dart';
import 'package:moviiku_app/src/screens/screens.dart';

part 'theme.dart';
part 'constanta.dart';
part 'commons.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'router.dart';
