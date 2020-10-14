import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';

part 'car_four_svg_data.svg_path.g.dart';

///this enum to represent the car paths

enum CarParts  {
  FILL125,
  STROKE126,
  FILL127,
  STROKE128,
  STROKE129,
  STROKE131,
  EKSEDAMLF,
  RFRFLB,
  DOORLB,
  DOORLF,
  LIGHTSPOTLB,
  STROKE144,
  WHEELLF,
  STROKE147,
  STROKE149,
  WHEELLB,
  STROKE162,
  STROKE164,
  STROKEGLASSLF,
  STROKE177,
  GLASSLB,
  STROKE179,
  SHORAALB,
  STROKE181,
  FILL182,
  STROKE183,
  RFRFLF,
  ATBL,
  EKSDAMLB,
  LIGHTSPOTLF,
}




Path getPathByProvince(CarParts car) {
  switch (car) {
    case CarParts.FILL125:
      return MapSvgData.fill125;
    case CarParts.STROKE126:
      return MapSvgData.stroke126;
    case CarParts.FILL127:
      return MapSvgData.fill127;
    case CarParts.STROKE128:
      return MapSvgData.stroke128;
    case CarParts.STROKE129:
      return MapSvgData.stroke129;
    case CarParts.STROKE131:
      return MapSvgData.stroke131;
     case CarParts.EKSEDAMLF:
       return MapSvgData.eksedamLf;
    case CarParts.RFRFLB:
      return MapSvgData.rfrfLb;
    case CarParts.DOORLB:
      return MapSvgData.doorLb;
    case CarParts.DOORLF:
      return MapSvgData.doorLf;
    case CarParts.LIGHTSPOTLB:
      return MapSvgData.lightSpotLb;
    case CarParts.STROKE144:
      return MapSvgData.stroke144;
    case CarParts.WHEELLF:
      return MapSvgData.wheelLf;
    case CarParts.STROKE147:
      return MapSvgData.stroke147;
    case CarParts.STROKE149:
      return MapSvgData.stroke149;
    case CarParts.WHEELLB:
      return MapSvgData.wheelLb;
    case CarParts.STROKE162:
      return MapSvgData.stroke162;
    case CarParts.STROKE164:
      return MapSvgData.stroke164;
    case CarParts.STROKEGLASSLF:
      return MapSvgData.strokeGlassLf;
    case CarParts.STROKE177:
      return MapSvgData.stroke177;
    case CarParts.GLASSLB:
      return MapSvgData.glassLb;
    case CarParts.STROKE179:
      return MapSvgData.stroke179;
    case CarParts.SHORAALB:
      return MapSvgData.shoraaLb;
    case CarParts.STROKE181:
      return MapSvgData.stroke181;
    case CarParts.FILL182:
      return MapSvgData.fill182;
    case CarParts.STROKE183:
      return MapSvgData.stroke183;
    case CarParts.RFRFLF:
      return MapSvgData.rfrfLf;
    case CarParts.ATBL:
      return MapSvgData.atbL;
    case CarParts.EKSDAMLB:
      return MapSvgData.eksdamLb;
    case CarParts.LIGHTSPOTLF:
      return MapSvgData.lightSpotLf;
    default :
      return Path();
  }
}


/// We can open our exported SVG image, then we put all SVG data we have in the
/// property it belongs to. Our build runner will create Paths for us to use
/// within the app. Run command: flutter packages pub run build_runner build


class MapSvgData {
  /// Height and width of the used SVG image
  static double get height => 125;
  static double get width =>  345;
  //car image

