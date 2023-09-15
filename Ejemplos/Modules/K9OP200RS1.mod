MODULE K9OP200RS1
    PERS num VAR_Job_NumR1:=0;
    VAR bool bTime;

    PROC main()
        VAR bool flag1;
        TPErase;
        VelSet 100, 750;
        UIMsgWriteAbort;
        CheckRobtargetR1;
        ResetConfig;
        TestPosicion;
        TPErase;
        WHILE (R1Bi_JobValid=0) DO
            Set R1Bo_SoftRelease;
            Set R1Bo_WaitJob;
            SetGO R1Go_JobNum,GInput(R1Gi_JobNum);
            SetGO R1Go_Rack,GInput(R1Gi_Rack);
            WaitTime 0.5;
            WaitUntil R1Bi_JobValid=1 OR GOutput(R1Go_JobNum)<>R1Gi_JobNum OR R1Gi_Rack<>GOutput(R1Go_Rack);
        ENDWHILE
        VAR_Job_NumR1:=GOutput(R1Go_JobNum);
        Reset R1Bo_SoftRelease;
        Reset R1Bo_WaitJob;
        TEST VAR_Job_NumR1
        CASE 1:
            !Op190 Rack
            CogerOP190_Rack;
        CASE 3:
            !Dejar en Op210B
            DejarOp210B;
        DEFAULT:
            Set R1Bo_JobReject;
            WHILE TRUE DO
                WaitTime 60;
            ENDWHILE
        ENDTEST
        RETURN ;
    ENDPROC

    PROC ResetConfig()
        VAR_Job_NumR1:=0;
        SetGO R1Go_JobNum,0;
        SetGO R1Go_Rack,0;
        Reset R1Bo_SoftRelease;
        Reset R1Bo_WaitJob;
        Reset R1Bo_JobReject;
        Reset R1Bo_InJob;
        Reset R1Bo_FalloManipulacion;
        !Reset R1Bo_Service;
        SetReleases;
        ResetFixtures;
        InitAnticolisones;
        MotionSup\On\TuneValue:=100;
        WaitTime 0.5;
        RETURN ;
    ENDPROC

    PROC R1_Home()
        MoveAbsJ R1_pHome,v200,fine,Grip_R1;
    ENDPROC

    PROC ObjetosDeTrabajo()
        VAR robtarget pTemp:=[[3886.19,-3.01,1421.31],[1.9552E-05,-0.0464429,-0.998921,-7.9567E-06],[-2,-1,1,0],[2700.02,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR orient orient1:=[1,0,0,0];
        VAR num rz:=0;
        pTemp:=CRobT(\Tool:=Grip_R1\WObj:=wobj0);
        orient1:=pTemp.rot;
        rz:=EulerZYX(\Z,orient1);
        orient1:=OrientZYX(rz,0,0);
        orient1:=NOrient(orient1);
        Stop;
        !        w_Op250B1:=wobj0;
        !        w_Op250B1.uframe.trans:=pTemp.trans;
        !        w_Op250B1.uframe.rot:=orient1;
        !        Stop;
        !        w_Op250B2:=wobj0;
        !        w_Op250B2.uframe.trans:=pTemp.trans;
        !        w_Op250B2.uframe.rot:=orient1;
        Stop;
    ENDPROC

    PROC Routine1()
        MoveAbsJ [[149.129,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs,v1000,z50,Grip_R1;
    ENDPROC

    PROC R1_SyncPos()
        MoveAbsJ [[90,0,0,0,90,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, fine, Grip_R1;
    ENDPROC

    PROC R1_Fixture()
        MoveAbsJ R1_pFixture1\NoEOffs,v100,fine,R1_tPointer;
    ENDPROC
	PROC Routine2()
		MoveAbsJ [[129.68,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, Grip_R1;
	ENDPROC

ENDMODULE