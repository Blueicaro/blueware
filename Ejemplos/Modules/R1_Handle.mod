MODULE R1_Handle
    CONST robtarget p1_Buffer:=[[-1356.973002002,-879.008196229,225.191196411],[0.03328089,-0.153070737,0.987641193,0.005157979],[-2,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p2_Buffer:=[[-1354.972848048,-870.007940962,2153.189169002],[0.033280988,-0.153070488,0.987641228,0.005158056],[-2,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget P_Mesa_1:=[[-289.838406964,-2950.0304561,919.981202731],[0.000548511,-0.999730236,0.000870784,-0.023203363],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P_Mesa_2:=[[-1358.454172502,2388.225007943,1333.670112214],[0.029048424,-0.642340192,-0.765310014,-0.029254915],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];


    PROC Buffer()
        MoveJ p1_Buffer,v1000,fine,Grip_R1\WObj:=wobj0;
        MoveJ p2_Buffer,v1000,fine,Grip_R1\WObj:=wobj0;
    ENDPROC

    PROC Mesa1()
        MoveJ P_Mesa_1,v1000,fine,Grip_R1\WObj:=wobj0;
    ENDPROC

    PROC Mesa2()
        MoveJ P_Mesa_2,v1000,fine,Grip_R1\WObj:=wobj0;
    ENDPROC

    PROC DejarOp210B()
    	CONST robtarget pDejar:=[[-0.01,0.00,0.00],[0.00185165,0.999806,-3.71595E-05,0.0196225],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        PresenciaPieza 1;
        CerrarGarra 1;
        GripLoad lPieza;
        Release 3,"Dejar en Op210";
        PedirAnticolision 2, "Anticolisión con RS4";
        MoveAbsJ R1_pHome,v1000,z50,Grip_R1;
        MoveJ [[756.78,2289.41,564.98],[0.0212734,-0.437342,-0.898112,-0.0409246],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z200, Grip_R1\WObj:=R1_wOp210B;
        MoveJ [[-3.70,1595.63,1035.65],[0.0996473,0.993902,-0.0467324,0.00674811],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z200, Grip_R1\WObj:=R1_wOp210B;
        MoveJ [[-227.21,597.27,868.65],[0.0382793,0.997533,-0.0570225,0.0145321],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z200, Grip_R1\WObj:=R1_wOp210B;
        MoveJ Offs(pDejar,0,0,300), v1000, z100, Grip_R1\WObj:=R1_wOp210B;
        MoveL Offs(pDejar,0,0,45), v1000, fine, Grip_R1\WObj:=R1_wOp210B;
        WaitTime\InPos, 0.5;
        AbrirGarra 1;
        GripLoad load0;
        MoveL Offs(pDejar,0,0,20), v50, fine, Grip_R1\WObj:=R1_wOp210B;
        MoveL pDejar, v50, fine, Grip_R1\WObj:=R1_wOp210B;
        MoveL Offs(pDejar,-10,0,-15), v1000, z10, Grip_R1\WObj:=R1_wOp210B;
        MoveL Offs(pDejar,-150,0,-15), v1000, fine, Grip_R1\WObj:=R1_wOp210B;
        SinPieza 1;
        Fixture 2, "Esperando salir  Op210B";
        MoveJ Offs(pDejar,-150,0,150), v1000, z100, Grip_R1\WObj:=R1_wOp210B;
        TriggJ [[2.76,1157.08,1094.65],[0.112544,0.993632,0.00216109,0.00488251],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, Releases{3}, z200, Grip_R1\WObj:=R1_wOp210B;
        !MoveJ [[684.05,-544.35,1588.90],[0.101507,0.60935,0.785811,-0.0298228],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, Grip_R1;
        LiberaAnticolJ [[684.05,-544.35,1588.90],[0.101507,0.60935,0.785811,-0.0298228],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], 2, v1000, z200, Grip_R1;
        MoveAbsJ R1_pHome,v1000,z50,Grip_R1;
        RETURN;
    ENDPROC
ENDMODULE