  @SvgPath(
    'M23.3927044,130 L28.5070611,125.491244 L82.1687451,119.290292 L89.5570895,120.290982 L89.5570895,129.168862 L249.29415,127.023197 L249.619657,118.141327 L306.583278,119.290292 L314.996967,115.965076 C315.222218,96.924708 302.8699,81.2840259 288.192166,78.4694611 C269.980082,74.9766879 248.662017,91.3195152 247.829371,115.965076 C246.997377,118.939219 246.165383,121.912697 245.333388,124.886841 L93.2144795,126.306424 C96.1538023,109.088575 88.461435,91.9691324 74.2257378,83.6777025 C58.7062434,74.6389135 38.3965967,77.8304824 27.4615345,90.2157643 C19.2887197,99.4726438 14.7589725,115.669191 20.7339681,126.342994 C21.640829,127.962715 22.6342745,129.177506 23.3927044,130')
  static Path get fill125 => _$MapSvgData_fill125;

  @SvgPath(
   'M23.3927044,130 L28.5070611,125.491244 L82.1687451,119.290292 L89.5570895,120.290982 L89.5570895,129.168862 L249.29415,127.023197 L249.619657,118.141327 L306.583278,119.290292 L314.996967,115.965076 C315.222218,96.924708 302.8699,81.2840259 288.192166,78.4694611 C269.980082,74.9766879 248.662017,91.3195152 247.829371,115.965076 C246.997377,118.939219 246.165383,121.912697 245.333388,124.886841 L93.2144795,126.306424 C96.1538023,109.088575 88.461435,91.9691324 74.2257378,83.6777025 C58.7062434,74.6389135 38.3965967,77.8304824 27.4615345,90.2157643 C19.2887197,99.4726438 14.7589725,115.669191 20.7339681,126.342994 C21.640829,127.962715 22.6342745,129.177506 23.3927044,130 Z')
  static Path get stroke126 => _$MapSvgData_stroke126;

  @SvgPath(
   'M114.981028,17.558766 C131.319492,7.7005357 149.811822,2.02680466 168.833525,1.03071332 C188.280026,0.0130389144 202.796538,-0.769183831 230.114782,1.30017467 C245.60625,2.47350879 266.679192,4.63116166 291.716911,8.93469483 C293.76815,9.28721829 295.301708,11.0328308 295.390695,13.1263885 L295.393293,13.1813272 C295.443957,14.4959323 295.143221,15.5469624 294.90614,16.1794117 C298.798817,20.7059699 302.767491,25.553658 306.760198,30.7316325 C309.659083,34.4923188 312.393636,38.1961042 314.97035,41.824676 C316.175242,43.5225441 316.828027,45.5520066 316.828027,47.6383699 L316.828027,70.8179321 C316.828027,72.3032397 317.191119,73.7656561 317.886124,75.075683 L322.349745,83.4937339 C323.167513,85.0365964 323.653367,86.7357725 323.77548,88.4800769 L324.987517,105.839405 C325.069358,107.004236 324.747837,108.168414 324.050884,109.101064 C323.252602,110.168445 322.264006,111.327391 321.050021,112.485682 C318.812364,114.61979 316.58575,116.010917 314.879415,116.900401 C315.328895,113.776088 315.697183,107.992479 313.038626,101.91194 C307.930014,90.2263434 294.894448,84.888131 284.351157,84.7978745 C270.849222,84.6834189 261.951859,93.1792997 259.993504,95.1538235 C248.284293,106.955838 249.547643,122.546662 249.763289,124.748789 C196.44666,125.239314 143.13068,125.729838 89.8147003,126.220362 C90.052431,124.516608 92.2459189,106.580423 78.7725642,94.0092668 C77.040248,92.3931528 65.1011007,81.6310497 48.8938431,85.0163214 C34.0856891,88.1092406 27.3240045,100.586217 26.3224178,102.511688 C19.9069368,114.840199 23.3286999,126.682763 24.0490369,129 C17.071706,128.190962 11.5188106,127.157591 8.13537018,125.402822 C4.99225862,123.772973 2.55779238,121.84554 0.756625123,120.131321 C-0.226124989,119.1954 -0.252756023,117.630301 0.683876932,116.646636 L2.77668649,114.447779 C1.73287986,109.545152 1.32626944,105.427364 1.15284295,102.511688 C0.721550102,95.2689332 0.372098972,89.4022626 3.26383955,83.2177323 C4.98186602,79.5427242 7.26044328,77.0031164 8.81673493,75.5021121 C8.7173557,74.2627207 8.64135982,72.4870228 8.78490759,70.3548771 C8.93689935,68.0880009 9.17398051,67.0134256 9.48445939,65.9015706 C10.2801427,63.0519514 17.1879732,57.8968681 28.4334144,53.1322421 C32.7690767,51.2950651 36.8501203,49.5762679 42.9395336,47.518028 C49.7408399,45.2197581 54.9793591,43.8724514 58.6369043,42.9398012 C64.3463382,41.4845791 71.7354759,39.8102562 80.504231,38.3615744 L114.981028,17.558766 Z')
  static Path get fill127 => _$MapSvgData_fill127;

