;;;;;;;;;;;;;;;;;;;start:欢迎画面:;;;;;;;;;;;;;;;;;;;;;;;;;
//S(Start)
	HS6=($85016,ac7,se1)
	HS7=($85015,ac7,se1)
	VS1=($85006,ac7,se1) 
	PRESS(HS6)
		LM("Mask1","hj_3_moxue.com",0);磨削界面加载
	END_PRESS	
	PRESS(HS7)
		LM("Mask0","hj_3_moxue.com",0);磨削界面加载
	END_PRESS
	PRESS(VS1)
		LM("Mask0")
	END_PRESS

//END

;;;;;;;;;;;;;;;;;;;MASK0:出厂信息:panel_0:;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask0/$85024/"panel_0_1_chs.png"/)

	DEF VAR1=(B///$85060,$85060,,/WR1,ac7,al0,fs2,li0,cb0///120,150,300/0,0,0/);机床型号
	DEF VAR2=(B///$85061,$85061,,/WR1,ac7,al0,fs2,li0,cb0///120,200,300/0,0,0/);出厂编号
	DEF VAR3=(B///$85062,$85062,,/WR1,ac7,al0,fs2,li0,cb0///120,250,300/0,0,0/);出厂日期
	HS8=($85005,ac7,se1);返回

	PRESS(HS8)
		EXIT
	END_PRESS

//END

