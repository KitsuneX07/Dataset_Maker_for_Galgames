//���O���t�B�b�N�֘A�̎��s���Q
#inc_start
	#define	@bup_prm_init	$bup_layer.init	$bup_stock.init		//�o�X�g�A�b�v�̃��C���l�␳�E�X�g�b�N��������
#inc_end

#Z00

command	$$BG_disp(	//@BG	���s����
	property $BGname	:str,
	property $wipe_no	:int,
	property $time		:int,
	property $bup_mode	:int
)
{
	$bup_layer.init		//�o�X�g�A�b�v�̃��C���l�␳�E�X�g�b�N��������
	$bup_stock.init		
	$BG_FILE = $BGname

	//�E�B���h�E���䃏���^�C���t���O�ɒl�������Ă�����E�C���h�E���Ȃ�
	IF($WC==0){	close	} $WC=0		//�E�B���h�E���䃏���^�C���t���O������

	back.object[<O_BG>].create($BG_FILE,1)
	IF($wipe_no == <SET>){return}	//���C�v�ԍ��������w��(999)�̎��͂����Ŗ߂�B

	//���ɑҋ@���̔w�i�Ɉꊇ�Ńg�[���J�[�u���ʂ�������
	if($SEPIA == 1){	back.object[<O_BG>].tonecurve_no = <TC_SEPIA>		//�Z�s�A�w�莞�̓Z�s�A�D��Ńg�[���J�[�u������
	}else{				back.object[<O_BG>].tonecurve_no = $BG_TC		}

	back.object[<O_BG>].wipe_copy = 1
	$$wipe_prm_set($wipe_no,<WIPE_BG>,$time)	//�\���t���p�����^�Z�b�g
	$$wipe_copy_set(0)	//�o�X�g�A�b�v�ނ̃��C�v�R�s�[�t���O��S�N���A
	$$WIPE_EXEC(1)
	$$wipe_prm_clr			//�\���t���p�����^�N���A
	return
}

//��������������������������������������������������������
command	$$CG_disp(	//@CG @CUTIN ���p���s����
	property $cg_name	:str,
	property $wipe_no	:int,
	property $obj_no	:int	//�g�p�I�u�W�F�N�g�������ɂ���
)
{
	$bup_layer.init		//�o�X�g�A�b�v�̃��C���l�␳�E�X�g�b�N��������
	$bup_stock.init		
	$$wipe_copy_set(0)	//�o�X�g�A�b�v�ނ̃��C�v�R�s�[�t���O��S�N���A
	$CG_FILE = $CG_name

	IF($WC==0){	close	} $WC=0		//�E�B���h�E���䃏���^�C���t���O

	back.object[$obj_no].create($CG_FILE,1,0,0,0)
	$$wipe_prm_set($wipe_no,<WIPE_CG>,0)	//�\���t���p�����^�Z�b�g

	if($obj_no >= 50){	//@CUTIN �̂Ƃ��͔w�i�E�o�X�g�A�b�v�E�b�f�̃��C�v�R�s�[���I��
		$$wipecopy_range(00,49)	
	}
	$$WIPE_EXEC(1)				//�\�����s�}�N��	�P=���C�v�I�������҂�
	$$wipe_prm_clr				//�\���t���p�����^�N���A

	//�L�[�҂����䃏���^�C���t���O�ɒl�������Ă�����L�[�҂�
	//##�L�[�҂��������U�J�b�g���܂����B�����l��҂��Ȃ������ɂ����ق����悢�c�H 2022_0714
	//IF($WR == 0){	close R	} $WR=0		//�L�[�҂����䃏���^�C���t���O������
	return
}

//��������������������������������������������������������
#Z09	//@TIME_FADE�̎��ɂ͂����ɂ��āA#z10���x�����RETURN�Ŗ߂�
	//@TIME_FADE(@WIPE(0),@close(0),@TIME(<TW_TIME>))
//	farcall(_00grp, 09, @WIPE, @close, @TIME,  000,  000,  000)
//				        L[00], L[01],  L[02], L[03],L[04],L[05]
	bgm.stop(1800)	//�a�f�l���t�F�[�h�A�E�g�i�o�ߎ��ԂŁj
	pcmch[0].stop(500)		//500msec�t�F�[�h�Ō��ߑł�
	pcmch[1].stop(500)		//500msec�t�F�[�h�Ō��ߑł�
	pcmch[2].stop(500)		//500msec�t�F�[�h�Ō��ߑł�

	pcmch[5].stop(500)		//500msec�t�F�[�h�Ō��ߑł�	���[�v�r�d�p��p�`�����l������~

	pcmch[1].wait_fade_key			// ����L�[�ŃX�L�b�v�ł���
	pcm.stop
	close	//@time_fade�̓��b�Z�[�W�E�B���h�E�����N���[�Y
	L[10]=L[02]

