//�G�N�X�e���V�����f�[�^�`�F�b�N�E�o�X�g�A�b�v�C�����W�Z�b�g
#inc_start
	#property	$bupEX	:strlist[5]		//�w��̕K�v����ʁX�ɃX�g�b�N����ׂ̕ϐ�

	//$$Bup_Rep_set �ň����ȗ���������ׂ̃��b�p�[�}�N��
	#macro @Bup_Rep_Set(@1dir,@1X,@1Y,@2dir(-1),@2X(000),@2Y(000),@3dir(-1),@3X(000),@3Y(000),@4dir(-1),@4X(000),@4Y(000),@5dir(-1),@5X(000),@5Y(000),@6dir(-1),@6X(000),@6Y(000))
			$$Bup_Rep_Set(	@1dir,@1X,@1Y,
							@2dir,@2X,@2Y,
							@3dir,@3X,@3Y,
							@4dir,@4X,@4Y,
							@5dir,@5X,@5Y,
							@6dir,@6X,@6Y)

	//$$Fup_Rep_set �ň����ȗ���������ׂ̃��b�p�[�}�N��
	#macro @Fup_Rep_Set(@1dir,@1X,@1Y,@1S,@2dir(-1),@2X(000),@2Y(000),@2S(1000),@3dir(-1),@3X(000),@3Y(000),@3S(1000),@4dir(-1),@4X(000),@4Y(000),@4S(1000),@5dir(-1),@5X(000),@5Y(000),@5S(1000),@6dir(-1),@6X(000),@6Y(000),@6S(1000))
			$$Fup_Rep_Set(	@1dir,@1X,@1Y,@1S,
							@2dir,@2X,@2Y,@2S,
							@3dir,@3X,@3Y,@3S,
							@4dir,@4X,@4Y,@4S,
							@5dir,@5X,@5Y,@5S,
							@6dir,@6X,@6Y,@6S)

#inc_end
//��������������������������������������������������������

#Z00	////�G�N�X�e���V�����p�t�@�C���w��`�F�b�N�Ɠǂݍ��݁E�p�^�[���ԍ����B
	$bup_exte =""		//�ϐ�������
	$bup_exte_num =0	//�ϐ�������
	// $bup_spec �ɓ����Ă���uBS_BT01_0203�v�̂悤�Ȏw��̕K�v�����E���Ă����B����Ɏg���������̃x�[�X�ɂ�����
	$bupEX[00] = $bup_spec.left(3)			//BS_BT01_0203 �� BS_
	$bupEX[02] = $bup_spec.mid(3,4)			//BS_BT01_0203 �� BT01
	$bupEX[03] = $bup_spec.left(7)			//BS_BT01_0203 �� BS_BT01
	$bupEX[04] = $bup_spec.mid(8,2)			//BS_BT01_0203 �� 02

	farcall("_00bupsub",$chr_num)	//�L�����ԍ��̂y���x���ɔ�΂�

	//��������������������������������������������������������
	IF($bup_exte != ""){	//�ǉ��w��Ƀt�@�C�����������Ă�������W�i�Œ�l�j�ƃp�^�[���ԍ���ǉ�����
		$bup_exte = "|"+$bup_exte+"("+math.tostr(<BUP_set_X>)+","+math.tostr(<BUP_set_Y>)+","+math.tostr($bup_exte_num)+")"
	}
	return

//��������������������������������������������������������
//�o�X�g�A�b�v�ǉ��ǂݍ��ݎw�蕔
//�y���x�����L�����ԍ�
#Z01	//�^��
	return

#Z02	//�F����
	return

