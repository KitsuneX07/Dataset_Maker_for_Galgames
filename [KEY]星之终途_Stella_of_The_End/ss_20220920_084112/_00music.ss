//���y�ӏ�	��ɂb�f���[�h����Ă΂��\��
//��������������������������������������������������������
#Z00

	$th_x.sets(1, 121, 121, 121, 121, 121, 121, 121, 121, 121, 121, 699, 699, 699, 699, 699, 699, 699, 699, 699, 699,1276,1276,1276,1276,1276,1276,1276,1276,1276,1276)
	$th_y.sets(1, 187, 243, 299, 355, 411, 467, 523, 579, 635, 691, 187, 243, 299, 355, 411, 467, 523, 579, 635, 691, 187, 243, 299, 355, 411, 467, 523, 579, 635, 691)
	gosub #LOAD_common
	$stage = 1
	//���C�v
	$$wipe_prm_set(500, <WIPE_BG>, 0)
	$$WIPE_EXEC(1)
	$$wipe_prm_clr

#sel_loop
	stage[$stage].objbtngroup[<SEL2>].init
	stage[$stage].objbtngroup[<SEL2>].start_cancel	//�I�����J�n
	while(1){
		//##�z�C�[�����܂킵�����ǂ����̃`�F�b�N
		$tmp[01] = front.objbtngroup[<sel2>].get_hit_no
		if(mouse.wheel != 0){	//�X���C�_�̉��n�ȊO�Ńz�C�[������ĂĂ����������@�c�n�Y
			switch($tmp[01]){	//���s���� 
				case(008)	$$wh_set(stage[$stage].object[08].child[03].x_rep[0],0,0, <SL00_MAX>,255,$tmp[01])	$$PRM_SLD_SET($tmp[01])
			}
		}
		$tmp[00]= stage[$stage].objbtngroup[<sel2>].get_pushed_no	//##�{�^���������ꂽ�����Ŕ�������q�͂������i���������ł͂Ȃ��j
		switch($tmp[00]){
			case(008)	$$SLD_LOOP(stage[$stage].object[08],$tmp[00],<SL00_MAX>)
		}
		$tmp[00]= stage[$stage].objbtngroup[<sel2>].get_decided_no	//##�{�^���E�`�F�b�N�{�b�N�X�ނ̏�Ԏ擾
		switch($tmp[00]){
			case(-1)	syscom.return_to_menu(0,0,1)	//�E�N���Ń^�C�g����
			case(01)	break	//�b�f���[�h�ɖ߂�
			case(02)	
			case(03)	syscom.return_to_menu(0,0,1)
			case(04)	$$mus_play(<GR_MUS>) stage[$stage].object[10].disp = 1
			case(05)	bgm.stop(300)	stage[$stage].object[<GR_MUS>+10].set_button_state_normal stage[$stage].object[10].disp = 0
			case(06)	<GR_MUS> = $$loop_dec(01,<GR_MUS>,30)	$$mus_play(<GR_MUS>) stage[$stage].object[10].disp = 1
			case(07)	<GR_MUS> = $$loop_inc(01,<GR_MUS>,30)	$$mus_play(<GR_MUS>) stage[$stage].object[10].disp = 1
			//����p�l����

		}
		if(($tmp[00] >= 101 )&&($tmp[00] <= 200 )){	//101�`200�@�Ȗ��{�^��
			$$mus_play($tmp[00]-100)
			stage[$stage].object[10].disp = 1
		}
		IF(stage[$stage].objbtngroup[<SEL2>].get_decided_no!= -2){
			stage[$stage].objbtngroup[<SEL2>].init
			stage[$stage].objbtngroup[<SEL2>].start_cancel	//�I�����J�n
		}
		input.next
		disp
	}
	return

