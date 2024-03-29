;;;;;;;;;;;;;;;;;;;修整界面,用于外螺纹成型轮V修整;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask0/$85711/"panel_2_2_chs.png"/)
	;;修整参数
		DEF VAR_SL0=(I/*0=$85327,1=$85328//$85310,$85310,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[8]"/355,10,110/440,10,60/3,4);新旧砂轮
		DEF VAR_SL1=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[11]"/355,30,110/440,30,60/7,4);粗修次数
		DEF VAR_SL2=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[12]"/355,50,110/440,50,110/7,4);粗修量
		DEF VAR_SL3=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[13]"/355,70,110/440,70,110/7,4);粗修速度
		DEF VAR_SL4=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[14]"/355,100,110/440,100,60/7,4);精修次数
		DEF VAR_SL5=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[15]"/355,120,110/440,120,110/7,4);精修量
		DEF VAR_SL6=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[16]"/355,140,110/440,140,110/7,4);精修速度

		DEF VAR_SL8=(R/0,1000//$85319,$85319,,$85043/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/340,270,110/440,270,110/6,4);新砂轮直径
		DEF VAR_SL9=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,290,110/440,290,110/3,4);砂轮当前直径
		DEF GUANCHA_0=(R///$85322,$85321,,$85043/WR2,ac3/"panel_2_3_2_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[1]"/325,310,110/440,310,110/6,4);当前修整接触点坐标
		DEF VAR_SL10=(R/0,80//$85317,$85317,,$85046/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[18]"/340,250,110/440,250,110/7,4);砂轮线速度
		DEF VAR_SL11=(R2///$85221,$85221,,$85044/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[26]"/355,230,110/440,230,110/3,4);修整时砂轮转速
		DEF VAR_SL12=(R2///$85304,$85304,,$85044/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/295,330,130/440,330,130/7,4);最大砂轮磨削直径
		DEF VAR_SL13=(R2///$85303,$85303,,$85044/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[4]"/295,350,130/440,350,130/7,4);最小砂轮磨削直径
	;;滚轮参数
		DEF VAR_GL0=(R///$85627,$85601,,$85043/WR1/"panel_2_2_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[6]"/40,230,110/120,230,110/3,4);修整接触位置基准(砂轮主轴中心与滚轮圆弧顶部(金刚笔尖)重合时X轴坐标)
		DEF VAR_GL0_1=(R///$85313,$85312,,$85043/WR2,ac3/"panel_2_15_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[36]"/40,250,110/120,250,110/6,4);成型轮齿形高度(滚轮外圆到齿形圆弧顶部的高度)
		DEF VAR_GL0_2=(R///$85628,$85629,,$85043/WR2,ac3/"panel_2_16_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[37]"/20,270,120/120,270,110/6,4);手动对出的新砂轮触碰滚轮外圆时X轴坐标
		DEF VAR_GL1=(R///$85626,$85630,,$85043/WR2,ac3/"panel_2_0_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[25]"/20,290,120/120,290,110/6,4);手动对出的新砂轮触碰滚轮滚道时X轴坐标
		DEF VAR_GL2=(R/0,5//$85604,$85604,,$85047/WR2,ac3/"panel_2_4_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[17]"/355,170,110/440,170,110/6,4);滚压轮停留时间
		DEF VAR_GL3=(R/0,500//$85620,$85620,,$85043/WR2,ac3/"panel_2_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[9]"/25,310,110/120,310,110/6,4);修整轮直径
		DEF VAR_GL4=(R/0,60//$85621,$85621,,$85046/WR2/"panel_2_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[10]"/10,350,110/120,350,110/7,4);修整轮线速度
		DEF VAR_GL5=(R2///$85600,$85600,,$85044/WR1//"$R[297]"/25,330,110/120,330,110/3,4);修整轮转速
		DEF VAR_GL6=(R///$85607,$85608,,$85043/WR4/"panel_2_1_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[7]"/40,210,110/120,210,110/7,4);砂轮中心与滚轮中心水平重合时Z轴坐标

	;;定义按键
	VS8=($85005,ac7,se1)
	PRESS(VS8)
		LM("Mask0","hj_1_moxue.com",0);磨削界面
	END_PRESS
	;;CHANGE事件
		CHANGE(VAR_GL0_1)
			CALL("UP5")	
		END_CHANGE	
		CHANGE(VAR_GL0_2)
			CALL("UP5")	
		END_CHANGE	
		CHANGE(VAR_SL8)
			CALL("UP5")	
		END_CHANGE
		CHANGE(VAR_SL9)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_SL10)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_SL11)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_GL3)
			CALL("UP4")	
		END_CHANGE
		CHANGE(VAR_GL4)
			CALL("UP4")	
		END_CHANGE
		CHANGE(VAR_GL5)
			CALL("UP4")	
		END_CHANGE

		CHANGE(VAR_GL0);;修整基准
			CALL("UP2")	
		END_CHANGE
		CHANGE(VAR_GL1);;新砂轮对出的接触点坐标
			CALL("UP2")	
		END_CHANGE
		CHANGE(VAR_SL0);;新旧砂轮
			CALL("UP2")	
		END_CHANGE
		CHANGE(GUANCHA_0);;修整接触点
			CALL("UP3")	
		END_CHANGE

		SUB(UP1);;计算修砂轮转速
			VAR_SL11=VAR_SL10*60000/(PI*VAR_SL9)
		END_SUB
		SUB(UP2)
			IF VAR_SL0.VAL==0;新砂轮时当前砂轮直径等于新砂轮直径,计算修整接触点
				VAR_SL9.VAL=2*(VAR_GL1.VAL-VAR_GL0.VAL);计算当前砂轮直径
				GUANCHA_0.VAL=VAR_GL0.VAL+VAR_SL9.VAL/2;依据当前砂轮直径计算修整接触点坐标
			ELSE
				VAR_SL9.VAL=2*(GUANCHA_0.VAL-VAR_GL0.VAL);计算当前砂轮直径
			ENDIF
		END_SUB
		SUB(UP3)
			VAR_SL9.VAL=2*(GUANCHA_0-VAR_GL0.VAL);计算当前砂轮直径
		END_SUB
		SUB(UP4)
			VAR_GL5=VAR_GL4*60000/(PI*VAR_GL3)
		END_SUB
		SUB(UP5)
			VAR_GL0.VAL=VAR_GL0_2.VAL-VAR_GL0_1.VAL-VAR_SL8.VAL/2
		END_SUB
//END

;;;;;;;;;;;;;;;;;;;修整界面,用于外螺纹成型轮Z向前修整;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask1/$85711/"panel_2_2_chs.png"/)
	;;修整参数
		DEF VAR_SL0=(I/*0=$85327,1=$85328//$85310,$85310,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[8]"/355,10,110/440,10,60/3,4);新旧砂轮
		DEF VAR_SL1=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[11]"/355,30,110/440,30,60/7,4);粗修次数
		DEF VAR_SL2=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[12]"/355,50,110/440,50,110/7,4);粗修量
		DEF VAR_SL3=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[13]"/355,70,110/440,70,110/7,4);粗修速度
		DEF VAR_SL4=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[14]"/355,100,110/440,100,60/7,4);精修次数
		DEF VAR_SL5=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[15]"/355,120,110/440,120,110/7,4);精修量
		DEF VAR_SL6=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[16]"/355,140,110/440,140,110/7,4);精修速度

		DEF VAR_SL8=(R/0,1000//$85319,$85319,,$85043/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/340,270,110/440,270,110/6,4);新砂轮直径
		DEF VAR_SL9=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,290,110/440,290,110/3,4);砂轮当前直径
		DEF GUANCHA_0=(R///$85322,$85321,,$85043/WR2,ac3/"panel_2_3_2_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[1]"/325,310,110/440,310,110/6,4);观察参数(当前砂轮直径对应的修整接触点坐标)
		DEF VAR_SL10=(R/0,80//$85317,$85317,,$85046/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[18]"/340,250,110/440,250,110/7,4);砂轮线速度
		DEF VAR_SL11=(R2///$85221,$85221,,$85044/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[26]"/355,230,110/440,230,110/3,4);修整时砂轮转速
		DEF VAR_SL12=(R2///$85304,$85304,,$85044/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/295,330,130/440,330,110/7,4);最大砂轮磨削直径
		DEF VAR_SL13=(R2///$85303,$85303,,$85044/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[4]"/295,350,130/440,350,110/7,4);最小砂轮磨削直径
	;;滚轮参数
		DEF VAR_GL0=(R///$85627,$85601,,$85043/WR1/"panel_2_2_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[6]"/40,230,110/120,230,110/3,4);修整接触位置基准(砂轮主轴中心与滚轮圆弧顶部(金刚笔尖)重合时X轴坐标)
		DEF VAR_GL0_1=(R///$85313,$85312,,$85043/WR2,ac3/"panel_2_15_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[36]"/40,250,110/120,250,110/6,4);成型轮齿形高度(滚轮外圆到齿形圆弧顶部的高度)
		DEF VAR_GL0_2=(R///$85628,$85629,,$85043/WR2,ac3/"panel_2_16_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[37]"/20,270,120/120,270,110/6,4);手动对出的新砂轮触碰滚轮外圆时X轴坐标
		DEF VAR_GL1=(R///$85626,$85630,,$85043/WR2,ac3/"panel_2_0_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[25]"/20,290,120/120,290,110/6,4);手动对出的新砂轮触碰滚轮滚道时X轴坐标
		DEF VAR_GL2=(R/0,5//$85604,$85604,,$85047/WR2,ac3/"panel_2_4_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[17]"/355,170,110/440,170,110/6,4);滚压轮停留时间
		DEF VAR_GL3=(R/0,500//$85620,$85620,,$85043/WR2,ac3/"panel_2_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[9]"/25,310,110/120,310,110/6,4);修整轮直径
		DEF VAR_GL4=(R/0,60//$85621,$85621,,$85046/WR2/"panel_2_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[10]"/10,350,110/120,350,110/7,4);修整轮线速度
		DEF VAR_GL5=(R2///$85600,$85600,,$85044/WR1//"$R[297]"/25,330,110/120,330,110/3,4);修整轮转速
		DEF VAR_GL6=(R///$85607,$85608,,$85043/WR2,ac3/"panel_2_1_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[7]"/40,210,110/120,210,110/6,4);砂轮中心与滚轮中心水平重合时Z轴坐标	
	;;定义按键
	VS8=($85005,ac7,se1)
	PRESS(VS8)
		LM("Mask0","hj_1_moxue.com",0);磨削界面
	END_PRESS
	;;CHANGE事件
		CHANGE(VAR_SL8)
			CALL("UP5")	
		END_CHANGE
		CHANGE(VAR_SL9)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_SL10)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_SL11)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_GL0_1)
			CALL("UP5")	
		END_CHANGE
		CHANGE(VAR_GL0_2)
			CALL("UP5")	
		END_CHANGE
		CHANGE(VAR_GL3)
			CALL("UP4")	
		END_CHANGE
		CHANGE(VAR_GL4)
			CALL("UP4")	
		END_CHANGE
		CHANGE(VAR_GL5)
			CALL("UP4")	
		END_CHANGE
		CHANGE(VAR_GL0);;修整基准
			CALL("UP2")	
		END_CHANGE
		CHANGE(VAR_GL1);;新砂轮对出的接触点坐标
			CALL("UP2")	
		END_CHANGE
		CHANGE(VAR_SL0);;新旧砂轮
			CALL("UP2")	
		END_CHANGE
		CHANGE(GUANCHA_0);;修整接触点
			CALL("UP3")	
		END_CHANGE
		SUB(UP1)
			VAR_SL11=VAR_SL10*60000/(PI*VAR_SL9)
		END_SUB
		END_SUB
		SUB(UP2)
			IF VAR_SL0.VAL==0;新砂轮
				VAR_SL9.VAL=2*(VAR_GL1.VAL-VAR_GL0.VAL);计算当前砂轮直径
				GUANCHA_0.VAL=VAR_GL0.VAL+VAR_SL9.VAL/2
			ELSE
				VAR_SL9.VAL=2*(GUANCHA_0.VAL-VAR_GL0.VAL);计算当前砂轮直径
			ENDIF
		END_SUB
		SUB(UP3)
			VAR_SL9.VAL=2*(GUANCHA_0.VAL-VAR_GL0.VAL);计算当前砂轮直径
		END_SUB
		SUB(UP4)
			VAR_GL5.VAL=VAR_GL4*60000/(PI*VAR_GL3.VAL)
		END_SUB
		SUB(UP5)
			VAR_GL0.VAL=VAR_GL0_2.VAL-VAR_GL0_1.VAL-VAR_SL8.VAL/2
		END_SUB

//END


;;;;;;;;;;;;;;;;;;;修整界面,用于外螺纹X-Z与V-W插补修整;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask2/$85711/"panel_2_8_chs.png"/)
	;;修整参数
		DEF VAR_SL0_0=(I/*0=$85383,1=$85384,2=$85385//,,,/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[28]"/0,0,0/355,10,60/6,4);齿形选择
		DEF VAR_SL0=(I/*0=$85327,1=$85328//,,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[8]"/355,10,110/440,10,60/7,4);新旧砂轮
		DEF VAR_SL1=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[11]"/355,30,110/440,30,60/7,4);粗修次数
		DEF VAR_SL2=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[12]"/355,50,110/440,50,110/7,4);粗修量
		DEF VAR_SL3=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[13]"/355,70,110/440,70,110/7,4);粗修速度
		DEF VAR_SL4=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[14]"/355,95,110/440,95,60/7,4);精修次数
		DEF VAR_SL5=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[15]"/355,115,110/440,115,110/7,4);精修量
		DEF VAR_SL6=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[16]"/355,135,110/440,135,110/7,4);精修速度
		DEF VAR_SL7=(R/0,200//$85316,$85316,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[30]"/355,250,110/440,250,110/7,4);砂轮宽度
		DEF VAR_SL8=(R/0,1000//$85319,$85319,,$85043/WR2,ac3//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/340,270,110/440,270,110/6,4);新砂轮直径
		DEF VAR_SL9=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,290,110/440,290,110/3,4);砂轮当前直径
		DEF GUANCHA_0=(R///$85322,$85321,,$85043/WR2,ac3//"/NC/_N_NC_GD2_ACX/POSITION[1]"/325,310,110/440,310,110/6,4);当前修整接触点(当前砂轮直径对应的修整接触点坐标)
		DEF VAR_SL10=(R/0,80//$85317,$85317,,$85046/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[18]"/340,180,110/440,180,110/7,4);砂轮线速度
		DEF VAR_SL11=(R2///$85221,$85221,,$85044/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[26]"/355,160,110/440,160,110/3,4);修整时砂轮转速
		DEF VAR_SL12=(R2///$85304,$85304,,$85044/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/295,330,130/440,330,110/7,4);最大砂轮磨削直径
		DEF VAR_SL13=(R2///$85303,$85303,,$85044/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[4]"/295,350,130/440,350,110/7,4);最小砂轮磨削直径		
	;;滚轮参数
		DEF VAR_JZ0=(R///$85609,$85608,,$85043/WR2,ac3/"panel_2_7_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[7]"/10,200,110/110,200,110/6,4);砂轮中心与滚轮中心水平重合时Z轴坐标	
		DEF VAR_JZ1=(R///$85627,$85601,,$85043/WR3/"panel_2_8_chs.png"/"/NC/_N_NC_GD2_ACX/POSITION[6]"/10,220,110/110,220,110/3,4);修整接触位置基准(砂轮主轴中心与滚轮圆弧顶部(金刚笔尖)重合时X轴坐标)
		DEF VAR_JZ2=(R///$85626,$85602,,$85043/WR2,ac3/"panel_2_9_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[25]"/10,240,110/110,240,110/6,4);手动对出的新砂轮触碰滚轮时X轴坐标	
		DEF VAR_GL1=(R///$85610,$85610,,$85043/WR4,ac3/"panel_2_10_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[6]"/10,270,50/110,270,110/6,4);修整轮左侧圆弧半径
		DEF VAR_GL2=(R///$85611,$85611,,$85043/WR4,ac3/"panel_2_11_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[7]"/10,290,50/110,290,110/6,4);修整轮右侧圆弧半径
		DEF VAR_GL1_1=(R///$85610,$85610,,$85043/WR4,ac3/"panel_2_10_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[7]"/10,270,50/110,270,110/6,4);修整轮左侧圆弧半径
		DEF VAR_GL2_1=(R///$85611,$85611,,$85043/WR4,ac3/"panel_2_11_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[6]"/10,290,50/110,290,110/6,4);修整轮右侧圆弧半径
		DEF VAR_GL3=(R///$85614,$85614,,$85043/WR2,ac3/"panel_2_12_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[29]"/10,310,110/110,310,110/6,4);修整轮左右圆弧圆心间距
		DEF VAR_GL4=(R///$85613,$85613,,$85043/WR2,ac3/"panel_2_13_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[5]"/10,330,110/110,330,110/6,4);左右滚轮高度差
		DEF VAR_GL5=(R/0,500//$85620,$85620,,$85043/WR2,ac3/"panel_2_5_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[9]"/10,350,110/110,350,110/6,4);修整轮直径
		DEF VAR_GL6=(R2///$85600,$85600,,$85044/WR1//"$R[297]"/340,205,110/440,205,110/3,4);修整轮转速
		DEF VAR_GL7=(R/0,60//$85621,$85621,,$85046/WR2/"panel_2_6_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[10]"/325,225,110/440,225,110/7,4);修整轮线速度
	;;定义按键		
		VS1=($85023,ac7,se1)
		VS8=($85005,ac7,se1)
		PRESS(VS1)
			IF (VAR_SL0_0.VAL==0)OR(VAR_SL0_0==1)
				LM("Mask0","hj_1_trap.com",0);修整界面
			ENDIF
			IF VAR_SL0_0.VAL==2
				LM("Mask0","hj_1_darc.com",0);修整界面
			ENDIF
		END_PRESS
		PRESS(VS8)
			LM("Mask0","hj_1_moxue.com",0);磨削界面
		END_PRESS
	;;CHANGE事件
		CHANGE(VAR_SL8)
			CALL("UP6")	
		END_CHANGE
		CHANGE(VAR_SL9)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_SL10)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_SL11)
			CALL("UP1")	
		END_CHANGE
		CHANGE(VAR_GL5)
			CALL("UP5")	
		END_CHANGE
		CHANGE(VAR_GL6)
			CALL("UP5")	
		END_CHANGE
		CHANGE(VAR_GL7)
			CALL("UP5")	
		END_CHANGE

		CHANGE(VAR_JZ1);;修整基准
			CALL("UP2")	
		END_CHANGE
		CHANGE(VAR_JZ2);;新砂轮对出的接触点坐标
			CALL("UP2")	
			CALL("UP6")	
		END_CHANGE
		CHANGE(VAR_SL0);;新旧砂轮
			CALL("UP2")	
		END_CHANGE
		CHANGE(GUANCHA_0);;修整接触点
			CALL("UP3")	
		END_CHANGE
		CHANGE(VAR_GL3);;修整接触点
			CALL("UP4")	
		END_CHANGE

		SUB(UP1);;计算修砂轮转速
			VAR_SL11.VAL=VAR_SL10.VAL*60000/(PI*VAR_SL9.VAL)
		END_SUB
		SUB(UP2)
			IF VAR_SL0.VAL==0;新砂轮
				VAR_SL9.VAL=2*(VAR_JZ2.VAL-VAR_JZ1.VAL);计算当前砂轮直径
				GUANCHA_0.VAL=VAR_JZ1.VAL+VAR_SL9.VAL/2;依据当前砂轮直径与修整基准计算修整接触点
			ELSE
				VAR_SL9.VAL=2*(GUANCHA_0.VAL-VAR_JZ1.VAL);计算当前砂轮直径
			ENDIF
		END_SUB
		SUB(UP3)
			VAR_SL9.VAL=2*(GUANCHA_0-VAR_JZ1.VAL);计算当前砂轮直径
		END_SUB
		SUB(UP4)
			IF VAR_GL3.VAL<=0
				VAR_GL1.WR=4
				VAR_GL2.WR=4
				VAR_GL1_1.WR=2
				VAR_GL2_1.WR=2
			ELSE
				VAR_GL1.WR=2
				VAR_GL2.WR=2
				VAR_GL1_1.WR=4
				VAR_GL2_1.WR=4
			ENDIF
		END_SUB
		SUB(UP5);;计算修整轮转速
			VAR_GL6.VAL=VAR_GL7.VAL*60000/(PI*VAR_GL5.VAL)
		END_SUB
		SUB(UP6)
			 VAR_JZ1.VAL=VAR_JZ2.VAL-VAR_SL8.VAL/2
		END_SUB
//END





