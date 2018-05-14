!  This file is part of libxfoil.

!  libxfoil is free software: you can redistribute it and/or modify
!  it under the terms of the GNU General Public License as published by
!  the Free Software Foundation, either version 3 of the License, or
!  (at your option) any later version.

!  libxfoil is distributed in the hope that it will be useful,
!  but WITHOUT ANY WARRANTY; without even the implied warranty of
!  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!  GNU General Public License for more details.

!  You should have received a copy of the GNU General Public License
!  along with libxfoil.  If not, see <http://www.gnu.org/licenses/>.

!  Copyright (C) 2018 Daniel Prosser

module xfoil_data_mod

! Derived type including all of the originally-global Xfoil variables
! This is huge because Xfoil uses a lot of global variables!

  use iso_c_binding

  implicit none

!------ Primary dimensioning limit parameters
! IQX   number of surface panel nodes + 6
! IWX   number of wake panel nodes
! IPX   number of Qspec(s) distributions
! ISX   number of airfoil sides
!
!------ Derived dimensioning limit parameters
! IBX   number of buffer airfoil nodes
! IMX   number of complex mapping coefficients  Cn
! IZX   number of panel nodes (airfoil + wake)
! IVX   number of nodes along BL on one side of airfoil and wake
! NAX   number of points in stored polar
! NPX   number of polars and reference polars
! NFX   number of points in one reference polar
! NTX   number of points in thickness/camber arrays

  INTEGER(c_int), PARAMETER :: IQX=360
  INTEGER(c_int), PARAMETER :: ISX=2
  INTEGER(c_int), PARAMETER :: IBX=4*IQX
  INTEGER(c_int), PARAMETER :: IWX=IQX/8+2
  INTEGER(c_int), PARAMETER :: IZX=IQX+IWX
  INTEGER(c_int), PARAMETER :: IVX=IQX/2 + IWX + 50
  INTEGER(c_int), PARAMETER :: NCOM = 73