#LOAD_common
	$stage = 0
	stage[$stage].object[00].create("_GAL_mus_base",1,000,000)
	$$OBJBTN_SET(stage[$stage].object[01],"_gal_mode_CG"		,1, 000,000,255,<SEL2>,01,1,1,0,0,0)	//�����{�^��
	$$OBJBTN_SET(stage[$stage].object[02],"_gal_mode_MUS"	,1, 000,000,255,<SEL2>,02,1,1,0,1,0)	
	$$OBJBTN_SET(stage[$stage].object[03],"_gal_mode_title"	,1, 000,000,255,<SEL2>,03,1,1,0,0,0)	

	$$OBJBTN_SET(stage[$stage].object[04],"_gal_mus_play"	,1, 000,000,255,<SEL2>,04,0,1,0,0,0)	
	$$OBJBTN_SET(stage[$stage].object[05],"_gal_mus_stop"	,1, 000,000,255,<SEL2>,05,0,1,0,0,0)	
	$$OBJBTN_SET(stage[$stage].object[06],"_gal_mus_rev"		,1, 000,000,255,<SEL2>,06,0,1,0,0,0)	
	$$OBJBTN_SET(stage[$stage].object[07],"_gal_mus_next"	,1, 000,000,255,<SEL2>,07,0,1,0,0,0)	
	$$SLIDE_set_load(stage[$stage].object[08],	977,910,	008)	$$PRM_SLD_SET(008)

	stage[$stage].object[10].create("_gal_mus_credit"		,1, 000,000,0)		//�ȃN���W�b�g

	$$OBJBTN_SET(stage[$stage].object[11],"_GAL_mus02"		,1,$th_x[01],$th_y[01],255,<SEL2>,101,1,1,0,0,0)	//bgm01		01
	$$OBJBTN_SET(stage[$stage].object[12],"_GAL_mus03"		,1,$th_x[02],$th_y[02],255,<SEL2>,102,1,1,0,0,0)	//bgm02		02
	$$OBJBTN_SET(stage[$stage].object[13],"_GAL_mus04"		,1,$th_x[03],$th_y[03],255,<SEL2>,103,1,1,0,0,0)	//bgm07		03
	$$OBJBTN_SET(stage[$stage].object[14],"_GAL_mus05"		,1,$th_x[04],$th_y[04],255,<SEL2>,104,1,1,0,0,0)	//bgm23		04
	$$OBJBTN_SET(stage[$stage].object[15],"_GAL_mus06"		,1,$th_x[05],$th_y[05],255,<SEL2>,105,1,1,0,0,0)	//bgm17		05
	$$OBJBTN_SET(stage[$stage].object[16],"_GAL_mus07"		,1,$th_x[06],$th_y[06],255,<SEL2>,106,1,1,0,0,0)	//bgm18		06
	$$OBJBTN_SET(stage[$stage].object[17],"_GAL_mus08"		,1,$th_x[07],$th_y[07],255,<SEL2>,107,1,1,0,0,0)	//bgm04		07
	$$OBJBTN_SET(stage[$stage].object[18],"_GAL_mus09"		,1,$th_x[08],$th_y[08],255,<SEL2>,108,1,1,0,0,0)	//bgm27		08
	$$OBJBTN_SET(stage[$stage].object[19],"_GAL_mus10"		,1,$th_x[09],$th_y[09],255,<SEL2>,109,1,1,0,0,0)	//bgm15		09
	$$OBJBTN_SET(stage[$stage].object[20],"_GAL_mus11"		,1,$th_x[10],$th_y[10],255,<SEL2>,110,1,1,0,0,0)	//bgm06		10
	$$OBJBTN_SET(stage[$stage].object[21],"_GAL_mus12"		,1,$th_x[11],$th_y[11],255,<SEL2>,111,1,1,0,0,0)	//bgm19		11
	$$OBJBTN_SET(stage[$stage].object[22],"_GAL_mus13"		,1,$th_x[12],$th_y[12],255,<SEL2>,112,1,1,0,0,0)	//bgm09		12
	$$OBJBTN_SET(stage[$stage].object[23],"_GAL_mus14"		,1,$th_x[13],$th_y[13],255,<SEL2>,113,1,1,0,0,0)	//bgm08		13
	$$OBJBTN_SET(stage[$stage].object[24],"_GAL_mus15"		,1,$th_x[14],$th_y[14],255,<SEL2>,114,1,1,0,0,0)	//bgm10		14
	$$OBJBTN_SET(stage[$stage].object[25],"_GAL_mus16"		,1,$th_x[15],$th_y[15],255,<SEL2>,115,1,1,0,0,0)	//bgm11B	15
	$$OBJBTN_SET(stage[$stage].object[26],"_GAL_mus17"		,1,$th_x[16],$th_y[16],255,<SEL2>,116,1,1,0,0,0)	//bgm11		16
	$$OBJBTN_SET(stage[$stage].object[27],"_GAL_mus18"		,1,$th_x[17],$th_y[17],255,<SEL2>,117,1,1,0,0,0)	//bgm24		17
	$$OBJBTN_SET(stage[$stage].object[28],"_GAL_mus19"		,1,$th_x[18],$th_y[18],255,<SEL2>,118,1,1,0,0,0)	//bgm26		18
	$$OBJBTN_SET(stage[$stage].object[29],"_GAL_mus20"		,1,$th_x[19],$th_y[19],255,<SEL2>,119,1,1,0,0,0)	//bgm14		19
	$$OBJBTN_SET(stage[$stage].object[30],"_GAL_mus22"		,1,$th_x[20],$th_y[20],255,<SEL2>,120,1,1,0,0,0)	//bgm22		20
	$$OBJBTN_SET(stage[$stage].object[31],"_GAL_mus23"		,1,$th_x[21],$th_y[21],255,<SEL2>,121,1,1,0,0,0)	//bgm21		21
	$$OBJBTN_SET(stage[$stage].object[32],"_GAL_mus24"		,1,$th_x[22],$th_y[22],255,<SEL2>,122,1,1,0,0,0)	//bgm13		22
	$$OBJBTN_SET(stage[$stage].object[33],"_GAL_mus25"		,1,$th_x[23],$th_y[23],255,<SEL2>,123,1,1,0,0,0)	//bgm25		05
	$$OBJBTN_SET(stage[$stage].object[34],"_GAL_mus26"		,1,$th_x[24],$th_y[24],255,<SEL2>,124,1,1,0,0,0)	//bgm16		24
	$$OBJBTN_SET(stage[$stage].object[35],"_GAL_mus27"		,1,$th_x[25],$th_y[25],255,<SEL2>,125,1,1,0,0,0)	//bgm05		25
	$$OBJBTN_SET(stage[$stage].object[36],"_GAL_mus28"		,1,$th_x[26],$th_y[26],255,<SEL2>,126,1,1,0,0,0)	//bgm12		26
	$$OBJBTN_SET(stage[$stage].object[37],"_GAL_mus30"		,1,$th_x[27],$th_y[27],255,<SEL2>,127,1,1,0,0,0)	//bgm03		27
	$$OBJBTN_SET(stage[$stage].object[38],"_GAL_mus01"		,1,$th_x[28],$th_y[28],255,<SEL2>,128,1,1,0,0,0)	//song01		28
	$$OBJBTN_SET(stage[$stage].object[39],"_GAL_mus21"		,1,$th_x[29],$th_y[29],255,<SEL2>,129,1,1,0,0,0)	//song03		29
	$$OBJBTN_SET(stage[$stage].object[40],"_GAL_mus29"		,1,$th_x[30],$th_y[30],255,<SEL2>,130,1,1,0,0,0)	//song02		30

	stage[$stage].object[<GR_MUS>+10].set_button_state_select
	stage[$stage].object[10].patno = <GR_MUS>
	//�Ȃ��Ȃ��Ă����炻�̃{�^�����A�N�e�B�u�ɂ���B