#Z10	//�e�F�t�F�[�h���s�����B�����ɗ^����q�f�a�l�ŐF��ς���
//	farcall(_00grp, 10, @WIPE, @close, @TIME,  000,  000,  000)
//				        L[00], L[01],  L[02], L[03],L[04],L[05]

//	$BT_MODE=0	//@BUP_TIME�p���ʕϐ�
//	@bup_prm_init	//�o�X�g�A�b�v�̃��C���l�␳�E�X�g�b�N��������

	//##���b�Z�[�W�E�C���h�E���ǂ������̂��̃R�A����
	IF($OT_WC != 0){L[01] = $OT_WC }	// $OT_WC ���Z�b�g����Ă���Έ������D��B
	SWITCH(L[01]){					//�����ň����� $OT_WC ����������B
		case(0)	$OT_WC=0	close	//���f�t�H���g�l
		case(1)	$OT_WC=1			//�E�C���h�E�N���[�Y�̎w�肪0�̂Ƃ��̂݃E�C���h�E����
		case(2)	$OT_WC=2			//�E�C���h�E����Ȃ��B���������Ȃ�
		case(3)	$OT_WC=3			//�E�C���h�E���ƃ��C�v�B$OT_WC �����C�v���ɎQ�Ƃ���̂ł����ł͉������Ȃ��B
	}	//##�R�R�}�f
	
	$$wipe_copy_set(0)						//�o�X�g�A�b�v�ނ̃��C�v�R�s�[�t���O��S�N���A
	back.object[<O_EFF>].create_rect(000,000,<SCREEN_WIDTH>,<SCREEN_HEIGHT>,L[03],L[04],L[05],255,1)	//��ʃT�C�Y�ɂ͗��ӂ��邱�ƁB

	$$wipe_prm_set(L[00],<WIPE_BG>,L[02])	//�\���t���p�����^�Z�b�g	���C�v�ԍ��E���C�v���x(���� �Ƃ�)�E���C�v����
	$W_prm[11]=500	//���C���l���グ�āA���b�Z�[�W�E�B���h�E���ƃ��C�v������
	$$WIPE_EXEC(1)			//�\�����s�}�N��	�P=���C�v�I�������҂�
	$$wipe_prm_clr			//�\���t���p�����^�N���A

	wait_wipe		//���C�v�I���҂�
	IF(bgm.check == 2){	//�a�f�l���t�F�[�h���Ȃ�t�F�[�h�A�E�g�҂�
		bgm.wait_fade_key
	}
	timewait(L[10])	// #Z09�����@TIME_FADE�Ăяo���ł���΁AL[10]�ɑ҂����Ԃ������Ă���͂�
	return

//��������������������������������������������������������
//##$$wipe_prm_set �ŃZ�b�g���ꂽ�t���p�����[�^���g���ă��C�v���s�B
command $$WIPE_EXEC( property $WIPE_wait_prm :int )
{
	IF($OT_WC==3){ $W_prm[11] = 300 }else{ $W_prm[11] = 0 }	//���C�v�I�[�_�[�̏����ύX
	if($MASK_WIPE!=""){
		mask_wipe(
			$MASK_WIPE,
			wait=		$WIPE_wait_prm,			//���C�v�I���҂��w��
			type=		$W_prm[00],				//���C�v�ԍ�
			time=		$W_prm[01],				//���C�v���Ԏw��
			speed_mode=	$W_prm[02],				//���C�v���x�w��
			start_order=0,						//���C�v�̃I�[�_�[�͈́i�����j
			end_order=	$W_prm[11],				//���C�v�̃I�[�_�[�͈́i����j
			option=[$W_prm[03],$W_prm[04],$W_prm[05],$W_prm[06],$W_prm[07]]		//���̑����C�v�ʃp�����^
		)
	}else{
		wipe(
			wait=		$WIPE_wait_prm,			//���C�v�I���҂��w��
			type=		$W_prm[00],				//���C�v�ԍ�
			time=		$W_prm[01],				//���C�v���Ԏw��
			speed_mode=	$W_prm[02],				//���C�v���x�w��
			start_order=0,						//���C�v�̃I�[�_�[�͈́i�����j
			end_order=	$W_prm[11],				//���C�v�̃I�[�_�[�͈́i����j
			option=[$W_prm[03],$W_prm[04],$W_prm[05],$W_prm[06],$W_prm[07],$W_prm[08],$W_prm[09],$W_prm[10]]		//���̑����C�v�ʃp�����^
		)
	}
	$wipe_ready = 0		//���C�v�����t���O��������
	$wipe_set_time = 0	//���C�v���ԋ����w��t���O��������
	return
}