#Z03	//�^�q	�L�q��Ƃ��ăR�����g�A�E�g���Ă����܂��B
//	IF(<MG_PK>==1){		//�ዾ�A���̂Ƃ�
//		$bup_exte = $bupEX[00] + "PK10_megane"	$bup_exte_num = 0	//���ዾ�̂݁B�w������΁��ŏ㏑�������
//		IF($bupEX[02]=="PK31"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 1	}	//��ɂ������{���K�l
//		IF($bupEX[02]=="PK41"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 1	}
//		IF($bupEX[02]=="PK51"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 1	}
//	}ELSE{				//�ዾ�i�V�̂Ƃ�
//		IF($bupEX[02]=="PK31"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 0	}	//��ɂ������
//		IF($bupEX[02]=="PK41"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 0	}
//		IF($bupEX[02]=="PK51"){	$bup_exte = $bupEX[00] + "PK10_yubi"	$bup_exte_num = 0	}
//	}
	return

#Z04	//���I��
	return

#Z05	//����
	return

//��������������������������������������������������������
#Z110	//��b�f
	gosub #Z120	//�␳�l�Z�b�g��
	return	//

#Z111	//�ʏ�o�X�g�A�b�v
	gosub #Z121	//�␳�l�Z�b�g��
	gosub #Z119	//�Z�b�g���s��
	return

#Z112	//�ߐڃo�X�g�A�b�v
	gosub #Z122	//�␳�l�Z�b�g��
	gosub #Z119	//�Z�b�g���s��
	return

#Z113	//�ߐڃo�X�g�A�b�v
	gosub #Z123	//�␳�l�Z�b�g��
	gosub #Z119	//�Z�b�g���s��
	return


#Z119	//�C�����W�����
	//##�L�����ʂ̍��W�C������
	//�C�����W�O�Ԃ͊�{�C���Ɏg�p�B
	//�C�����W�P�Ԃ̓o�X�g�A�b�v�G�t�F�N�g�p�i�s�����s�����Ƃ��r�N���Ƃ��j
	//�C�����W�Q�ԃV�i���I��ł̈ʒu�C���p�B�X�N���[��������ōs���B
	//�C�����W�R�Ԃ͈ړ��\��������Ƃ��Ɏg�p�B�I�����ɐ��l���O�ɂȂ�悤�ɂ��邱�ƁB
		//�������ł͂O�ԂƂQ�Ԃ̐ݒ���s���B
	$$obj_rep_xy(stage[0].object[$chr_num],4,4)	//�h�炵�p�Ƃ��� y_rep �� x_rep ���S���m��
	stage[0].object[$chr_num].x_rep[0]=$bup_Xrep			//�O�ԁ@��{�C���p
	stage[0].object[$chr_num].y_rep[0]=$bup_Yrep			

//system.debug_messagebox_ok($bup_Xrep)	//�f�o�b�O���b�Z�[�W

//	stage[$stage].object[$chr_num].x_rep[2]=$reppos_x[$chr_num]	//�Q�ԁ@�V�i���I��ʒu�C���p
//	stage[$stage].object[$chr_num].y_rep[2]=$reppos_y[$chr_num]	
	return

//��������������������������������������������������������
#Z120	//##��b�f�̂w�␳�E�x�␳�E�k�������Z�b�g
/*
	switch($bup_spec.mid( 3,2)){
//	1,150,-160,900 = �����ԍ� , �w�␳�l , �x�␳�l , �k����
//	���f�[�^����
//									1���w����			2���w�ȂȂ�			5�w������			6�w���ȂȂ�
		case("BT")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		3,150,-160,900,		4,150,-160,900,	5,150,-160,900,		6,150,-160,900)		//�x�X���[
		case("HN")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//����
		case("NS")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//��
		case("MZ")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//���H
		case("MU")	@Fup_Rep_Set(	1,150,-160,900,		2,150,-160,900,		5,150,-160,900,		6,150,-160,900)		//�ጎ
	}
*/
	return

