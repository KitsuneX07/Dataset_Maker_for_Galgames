//��������������������������������������������������������
//	�o�X�g�A�b�v�}�N���Q	���s��
//��������������������������������������������������������
#inc_start

	#property $chrlist : intlist[6]	// �o�X�g�A�b�v�����\���E����p�̔z��

#inc_end


//��������������������������������������������������������
#Z00	//@bup���s��	//�R�}���h���\��B

	$bup_com = L[01]							//�Ăяo�����R�}���h�̃X�g�b�N
	$bup_spec = $$filename_chk(K[00])		//�ȗ���Ԃ���̓W�J�E�L�����ԍ��擾�E�o�X�g�A�b�v�w��␳�E�P�̑��݊m�F

	IF($BG_FILE == ""){$BG_FILE="_black"}
	//##�Ăяo�����R�}���h�ɂ��w���W�������
	SWITCH($bup_com){		//L[01]�Ŕ��ʁ�L[02]�ɕ\����w���W�����B
		CASE(00)	L[02] = <POS_C>	$CHR_C = $bup_spec	// 400	//�\��؂�ւ� or �����\��
		CASE(01)	// $bup_px �ɕ\���w���W����������Ԃŗ���
		CASE(06)	L[02] = 000	 $bup_layer[$chr_num]=0	$bup_stock[$chr_num]="" goto #set_ok	//�L�����ʏ������B�w�菈���Ƃ����΂��B
		CASE(50)	// �w��w���W�\��(L[02]�ɂ͊��ɒl�������Ă��邽�߉������Ȃ�)
		default		/*�z��O�̃o�X�g�A�b�v�R�}���h�ł� R*/ close return
	}
	IF($bup_com != 50){
		L[03]=<POS_Y>	//���W���ڎw��R�}���h�n�łȂ���΁A�x���W�͊�{�l�i200�j
	}
	$bup_py = L[03]	
	IF((front.object[$chr_num].exist_type == 1)&&($bup_com == 0)){	//���ɑ��݂��Ă��違BUP�R�}���h�@����������W�㏑��
		$bup_px = front.object[$chr_num].x	
		$bup_py = front.object[$chr_num].y
	}	
	IF((front.object[$chr_num].child.get_size != 0)&&($bup_com) == 0){	//## @BUP�ŌĂ΂�āA�L���������ɂ���Ƃ��B
		back.object[$chr_num].create_copy_from(front.object[$chr_num])	//�I�u�W�F�N�g�𗠂փR�s�[�i���W���p���ׁ̈j
	}else{															//## @BUP�ŌĂ΂�āA�L���������Ȃ��Ƃ��B
		$$create_child(back.object[$chr_num],1,6)					//�q�u�W�F�N�g�쐬
		back.object[$chr_num].set_pos($bup_px,$bup_py)				// �w���W�͒��O��case���ŗ^����ꂽ���̂���B
	
	}

	$$bup_set(0,1)	//�o�X�g�A�b�v�̓ǂݍ���
	#set_ok		//##���t�@�C���̏������ł����炱���ɗ���
	
	back.object[$chr_num].wipe_copy = 1		// k-takahashi ����ʎ��ɃZ�b�g���ꂽ���_��wipe_copy���Ă܂���
	
	front.object[$chr_num].wipe_copy = 0	//���C�v�R�s�[�t���O���I�t�i�����ύX��������  �̈Ӂj

	IF(L[00]!=999){		//���C�v�ԍ��w�肪999�̂Ƃ��ȊO�͂����ŕ\������
		//##����bg(xxx,999)�̂��ƌĂ΂ꂽ�Ƃ��Ɏ��O������������Ȃ��H�t�B���^�Ƃ��B
		//##����BG�̕\�ɃI�u�W�F�N�g�����������炻�̂܂ܖ������铮��H
		//##�����@�t�ɁABG�̗��ɉ����\�z����Ă��炨�@�����ăm�[�^�b�`�X���[�̂ق����V�����Ƃ��Ă邩���B
		front.object[<O_BG>].wipe_copy =1

//##�\�����̃L�[�҂�����U�J�b�g
//##		IF($WR==0){	close	}	//�L�[�҂����䃏���^�C���t���O�ɒl�������Ă�����
		$$BUP_DISP(L[00])		//�o�X�g�A�b�v�\�������BL[00]�̓��C�v�ԍ��@�w�i�̈��p���Ƃ��g�[���J�[�u���Ƃ��܂�
		//�L�[�҂����䃏���^�C���t���O�ɒl�������Ă�����L�[�҂�
//##		IF($WR==0){	R	} $WR=0		//�L�[�҂����䃏���^�C���t���O������

	}
	return