  @SvgPath(
   'M80.504231,38.3615744 L114.981028,17.558766 C131.319492,7.7005357 149.811822,2.02680466 168.833525,1.03071332 C188.280026,0.0130389144 202.796538,-0.769183831 230.114782,1.30017467 C245.60625,2.47350879 266.679192,4.63116166 291.716911,8.93469483 C293.76815,9.28721829 295.301708,11.0328308 295.390695,13.1263885 L295.393293,13.1813272 C295.443957,14.4959323 295.143221,15.5469624 294.90614,16.1794117 C298.798817,20.7059699 302.767491,25.553658 306.760198,30.7316325 C309.659083,34.4923188 312.393636,38.1961042 314.97035,41.824676 C316.175242,43.5225441 316.828027,45.5520066 316.828027,47.6383699 L316.828027,70.8179321 C316.828027,72.3032397 317.191119,73.7656561 317.886124,75.075683 L322.349745,83.4937339 C323.167513,85.0365964 323.653367,86.7357725 323.77548,88.4800769 L324.987517,105.839405 C325.069358,107.004236 324.747837,108.168414 324.050884,109.101064 C323.252602,110.168445 322.264006,111.327391 321.050021,112.485682 C318.812364,114.61979 316.58575,116.010917 314.879415,116.900401 C315.328895,113.776088 315.697183,107.992479 313.038626,101.91194 C307.930014,90.2263434 294.894448,84.888131 284.351157,84.7978745 C270.849222,84.6834189 261.951859,93.1792997 259.993504,95.1538235 C248.284293,106.955838 249.547643,122.546662 249.763289,124.748789 C196.44666,125.239314 143.13068,125.729838 89.8147003,126.220362 C90.052431,124.516608 92.2459189,106.580423 78.7725642,94.0092668 C77.040248,92.3931528 65.1011007,81.6310497 48.8938431,85.0163214 C34.0856891,88.1092406 27.3240045,100.586217 26.3224178,102.511688 C19.9069368,114.840199 23.3286999,126.682763 24.0490369,129 C17.071706,128.190962 11.5188106,127.157591 8.13537018,125.402822 C4.99225862,123.772973 2.55779238,121.84554 0.756625123,120.131321 C-0.226124989,119.1954 -0.252756023,117.630301 0.683876932,116.646636 L2.77668649,114.447779 C1.73287986,109.545152 1.32626944,105.427364 1.15284295,102.511688 C0.721550102,95.2689332 0.372098972,89.4022626 3.26383955,83.2177323 C4.98186602,79.5427242 7.26044328,77.0031164 8.81673493,75.5021121 C8.7173557,74.2627207 8.64135982,72.4870228 8.78490759,70.3548771 C8.93689935,68.0880009 9.17398051,67.0134256 9.48445939,65.9015706 C10.2801427,63.0519514 17.1879732,57.8968681 28.4334144,53.1322421 C32.7690767,51.2950651 36.8501203,49.5762679 42.9395336,47.518028 C49.7408399,45.2197581 54.9793591,43.8724514 58.6369043,42.9398012 C64.3463382,41.4845791 71.7354759,39.8102562 80.504231,38.3615744 Z')
  static Path get stroke128 => _$MapSvgData_stroke128;

