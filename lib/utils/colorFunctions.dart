/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 02/12/2022
 */


import 'package:flutter/material.dart';


class ColorFunctions
{
  static final int MAX_RGB_VALUE = 255;


  /**
   * Method to choose the max value from a range of values
   */
  static double _max({double a = 0, double b = 0, double c = 0})
  {
    return a>b?(a>c?a:c):(b>c?b:c);
  }


  /**
   * Method to choose the minimal value from a range of values
   */
  static double _min({double a = 255, double b = 255, double c = 255})
  {
    return a<b?(a<c?a:c):(b<c?b:c);
  }


  /**
   * Method to multiplate two matrices together
   */
  static List<double> _matrixMultiplication(List<List<double>> matrixA, List<List<double>> matrixB)
  {
    int i, j;
    List<double> c = [];
    double temp;

    for (i = 0; i < matrixA.length; i++) {
      temp = 0;

      for (j = 0; j < matrixA[1].length; j++) {
        temp += matrixA[i][j]*matrixB[0][i];
      }

      c.add(temp);
    }

    return c;
  }


  /**
   *  Method to calculate the b from the hue value
   */
  static double _determineB(double h, double max, double min)
  {
    double r = h%360;
    r = r>0?r:360+r;

    if (r >= 0 && r < 120) return min;
    else if (r >= 120 && r < 180) return min+(max-min)*((r-120)/60);
    else if (r >= 180 && r < 300) return max;
    else if (r >= 300 && r < 360) return max-(max-min)*((r-300)/60);
    else return 0;
  }


  /**
   * Method to convert RGB values to a vector of HSL values
   */
  static List<double> RGBtoHSL(double R, double G, double B)
  {
    double h, s, l, rPrime, gPrime, bPrime, cMax, cMin, delta;

    rPrime = R/MAX_RGB_VALUE;
    gPrime = G/MAX_RGB_VALUE;
    bPrime = B/MAX_RGB_VALUE;

    cMax =  _max(a: rPrime, b: gPrime, c: bPrime);
    cMin =  _min(a: rPrime, b: gPrime, c: bPrime);
    delta = cMax-cMin;

    if (cMax == rPrime)       h = cMin==gPrime?(60*((cMax-bPrime)/delta))+300:(60*((gPrime-cMin)/delta));
    else if (cMax == gPrime)  h = cMin==bPrime?(60*((cMax-rPrime)/delta))+60:(60*((bPrime-cMin)/delta))+120;
    else if (cMax == bPrime)  h = cMin==rPrime?(60*((cMax-gPrime)/delta))+180:(60*((rPrime-cMin)/delta))+240;
    else                      h = 0;

    s = delta/(1-(cMin+cMax-1).abs());
    l = (cMin+cMax)/2;

    return <double>[h, s, l];
  }


  /**
   * Method to convert HSL values to a vector of RGB values
   */
  static List<int> HSLtoRGB(double H, double S, double L)
  {
    double r, g, b, cMax, cMin;

    cMin = L+(S*(L-0.5).abs())-(0.5*S);
    cMax = L-(S*(L-0.5).abs())+(0.5*S);

    print("[info]\tMax:${cMax} & Min:${cMin}");

    r = _determineB(H-120, cMax, cMin)*MAX_RGB_VALUE;
    g = _determineB(H+120, cMax, cMin)*MAX_RGB_VALUE;
    b = _determineB(H, cMax, cMin)*MAX_RGB_VALUE;

    return [r.ceil(), g.ceil(), b.ceil()];
  }


  /**
   * Method to convert HSL values to a vector of CIE-LAB values
   */
  static List<double> HSLtoLAB(double H, double S, double L)
  {
    double l, a, b;

    l = 0;
    a = 0;
    b = 0;

    return [l, a, b];
  }


  /**
   *  Method to convert CIE-LAB values to a vector of HSL values
   */
  static List<double> LABtoHSL(double L, double A, double B)
  {
    double h, s, l;

    h = 0;
    s = 0;
    l = 0;

    return [h, s, l];
  }


  /**
   * Method to convert RGB values to a vector of CIE-LAB values
   */
  static List<double> RGBtoLAB(double R, double G, double B)
  {
    List<double> rgb_prime, xyz;
    rgb_prime = [R/MAX_RGB_VALUE, G/MAX_RGB_VALUE, B/MAX_RGB_VALUE];
    List<List<double>> m = [
      [0.4124, 0,3576, 0.1805],
      [0.2126, 0.7152, 0.0722],
      [0.0913, 0.1192, 0.9505],
    ];


    double l, a, b;

    l = 0;
    a = 0;
    b = 0;

    return [l, a, b];
  }


  /**
   *
   */
  static List<double> LABtoRGB(double L, double A, double B)
  {
    double r, g, b;
    List<List<double>> m, rgb_prime;

    m = [
      [3.2406, -1.5372, -0.4986],
      [-0.9689, 1.8758, 0.0415],
      [0.0557, -0.2040, 1.0570],
    ];

    r = 0;
    g = 0;
    b = 0;

    return [r, g, b];
  }
}