//��������������������������������������������������������
#Z01	//�o�X�g�A�b�v����

//������Ƃ̎��� $wipe_ready != 0

	IF(k[00] == "all"){
		front.object[<O_BG>].wipe_copy = 1
	}else{
		$bup_spec = $$filename_chk(K[00])
		
		
	}



	return

//��������������������������������������������������������
command $$bup_set(
	property $c_stage : int ,
	property $c_wipe : int 
	)
{
	$bup_load = $bup_spec
	$bup_load =  $$system_bs_file($bup_spec)	//�����w��Ή��̃t�@�C�����\�z�R�}���h
	stage[$c_stage].object[$chr_num].create($bup_load,1,$bup_px,$bup_py)
//	IF($bup_layer[$chr_num]==0){	//���C���l�̕ύX�����ɂ���Ă����ꍇ�̓X���[������d�g��  k-takahashi�s�s���o�镔������̂ŃR�����g�A�E�g���Ă��܂�
		$bup_layer[$chr_num] = $$set_layer($chr_num)
//	}
	stage[$c_stage].object[$chr_num].layer = $bup_layer[$chr_num]

	switch($bup_spec.mid( 0,2)){	//�L�����̕␳���W���Z�b�g
		case("BS")	FARCALL("_00bupSub",111)	//�ʏ�
		case("BU")	FARCALL("_00bupSub",112)	//�ߐ�
		case("BW")	FARCALL("_00bupSub",113)	//����
	}

	return
}
//��������������������������������������������������������
command $$system_bs_file(property $bup_name : str) : str
{
	property $distance : str
	property $chara : str
	property $face : str
	property $load : strlist[10]
	property $filename : str
	property $dress :int

	if( $bup_name.left(2) == "BS" ) {
		$distance = "bs1"
	}
	elseif( $bup_name.left(2) == "BU" ) {
		$distance = "bs2"
	}
	elseif( $bup_name.left(2) == "BW" ) {
		$distance = "bs3"
	}
	$chara = $bup_name.mid(3, 2)
	$face = $bup_name.right(2)
	$dress = $DR[$$chr2num($chara)]
	$dress = math.limit(01, $dress, 99)	//�����ԍ�= 01�`99

	$load[00] = $distance + "_" + $chara	//BU_PH
	$load[01] = $load[00] + math.tostr_zero($dress, 2) + "_base01"
	$load[02] = $load[00] + "_f01_" + $face
	$filename = $load[01] + " | " + $load[02]
	
	$load[03] = $$bup_ex($$chr2num($chara),$dress)	//�L�����ԍ��E�����ԍ��@���@�ǉ��p�[�c�w��
	if($load[03] != "" ){	//�ǉ��p�[�c������Ƃ�
		$filename = $filename + " | " +  $load[00] + $load[03]
	}

	$WR=1
	
	return ($filename)
}
//��������������������������������������������������������
command $$bup_ex(	//�o�X�g�A�b�v�ǉ��p�[�c�ǂݍ���
	property $chr_no :int,
	property $dress  :int
) : str
{
	property $ctmp :intlist[10]
	property $ex_sp :str

	if($chr_no == 02){	//�t�B���A
		switch($dress){		//�ߑ��ԍ�
			case(03)	$ex_sp ="01_parts01"
			case(04)	$ex_sp ="01_parts01"
			case(05)	$ex_sp ="01_parts01"
			case(06)	$ex_sp ="01_parts02"	//�킩��
			default		$ex_sp =""
		}
	}

	return($ex_sp)
}