  @SvgPath(
   'M83.5073871,54.0056593 C84.2840198,54.846759 85.3052202,54.9133162 87.4679535,55.2722028 C87.5583655,55.2872108 87.6520297,55.3028713 87.7482957,55.3191844 C91.7888669,56.0069416 95.9003367,56.1733345 99.9831869,55.8196681 C134.76189,52.8108931 244.084968,42.8645134 256.328315,41.7669728 C257.796372,41.6351636 259.248168,41.3630622 260.664189,40.954584 C267.109459,39.0929412 273.55473,37.2312984 280,35.3703081 C277.736448,32.0659411 275.049455,28.5351492 271.869424,24.9299699 C268.628251,21.2562759 265.369516,18.0667526 262.239569,15.3105033 C258.597071,12.1033619 254.10509,10.0185569 249.309351,9.31774915 C231.595752,6.7291978 216.455969,6.03752539 204.873475,6.0068569 C186.078184,5.95661277 170.912383,6.03295774 151.862118,11.7164169 C140.152136,15.210015 131.804962,19.3802776 124.055547,23.2986671 C112.545253,29.1178506 98.0786807,37.6932834 82.6917277,50.3208724 C80.7520974,51.9123715 83.5073871,54.0056593 83.5073871,54.0056593 Z')
  static Path get stroke129 => _$MapSvgData_stroke129;

  @SvgPath(
   'M12.3789005,63.5115806 C11.2915802,64.078738 10.5484384,65.1542216 10.3731265,66.3929779 C10.1849241,67.7255994 10.0489285,69.1983576 10.0109012,70.792744 C9.93355778,74.0152289 10.2783807,76.8021 10.7089261,79 C15.7008025,76.9964406 20.8673464,74.7826761 26.1776201,72.3349096 C28.569467,71.232324 30.9071733,70.1204841 33.1894502,69.004017 C37.4768566,66.9059314 41.5006507,64.286299 45.1332157,61.147764 C45.1525515,61.1305774 45.1718874,61.1140518 45.1912233,61.0975263 C48.3429697,58.3727913 51.2755763,55.6612768 54,53 C52.6245753,53.175832 50.557571,53.4323087 48.0381075,53.7158874 C44.4635501,54.1191112 25.1334833,56.8590497 12.3789005,63.5115806 Z')
  static Path get stroke131 => _$MapSvgData_stroke131;

  @SvgPath(
   'M41,87.5803618 C38.6136172,88.8775914 36.9860961,89.8490834 36.1174368,90.4948378 C32.8695709,92.9092755 31.0876275,95.1415314 29.7437353,96.8846035 C24.6065107,103.547752 22.4949954,111.854309 22.5812295,117.593943 C22.6286122,120.747677 23.4387662,124.48845 24.179011,128 C20.952543,127.511658 5.18073593,126.45643 -2.91322522e-13,117.593943 C2.81611771e-12,116.815518 0.930564404,115.482685 2.79169321,113.595446 C-1.28033619,93.7824245 0.743894523,80.9322679 8.86438536,75.0449764 C9.37465892,74.797647 9.67904491,74.6318783 9.77754333,74.5476703 L31.1340905,70 L41,87.5803618 Z')
  static Path get eksedamLf => _$MapSvgData_eksedamLf;

