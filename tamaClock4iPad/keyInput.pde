//
// Processing3/2016/sketch_20160308a_tamaClock/2016/sketch_20160308a_tamaClock/keyInput.pde
//

// First version: Wed Aug 18 06:26:33 JST 2021

// ---------------------------------------------------------

class myTest {
  int x, y, z;
  myTest(int _x, int _y, int _z) {
    x = _x; y = _y; z = _z;
  }
}

// ---------------------------------------------------------
// ---------------------------------------------------------

// 注意：
// 以下のクラスはインナークラスなので，private 宣言した変数も setup() や draw() などから見えてしまう．
// しかし，いずれ完全なクラスライブラリにする（はずな）nおで，private 宣言した変数はクラス外からは直接操作せず，アクセス用の関数経由で利用すること

class myKeyboard {

  // private final int _i_mesgBuffSize = 256;
  char[] mesgBuff;
  private int _i_mesgBuffSize = 0;
  private boolean _b_mesgBuffReady = false;
  private boolean _b_mesgBuffTop = true;

  private int _i_mesgBuffPos = 0;
  private int _i_mesgLen = 0;


  myKeyboard(int _size) {	// constructor
    _i_mesgBuffSize = _size;
    mesgBuff = new char[_i_mesgBuffSize];
  }

  myKeyboard() {	// constructor
    _i_mesgBuffSize = 256;
    mesgBuff = new char[_i_mesgBuffSize];
  }


  int getBuffPos() {
    return(_i_mesgBuffPos);
  }


  int getMesgLen() {
    return(_i_mesgLen);
  }


  int readStringUntilEOL() {
    return(this.readStringUntil('\n'));
  }


  int readStringUntil(char ch) {

    int _i_retVal = 0;

  if (_b_mesgBuffReady) {
    _i_retVal = _i_mesgLen;
    _b_mesgBuffReady = false;
  } else {
    _i_retVal = 0;
  }

    return(_i_retVal);
  }

  void keyTyped() {
    if (key != CODED) {
      // print("[" + key + "]");

      if (_b_mesgBuffTop) {
        _b_mesgBuffTop = false;
        _b_mesgBuffReady = false;
        _i_mesgLen = 0;
      }

      if (key == BACKSPACE) {
        if (_i_mesgBuffPos >= 1) {
          mesgBuff[_i_mesgBuffPos] = '\0';
          _i_mesgBuffPos--;
          _i_mesgLen--;
          if (_i_mesgBuffPos == 0) {
            _b_mesgBuffTop = true;
          }
        }

      } else if ((key == ENTER) || (key == RETURN)) {
        mesgBuff[_i_mesgBuffPos] = '\0';
        mesgBuff[_i_mesgBuffPos+1] = '\0';
        _b_mesgBuffReady = true;
        _b_mesgBuffTop = true;
        _i_mesgBuffPos = 0;

      } else {
        mesgBuff[_i_mesgBuffPos] = key;
        mesgBuff[_i_mesgBuffPos+1] = '\0';
        _b_mesgBuffReady = false;
        _b_mesgBuffTop = false;
        _i_mesgBuffPos++;
        _i_mesgLen++;
      }

      for(int i = _i_mesgLen; i < _i_mesgBuffSize; i++) {
        mesgBuff[i] = '\0';
      }
      String str = new String(mesgBuff);
      // println("[" + key + "](" + _i_mesgBuffPos + "/" + _i_mesgLen + ")(" + str +  ")" );

    }
  }


}


// ---------------------------------------------------------