! The following are originally from XFOIL.INC or added for libxfoil

  type, bind(c) :: xfoil_data_type

    REAL(c_double) :: PI, HOPI, QOPI, DTOR
    LOGICAL(c_bool) :: SILENT_MODE, VISCOUS_MODE
    INTEGER(c_int) :: MAXIT
    REAL(c_double) :: GAM(IQX), GAMU(IQX,2), QINVU(IZX,2), GAM_A(IQX)
    REAL(c_double) :: QINV(IZX), QINV_A(IZX)
    LOGICAL(c_bool) :: LGAMU, LQAIJ, SHARP, LVISC, LWAKE, LVCONV, LWDIJ, LIPAN
    LOGICAL(c_bool) :: LBLINI, LADIJ, LALFA
    INTEGER(c_int) :: RETYP, MATYP, ITMAX
    REAL(c_double) :: AIJ(IQX,IQX), BIJ(IQX,IZX), DIJ(IZX,IZX), CIJ(IWX,IQX)
    REAL(c_double) :: DZDG(IQX), DZDN(IQX), DQDG(IQX), DZDM(IZX), DQDM(IZX)
    REAL(c_double) :: X(IZX), Y(IZX), NX(IZX), NY(IZX), S(IZX), APANEL(IZX)
    REAL(c_double) :: SIG(IZX), XP(IZX), YP(IZX)
    INTEGER(c_int) :: N, NB, NPAN, NW, IST, NSYS
    REAL(c_double) :: PSIO, QINF, ALFA, Z_QINF, Z_ALFA, Z_QDOF0, Z_QDOF1
    REAL(c_double) :: Z_QDOF2, Z_QDOF3, ANTE, ASTE, DSTE, ADEG, AMAX
    REAL(c_double) :: QF0(IQX), QF1(IQX), QF2(IQX), QF3(IQX)
    INTEGER(c_int) :: AIJPIV(IQX), IBLTE(ISX), NBL(ISX)
    INTEGER(c_int) :: IPAN(IVX,ISX), ISYS(IVX,ISX)
    REAL(c_double) :: SIGTE, GAMTE, SIGTE_A, GAMTE_A, MINF, MINF1, REINF, REINF1
    REAL(c_double) :: TKLAM, TKL_MSQ, CPSTAR, QSTAR, GAMMA, GAMM1
    REAL(c_double) :: XCMREF, YCMREF, CL, CM, CD, CDP, CDF, CL_ALF, CL_MSQ, SBLE
    REAL(c_double) :: XB(IBX), YB(IBX), SB(IBX), XBP(IBX), YBP(IBX), SNEW(5*IBX)
    REAL(c_double) :: W1(6*IQX), W2(6*IQX), W3(6*IQX)
    REAL(c_double) :: W4(6*IQX), W5(6*IQX), W6(6*IQX)
    REAL(c_double) :: XLE, YLE, XTE, YTE, CHORD, SLE
    REAL(c_double) :: CVPAR, CTERAT, CTRRAT, XSREF1, XSREF2, XPREF1, XPREF2
    REAL(c_double) :: MINF_CL, COSA, SINA, ACRIT, RLX, VACCEL
    REAL(c_double) :: CPI(IZX), CPV(IZX), QVIS(IZX)
    REAL(c_double) :: VTI(IVX,ISX), XSSI(IVX,ISX)
    REAL(c_double) :: AWAKE, AVISC, MVISC, CLSPEC, QTAN1, QTAN2, SST, SST_GO
    REAL(c_double) :: SST_GP
    REAL(c_double) :: WGAP(IWX), XSTRIP(ISX), XSSITR(ISX)
    REAL(c_double) :: UINV(IVX,ISX), UINV_A(IVX,ISX), UEDG(IVX,ISX)
    REAL(c_double) :: THET(IVX,ISX), DSTR(IVX,ISX), CTAU(IVX,ISX)
    REAL(c_double) :: MASS(IVX,ISX), TAU(IVX,ISX), DIS(IVX,ISX), CTQ(IVX,ISX)
    REAL(c_double) :: DELT(IVX,ISX), TSTR(IVX,ISX), USLP(IVX,ISX)
    INTEGER(c_int) :: IDAMP
    INTEGER(c_int) :: ITRAN(ISX), IMXBL, ISMXBL
    LOGICAL(c_bool) :: TFORCE(ISX)
    REAL(c_double) :: VM(3,IZX,IZX), VA(3,2,IZX), VB(3,2,IZX), VDEL(3,2,IZX)
    REAL(c_double) :: VZ(3,2), XOCTR(ISX), YOCTR(ISX)
    REAL(c_double) :: RMSBL, RMXBL, WAKLEN
    REAL(c_double) :: UNEW(IVX,2), U_AC(IVX,2)
    REAL(c_double) :: QNEW(IQX), Q_AC(IQX)
    CHARACTER(c_char), dimension(1) :: VMXBL
    REAL(c_double) :: THICKB, XTHICKB, THICKM, XTHICKM, CAMBR, XCAMBR
    LOGICAL(c_bool) :: XFOIL_FAIL

  end type xfoil_data_type

!   The following are originally from BLPAR.INC
!
!-    SCCON  =  shear coefficient lag constant
!-    GACON  =  G-beta locus constants...
!-    GBCON  =   G = GACON * sqrt(1.0 + GBCON*beta) 
!-    GCCON  =         + GCCON / [H*Rtheta*sqrt(Cf/2)]   <-- wall term
!-    DLCON  =  wall/wake dissipation length ratio  Lo/L
!-    CTCON  =  Ctau weighting coefficient (implied by G-beta constants)
!
  type, bind(c) :: blpar_data_type

    REAL(c_double) :: SCCON, GACON, GBCON, GCCON, DLCON, CTRCON, CTRCEX, DUXCON
    REAL(c_double) :: CTCON, CFFAC

  end type blpar_data_type

