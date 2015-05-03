import serial


def lookup(a, b):
	num1 = 0
	num2 = 0
	if a < b:
		num1 = a[0]
		num2 = b[0]
	else:
		num1 = b[0]
		num2 = a[0]
		
	if num1 == 0 and num2 == 1:
		return 9
	if num1 == 0 and num2 == 2:
		return 12
	if num1 == 0 and num2 == 3:
		return 23
	if num1 == 0 and num2 == 4:
		return 22
	if num1 == 0 and num2 == 5:
		return 33
	if num1 == 0 and num2 == 6:
		return 22
	if num1 == 0 and num2 == 7:
		return 33
	if num1 == 0 and num2 == 8:
		return 43
	if num1 == 0 and num2 == 9:
		return 47
	if num1 == 0 and num2 == 10:
		return 95
	if num1 == 0 and num2 == 11:
		return 47
	if num1 == 0 and num2 == 12:
		return 97
	if num1 == 0 and num2 == 13:
		return 95
	if num1 == 0 and num2 == 14:
		return 45
	if num1 == 0 and num2 == 15:
		return 91
	if num1 == 0 and num2 == 16:
		return 169
	if num1 == 0 and num2 == 17:
		return 66
	if num1 == 0 and num2 == 18:
		return 62
	if num1 == 0 and num2 == 19:
		return 71
	if num1 == 0 and num2 == 20:
		return 72
	if num1 == 0 and num2 == 21:
		return 85
	if num1 == 0 and num2 == 22:
		return 136
	if num1 == 0 and num2 == 23:
		return 116
	if num1 == 0 and num2 == 24:
		return 168
	if num1 == 0 and num2 == 25:
		return 178
	if num1 == 0 and num2 == 26:
		return 100
	if num1 == 0 and num2 == 27:
		return 65
	if num1 == 0 and num2 == 28:
		return 156
	if num1 == 0 and num2 == 29:
		return 68
	if num1 == 1 and num2 == 2:
		return 11
	if num1 == 1 and num2 == 3:
		return 13
	if num1 == 1 and num2 == 4:
		return 19
	if num1 == 1 and num2 == 5:
		return 23
	if num1 == 1 and num2 == 6:
		return 31
	if num1 == 1 and num2 == 7:
		return 23
	if num1 == 1 and num2 == 8:
		return 33
	if num1 == 1 and num2 == 9:
		return 40
	if num1 == 1 and num2 == 10:
		return 90
	if num1 == 1 and num2 == 11:
		return 48
	if num1 == 1 and num2 == 12:
		return 88
	if num1 == 1 and num2 == 13:
		return 91
	if num1 == 1 and num2 == 14:
		return 55
	if num1 == 1 and num2 == 15:
		return 81
	if num1 == 1 and num2 == 16:
		return 176
	if num1 == 1 and num2 == 17:
		return 63
	if num1 == 1 and num2 == 18:
		return 62
	if num1 == 1 and num2 == 19:
		return 69
	if num1 == 1 and num2 == 20:
		return 70
	if num1 == 1 and num2 == 21:
		return 92
	if num1 == 1 and num2 == 22:
		return 146
	if num1 == 1 and num2 == 23:
		return 109
	if num1 == 1 and num2 == 24:
		return 176
	if num1 == 1 and num2 == 25:
		return 185
	if num1 == 1 and num2 == 26:
		return 93
	if num1 == 1 and num2 == 27:
		return 55
	if num1 == 1 and num2 == 28:
		return 165
	if num1 == 1 and num2 == 29:
		return 58
	if num1 == 2 and num2 == 3:
		return 17
	if num1 == 2 and num2 == 4:
		return 31
	if num1 == 2 and num2 == 5:
		return 26
	if num1 == 2 and num2 == 6:
		return 32
	if num1 == 2 and num2 == 7:
		return 27
	if num1 == 2 and num2 == 8:
		return 36
	if num1 == 2 and num2 == 9:
		return 35
	if num1 == 2 and num2 == 10:
		return 83
	if num1 == 2 and num2 == 11:
		return 36
	if num1 == 2 and num2 == 12:
		return 86
	if num1 == 2 and num2 == 13:
		return 82
	if num1 == 2 and num2 == 14:
		return 54
	if num1 == 2 and num2 == 15:
		return 82
	if num1 == 2 and num2 == 16:
		return 181
	if num1 == 2 and num2 == 17:
		return 53
	if num1 == 2 and num2 == 18:
		return 51
	if num1 == 2 and num2 == 19:
		return 59
	if num1 == 2 and num2 == 20:
		return 60
	if num1 == 2 and num2 == 21:
		return 98
	if num1 == 2 and num2 == 22:
		return 143
	if num1 == 2 and num2 == 23:
		return 104
	if num1 == 2 and num2 == 24:
		return 180
	if num1 == 2 and num2 == 25:
		return 191
	if num1 == 2 and num2 == 26:
		return 87
	if num1 == 2 and num2 == 27:
		return 59
	if num1 == 2 and num2 == 28:
		return 167
	if num1 == 2 and num2 == 29:
		return 62
	if num1 == 3 and num2 == 4:
		return 27
	if num1 == 3 and num2 == 5:
		return 10
	if num1 == 3 and num2 == 6:
		return 45
	if num1 == 3 and num2 == 7:
		return 10
	if num1 == 3 and num2 == 8:
		return 20
	if num1 == 3 and num2 == 9:
		return 29
	if num1 == 3 and num2 == 10:
		return 80
	if num1 == 3 and num2 == 11:
		return 46
	if num1 == 3 and num2 == 12:
		return 75
	if num1 == 3 and num2 == 13:
		return 82
	if num1 == 3 and num2 == 14:
		return 68
	if num1 == 3 and num2 == 15:
		return 68
	if num1 == 3 and num2 == 16:
		return 189
	if num1 == 3 and num2 == 17:
		return 56
	if num1 == 3 and num2 == 18:
		return 59
	if num1 == 3 and num2 == 19:
		return 64
	if num1 == 3 and num2 == 20:
		return 65
	if num1 == 3 and num2 == 21:
		return 105
	if num1 == 3 and num2 == 22:
		return 159
	if num1 == 3 and num2 == 23:
		return 96
	if num1 == 3 and num2 == 24:
		return 189
	if num1 == 3 and num2 == 25:
		return 197
	if num1 == 3 and num2 == 26:
		return 81
	if num1 == 3 and num2 == 27:
		return 42
	if num1 == 3 and num2 == 28:
		return 179
	if num1 == 3 and num2 == 29:
		return 45
	if num1 == 4 and num2 == 5:
		return 33
	if num1 == 4 and num2 == 6:
		return 34
	if num1 == 4 and num2 == 7:
		return 33
	if num1 == 4 and num2 == 8:
		return 42
	if num1 == 4 and num2 == 9:
		return 57
	if num1 == 4 and num2 == 10:
		return 108
	if num1 == 4 and num2 == 11:
		return 67
	if num1 == 4 and num2 == 12:
		return 100
	if num1 == 4 and num2 == 13:
		return 109
	if num1 == 4 and num2 == 14:
		return 55
	if num1 == 4 and num2 == 15:
		return 88
	if num1 == 4 and num2 == 16:
		return 164
	if num1 == 4 and num2 == 17:
		return 83
	if num1 == 4 and num2 == 18:
		return 82
	if num1 == 4 and num2 == 19:
		return 89
	if num1 == 4 and num2 == 20:
		return 90
	if num1 == 4 and num2 == 21:
		return 81
	if num1 == 4 and num2 == 22:
		return 146
	if num1 == 4 and num2 == 23:
		return 123
	if num1 == 4 and num2 == 24:
		return 165
	if num1 == 4 and num2 == 25:
		return 171
	if num1 == 4 and num2 == 26:
		return 108
	if num1 == 4 and num2 == 27:
		return 59
	if num1 == 4 and num2 == 28:
		return 159
	if num1 == 4 and num2 == 29:
		return 61
	if num1 == 5 and num2 == 6:
		return 55
	if num1 == 5 and num2 == 7:
		return 1
	if num1 == 5 and num2 == 8:
		return 10
	if num1 == 5 and num2 == 9:
		return 25
	if num1 == 5 and num2 == 10:
		return 76
	if num1 == 5 and num2 == 11:
		return 50
	if num1 == 5 and num2 == 12:
		return 67
	if num1 == 5 and num2 == 13:
		return 79
	if num1 == 5 and num2 == 14:
		return 78
	if num1 == 5 and num2 == 15:
		return 58
	if num1 == 5 and num2 == 16:
		return 197
	if num1 == 5 and num2 == 17:
		return 56
	if num1 == 5 and num2 == 18:
		return 61
	if num1 == 5 and num2 == 19:
		return 66
	if num1 == 5 and num2 == 20:
		return 66
	if num1 == 5 and num2 == 21:
		return 114
	if num1 == 5 and num2 == 22:
		return 169
	if num1 == 5 and num2 == 23:
		return 89
	if num1 == 5 and num2 == 24:
		return 198
	if num1 == 5 and num2 == 25:
		return 205
	if num1 == 5 and num2 == 26:
		return 74
	if num1 == 5 and num2 == 27:
		return 32
	if num1 == 5 and num2 == 28:
		return 188
	if num1 == 5 and num2 == 29:
		return 35
	if num1 == 6 and num2 == 7:
		return 55
	if num1 == 6 and num2 == 8:
		return 65
	if num1 == 6 and num2 == 9:
		return 68
	if num1 == 6 and num2 == 10:
		return 114
	if num1 == 6 and num2 == 11:
		return 60
	if num1 == 6 and num2 == 12:
		return 118
	if num1 == 6 and num2 == 13:
		return 111
	if num1 == 6 and num2 == 14:
		return 23
	if num1 == 6 and num2 == 15:
		return 113
	if num1 == 6 and num2 == 16:
		return 149
	if num1 == 6 and num2 == 17:
		return 82
	if num1 == 6 and num2 == 18:
		return 74
	if num1 == 6 and num2 == 19:
		return 84
	if num1 == 6 and num2 == 20:
		return 85
	if num1 == 6 and num2 == 21:
		return 67
	if num1 == 6 and num2 == 22:
		return 114
	if num1 == 6 and num2 == 23:
		return 137
	if num1 == 6 and num2 == 24:
		return 148
	if num1 == 6 and num2 == 25:
		return 160
	if num1 == 6 and num2 == 26:
		return 120
	if num1 == 6 and num2 == 27:
		return 86
	if num1 == 6 and num2 == 28:
		return 135
	if num1 == 6 and num2 == 29:
		return 89
	if num1 == 7 and num2 == 8:
		return 10
	if num1 == 7 and num2 == 9:
		return 26
	if num1 == 7 and num2 == 10:
		return 77
	if num1 == 7 and num2 == 11:
		return 51
	if num1 == 7 and num2 == 12:
		return 67
	if num1 == 7 and num2 == 13:
		return 80
	if num1 == 7 and num2 == 14:
		return 78
	if num1 == 7 and num2 == 15:
		return 57
	if num1 == 7 and num2 == 16:
		return 197
	if num1 == 7 and num2 == 17:
		return 58
	if num1 == 7 and num2 == 18:
		return 63
	if num1 == 7 and num2 == 19:
		return 67
	if num1 == 7 and num2 == 20:
		return 68
	if num1 == 7 and num2 == 21:
		return 113
	if num1 == 7 and num2 == 22:
		return 169
	if num1 == 7 and num2 == 23:
		return 89
	if num1 == 7 and num2 == 24:
		return 198
	if num1 == 7 and num2 == 25:
		return 204
	if num1 == 7 and num2 == 26:
		return 75
	if num1 == 7 and num2 == 27:
		return 32
	if num1 == 7 and num2 == 28:
		return 189
	if num1 == 7 and num2 == 29:
		return 35
	if num1 == 8 and num2 == 9:
		return 25
	if num1 == 8 and num2 == 10:
		return 73
	if num1 == 8 and num2 == 11:
		return 56
	if num1 == 8 and num2 == 12:
		return 59
	if num1 == 8 and num2 == 13:
		return 77
	if num1 == 8 and num2 == 14:
		return 88
	if num1 == 8 and num2 == 15:
		return 48
	if num1 == 8 and num2 == 16:
		return 206
	if num1 == 8 and num2 == 17:
		return 58
	if num1 == 8 and num2 == 18:
		return 66
	if num1 == 8 and num2 == 19:
		return 69
	if num1 == 8 and num2 == 20:
		return 69
	if num1 == 8 and num2 == 21:
		return 123
	if num1 == 8 and num2 == 22:
		return 179
	if num1 == 8 and num2 == 23:
		return 82
	if num1 == 8 and num2 == 24:
		return 207
	if num1 == 8 and num2 == 25:
		return 213
	if num1 == 8 and num2 == 26:
		return 68
	if num1 == 8 and num2 == 27:
		return 22
	if num1 == 8 and num2 == 28:
		return 198
	if num1 == 8 and num2 == 29:
		return 25
	if num1 == 9 and num2 == 10:
		return 51
	if num1 == 9 and num2 == 11:
		return 35
	if num1 == 9 and num2 == 12:
		return 50
	if num1 == 9 and num2 == 13:
		return 53
	if num1 == 9 and num2 == 14:
		return 90
	if num1 == 9 and num2 == 15:
		return 52
	if num1 == 9 and num2 == 16:
		return 216
	if num1 == 9 and num2 == 17:
		return 33
	if num1 == 9 and num2 == 18:
		return 42
	if num1 == 9 and num2 == 19:
		return 44
	if num1 == 9 and num2 == 20:
		return 44
	if num1 == 9 and num2 == 21:
		return 133
	if num1 == 9 and num2 == 22:
		return 176
	if num1 == 9 and num2 == 23:
		return 68
	if num1 == 9 and num2 == 24:
		return 216
	if num1 == 9 and num2 == 25:
		return 225
	if num1 == 9 and num2 == 26:
		return 52
	if num1 == 9 and num2 == 27:
		return 41
	if num1 == 9 and num2 == 28:
		return 203
	if num1 == 9 and num2 == 29:
		return 44
	if num1 == 10 and num2 == 11:
		return 58
	if num1 == 10 and num2 == 12:
		return 41
	if num1 == 10 and num2 == 13:
		return 11
	if num1 == 10 and num2 == 14:
		return 132
	if num1 == 10 and num2 == 15:
		return 64
	if num1 == 10 and num2 == 16:
		return 263
	if num1 == 10 and num2 == 17:
		return 35
	if num1 == 10 and num2 == 18:
		return 50
	if num1 == 10 and num2 == 19:
		return 41
	if num1 == 10 and num2 == 20:
		return 40
	if num1 == 10 and num2 == 21:
		return 181
	if num1 == 10 and num2 == 22:
		return 210
	if num1 == 10 and num2 == 23:
		return 35
	if num1 == 10 and num2 == 24:
		return 262
	if num1 == 10 and num2 == 25:
		return 274
	if num1 == 10 and num2 == 26:
		return 21
	if num1 == 10 and num2 == 27:
		return 77
	if num1 == 10 and num2 == 28:
		return 245
	if num1 == 10 and num2 == 29:
		return 79
	if num1 == 11 and num2 == 12:
		return 78
	if num1 == 11 and num2 == 13:
		return 54
	if num1 == 11 and num2 == 14:
		return 75
	if num1 == 11 and num2 == 15:
		return 86
	if num1 == 11 and num2 == 16:
		return 207
	if num1 == 11 and num2 == 17:
		return 24
	if num1 == 11 and num2 == 18:
		return 14
	if num1 == 11 and num2 == 19:
		return 24
	if num1 == 11 and num2 == 20:
		return 25
	if num1 == 11 and num2 == 21:
		return 126
	if num1 == 11 and num2 == 22:
		return 151
	if num1 == 11 and num2 == 23:
		return 89
	if num1 == 11 and num2 == 24:
		return 205
	if num1 == 11 and num2 == 25:
		return 219
	if num1 == 11 and num2 == 26:
		return 71
	if num1 == 11 and num2 == 27:
		return 75
	if num1 == 11 and num2 == 28:
		return 186
	if num1 == 11 and num2 == 29:
		return 78
	if num1 == 12 and num2 == 13:
		return 52
	if num1 == 12 and num2 == 14:
		return 140
	if num1 == 12 and num2 == 15:
		return 26
	if num1 == 12 and num2 == 16:
		return 264
	if num1 == 12 and num2 == 17:
		return 61
	if num1 == 12 and num2 == 18:
		return 77
	if num1 == 12 and num2 == 19:
		return 71
	if num1 == 12 and num2 == 20:
		return 71
	if num1 == 12 and num2 == 21:
		return 181
	if num1 == 12 and num2 == 22:
		return 227
	if num1 == 12 and num2 == 23:
		return 25
	if num1 == 12 and num2 == 24:
		return 264
	if num1 == 12 and num2 == 25:
		return 272
	if num1 == 12 and num2 == 26:
		return 21
	if num1 == 12 and num2 == 27:
		return 50
	if num1 == 12 and num2 == 28:
		return 253
	if num1 == 12 and num2 == 29:
		return 51
	if num1 == 13 and num2 == 14:
		return 129
	if num1 == 13 and num2 == 15:
		return 74
	if num1 == 13 and num2 == 16:
		return 261
	if num1 == 13 and num2 == 17:
		return 30
	if num1 == 13 and num2 == 18:
		return 43
	if num1 == 13 and num2 == 19:
		return 33
	if num1 == 13 and num2 == 20:
		return 32
	if num1 == 13 and num2 == 21:
		return 179
	if num1 == 13 and num2 == 22:
		return 203
	if num1 == 13 and num2 == 23:
		return 46
	if num1 == 13 and num2 == 24:
		return 259
	if num1 == 13 and num2 == 25:
		return 272
	if num1 == 13 and num2 == 26:
		return 32
	if num1 == 13 and num2 == 27:
		return 84
	if num1 == 13 and num2 == 28:
		return 240
	if num1 == 13 and num2 == 29:
		return 86
	if num1 == 14 and num2 == 15:
		return 136
	if num1 == 14 and num2 == 16:
		return 132
	if num1 == 14 and num2 == 17:
		return 99
	if num1 == 14 and num2 == 18:
		return 88
	if num1 == 14 and num2 == 19:
		return 98
	if num1 == 14 and num2 == 20:
		return 100
	if num1 == 14 and num2 == 21:
		return 54
	if num1 == 14 and num2 == 22:
		return 91
	if num1 == 14 and num2 == 23:
		return 158
	if num1 == 14 and num2 == 24:
		return 129
	if num1 == 14 and num2 == 25:
		return 145
	if num1 == 14 and num2 == 26:
		return 141
	if num1 == 14 and num2 == 27:
		return 110
	if num1 == 14 and num2 == 28:
		return 113
	if num1 == 14 and num2 == 29:
		return 112
	if num1 == 15 and num2 == 16:
		return 253
	if num1 == 15 and num2 == 17:
		return 74
	if num1 == 15 and num2 == 18:
		return 89
	if num1 == 15 and num2 == 19:
		return 86
	if num1 == 15 and num2 == 20:
		return 86
	if num1 == 15 and num2 == 21:
		return 170
	if num1 == 15 and num2 == 22:
		return 226
	if num1 == 15 and num2 == 23:
		return 50
	if num1 == 15 and num2 == 24:
		return 254
	if num1 == 15 and num2 == 25:
		return 258
	if num1 == 15 and num2 == 26:
		return 47
	if num1 == 15 and num2 == 27:
		return 31
	if num1 == 15 and num2 == 28:
		return 246
	if num1 == 15 and num2 == 29:
		return 30
	if num1 == 16 and num2 == 17:
		return 230
	if num1 == 16 and num2 == 18:
		return 220
	if num1 == 16 and num2 == 19:
		return 231
	if num1 == 16 and num2 == 20:
		return 232
	if num1 == 16 and num2 == 21:
		return 83
	if num1 == 16 and num2 == 22:
		return 105
	if num1 == 16 and num2 == 23:
		return 285
	if num1 == 16 and num2 == 24:
		return 10
	if num1 == 16 and num2 == 25:
		return 22
	if num1 == 16 and num2 == 26:
		return 269
	if num1 == 16 and num2 == 27:
		return 222
	if num1 == 16 and num2 == 28:
		return 49
	if num1 == 16 and num2 == 29:
		return 224
	if num1 == 17 and num2 == 18:
		return 16
	if num1 == 17 and num2 == 19:
		return 11
	if num1 == 17 and num2 == 20:
		return 11
	if num1 == 17 and num2 == 21:
		return 149
	if num1 == 17 and num2 == 22:
		return 175
	if num1 == 17 and num2 == 23:
		return 66
	if num1 == 17 and num2 == 24:
		return 228
	if num1 == 17 and num2 == 25:
		return 242
	if num1 == 17 and num2 == 26:
		return 49
	if num1 == 17 and num2 == 27:
		return 72
	if num1 == 17 and num2 == 28:
		return 210
	if num1 == 17 and num2 == 29:
		return 75
	if num1 == 18 and num2 == 19:
		return 10
	if num1 == 18 and num2 == 20:
		return 11
	if num1 == 18 and num2 == 21:
		return 140
	if num1 == 18 and num2 == 22:
		return 160
	if num1 == 18 and num2 == 23:
		return 83
	if num1 == 18 and num2 == 24:
		return 218
	if num1 == 18 and num2 == 25:
		return 233
	if num1 == 18 and num2 == 26:
		return 66
	if num1 == 18 and num2 == 27:
		return 83
	if num1 == 18 and num2 == 28:
		return 197
	if num1 == 18 and num2 == 29:
		return 86
	if num1 == 19 and num2 == 20:
		return 1
	if num1 == 19 and num2 == 21:
		return 150
	if num1 == 19 and num2 == 22:
		return 170
	if num1 == 19 and num2 == 23:
		return 75
	if num1 == 19 and num2 == 24:
		return 228
	if num1 == 19 and num2 == 25:
		return 243
	if num1 == 19 and num2 == 26:
		return 58
	if num1 == 19 and num2 == 27:
		return 84
	if num1 == 19 and num2 == 28:
		return 208
	if num1 == 19 and num2 == 29:
		return 87
	if num1 == 20 and num2 == 21:
		return 151
	if num1 == 20 and num2 == 22:
		return 171
	if num1 == 20 and num2 == 23:
		return 74
	if num1 == 20 and num2 == 24:
		return 229
	if num1 == 20 and num2 == 25:
		return 244
	if num1 == 20 and num2 == 26:
		return 57
	if num1 == 20 and num2 == 27:
		return 84
	if num1 == 20 and num2 == 28:
		return 209
	if num1 == 20 and num2 == 29:
		return 87
	if num1 == 21 and num2 == 22:
		return 92
	if num1 == 21 and num2 == 23:
		return 201
	if num1 == 21 and num2 == 24:
		return 84
	if num1 == 21 and num2 == 25:
		return 93
	if num1 == 21 and num2 == 26:
		return 185
	if num1 == 21 and num2 == 27:
		return 139
	if num1 == 21 and num2 == 28:
		return 82
	if num1 == 21 and num2 == 29:
		return 141
	if num1 == 22 and num2 == 23:
		return 240
	if num1 == 22 and num2 == 24:
		return 97
	if num1 == 22 and num2 == 25:
		return 128
	if num1 == 22 and num2 == 26:
		return 223
	if num1 == 22 and num2 == 27:
		return 201
	if num1 == 22 and num2 == 28:
		return 58
	if num1 == 22 and num2 == 29:
		return 204
	if num1 == 23 and num2 == 24:
		return 285
	if num1 == 23 and num2 == 25:
		return 293
	if num1 == 23 and num2 == 26:
		return 17
	if num1 == 23 and num2 == 27:
		return 76
	if num1 == 23 and num2 == 28:
		return 271
	if num1 == 23 and num2 == 29:
		return 76
	if num1 == 24 and num2 == 25:
		return 32
	if num1 == 24 and num2 == 26:
		return 268
	if num1 == 24 and num2 == 27:
		return 223
	if num1 == 24 and num2 == 28:
		return 39
	if num1 == 24 and num2 == 29:
		return 225
	if num1 == 25 and num2 == 26:
		return 278
	if num1 == 25 and num2 == 27:
		return 227
	if num1 == 25 and num2 == 28:
		return 72
	if num1 == 25 and num2 == 29:
		return 228
	if num1 == 26 and num2 == 27:
		return 66
	if num1 == 26 and num2 == 28:
		return 254
	if num1 == 26 and num2 == 29:
		return 67
	if num1 == 27 and num2 == 28:
		return 218
	if num1 == 27 and num2 == 29:
		return 3
	if num1 == 28 and num2 == 29:
		return 220
	else:
		return 0
		
ser = serial.Serial(0)

print(ser.name)
while(True):
	s = ser.read(30)

	print(s)

	ar = [s[i:i+1] for i in range(0,len(s))]

	dist = lookup(b'\x00', ar[1])

	for i in range(1,29):
		dist += lookup(ar[i], ar[i+1])
		
	dist += lookup(ar[29],b'\x00')
	print(str(dist))


	
		
		
		
		