//��������������������������������������������������������
//�L�����̏������C���l���Z�b�g
command $$set_layer(property $number :int ):int
{
	property $layer :int

	switch( $number ){
		case(<JD>)	$layer = 168	// 170		k-takahashi ���ԓ���ւ��܂����B�� �� �f���� �� �t�B���A �� �W���[�h �� �O
		case(<PH>)	$layer = 170	// 169										�� �� �W���[�h �� �f���� �� �t�B���A �� �O
		case(<DE>)	$layer = 169	// 168
		case(<GA>)	$layer = 167
		case(<WI>)	$layer = 166
		case(<KW>)	$layer = 165
		case(<A1>)	$layer = 164
		case(<A7>)	$layer = 163
		case(<OT>)	$layer = 162
	}
	IF($bup_spec.mid(0,2)=="BU"){	$layer += 20	}//�ߐڎ�
	IF($bup_spec.mid(0,2)=="BW"){	$layer += 40	}//���ߐڎ�

	return( $layer )	//�߂�l�F���C���l
}

//��������������������������������������������������������
//�t�@�C���w��̃`�F�b�N
command $$filename_chk(property $file : str) :str
	{
		//���o�X�g�A�b�v�w�聁�t�@�C�����@�����݂��遨�t���O���Ă遨����
		//���Q�����̎w�聨�L�������ʎq�ƒf�聨�X�g�b�N����Ă���L�����w�����������
		//�����Q������BS�EBU�ł͂Ȃ������O�̎w�肩��E���ė���@������BS
		//���o�X�g�A�b�v�w�肩��L�����ԍ����Z�o

		$bup_exist = 0						//�P�̑��݃`�F�b�N�t���O������
//		K[00] = $file						//�����l�Ƃ���K[00]�Ƀo�X�g�A�b�v�w�����荞��
//		L[10] = $file.cnt					//�w��̕��������`�F�b�N
//		K[10] = $file.mid(0,2)				//�w��̐擪�Q�������X�g�b�N

		$chr_num = $$chr2num($file)	//�L�����ԍ��擾

		$bup_exist = 1
		$bup_stock[$chr_num] = $file			//�w����X�g�b�N

	return($bup_stock[$chr_num])
	}

//��������������������������������������������������������
//##���ۂɃo�X�g�A�b�v��\������R�}���h�B
command $$BUP_DISP(property $wipe_no : int)
{
	$$wipe_prm_set($wipe_no,<WIPE_CH>,0)	//�\���t���p�����^�Z�b�g

	$$WIPE_EXEC(0)							//##���C�v�҂����Ɏ��s������B
	$wipe_set_nowait = 0
	$$wipe_prm_clr		//�\���t���p�����^�N���A
	$$wipe_copy_set(1)	//##�o�X�g�A�b�v�L�����S���̃��C�v�R�s�[�t���O�𗧂Ă�
}

//��������������������������������������������������������
//##�L�������ʎq����L�����ԍ��ւ̕ϊ��R�}���h
command $$chr2num(property $chr_dst : str) :int
{

	$stmp[00]=$chr_dst.mid(0,2)	//�擪�̂Q�����𒊏o
	//�L�����w��̃`�F�b�N�����o
	IF(($stmp[00]=="BS")||($stmp[00]=="BU")||($stmp[00]=="BW")||($stmp[00]=="CG")){
			$stmp[01] = $chr_dst.mid(3,2)
	}ELSE{
			$stmp[01] = $chr_dst.mid(0,2)
	}

	switch($stmp[01]){
		case("BG")	$ret[00] = 00
		case("JD")	$ret[00] = 01
		case("PH")	$ret[00] = 02
		case("DE")	$ret[00] = 03
		case("GA")	$ret[00] = 04
		case("WI")	$ret[00] = 05
		case("KW")	$ret[00] = 06
		case("A1")	$ret[00] = 07
		case("A7")	$ret[00] = 08
		case("OT")	$ret[00] = 09
		default		$ret[00] = 99
	}

	return($ret[00])
}

//##�L�����ԍ�����L�������ʎq�ւ̕ϊ��R�}���h�B
command $$num2chr(property $chr_num : int) :str
{
	switch($chr_num){
		case(00)	$sret[00]="BG"
		case(01)	$sret[00]="JD"
		case(02)	$sret[00]="PH"
		case(03)	$sret[00]="DE"
		case(04)	$sret[00]="GA"
		case(05)	$sret[00]="WI"
		case(06)	$sret[00]="KW"
		case(07)	$sret[00]="A1"
		case(08)	$sret[00]="A7"
		case(09)	$sret[00]="OT"
	}
	return($sret[00])
}

