/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 08/12/2022
 */


import 'dart:core';
import 'dart:ffi';
import 'package:flutter/material.dart';


class Matrix
{
  int _rows = 0;
  int _columns = 0;
  List<List<double>> datapool = [[]];


  Matrix(int rows, int columns)
  {
    _rows = rows;
    _columns = columns;
  }


  /**
   * Method to add 2 matrices together to one new matrix
   */
  Matrix add(Matrix b)
  {
    if (this.getRows != b.getRows && this.getColumns != b.getColumns) {
      return this;
    }

    int i, j;

    if (this.getColumns == b.getRows) {
      for (i = 0; i < this.getRows; i++) {
        for (j = 0; j < this.getColumns; j++) {
          datapool[i][j] = this.datapool[i][j] + b.datapool[i][j];
        }
      }
    }

    return this;
  }


  /**
   * Method to subtract 2 matrices from each other
   */
  void subtract(Matrix b)
  {
    if (this.getRows != b.getRows && this.getColumns != b.getColumns) {
      return;
    }
  }


  /**
   * Method to multiplicate to matrices with each other
   */
  Matrix multiplicate(Matrix b)
  {
    if (getRows != b.getColumns || getColumns != b.getRows) {
      return this;
    }

    int i, j, k, s, smallestRows, smallestColumns;

    smallestRows    = getRows < b.getRows ? getRows : b.getRows;
    smallestColumns = getColumns < b.getColumns ? getColumns : b.getColumns;
    s = smallestRows < smallestColumns ? smallestRows : smallestColumns;
    Matrix temp = smallestRows < smallestColumns ? Matrix(s, getColumns) : Matrix(getRows, s);

    for (k = 0; k < s; k++) {
      for (i = 0; i < getRows; i++) {
        for (j = 0; j < getColumns; j++) {
          if (s == smallestRows) {
            temp.datapool[k][j] = 0;
          }
        }
      }
    }

    return temp;
  }


  double determinant()
  {
    return 0.00;
  }


  /**
   * Method to copy the contents of the matrix
   */
  Matrix copy()
  {
    return this;
  }





  /**
   * Setters
   */
  set setRows(int rows) => _rows = rows;
  set setColumns(int columns) => _columns = columns;


  /**
   * Getters
   */
  int get getRows => _rows;
  int get getColumns => _columns;
}