//��������������������������������������������������������
//##�I�u�W�F�N�g�̐F�������ň�C�ɕς���R�}���h
command $$obj_rgb(
	property $obj	:object,
	property $R		:int,
	property $G		:int,
	property $B		:int,
	property $rate	:int
	)
{
	$obj.color_r = $R
	$obj.color_g = $G
	$obj.color_b = $B
	$obj.color_rate = $rate
	return
}

//��������������������������������������������������������
command	$$fullCG_LOAD(	//�b�f�ǂݍ��ݕ����ꌳ���������[�`���B
	property $obj	: object
)
{
	$obj.init				//�����\���p�I�u�W�F�N�g������
	$obj.disp = 1			//�\���I��

	//�t�@�C���l�[���\�z�������ɒP�̓ǂݍ��݂�����
	$obj.create($CG_FILE,1,0,0,0)	//�P�̉摜�ǂݍ���
	return
}

//��������������������������������������������������������
command	$$wipecopy_range(	//�I�u�W�F�N�g�ԍ���͈͎w�肵�āA�\�ɑ��݂�����̂̂ݗ��ɃR�s�[
	property $o_start	:int,
	property $o_end		:int
)
{
	for($tmp[01] = $o_start , $tmp[01] <= $o_end , $tmp[01] += 1 ){
		$tmp[00] = front.object[$tmp[01]].exist_type
		if($tmp[00] == 1){
			front.object[$tmp[01]].wipe_copy = 1
		}
	}
	return
}

//##��������������������������������������������������������
//##�I�u�W�F�N�g�̃��[�h�Ɠ����Ƀ{�^���̐ݒ���ς܂�����I�ȃ}�N��
command	$$OBJBTN_SET(
	property $obj : object,
	property $filename : str,
	property $DISP,
	property $X,
	property $Y,
	property $TR,
	property $group,
	property $btn_no,
	property $action,
	property $se,
	property $Pushkeep,
	property $btn_mode,
	property $alpha
	)
	{
		$obj.create($filename,$DISP,$X,$Y)			//�I�u�W�F�N�g�ǂݍ���
		$obj.TR = $TR								//�I�u�W�F�N�g�ǂݍ���
		$obj.set_button($btn_no,$group,$action,$se)	//�{�^����
		$obj.set_button_pushkeep($Pushkeep)			//�X���C�_�ނȂǂ͂����̃L�[�v�X�C�b�`���I���ɂ��邱��
		switch($btn_mode){	//�{�^����Ԃ̐ݒ�
			case(0)	$obj.set_button_state_normal
			case(1)	$obj.set_button_state_select
			case(2)	$obj.set_button_state_disable
		}
		$obj.set_button_alpha_test($alpha)	// 1= ���ߕ�������
	}
//			���e���v��
//	$$OBJBTN_SET(obj,filename,Disp,X,Y,Tr,group,btn_no,action,SE,PushKeep,Btn_mode)

