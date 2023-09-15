MODULE R1_RACK
    ! Puntos del rack
    ! izquierdo
    LOCAL CONST robtarget R1_pRack_IzqInf_pos1:=[[-0.02,0.00,-1.39],[0.715382,-0.0172016,0.698206,0.0210285],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_IzqInf_pos2:=[[-214.02,-26.38,-181.24],[0.712335,-0.0221182,0.701196,0.0203576],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_IzqInf_pos3:=[[-430.95,-26.38,4.08],[0.712334,-0.0221178,0.701197,0.0203589],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_IzqInf_pos4:=[[-641.04,-36.31,-176.67],[0.712347,-0.0221001,0.701184,0.0203718],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    LOCAL CONST robtarget R1_pRack_IzqSup_pos1:=[[-0.02,0.00,658.61],[0.715382,-0.0172016,0.698206,0.0210285],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_IzqSup_pos2:=[[-214.02,-11.02,478.23],[0.712334,-0.022124,0.701196,0.0203568],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_IzqSup_pos3:=[[-425.51,-23.56,659.27],[0.71233,-0.022118,0.701201,0.0203579],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_IzqSup_pos4:=[[-636.57,-25.24,480.19],[0.720903,-0.0178115,0.692503,0.0205379],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    ! Derecha
    LOCAL CONST robtarget R1_pRack_DerInf_pos1:=[[-3.10,-6.03,-0.79],[0.715239,-0.0170553,0.698353,0.0210833],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_DerInf_pos2:=[[-207.19,-19.57,-180.16],[0.712323,-0.0221141,0.701208,0.0203584],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_DerInf_pos3:=[[-425.95,-31.63,0.14],[0.712149,-0.026784,0.701065,0.0251688],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_DerInf_pos4:=[[-632.16,-40.18,-184.24],[0.7123,-0.0234964,0.701144,0.021792],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    LOCAL CONST robtarget R1_pRack_DerSup_pos1:=[[-0.02,-2.73,655.96],[0.715378,-0.0172001,0.69821,0.02103],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_DerSup_pos2:=[[-204.36,-11.76,478.40],[0.719947,-0.0218989,0.693378,0.0205908],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_DerSup_pos3:=[[-412.25,-29.61,653.60],[0.712333,-0.022117,0.701197,0.0203588],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_DerSup_pos4:=[[-630.94,-41.78,479.16],[0.712338,-0.0220961,0.701192,0.0203756],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    LOCAL CONST robtarget R1_pRack_Izq_Abajo:=[[-1768.64,-7.94,-175.16],[0.137536,-0.199686,0.962518,0.121524],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_Izq_Arriba:=[[-1676.73,-111.45,704.51],[2.9226E-06,-0.0385709,0.999256,-3.12876E-06],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_Izq_Arriba10:=[[-1342.59,-140.46,-1695.92],[0.96246,-0.265148,-0.0533346,-0.0228591],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_Dcha_Abajo:=[[-1582.03,-143.94,-174.75],[0.172201,0.0870343,0.981133,-0.0122401],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget R1_pRack_Dcha_Arriba:=[[-1709.34,8.55,762.36],[0.0424324,0.0426421,0.998184,-0.00301268],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    ! Variables
    PERS num desplXDescargaOp205B:=-500;
    PERS num desplZDescargaOP205B:=150;
    CONST num distanciaEntrePiezas:=210;
    LOCAL CONST robtarget pAproxRackIzq:=[[492.83,733.68,1548.40],[0.0229772,-0.413229,0.910319,-0.00567575],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pAproxRackDch:=[[492.83,733.68,1548.40],[0.0229772,-0.413229,0.910319,-0.00567575],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pAproxRackDch10:=[[-1448.44,-710.98,685.12],[0.511468,0.241111,0.712925,-0.414733],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC CogerOP190_Rack()
        ! Coger pieza en Rack
        Set R1Bo_InJob;
        SinPieza 1;
        AbrirGarra 1;
        Release 1,"Petición release Rack";
        MoveAbsJ R1_pHome,v3000,fine,Grip_R1;
        !Primera pieza en coger es la número 16
        !Del 16 al 13 arriba a la derecha
        !Del 12 al 9 arriba a la izquierda
        !Del 8 al 5 abajo a la derecha
        !Del 4 al 1 abajo a la izquierda
        TEST GOutput(R1Go_Rack)
        CASE 1,2,3,4,9,10,11,12:
            RackIzquierdo;
        CASE 5,6,7,8,13,14,15,16:
            RackDerecho;
        DEFAULT:
            WHILE TRUE DO
                !Error  en código de rack
                DisplayError "Código de Racks incorrecto";
                Stop;
            ENDWHILE
        ENDTEST
        Fixture 1,"Coger pieza en rack";
        MoveAbsJ R1_pHome,v3000,fine,Grip_R1;
        RETURN ;
    ENDPROC

    LOCAL PROC RackDerecho()
        TEST GOutput(R1Go_Rack)
        CASE 5:
            T_Descarga_Rack_DerInf_1;
        CASE 6:
            T_Descarga_Rack_DerInf_2;
        CASE 7:
            T_Descarga_Rack_DerInf_3;
        CASE 8:
            T_Descarga_Rack_DerInf_4;
        CASE 13:
            T_Descarga_Rack_DerSup_1;
        CASE 14:
            T_Descarga_Rack_DerSup_2;
        CASE 15:
            T_Descarga_Rack_DerSup_3;
        CASE 16:
            T_Descarga_Rack_DerSup_4;
        DEFAULT:
            WHILE TRUE DO
                !Error  en código de rack
                DisplayError "Código de Racks incorrecto";
                Stop;
            ENDWHILE
        ENDTEST
        MoveAbsJ R1_pHome_Old\NoEOffs, v1000, z50, Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC RackIzquierdo()
        TEST GOutput(R1Go_Rack)
        CASE 1:
            T_Descarga_Rack_IzqInf_1;
        CASE 2:
            T_Descarga_Rack_IzqInf_2;
        CASE 3:
            T_Descarga_Rack_IzqInf_3;
        CASE 4:
            T_Descarga_Rack_IzqInf_4;
        CASE 9:
            T_Descarga_Rack_IzqSup_1;
        CASE 10:
            T_Descarga_Rack_IzqSup_2;
        CASE 11:
            T_Descarga_Rack_IzqSup_3;
        CASE 12:
            T_Descarga_Rack_IzqSup_4;
        DEFAULT:
            WHILE TRUE DO
                !Error  en código de rack
                DisplayError "Código de Racks incorrecto";
                Stop;
            ENDWHILE
        ENDTEST
        MoveAbsJ R1_pHome\NoEOffs, v1000, z50, Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerInf_1()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerInf Pos_1_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_DerInf_pos1,desplXDescargaOp205B-distanciaEntrePiezas*2,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ Offs(R1_pRack_DerInf_pos1,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos1,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos1,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerInf_pos1,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerInf_pos1,-40,0,-10\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos1,-30,30,-15\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos1,-55,25,-50\Rx:=3\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos1,-65,-5,-110\Rx:=8\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos1,-90,10,-350\Rx:=20\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos1,-80,-10,desplZDescargaOP205B-distanciaEntrePiezas*3\Rx:=20\Ry:=2\Rz:=-2),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos1,-80,-90,desplZDescargaOP205B-distanciaEntrePiezas*4\Rx:=40\Ry:=2\Rz:=-2),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Abajo,v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerInf_2()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerInf Pos_2_A         *
        !******************************************
        !
        MoveJ RelTool(R1_pRack_DerInf_pos3,-desplZDescargaOP205B-250,0,desplXDescargaOp205B - distanciaEntrePiezas\Rx:=0\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ Offs(R1_pRack_DerInf_pos2,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos2,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos2,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerInf_pos2,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerInf_pos2,-40,0,-10\Rx:=0\Ry:=4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos2,-30,30,-20\Rx:=0\Ry:=6\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos2,-55,30,-50\Rx:=3\Ry:=4\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos2,-70,-5,-110\Rx:=8\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos2,-80,-5,-350\Rx:=20\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos2,-250,-90,-desplZDescargaOP205B-(distanciaEntrePiezas*2)\Rx:=45\Ry:=2\Rz:=-2),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Abajo,v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerInf_3()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerInf Pos_3_A         *
        !******************************************
        !
        MoveJ RelTool(R1_pRack_DerInf_pos3,-desplZDescargaOP205B-250,0,desplXDescargaOp205B - distanciaEntrePiezas\Rx:=0\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos3,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos3,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerInf_pos3,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerInf_pos3,-40,0,0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos3,-30,30,0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos3,-30,30,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos3,-50,0,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos3,-40,30,-160\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos3,-40,-30,-160\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos3,-40,-30,-300\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos3,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Abajo,v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerInf_4()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerInf Pos_4_A         *
        !******************************************
        !
        MoveJ RelTool(R1_pRack_DerInf_pos4,-desplZDescargaOP205B,0,desplXDescargaOp205B\Rx:=0\Ry:=25\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos4,15,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerInf_pos4,15,0,15),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerInf_pos4,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerInf_pos4,-40,0,-10\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos4,-35,30,-20\Rx:=0\Ry:=4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos4,-45,30,-50\Rx:=3\Ry:=4\Rz:=-1),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos4,-60,-10,-110\Rx:=8\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos4,-60,-20,-200\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerInf_pos4,-desplZDescargaOP205B,0,desplXDescargaOp205B\Rx:=0\Ry:=25\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Abajo,v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerSup_1()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerSup Pos_1_A         *
        !******************************************
        !        
        MoveJ Offs(R1_pRack_DerSup_pos1,desplXDescargaOp205B - distanciaEntrePiezas * 3,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos1,desplXDescargaOp205B - distanciaEntrePiezas,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-desplZDescargaOP205B,0,desplXDescargaOp205B\Rx:=0\Ry:=-5\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-desplZDescargaOP205B,0,0\Rx:=0\Ry:=-5\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos1,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerSup_pos1,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerSup_pos1,-40,0,0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-30,30,0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-30,30,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-40,0,-50\Rx:=4\Ry:=-5\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-30,30,-150\Rx:=14\Ry:=-6\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-40,-30,-160\Rx:=14\Ry:=-6\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-90,0,-160\Rx:=14\Ry:=-10\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-90,0,desplXDescargaOP205B-distanciaEntrePiezas*2\Rx:=14\Ry:=-10\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos1,-90,0,desplXDescargaOP205B-distanciaEntrePiezas*2\Rx:=00\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ pAproxRackDch10, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerSup_2()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerSup Pos_2_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_DerSup_pos2,desplXDescargaOp205B - distanciaEntrePiezas * 2,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos2,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos2,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerSup_pos2,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerSup_pos2,-40,0,-20\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos2,-80,0,-10\Rx:=0\Ry:=2\Rz:=-4),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos2,-100,0,-60\Rx:=5\Ry:=0\Rz:=-6),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos2,-110,0,-160\Rx:=12\Ry:=0\Rz:=-7),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos2,-180,0,-170\Rx:=12\Ry:=0\Rz:=-4),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos2,-200,0,desplXDescargaOp205B   \Rx:=12\Ry:=0\Rz:=-4),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos2,-200,0,desplXDescargaOp205B - (distanciaEntrePiezas *2)    \Rx:=12\Ry:=0\Rz:=-4),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ pAproxRackDch10, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerSup_3()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerSup Pos_3_A         *
        !******************************************
        !
        !MoveJ RelTool(R1_pRack_DerSup_pos3,-150,0,desplXDescargaOp205B - distanciaEntrePiezas    \Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ Offs(R1_pRack_DerSup_pos3,desplXDescargaOp205B - distanciaEntrePiezas,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos3,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos3,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerSup_pos3,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_DerSup_pos3,-40,0,0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos3,-30,30,0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos3,-30,30,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos3,-50,0,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos3,-40,30,-160\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos3,-40,-30,-160\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos3,-40,-30,-300\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos3,desplXDescargaOp205B - distanciaEntrePiezas,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ pAproxRackDch10, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_DerSup_4()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack DerSup Pos_4_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_DerSup_pos4,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos4,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL Offs(R1_pRack_DerSup_pos4,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL R1_pRack_DerSup_pos4,v100,fine,Grip_R1\WObj:=R1_wRack_DCH;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        Fixture 1,"Coger pieza en rack";
        MoveL RelTool(R1_pRack_DerSup_pos4,-40,0,-10\Rx:=0\Ry:=4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos4,-30,30,-10\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos4,-30,30,-50\Rx:=3\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos4,-30,0,-180\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos4,-30,-30,-180\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_DCH;
        MoveL RelTool(R1_pRack_DerSup_pos4,-30,-30,desplXDescargaOp205B\Rx:=14\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_DCH;
        MoveJ R1_pRack_Dcha_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_DCH;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqInf_1()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqInf Pos_1_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_IzqInf_pos1,desplXDescargaOp205B-distanciaEntrePiezas*3,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos1,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos1,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos1,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqInf_pos1,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqInf_pos1,-40,0,-10\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos1,-35,30,-15\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos1,-60,30,-80\Rx:=7\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos1,-70,10,-110\Rx:=10\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos1,-80,20,-350\Rx:=20\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos1,-80,-10,-desplZDescargaOP205B-distanciaEntrePiezas*4\Rx:=20\Ry:=2\Rz:=-2),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ Offs(R1_pRack_IzqInf_pos1,desplXDescargaOp205B-distanciaEntrePiezas*3,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Abajo,v1000,z50,Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqInf_2()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqInf Pos_2_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_IzqInf_pos2,desplXDescargaOp205B-distanciaEntrePiezas*2,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos2,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos2,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos2,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqInf_pos2,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqInf_pos2,-40,0,-10\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos2,-35,30,-15\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos2,-55,30,-50\Rx:=3\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos2,-70,-5,-110\Rx:=8\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos2,-80,0,-350\Rx:=20\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos2,-80,-10,-desplZDescargaOP205B-distanciaEntrePiezas*3\Rx:=20\Ry:=2\Rz:=-2),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ Offs(R1_pRack_IzqInf_pos2,desplXDescargaOp205B-distanciaEntrePiezas*2,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Abajo,v1000,z50,Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqInf_3()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqInf Pos_3_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_IzqInf_pos3,desplXDescargaOp205B-(distanciaEntrePiezas*2),0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ Offs(R1_pRack_IzqInf_pos3,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos3,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos3,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqInf_pos3,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-40,0,0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-30,30,0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-30,30,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-50,0,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-40,30,-160\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-40,-30,-160\Rx:=14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos3,-40,-30,-300\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos3,desplXDescargaOp205B-(distanciaEntrePiezas*2),0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Abajo,v1000,z50,Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqInf_4()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqInf Pos_4_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_IzqInf_pos4,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos4,15,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos4,15,0,15),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqInf_pos4,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqInf_pos4,-40,0,-10\Rx:=0\Ry:=4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos4,-30,30,-15\Rx:=0\Ry:=4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos4,-50,30,-50\Rx:=3\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos4,-60,-20,-110\Rx:=8\Ry:=2\Rz:=-2),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqInf_pos4,-60,-20,-200\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqInf_pos4,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Abajo,v1000,z50,Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqSup_1()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqSup Pos_1_A         *
        !******************************************
        !
        MoveJ RelTool(R1_pRack_IzqSup_pos1,-150,0,desplXDescargaOp205B - distanciaEntrePiezas * 3    \Rx:=0\Ry:=-12\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-150,0,desplXDescargaOp205B\Rx:=0\Ry:=-12\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-150,0,25\Rx:=0\Ry:=-12\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqSup_pos1,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqSup_pos1,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-40,0,0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-30,30,0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-30,30,-50\Rx:=4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-40,0,-40\Rx:=4\Ry:=-5\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-30,30,-150\Rx:=14\Ry:=-6\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-40,-30,-160\Rx:=14\Ry:=-6\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-90,0,-160\Rx:=20\Ry:=-10\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-90,0,desplxDescargaOP205B-distanciaEntrePiezas*2\Rx:=20\Ry:=-10\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos1,-90,0,desplXDescargaOP205B-distanciaEntrePiezas*3\Rx:=0\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqSup_2()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqSup Pos_2_A         *
        !******************************************
        !
        MoveJ RelTool(R1_pRack_IzqSup_pos2,-150,0,desplXDescargaOp205B - distanciaEntrePiezas * 2    \Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-150,0,desplXDescargaOP205B\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-150,0,25\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqSup_pos2,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqSup_pos2,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-40,-5,0\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-80,10,-5\Rx:=0\Ry:=-2\Rz:=-4),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-90,-5,-55\Rx:=6\Ry:=-2\Rz:=-4),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-120,-40,-30\Rx:=6\Ry:=-2\Rz:=-6),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-250,-35,-40\Rx:=8\Ry:=-2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-250,-5,-180\Rx:=-16\Ry:=-4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-250,-10,-470\Rx:=-14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos2,-170,0,desplXDescargaOP205B-(distanciaEntrePiezas*2)\Rx:=-12\Ry:=0\Rz:=-4),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqSup_3()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqSup Pos_3_A         *
        !******************************************
        !
        MoveJ RelTool(R1_pRack_IzqSup_pos3,-150,0,desplXDescargaOP205B-distanciaEntrePiezas\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-150,0,desplXDescargaOP205B\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-150,0,25\Rx:=0\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqSup_pos3,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqSup_pos3,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-40,0,0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-30,-30,0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-30,-30,-50\Rx:=-4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-40,0,-50\Rx:=-4\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-40,-30,-160\Rx:=-14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-40,20,-190\Rx:=-18\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos3,-40,20,desplXDescargaOp205B - distanciaEntrePiezas\Rx:=-18\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC

    LOCAL PROC T_Descarga_Rack_IzqSup_4()
        !
        !******************************************
        !*             Trayectoria                *
        !*   Descarga Rack IzqSup Pos_4_A         *
        !******************************************
        !
        MoveJ Offs(R1_pRack_IzqSup_pos4,desplXDescargaOp205B,0,desplZDescargaOP205B),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqSup_pos4,0,0,desplZDescargaOP205B),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL Offs(R1_pRack_IzqSup_pos4,15,0,10),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL R1_pRack_IzqSup_pos4,v100,fine,Grip_R1\WObj:=R1_wRack_IZQ;
        WaitTime\InPos,0.5;
        CerrarGarra 1;
        PresenciaPieza 1;
        GripLoad lPieza;
        MoveL RelTool(R1_pRack_IzqSup_pos4,-40,0,-10\Rx:=0\Ry:=4\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos4,-30,-30,-10\Rx:=0\Ry:=2\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos4,-30,-30,-40\Rx:=-3\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos4,-30,0,-180\Rx:=-14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos4,-30,30,-180\Rx:=-14\Ry:=0\Rz:=0),v1000,z10,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveL RelTool(R1_pRack_IzqSup_pos4,-30,-30,desplXDescargaOP205B\Rx:=-14\Ry:=0\Rz:=0),v1000,z200,Grip_R1\WObj:=R1_wRack_IZQ;
        MoveJ R1_pRack_Izq_Arriba, v1000, z200, Grip_R1\WObj:=R1_wRack_IZQ;
        RETURN ;
    ENDPROC


ENDMODULE