  @SvgPath(
   'M256.798815,12 L295.106449,16.0897098 L295.734108,16.7467473 L294.552745,20.0953795 C299.19788,24.5839188 302.583429,28.0374588 304.709394,30.4559996 C306.835358,32.8745404 309.494814,36.3688613 312.687761,40.9389624 L305.473873,41.689013 C307.282646,54.4601149 310.124688,62.8975159 314,67.0012161 C312.994413,69.3895286 309.210971,76.8929952 302.649675,89.511616 C299.174989,87.7411473 296.660581,86.5998206 295.106449,86.0876358 C291.186078,84.7956252 287.762218,84.5879503 285.589921,84.4415017 C276.777422,83.8473942 269.348653,87.1760278 264.628856,91.0734195 C262.168802,93.1048189 259.233921,95.4611449 256.798815,98.7160311 C255.181814,100.877397 254.005219,103.777594 252.536757,106 C249.222331,106 246.043412,106 243,106 C265.182904,79.2363349 278.362739,59.833152 282.539505,47.7904511 C282.539505,46.3874107 285.593773,43.3586641 278.607899,33.5695402 C277.238794,31.8722863 276.48526,30.3638011 273.911814,27.6424325 C272.368169,26.0100585 270.926871,23.7031209 266.922292,20.0953795 C265.279442,18.6153285 261.904949,15.9168686 256.798815,12 Z')
  static Path get rfrfLb => _$MapSvgData_rfrfLb;

  @SvgPath(
   'M280.075829,35.6278429 C280.991429,36.9759762 281.543961,38.8282853 282.453704,40.538017 C282.466068,40.5615996 282.478432,40.5851821 282.491447,40.6094196 C284.536091,44.4690899 284.48273,49.108948 282.45045,52.975824 C279.509078,58.5720838 275.661216,65.2426578 270.740275,72.4726612 C264.832151,81.1516786 259.691257,87.2366204 254.14625,93.7624239 C250.207284,98.3976966 245.176366,104.073875 239.060004,110.409053 C234.871802,114.746924 229.145887,117.246015 223.137549,117.367858 C212.758149,117.57879 202.378749,117.789068 192,118 L193.44791,48.055596 C195.213863,20.8381839 196.547972,7.17692529 197.450237,7.07182014 C199.670789,6.8131473 199.896382,7.30468746 201.983208,7.7281999 C201.983208,9.0297338 201.374408,45.1418464 201.374408,45.1418464 C205.602484,45.1418464 212.826928,44.0781326 220.54868,43.3375885 C233.69712,42.0766054 248.286609,40.8149536 251.973483,40.538017 C261.291262,39.8381195 262.99422,38.7401889 268.967814,37.3863148 C270.961549,36.9344484 275.118313,34.6547067 278.865793,34.1501193 C279.394338,34.0789523 279.797684,34.5715268 280.075829,35.6278429 Z')
  static Path get doorLb => _$MapSvgData_doorLb;

  @SvgPath(
   'M169.097557,10.0069534 C186.680467,8.43811545 195.981281,7.43579767 197,7 L193.264589,48.2393716 L193.264589,54.36515 L193.264589,68.92718 C192.350151,76.5368144 192.09974,82.7720961 192.014315,87.0781369 C191.950246,90.28298 191.991664,91.9033276 192.014315,93.0824863 C192.092621,97.2481975 191.468071,100.18102 191.824657,103.747082 C192.172182,107.233234 191.691342,109.323693 191.824657,112.735132 C191.904905,114.803045 191.868017,116.499994 191.824657,117.607689 C161.992496,118.071556 132.160983,118.535424 102.329469,118.999291 C99.6431059,119.04087 97.2628494,117.249718 96.5587387,114.647123 C94.2930295,106.270873 93.0459511,98.9198093 92.3237199,93.0824863 C91.4041048,85.6547607 90.1363172,74.8402833 91.8383495,60.9236115 C92.5139852,55.3992149 92.6757753,53.3451615 92.3237199,54.7614513')
  static Path get doorLf => _$MapSvgData_doorLf;

  @SvgPath(
   'M316.786263,71 C314.571714,68.8349917 311.717887,65.5228971 309.357526,60.8776661 C305.327658,52.9477795 304.937979,45.4622718 305.006746,41.5813188 C306.247097,41.3149592 307.710941,41.0947775 309.357526,41.0238375 C311.447276,40.9341587 313.280424,41.1088317 314.769737,41.3584601 C315.19571,41.8972025 315.791053,42.7558441 316.255229,43.923677 C317.025037,45.8604727 317.005298,47.5650403 316.998294,48.2737709 C316.967731,51.3489527 316.949266,59.7171949 316.786263,71')
  static Path get lightSpotLb => _$MapSvgData_lightSpotLb;

