;;;;;;;;;;;;;;;;;;;齿型界面;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask0/$85023/"panel_8_1.png"/)
	DEF VAR0=(R/0,100//$85417,$85417,,$85043/WR2/"panel_8_1_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[1]"/330,30,110/440,30,110/,4);齿高
	DEF VAR1=(R/0,100//$85404,$85404,,$85043/WR2/"panel_8_2_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[2]"/330,50,110/440,50,110/,4);齿顶宽
	DEF VAR2=(R/0,90//$85402,$85402,,$85042/WR2/"panel_8_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[3]"/330,70,110/440,70,110/,4);左齿形角
	DEF VAR3=(R/0,90//$85403,$85403,,$85042/WR2/"panel_8_4_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[4]"/330,90,110/440,90,110/,4);右齿形角
	DEF VAR4=(R/0,90//$85418,$85418,,$85043/WR2/"panel_8_5_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[5]"/330,110,110/440,110,110/,4);左齿根圆弧半径
	DEF VAR5=(R/0,90//$85419,$85419,,$85043/WR2/"panel_8_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[6]"/330,130,110/440,130,110/,4);右齿根圆弧半径
	DEF VAR6=(R/0,90//$85420,$85420,,$85043/WR2/"panel_8_7_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[7]"/330,150,110/440,150,110/,4);左齿顶过渡圆弧半径
	DEF VAR7=(R/0,90//$85429,$85421,,$85043/WR2/"panel_8_8_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[8]"/330,170,110/440,170,110/,4);右齿顶过渡圆弧半径
	DEF VAR8=(R/0,90//$85405,$85405,,$85042/WR2/"panel_8_9_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[13]"/330,190,110/440,190,110/,4);拉出斜线角度
	DEF VAR9=(R///$85445,$85445,,$85042/WR2/"panel_8_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[9]"/100,220,110/210,220,110/,4);调整左角
	DEF VAR10=(R///$85446,$85446,,$85042/WR2/"panel_8_4_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[10]"/100,240,110/210,240,110/,4);调整右角
	DEF VAR11=(R/0,90//$85447,$85447,,$85042/WR1//"/NC/_N_NC_GD2_ACX/TRAP[11]"/330,220,110/440,220,110/3,4);当前左角
	DEF VAR12=(R/0,90//$85448,$85448,,$85042/WR1//"/NC/_N_NC_GD2_ACX/TRAP[12]"/330,240,110/440,240,110/3,4);当前右角
	DEF VAR13=(R/0,90//$85406,$85406,,$85043/WR2/"panel_8_5_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[14]"/70,270,120/210,270,110/,4);左齿根圆弧半径调整
	DEF VAR14=(R///$85407,$85407,,$85043/WR2/"panel_8_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[15]"/70,290,120/210,290,110/,4);右齿根圆弧半径调整
	DEF VAR15=(R///$85408,$85408,,$85043/WR1//"/NC/_N_NC_GD2_ACX/TRAP[16]"/300,270,120/440,270,110/3,4);当前左齿根圆弧半径
	DEF VAR16=(R/0,90//$85409,$85409,,$85043/WR1//"/NC/_N_NC_GD2_ACX/TRAP[17]"/300,290,120/440,290,110/3,4);当前右齿根圆弧半径
	DEF VAR17=(R///$85410,$85410,,$85043/WR2/"panel_8_7_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[18]"/70,320,120/210,320,110/,4);调整过渡左圆弧
	DEF VAR18=(R///$85411,$85411,,$85043/WR2/"panel_8_8_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[19]"/70,340,120/210,340,110/,4);调整过渡右圆弧
	DEF VAR19=(R/0,90//$85412,$85412,,$85043/WR1//"/NC/_N_NC_GD2_ACX/TRAP[20]"/300,320,120/440,320,110/3,4);当前过渡左圆弧
	DEF VAR20=(R/0,90//$85413,$85413,,$85043/WR1//"/NC/_N_NC_GD2_ACX/TRAP[21]"/300,340,120/440,340,110/3,4);当前过渡右圆弧
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[6]"/0,0,0/0,0,0/);修左侧砂轮滚轮圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[7]"/0,0,0/0,0,0/);修右侧砂轮滚轮右圆弧半径
	DEF VAR23=(I/*0=$85383,1=$85384,2=$85385//,,,/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[28]"/0,0,0/0,0,0/);齿形选择
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	;;按键定义
		VS8=($85005,ac7,se1)
		PRESS(VS8)
			LM("Mask2","hj_0_xiuzheng.com",0);修整界面
		END_PRESS
		CHANGE()
			CALL("UP1")
		END_CHANGE
		CHANGE(VAR19)
			CALL("UP2")
		END_CHANGE
		CHANGE(VAR20)
			CALL("UP3")
		END_CHANGE
		SUB(UP1)
			VAR11.VAL=VAR2.VAL+VAR9.VAL
			VAR12.VAL=VAR3.VAL+VAR10.VAL
			VAR15.VAL=VAR4.VAL+VAR13.VAL
			VAR16.VAL=VAR5.VAL+VAR14.VAL
			VAR19.VAL=VAR6.VAL+VAR17.VAL
			VAR20.VAL=VAR7.VAL+VAR18.VAL
		END_SUB
		SUB(UP2)
			IF VAR21.VAL>=VAR19.VAL
				VAR19.VAL=VAR21.VAL
			ENDIF
		END_SUB
		SUB(UP3)
			IF VAR22.VAL>=VAR20.VAL
				VAR20.VAL=VAR22.VAL
			ENDIF
		END_SUB
//END