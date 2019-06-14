;;;;;;;;;;;;;;;;;;;自动对刀,接近开关测量滚道-探头测量端面;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask0/$85026/"panel_4_1_chs.png"/)
	DEF VAR0=(R/-100,100//$85529,$85529,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[2]"/310,10,110/440,10,110/);对刀结果调整
	DEF VAR1=(R///$85528,$85528,,$85043/WR2/"panel_5_14_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[24]"/310,30,150/440,30,110/);接近开关中心与砂轮中心重合时Z轴坐标
	DEF VAR2=(R///$85543,$85541,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[26]"/310,50,110/440,50,110/);检测端面时X轴的安全坐标
	DEF VAR3=(R///$85544,$85542,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[27]"/310,70,110/440,70,110/);检测端面时Z轴的安全坐标

	DEF VAR4=(I/*0=$85041,1=$85040//"是否测量端面","是否测量端面",,/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[30]"/100,10,100/210,10,40/);自动对刀方式选择
	DEF BIAOJI=(R/*0=$85191,1=$85192//$85089,$85089,,/WR4//"/NC/_N_NC_GD2_ACX/GRIND[28]"/0,0,0/380,10,70/3,4);0=X向磨削/1=双齿面磨削

;;按键定义
	VS8=($85005,ac7,se1)
    PRESS(VS8)
        IF BIAOJI.VAL==0
			LM("Mask0","hj_3_moxue.com",0);磨削界面
		ELSE
			LM("Mask1","hj_3_moxue.com",0);磨削界面
		ENDIF
    END_PRESS

;;CHANGE事件
	CHANGE(VAR4)
		IF VAR4.VAL==0
			VAR2.WR=4
			VAR3.WR=4
		ELSE
			VAR2.WR=2
			VAR3.WR=2
		ENDI
	END_CHANGE
//END