return
//<GR_MUS>	//�Ȕԍ��X�g�b�N

//�y�ȍĐ�
command $$mus_play(property $mus_no:int){
	property $ctmp :intlist[10]
	<GR_MUS> = $mus_no
	stage[$stage].object[10].patno = $mus_no

	for($ctmp[00]=11, $ctmp[00] <= 40 ,$ctmp[00] +=1){
		stage[$stage].object[$ctmp[00]].set_button_state_normal
	}

	stage[$stage].object[$mus_no + 10].set_button_state_select
	switch($mus_no){
		case(01)	@bgm(bgm01)
		case(02)	@bgm(bgm02)
		case(03)	@bgm(bgm07)
		case(04)	@bgm(bgm23)
		case(05)	@bgm(bgm17)
		case(06)	@bgm(bgm18)
		case(07)	@bgm(bgm04)
		case(08)	@bgm(bgm27)
		case(09)	@bgm(bgm15)
		case(10)	@bgm(bgm06)
		case(11)	@bgm(bgm19)
		case(12)	@bgm(bgm09)
		case(13)	@bgm(bgm08)
		case(14)	@bgm(bgm10)
		case(15)	@bgm(bgm11B)
		case(16)	@bgm(bgm11)
		case(17)	@bgm(bgm24)
		case(18)	@bgm(bgm26)
		case(19)	@bgm(bgm14)
		case(20)	@bgm(bgm22)
		case(21)	@bgm(bgm21)
		case(22)	@bgm(bgm13)
		case(23)	@bgm(bgm25)
		case(24)	@bgm(bgm16)
		case(25)	@bgm(bgm05)
		case(26)	@bgm(bgm12)
		case(27)	@bgm(bgm03)
		case(28)	@bgm(song01)
		case(29)	@bgm(song03)
		case(30)	@bgm(song02)
	}
	return
}

