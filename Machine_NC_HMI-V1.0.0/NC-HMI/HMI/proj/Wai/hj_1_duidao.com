;;;;;;;;;;;;;;;;;;;自动对刀界面;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask0/$85026/"panel_4_1_chs.png"/)
	DEF VAR0=(R/-100,100//$85529,$85529,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[2]"/330,10,110/440,10,110/);对刀结果调整
	DEF VAR4=(R/-500,500//$85528,$85528,,$85043/WR2,ac3/"panel_5_14_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[23]"/308,30,150/440,30,110/);内螺纹测头/开关与砂轮距离(Z向)
	DEF SIGNAL=(I/*0=$85014,1=$85013//$85534,$85534,,/WR1//"/Plc/DB2700.DBX1.0"/110,10,40/150,10,50/);测头信号

;;按键定义
	VS8=($85005,ac7,se1)
	PRESS(VS8)
		LM("Mask0","hj_1_moxue.com",0);磨削界面
	END_PRESS
//END