//��������������������������������������������������������
#Z121	//##�␳�l�Z�b�g�i�a�r�j
	switch($bup_spec.mid( 3,2)){
	//�f�[�^�����F					1,000,000 = �|�[�Y�ԍ� , �w�␳�l , �x�␳�l
		case("JD")	@Bup_Rep_Set(	1, 000, 000		)		//�W���[�h
		case("PH")	@Bup_Rep_Set(	1,-050, 000		)		//�t�B���A
		default		@Bup_Rep_Set(	1, 000, 000		)		//�w��Ȃ�
	//	case("MU")	@Bup_Rep_Set(	1, 10, 10,		2,  5,  5,		5,000,000,		6,000,000)		//�ጎ
	}

	return

//��������������������������������������������������������
#Z122	//##�␳�l�Z�b�g�i�a�t�j
	switch($bup_spec.mid( 3,2)){
	//�f�[�^�����F					1,000,000 = �|�[�Y�ԍ� , �w�␳�l , �x�␳�l
		case("JD")	@Bup_Rep_Set(	1, 000, 000		)		//�W���[�h
		case("PH")	@Bup_Rep_Set(	1,-100, 000		)		//�t�B���A
		default		@Bup_Rep_Set(	1, 000, 000		)		//�w��Ȃ�
	//	case("MU")	@Bup_Rep_Set(	1, 10, 10,		2,  5,  5,		5,000,000,		6,000,000)		//�ጎ
	}
	return

//��������������������������������������������������������
#Z123	//##�␳�l�Z�b�g�i�a�v�j
	switch($bup_spec.mid( 3,2)){
	//�f�[�^�����F					1,000,000 = �|�[�Y�ԍ� , �w�␳�l , �x�␳�l
		case("JD")	@Bup_Rep_Set(	1, 000, 000		)		//�W���[�h
		case("PH")	@Bup_Rep_Set(	1,-100, 000		)		//�t�B���A
		default		@Bup_Rep_Set(	1, 000, 000		)		//�w��Ȃ�
	//	case("MU")	@Bup_Rep_Set(	1, 10, 10,		2,  5,  5,		5,000,000,		6,000,000)		//�ጎ
	}
	return


//��������������������������������������������������������
#Z30	//@bup_area_set	�s�u�d�b�p�o�X�g�A�b�v�͈͐����}�N�����l�Z�b�g��
	//�\����_���W	2x3�i�L�����̃Z���^�[�E�k�E�q�ʒu�j
	//�\���͈�		4
	//�k����		1
	//��{���C���l	1		�v12�t���O���K�v
/*
	IF(L[00]==-1){	//���[�U�[���[�h�ł̃X�}�z�̃I�[�v���ۂ��Z�b�g
		IF(<SMH_USER_STOCK> ==1 ){$SMH_USER=1 <SMH_USER_STOCK>=0 }	//����
	}ELSE{
		<SMH_USER_STOCK> = $SMH_USER | <SMH_USER_STOCK>		//�X�}�z�s��
		$SMH_USER=0
	}


switch(L[00]){
	case(-1)	$bup_area_set.init	$bup_area.init	
				stage[1].object[<O_CGB>].wipe_copy=0 stage[1].object[<O_CGM>].wipe_copy=0	//������-1�̏ꍇ�̓L�����p�t���O���X������
				stage[0].object[<O_CGB>].wipe_copy=0 stage[0].object[<O_CGM>].wipe_copy=0	//������-1�̏ꍇ�̓L�����p�t���O���X������
//										Cx,Cy,		Lx,Ly,		Rx,Ry,		ALx,ALy,ARx,ARy,	zoom,	rep_Layer
	case(00)	$bup_area_set.sets(0,	1084,290,	985,290,	1182,290,	925,108,1242,584,	800,	100)		//�X�}�z���\���p
}
*/
return

//��������������������������������������������������������
#Z31	//@BUP_AREA_parts		//�s�u�d�b�p�p�[�c�Q�ꊇ�Z�b�g��
	//K[00]	�t�@�C���l�[��
	//L[00]	stage�w��
	//L[01] �g�p�I�u�W�F�N�g
	//L[02] ���C���l
	//L[03]	x���W
	//L[04]	y���W
	//L[05]	�p�^�[���ԍ�

	stage[L[00]].object[L[01]].create(K[00],1,L[03],L[04],L[05])
	stage[L[00]].object[L[01]].Layer = L[02]
	stage[L[00]].object[L[01]].wipe_copy = 1