! The following are originally from XBL.INC

  type, bind(c) :: xbl_data_type

    INTEGER(c_int) :: IDAMPV
    LOGICAL(c_bool) :: SIMI, TRAN, TURB, WAKE
    LOGICAL(c_bool) :: TRFORC, TRFREE
    REAL(c_double) :: X1, U1, T1, D1, S1, AMPL1, U1_UEI, U1_MS, DW1
    REAL(c_double) :: H1, H1_T1, H1_D1
    REAL(c_double) :: M1, M1_U1, M1_MS
    REAL(c_double) :: R1, R1_U1, R1_MS
    REAL(c_double) :: V1, V1_U1, V1_MS, V1_RE
    REAL(c_double) :: HK1, HK1_U1, HK1_T1, HK1_D1, HK1_MS
    REAL(c_double) :: HS1, HS1_U1, HS1_T1, HS1_D1, HS1_MS, HS1_RE
    REAL(c_double) :: HC1, HC1_U1, HC1_T1, HC1_D1, HC1_MS
    REAL(c_double) :: RT1, RT1_U1, RT1_T1, RT1_MS, RT1_RE
    REAL(c_double) :: CF1, CF1_U1, CF1_T1, CF1_D1, CF1_MS, CF1_RE
    REAL(c_double) :: DI1, DI1_U1, DI1_T1, DI1_D1, DI1_S1, DI1_MS, DI1_RE
    REAL(c_double) :: US1, US1_U1, US1_T1, US1_D1, US1_MS, US1_RE
    REAL(c_double) :: CQ1, CQ1_U1, CQ1_T1, CQ1_D1, CQ1_MS, CQ1_RE
    REAL(c_double) :: DE1, DE1_U1, DE1_T1, DE1_D1, DE1_MS
    REAL(c_double) :: X2, U2, T2, D2, S2, AMPL2, U2_UEI, U2_MS, DW2
    REAL(c_double) :: H2, H2_T2, H2_D2
    REAL(c_double) :: M2, M2_U2, M2_MS
    REAL(c_double) :: R2, R2_U2, R2_MS
    REAL(c_double) :: V2, V2_U2, V2_MS, V2_RE
    REAL(c_double) :: HK2, HK2_U2, HK2_T2, HK2_D2, HK2_MS
    REAL(c_double) :: HS2, HS2_U2, HS2_T2, HS2_D2, HS2_MS, HS2_RE
    REAL(c_double) :: HC2, HC2_U2, HC2_T2, HC2_D2, HC2_MS
    REAL(c_double) :: RT2, RT2_U2, RT2_T2, RT2_MS, RT2_RE
    REAL(c_double) :: CF2, CF2_U2, CF2_T2, CF2_D2, CF2_MS, CF2_RE
    REAL(c_double) :: DI2, DI2_U2, DI2_T2, DI2_D2, DI2_S2, DI2_MS, DI2_RE
    REAL(c_double) :: US2, US2_U2, US2_T2, US2_D2, US2_MS, US2_RE
    REAL(c_double) :: CQ2, CQ2_U2, CQ2_T2, CQ2_D2, CQ2_MS, CQ2_RE
    REAL(c_double) :: DE2, DE2_U2, DE2_T2, DE2_D2, DE2_MS
    REAL(c_double) :: CFM, CFM_MS, CFM_RE
    REAL(c_double) :: CFM_U1, CFM_T1, CFM_D1, CFM_U2, CFM_T2, CFM_D2
    REAL(c_double) :: XT, XT_A1, XT_MS, XT_RE, XT_XF
    REAL(c_double) :: XT_X1, XT_T1, XT_D1, XT_U1, XT_X2, XT_T2, XT_D2, XT_U2
    REAL(c_double), DIMENSION(NCOM) :: C1SAV, C2SAV
    REAL(c_double) :: DWTE, QINFBL, TKBL, TKBL_MS, RSTBL, RSTBL_MS, HSTINV
    REAL(c_double) :: HSTINV_MS, REYBL, REYBL_MS, REYBL_RE, GAMBL, GM1BL
    REAL(c_double) :: HVRA, BULE, XIFORC, AMCRIT
    REAL(c_double), DIMENSION(4,5) :: VS1, VS2
    REAL(c_double), DIMENSION(4) :: VSREZ, VSR, VSM, VSX

  end type xbl_data_type

end module xfoil_data_mod