  @SvgPath(
   'M316.786263,71 C314.571714,68.8349917 311.717887,65.5228971 309.357526,60.8776661 C305.327658,52.9477795 304.937979,45.4622718 305.006746,41.5813188 C306.247097,41.3149592 307.710941,41.0947775 309.357526,41.0238375 C311.447276,40.9341587 313.280424,41.1088317 314.769737,41.3584601 C315.19571,41.8972025 315.791053,42.7558441 316.255229,43.923677 C317.025037,45.8604727 317.005298,47.5650403 316.998294,48.2737709 C316.967731,51.3489527 316.949266,59.7171949 316.786263,71 Z')
  static Path get stroke144 => _$MapSvgData_stroke144;

  @SvgPath(
   'M83,117.999671 C83,132.91151 70.9121272,145 56.0003215,145 C41.0885158,145 29,132.91151 29,117.999671 C29,103.087832 41.0885158,91 56.0003215,91 C70.9121272,91 83,103.087832 83,117.999671')
  static Path get wheelLf => _$MapSvgData_wheelLf;

  @SvgPath(
   'M83,117.999671 C83,132.91151 70.9121272,145 56.0003215,145 C41.0885158,145 29,132.91151 29,117.999671 C29,103.087832 41.0885158,91 56.0003215,91 C70.9121272,91 83,103.087832 83,117.999671 Z')
   static Path get stroke147 => _$MapSvgData_stroke147;

  @SvgPath(
   'M76,118.499671 C76,129.821918 66.8223062,139 55.5003215,139 C44.1783368,139 35,129.821918 35,118.499671 C35,107.178082 44.1783368,98 55.5003215,98 C66.8223062,98 76,107.178082 76,118.499671 Z')
  static Path get stroke149 => _$MapSvgData_stroke149;

  @SvgPath(
   'M309,118 C309,132.911657 296.911628,145 282,145 C267.088372,145 255,132.911657 255,118 C255,103.088343 267.088372,91 282,91 C296.911628,91 309,103.088343 309,118')
  static Path get wheelLb => _$MapSvgData_wheelLb;

  @SvgPath(
  'M309,118 C309,132.911657 296.911628,145 282,145 C267.088372,145 255,132.911657 255,118 C255,103.088343 267.088372,91 282,91 C296.911628,91 309,103.088343 309,118 Z')
  static Path get stroke162 => _$MapSvgData_stroke162;

  @SvgPath(
   'M303,118.500329 C303,129.821918 293.821807,139 282.5,139 C271.178193,139 262,129.821918 262,118.500329 C262,107.178082 271.178193,98 282.5,98 C293.821807,98 303,107.178082 303,118.500329 Z')
  static Path get stroke164 => _$MapSvgData_stroke164;

  @SvgPath(
   'M192,8 C178.813298,8.22200271 166.661533,9.2378923 152.19379,13.5500677 C140.453927,17.0495315 132.142698,21.2474599 124.81006,24.9513999 C110.425863,32.2171201 96.6957867,41.1777207 84,51.5826372 C84.1301767,51.8156751 84.4436369,52.1739953 84.7188861,52.3888575 L84.8477674,52.4862271 L84.9578671,52.6050181 C85.1871335,52.8536351 85.7033066,52.9548995 87.1197064,53.1814462 L88.1397474,53.3482727 C90.6817544,53.7805938 93.2801065,54 95.8655057,54 C97.1918828,54 98.5344511,53.9415782 99.8582377,53.8273312 C116.965783,52.3486114 152.713849,49.1380108 185.498939,46.179273 L192,8')
  static Path get strokeGlassLf => _$MapSvgData_strokeGlassLf;