//��������������������������������������������������������
//�b�f���[�h�p�@�A���\���R�}���h�@13���܂őΉ�
command $$CG_views(	//�b�f�A���\���R�}���h
	property $CG00 :str,
	property $CG01 :str,
	property $CG02 :str,
	property $CG03 :str,
	property $CG04 :str,
	property $CG05 :str,
	property $CG06 :str,
	property $CG07 :str,
	property $CG08 :str,
	property $CG09 :str,
	property $CG10 :str,
	property $CG11 :str,
	property $CG12 :str
	)
{
	property $ctmp :intlist[10]
	property $sctmp :strlist[20]
	property $file :str

	$sctmp[00] = $CG00
	$sctmp[01] = $CG01
	$sctmp[02] = $CG02
	$sctmp[03] = $CG03
	$sctmp[04] = $CG04
	$sctmp[05] = $CG05
	$sctmp[06] = $CG06
	$sctmp[07] = $CG07
	$sctmp[08] = $CG08
	$sctmp[09] = $CG09
	$sctmp[10] = $CG10
	$sctmp[11] = $CG11
	$sctmp[12] = $CG12

	while(1){//�����J�E���g���[�v
		if( $sctmp[ $ctmp[00] ] == "" ){break}
		$ctmp[00] +=1
	}

	while($ctmp[01] < $ctmp[00]){	//�b�f�\�����[�v

		$file = $sctmp[$ctmp[01]]
		//�����̌ʓ��ꏈ��
		if($file =="cg_ts88_01" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts88_02" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_01" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_02" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_03" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="cg_ts89_04" )	{$file= "bg_kuro" +"|" + $file}
		if($file =="bg02")			{$ctmp[03] = 01}
		if($file =="bg09")			{$ctmp[03] = 02}
		if($file =="bg09N")			{$ctmp[03] = 02}
		if($file =="bg43")			{$ctmp[03] = 03}
		if($file =="bg43_03")		{$ctmp[03] = 03}
		if($file =="bg44")			{$ctmp[03] = 03}
		if($file =="bg44_03")		{$ctmp[03] = 03}
		if($file =="bg53")			{$ctmp[03] = 04}
		if($file =="bg76")			{$ctmp[03] = 05}
		if($file =="bg78")			{$ctmp[03] = 06}

		switch($ctmp[03]){	//�t�@�C���ǂݍ��ݏ���
			case(01)	$$obj_combine("bg02",0,0000,0000, 1,0000,1080)
			case(04)	$$obj_combine("bg53",0,0000,0000, 1,0000,1350)
			case(06)	$$obj_combine("bg78",0,0000,0000, 1,1440,0000)
			default		front.object[41].create($file,0,000,000)	//�A�������s�v�̏ꍇ
		}
		front.object[41].tr = 00
		front.object[41].disp = 01
		front.object[41].tr_eve.set(255, 300, 0, 1)
		front.object[41].tr_eve.wait
		front.object[40].init	//�\�����I������O�̉摜���N���A

		switch($ctmp[03]){	//�K�v�Ȃ��̂̓X�N���[�����o
			case(01)		front.object[41].y_eve.set(-1080, 2200, 400, 0)	front.object[41].y_eve.wait	//BG02
			case(02)		front.object[41].y_eve.set( -627, 1500, 400, 0)	front.object[41].y_eve.wait	//BG09 BG09N
			case(03)		front.object[41].y_eve.set( -307, 1000, 400, 0)	front.object[41].y_eve.wait	//BG43 BG43_03 BG44 BG44_03
			case(04)		front.object[41].y_eve.set(-1620, 2500, 400, 0)	front.object[41].y_eve.wait	//BG53
			case(05)		front.object[41].y_eve.set( -540, 1000, 400, 0)	front.object[41].y_eve.wait	//BG76
			case(06)		front.object[41].x_eve.set( -960, 2000, 400, 0)	front.object[41].x_eve.wait	//BG78	//�����X�N���[��
		}
		$ctmp[03]=00

		while(1){	//�I��p���[�v
			if(input.decide.on_down_up == 1){ break }				//����L�[�Ŏ��ցB
			if(input.cancel.on_down_up == 1){  $ctmp[02]=1 break }	//�L�����Z���L�[�Ŕ���
			input.next
			disp
		}
		front.object[40].create_copy_from(front.object[41])	//���s�̉摜�����ɃR�s�[
		if($ctmp[02] ==1 ){$ctmp[02]=0 break}	//�L�����Z���L�[�ł̔�������
		$ctmp[01] +=1
	}
	//��������
	front.object[41].init
	front.object[40].tr_eve.set(000, 200, 0, 2)
	front.object[40].tr_eve.wait
	front.object[40].init
	return
}

//��������������������������������������������������������
//�I�u�W�F�N�g�Ɏq�����A�p�^�[�������炵�Ĕz�u����R�}���h�B������ėp�����������B
command	$$obj_combine(
	property $file	:str,
	property $pat0no:int,
	property $pat0x	:int,
	property $pat0y	:int,
	property $pat1no:int,
	property $pat1x	:int,
	property $pat1y	:int
	)
{
	$$create_child(front.object[41],0,2)	//�q���
	front.object[41].child[00].create($file,1,$pat0x,$pat0y,$pat0no)
	front.object[41].child[01].create($file,1,$pat1x,$pat1y,$pat1no)
	return
}