//�X���C�_�p�[�c�ǂݍ���
//##�X���C�_�[�E�X���C�_�[���n���ꊇ�ŃZ�b�g����R�}���h
command $$SLIDE_set_load(
		property $obj		: object,	//�x�[�X�I�u�W�F�N�g
		property $x			: int,		//��{�w���W
		property $y			: int,		//��{�x���W
		property $SLD_B_NO	: int		//���X���C�_���n�̔���ԍ�
	){
		property $SLD_X		//�X���C�_�[�̕␳���W
		property $SLD_Y		//
		property $SLD_B_X	//�X���C�_�[���n�̕␳���W
		property $SLD_B_Y	//

		$SLD_X	= 00	//�X���C�_�[�̕␳���W
		$SLD_Y	= 00	//
		$obj.init
		$obj.set_pos($x, $y)
		$obj.disp=1
		$obj.child.resize(4)	//�q�u�W�F�N�g��\��
	
		$obj.child[00].create("_GAL_mus_bar",1,$SLD_X, $SLD_Y,00)															//00_�X���C�_
		$obj.child[01].create("_GAL_mus_bar",1,$SLD_X, $SLD_Y,10)	$obj.child[01].set_src_clip(1,000,000, 000,12)			//01_�X���C�_
		$$OBJBTN_RECT($obj.child[02],1,$SLD_X-15, $SLD_Y-20, <SL00_MAX>+30, 40,000,<SEL2>,$SLD_B_NO,1,-1)			//02_�X���C�_���n(����)
		$obj.child[03].create("_gal_mus_sld",1,$SLD_X, $SLD_Y+1,00)	$obj.child[03].x_rep.resize(1)							//03_�X���C�_(��{�^��)
		return
	}
//��������������������������������������������������������
//�X���C�_�[�̉������ςȂ����[�v����R�}���h
command $$SLD_LOOP(
	property	$obj_base : object,	//�x�[�X�Ƃ���I�u�W�F�N�g�̎w��
	property	$obj_base_no : int,	//����Ɏg���{�^���ԍ�
	property	$sld_max	: int	//�X���C�_�̍ő�l
	){
		property	$SLD_X : int		//�X���C�_�̂w���W�p�ϐ���p��
		$SLD_X = mouse.pos_x - $obj_base.x - $obj_base.child[03].x	//���̂Q�s�ŁA�X���C�_�����N���b�N�����̏ꏊ�ɃX���C�_���ړ�������@�����������Ă���
		$$sld_pos_set($obj_base,math.limit(00,$SLD_X,$sld_max))		//�I�u�W�F�N�g�̍��W�ړ��݂̂ŁA�p�����^�̕ύX�̓��[�v���Ɉ�C

		$m_diff_x=$obj_base.child[03].x_rep[0]-mouse.pos_x
		while(input.decide.is_down == 1){	//�{�^�������Ă�ԁA�����̃��[�v�𑱂���
			$SLD_X=$$SVX_FIX($m_diff_x,$sld_max)
			$$sld_pos_set($obj_base,$SLD_X)
			$$PRM_SET($obj_base_no,$SLD_X)		//�p�����^�Z�b�g�E�X���C�_�ւ̔��f
			input.next disp
		}
		return
	}
//��������������������������������������������������������
command	$$PRM_SET(		//�z�C�[���ƃX���C�_�ŋ��p����̂ňꌳ��
	property $btn_no : int,
	property $SLD_X : int
	){
		switch($btn_no){
			case(008)	syscom.set_BGM_volume(math.timetable($SLD_X,0,0,[0,<SL00_MAX>,255]))	$$PRM_SLD_SET(08)
			}
		return
	}