  @SvgPath(
   'M192,8 C178.813298,8.22200271 166.661533,9.2378923 152.19379,13.5500677 C140.453927,17.0495315 132.142698,21.2474599 124.81006,24.9513999 C110.425863,32.2171201 96.6957867,41.1777207 84,51.5826372 C84.1301767,51.8156751 84.4436369,52.1739953 84.7188861,52.3888575 L84.8477674,52.4862271 L84.9578671,52.6050181 C85.1871335,52.8536351 85.7033066,52.9548995 87.1197064,53.1814462 L88.1397474,53.3482727 C90.6817544,53.7805938 93.2801065,54 95.8655057,54 C97.1918828,54 98.5344511,53.9415782 99.8582377,53.8273312 C116.965783,52.3486114 152.713849,49.1380108 185.498939,46.179273 L192,8 Z')
  static Path get stroke177 => _$MapSvgData_stroke177;

  @SvgPath(
   'M255,13.0312225 C253.078423,12.1917069 251.04644,11.5987624 248.942826,11.2947886 C234.111062,9.15066465 219.09529,8.04305208 204.310186,8.00391383 C203.398028,8.00195691 202.5069,8.00130461 201.610515,8 C201.406791,20.3331159 201.203724,32.6668841 201,45 C213.987076,43.8375939 225.872727,42.7723811 235.145455,41.9413455 C244.310405,41.1194422 251.256736,40.4964917 254.752245,40.1853425 L255,13.0312225')
  static Path get glassLb => _$MapSvgData_glassLb;

  @SvgPath(
   'M255,13.0312225 C253.078423,12.1917069 251.04644,11.5987624 248.942826,11.2947886 C234.111062,9.15066465 219.09529,8.04305208 204.310186,8.00391383 C203.398028,8.00195691 202.5069,8.00130461 201.610515,8 C201.406791,20.3331159 201.203724,32.6668841 201,45 C213.987076,43.8375939 225.872727,42.7723811 235.145455,41.9413455 C244.310405,41.1194422 251.256736,40.4964917 254.752245,40.1853425 L255,13.0312225 Z')
  static Path get stroke179 => _$MapSvgData_stroke179;

  @SvgPath(
   'M270.570144,27.305458 C267.665468,23.9729608 264.520555,20.7937193 261.222765,17.8557741 C259.986896,16.7549413 258.648895,15.8008428 257.231886,15 L257,41 C258.136305,40.8643524 259.265545,40.640012 260.364594,40.3185011 L277,35.4567071 C274.989466,32.6354971 272.833119,29.9016755 270.570144,27.305458')
  static Path get shoraaLb => _$MapSvgData_shoraaLb;

  @SvgPath(
   'M270.570144,27.305458 C267.665468,23.9729608 264.520555,20.7937193 261.222765,17.8557741 C259.986896,16.7549413 258.648895,15.8008428 257.231886,15 L257,41 C258.136305,40.8643524 259.265545,40.640012 260.364594,40.3185011 L277,35.4567071 C274.989466,32.6354971 272.833119,29.9016755 270.570144,27.305458 Z')
  static Path get stroke181 => _$MapSvgData_stroke181;

  @SvgPath(
   'M295.422205,16 L294,20.0299701 C297.033406,22.9599195 300.236213,26.3167234 303.481369,30.1313319 C306.68544,33.8995151 309.461585,37.5625967 311.855314,41 C312.57021,40.6466522 313.285105,40.2933044 314,39.9399567 C311.21943,35.9009595 308.175911,31.7194625 304.850479,27.445115 C301.669163,23.3558238 298.511235,19.5431497 295.422205,16')
  static Path get fill182 => _$MapSvgData_fill182;

  @SvgPath(
   'M295.422205,16 L294,20.0299701 C297.033406,22.9599195 300.236213,26.3167234 303.481369,30.1313319 C306.68544,33.8995151 309.461585,37.5625967 311.855314,41 C312.57021,40.6466522 313.285105,40.2933044 314,39.9399567 C311.21943,35.9009595 308.175911,31.7194625 304.850479,27.445115 C301.669163,23.3558238 298.511235,19.5431497 295.422205,16 Z')
  static Path get stroke183 => _$MapSvgData_stroke183;

