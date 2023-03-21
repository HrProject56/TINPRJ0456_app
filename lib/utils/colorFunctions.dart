/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 02/12/2022
 */


import 'dart:math';

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
  static List<double> RGBtoXYZ(double R, double G, double B)
  {
    List<double> rgb_prime, xyz;
    rgb_prime = [R/MAX_RGB_VALUE, G/MAX_RGB_VALUE, B/MAX_RGB_VALUE];
    List<List<double>> m = [
      [0.4124564, 0.3575761, 0.1804375],
      [0.2126729, 0.7151522, 0.0721750],
      [0.0193339, 0.1191920, 0.9503041],
    ];

    for (int i = 0; i < 3; i++) {
      if (rgb_prime[i] > 0.04045) {
        rgb_prime[i] = pow((rgb_prime[i]+0.055)/1.055, 2.4).toDouble();
      } else {
        rgb_prime[i] = rgb_prime[i]/12.92;
      }
    }

    double x, y, z;

    x = rgb_prime[0]*m[0][0] + rgb_prime[1]*m[0][1] + rgb_prime[2]*m[0][2];
    y = rgb_prime[0]*m[1][0] + rgb_prime[1]*m[1][1] + rgb_prime[2]*m[1][2];
    z = rgb_prime[0]*m[2][0] + rgb_prime[1]*m[2][1] + rgb_prime[2]*m[2][2];

    return [x, y, z];
  }


  static double f(double t)
  {
    double epsilon =  0.008856;
    double k = 903.3;

    if (t > epsilon) {
      return pow(t, 1/3).toDouble();
    } else {
      return (k*t+16)/116;
    }
  }


  static List<double> normalizeXyz(List<double> xyz) {
    double maxVal = xyz.reduce(max);
    return xyz.map((val) => val / maxVal).toList();
  }


  static List<double> XYZtoLAB(double x, double y, double z)
  {
    List<double> whitePoint = [95.047, 100.000, 108.883]; // example D65 white point
    List<double> t = [x, y, z];
    //List<double> n = normalizeXyz(t);
    double x_prime = t[0]/whitePoint[0];
    double y_prime = t[1]/whitePoint[1];
    double z_prime = t[2]/whitePoint[2];



    double l, a, b;

    l = 116*f(y_prime)-16;
    a = 500*(f(x_prime) - f(y_prime));
    b = 200*(f(y_prime) - f(z_prime));

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


  /**
   *
   */
  static double DeltaE(double l1, double a1, double b1, double l2, double a2, double b2) {
    double kL = 1, kC = 1, kH = 1;

    double c1 = sqrt(pow(a1, 2) + pow(b1, 2));
    double c2 = sqrt(pow(a2, 2) + pow(b2, 2));

    double cAvg = (c1 + c2) / 2;

    double g = 0.5 * (1 - sqrt(pow(cAvg, 7) / (pow(cAvg, 7) + pow(25, 7))));

    double a1Prime = (1 + g) * a1;
    double a2Prime = (1 + g) * a2;

    double c1Prime = sqrt(pow(a1Prime, 2) + pow(b1, 2));
    double c2Prime = sqrt(pow(a2Prime, 2) + pow(b2, 2));

    double cAvgPrime = (c1Prime + c2Prime) / 2;

    double h1Prime = atan2(b1, a1Prime);
    if (h1Prime < 0) {
      h1Prime += 2 * pi;
    }
    double h2Prime = atan2(b2, a2Prime);
    if (h2Prime < 0) {
      h2Prime += 2 * pi;
    }

    double hDiffPrime = h2Prime - h1Prime;
    if (hDiffPrime > pi) {
      hDiffPrime -= 2 * pi;
    } else if (hDiffPrime < -pi) {
      hDiffPrime += 2 * pi;
    }

    double hAvgPrime = (h1Prime + h2Prime) / 2;

    double t = 1 - 0.17 * cos(hAvgPrime - pi / 6) + 0.24 * cos(2 * hAvgPrime) + 0.32 * cos(3 * hAvgPrime + pi / 30) - 0.20 * cos(4 * hAvgPrime - 63 * pi / 180);

    double deltaHPrime = 2 * sqrt(c1Prime * c2Prime) * sin(hDiffPrime / 2);

    double deltaLPrime = l2 - l1;
    double deltaCPrime = c2Prime - c1Prime;
    double deltaHPrimeSq = pow(deltaHPrime, 2).toDouble();

    double lAvgPrime = (l1 + l2) / 2;
    double cAvgPrimePow7 = pow(cAvgPrime, 7).toDouble();

    double sL = 1 + (0.015 * pow((lAvgPrime - 50), 2)) / sqrt(20 + pow((lAvgPrime - 50), 2));
    double sC = 1 + 0.045 * cAvgPrime;
    double sH = 1 + 0.015 * cAvgPrime * t;

    double deltaR = 2 * sqrt(cAvgPrimePow7 / (cAvgPrimePow7 + pow(25, 7))) * sin((60 * exp(-(pow((hAvgPrime - 275) / 25, 2)))) * pi / 180);
    double deltaEPrime = pow(deltaLPrime / (kL * sL), 2) + pow(deltaCPrime / (kC * sC), 2) + pow(deltaHPrime / (kH * sH), 2) + deltaR * (deltaCPrime / (kC * sC) * deltaHPrimeSq / (kH * sH));

    return sqrt(deltaEPrime);
  }
}