command $$PRM_SLD_SET(property $btn_no :int)	//�e��p�����^�l���X���C�_�ɔ��f������R�}���h
	{
	property $obj_no :int
	property $sys_prm :int

	$obj_no = $btn_no % 100	//�I�u�W�F�N�g�ԍ��Z�o
	switch($btn_no){
		case(008)	$sys_prm = math.timetable(syscom.get_BGM_volume,0,0,[0,255,<SL00_MAX>])
	}
	$$sld_pos_set(stage[$stage].object[08] , $sys_prm)
	return
	}

//��������������������������������������������������������
//�w�肳�ꂽ�I�u�W�F�N�g�̃X���C�_�[���w����W�ɃZ�b�g����R�}���h�B�u�̂т̂сv������
command $$sld_pos_set(
		property $obj:object,
		property $pos:int
		){
			$obj.child[03].x_rep[0] = $pos						//�X���C�_�̈ʒu�ݒ�
			$obj.child[01].set_src_clip(1,000,000, $pos,12)		//�X���C�_���́u�̂т̂сv
			return
		}
//##��`�̃{�^���̈���쐬����
command	$$OBJBTN_RECT(
	property $obj : object,
	property $DISP,
	property $XS,
	property $YS,
	property $X_rect,
	property $Y_rect,
	property $tr,
	property $group,
	property $btn_no,
	property $action,
	property $se
	)
	{
		$obj.create_rect($XS, $YS, $XS+$X_rect, $YS+$Y_rect, 255, 255, 000,$tr)
		$obj.disp = $DISP
		$obj.set_button($btn_no,$group,$action,$se)	//�{�^����
		return
	}

//##�z�C�[���l���I�u�W�F�N�g�ƁA�w��̃V�X�e���p�����^�ɓn���R�}���h�B
command $$wh_set(
	property $obj_rep	: int,	;�g�p�I�u�W�F�N�g�̕␳���W
	property $prm_min	: int,	;�X���C�_�̉����l
	property $v_min		: int,	;�V�X�e���p�����^�̉����l
	property $prm_max	: int,	;�X���C�_�̏���l
	property $v_max		: int,	;�V�X�e���p�����^�̏���l
	property $btn_no	: int	//�{�^������ԍ�
	)	;##�߂�l���Q�K�v�Ƃ��邽�߁A$ret[00] $ret[01] �̂Q���g�p����B
	{
		$obj_rep += mouse.wheel * -10
		$ret[00] = math.limit($prm_min, $obj_rep, $prm_max)					//�߂�l�O�@�X���C�_�J�[�\���̕␳���W�l
		$ret[01] = math.linear($obj_rep,$prm_min,$v_min,$prm_max,$v_max)	//�߂�l�P�@�V�X�e���p�����^�ւ̑���l
		$ret[01] = math.limit($v_min,$ret[01],$v_max)						//�߂�l�P�ɂk��������������
		$$PRM_SET($btn_no,$obj_rep)
		return
	}

//##��������������������������������������������������������
//�t���O�l���X���C�_�l�R���o�[�^�@�@�������̓X���C�_�̉����ő�l
command $$S2F(property $sys_prm : int , property $SLD_MAX : int) :int
	{	return(math.timetable($sys_prm,0,0,[0,255,$SLD_MAX]))}	//�߂�l�̓X���C�_��x_rep���W�Ƃ��Ďg����B
//�X���C�_�l���t���O�l�R���o�[�^�@�@�������̓X���C�_�̉����ő�l
command $$F2S(property $x_rep : int , property $SLD_MAX : int) :int
	{	return(math.timetable($x_rep,0,0,[0,$SLD_MAX,255]))}	//�߂�l�̓V�X�e���t���O�̃{�����[���l�Ƃ��Ďg����B
//�w�X���C�_�l���`�p�R�}���h	���s�w�l�E�X���C�_�ő�l
command $$SVX_FIX(property $x : int , property $MAX : int ) :int
	{	return(math.limit(00,mouse.pos_x + $x,$MAX))}			//�X���C�_���W�𐮌`


#inc_start

	#property	$m_diff_x	: int		;�X���C�_�Ŏg�p�B�}�E�X�ʒu�ƃ{�^���̍��W���i�w�j
	#property	$m_diff_y	: int		;�X���C�_�Ŏg�p�B�}�E�X�ʒu�ƃ{�^���̍��W���i�x�j
	#property	$th_x		:intlist[41]
	#property	$th_y		:intlist[41]

	#DEFINE		<SL00_MAX>		340

#inc_end

