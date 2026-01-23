class Solution {
  String minWindow(String s, String t) {
    if (s.length < t.length) return "";

    List<int> need = List.filled(128, 0);
    for (int i = 0; i < t.length; i++) {
      need[t.codeUnitAt(i)]++;
    }

    int left = 0;
    int right = 0;
    int needCount = t.length;

    int minLen = 1 << 30;
    int start = 0;

    while (right < s.length) {
      int r = s.codeUnitAt(right);
      if (need[r] > 0) needCount--;
      need[r]--;
      right++;

      while (needCount == 0) {
        if (right - left < minLen) {
          minLen = right - left;
          start = left;
        }

        int l = s.codeUnitAt(left);
        need[l]++;
        if (need[l] > 0) needCount++;
        left++;
      }
    }

    return minLen == 1 << 30 ? "" : s.substring(start, start + minLen);
  }
}