return
/*
//��������������������������������������������������������
#Z32	//@BUP_AREA_COVER(@cover_name,@stage)	//�s�u�d�b�p�J�o�[�i�X�}�z�̃t���[���j
	//K[00]	�t�@�C���l�[��
	//L[00]	stage�w��
	//L[01]	x���W
	//L[02]	y���W
	//�{�҂ł͎g�p���Ȃ��b�f���[�h�p�̃I�u�W�F�N�g�𗘗p
	//XY���W���ȗ��l��������A�\���̈�̊�_���g��

	stage[L[00]].object[<O_CGM>].create(K[00],1,$bup_area_set[06],$bup_area_set[07])
	stage[L[00]].object[<O_CGM>].Layer = $bup_area_set[13]
	stage[L[00]].object[<O_CGM>].wipe_copy = 1
return
*/
//��������������������������������������������������������
command	$$Bup_Rep_Set(	//�o�X�g�A�b�v�␳���W���ꊇ�Z�b�g����R�}���h
	property $1dir :int, property $1X :int, property $1Y :int,
	property $2dir :int, property $2X :int, property $2Y :int,
	property $3dir :int, property $3X :int, property $3Y :int,
	property $4dir :int, property $4X :int, property $4Y :int,
	property $5dir :int, property $5X :int, property $5Y :int,
	property $6dir :int, property $6X :int, property $6Y :int
	){
		K[00]=$bup_spec.mid(5,1)	//bs_PH10_02 �������1
		L[00]=K[00].tonum			//�L�����̌����w��𐔒l��
		switch(L[00]){
			case($1dir)		$bup_Xrep = $1X		$bup_Yrep = $1Y
			case($2dir)		$bup_Xrep = $2X		$bup_Yrep = $2Y
			case($3dir)		$bup_Xrep = $3X		$bup_Yrep = $3Y
			case($4dir)		$bup_Xrep = $4X		$bup_Yrep = $4Y
			case($5dir)		$bup_Xrep = $5X		$bup_Yrep = $5Y
			case($6dir)		$bup_Xrep = $6X		$bup_Yrep = $6Y
		}
	return
	}

//��������������������������������������������������������
command	$$Fup_Rep_Set(//��b�f�␳���W���ꊇ�Z�b�g����R�}���h
	property $1dir :int, property $1X :int, property $1Y :int, property $1S :int,
	property $2dir :int, property $2X :int, property $2Y :int, property $2S :int,
	property $3dir :int, property $3X :int, property $3Y :int, property $3S :int,
	property $4dir :int, property $4X :int, property $4Y :int, property $4S :int,
	property $5dir :int, property $5X :int, property $5Y :int, property $5S :int,
	property $6dir :int, property $6X :int, property $6Y :int, property $6S :int
	){
//		K[00]=$bup_spec.mid(6,1)
//		L[00]=K[00].tonum			//�L�����̌����w��𐔒l��
//		switch(L[00]){
//			case($1dir)		$fup_repX = $1X		$fup_repY = $1Y		$fup_zoom = $1S
//			case($2dir)		$fup_repX = $2X		$fup_repY = $2Y		$fup_zoom = $2S
//			case($3dir)		$fup_repX = $3X		$fup_repY = $3Y		$fup_zoom = $3S
//			case($4dir)		$fup_repX = $4X		$fup_repY = $4Y		$fup_zoom = $4S
//			case($5dir)		$fup_repX = $5X		$fup_repY = $5Y		$fup_zoom = $5S
//			case($6dir)		$fup_repX = $6X		$fup_repY = $6Y		$fup_zoom = $6S
//		}
	return
	}