  @SvgPath(
   'M31,71.0160523 L40.833104,88.2729893 C46.8641182,86.0256427 51.275079,84.819376 54.0659864,84.654189 C60.16791,84.2930311 65.4102651,85.5161359 70.5348965,88.2729893 C75.8833616,91.1502566 81.0600294,95.6974553 84.8224939,101.822424 C86.9872647,105.346485 88.0154895,109.454932 89.7192877,114 C89.7192877,114 91.8128585,113.70749 96,113.12247 C93.2342555,100.18475 91.6170223,89.6399361 91.1483004,81.4880278 C90.6795784,73.3361196 91.2189566,65.1351188 92.766435,56.8850256 C86.1616867,56.9630384 82.4957605,55.4264219 81.7686563,52.2751759 C81.0415521,49.12393 79.6771011,46.6988714 77.6753033,45 C68.6613636,46.4093607 63.9362625,47.2587964 63.5,47.5483071 C63.2685748,47.7018844 59.6040748,49.4842834 54.0659864,54.0622968 C50.8458573,56.7241889 47.8185278,60.8225898 42.3033047,64.8103797 C40.3830983,66.1987877 36.61533,68.2673453 31,71.0160523 Z')
  static Path get rfrfLf => _$MapSvgData_rfrfLf;

  @SvgPath(
   'M101.4798,119.474705 C180.618926,118.178873 220.362418,117.440724 220.710277,117.260256 C228.357994,118.100427 235.617183,114.347008 242.487846,106 C248.829282,106 252,106 252,106 C250.204691,110.492722 249.314022,116.660742 249.327993,124.50406 C142.60912,125.501353 89.2496828,126 89.2496828,126 C89.694758,124.741482 89.6115304,120.639896 89,113.695243 L95.2728749,112.795449 C96.174482,115.406578 96.9745694,117.088006 97.6731372,117.839733 C98.3717049,118.59146 99.6405926,119.136451 101.4798,119.474705 Z')
  static Path get atbL => _$MapSvgData_atbL;

  @SvgPath(
   'M302,89.9264799 C311.699599,95.6366429 315.936631,104.66115 314.711097,117 C316.129283,116.479927 324.197292,111.233472 325,106.922382 C324.603244,105.155018 324.089358,87.5368649 323.561878,86.0983902 C323.151106,84.9781872 322.42051,84.5083726 320.406929,79.6025889 C320.082185,78.811399 318.426925,76.4457059 317.475703,74.3520723 C316.751168,72.7573764 316.828862,71.169753 316.692117,70.6569074 C316.692117,70.4404052 315.689119,69.221436 313.683124,67 L302,89.9264799 Z')
  static Path get eksdamLb => _$MapSvgData_eksdamLb;

  @SvgPath(
    'M12.3789005,63.5115806 C11.2915802,64.078738 10.5484384,65.1542216 10.3731265,66.3929779 C10.1849241,67.7255994 10.0489285,69.1983576 10.0109012,70.792744 C9.93355778,74.0152289 10.2783807,76.8021 10.7089261,79 C15.7008025,76.9964406 20.8673464,74.7826761 26.1776201,72.3349096 C28.569467,71.232324 30.9071733,70.1204841 33.1894502,69.004017 C37.4768566,66.9059314 41.5006507,64.286299 45.1332157,61.147764 C45.1525515,61.1305774 45.1718874,61.1140518 45.1912233,61.0975263 C48.3429697,58.3727913 51.2755763,55.6612768 54,53 C52.6245753,53.175832 50.557571,53.4323087 48.0381075,53.7158874 C44.4635501,54.1191112 25.1334833,56.8590497 12.3789005,63.5115806')
  static Path get lightSpotLf => _$MapSvgData_lightSpotLf;

}
