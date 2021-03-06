%%-------------------------------------------------------------------------
% Omar A. Jiménez-Negrón (06.2019)- Revised 08.2019
%--------------------------------------------------------------------------

%% Define dimensions of materials physical and chemical properties (Features)
  
% Input row vector with dimensions exponents: [Length   Mass   Time  Current  Temperature   MatterAmount  ... ...]
% This script outputs the U-terms in a csv file 'U_groups.csv' as input for MAST-ML
% Very coarse implementation, clearly is not very convenient nor efficient and needs improvement  
% if used with larger amounts of data. 
% Instances: composition_average, arithemetic_average, max_value,
% min_value, difference, Element1
 
Features={                          'B2' [1	0	0	0	0	0], ...%AtomicRadii instances
                                   'CK2' [1	0	0	0	0	0], ...
                                   'FT2' [1	0	0	0	0	0], ...
                                   'JC2' [1	0	0	0	0	0], ...
                                   'ML2' [1	0	0	0	0	0], ...
                                   'PU2' [1	0	0	0	0	0], ...
                                    'C2' [3	0	0	0	0  -1], ...%AtomicVolume instances
                                   'CL2' [3	0	0	0	0  -1], ...
                                   'FU2' [3	0	0	0	0  -1], ...
                                   'JD2' [3	0	0	0	0  -1], ...
                                   'MM2' [3	0	0	0	0  -1], ...
                                   'PV2' [3	0	0	0	0  -1], ...
                                   'D2'  [0	1	0	0	0  -1], ...%AtomicWeight instances
                                   'CM2' [0	1	0	0	0  -1], ...
                                   'FV2' [0	1	0	0	0  -1], ...
                                   'JE2' [0	1	0	0	0  -1], ...
                                   'MN2' [0	1	0	0	0  -1], ...
                                   'PW2' [0	1	0	0	0  -1], ...
                                    'E2' [1	0	0	0	0	0], ...%BCCefflatcnt instances
                                   'CN2' [1	0	0	0	0	0], ...
                                   'FW2' [1	0	0	0	0	0], ...
                                   'JF2' [1	0	0	0	0	0], ...
                                   'MO2' [1	0	0	0	0	0], ...
                                   'PX2' [1	0	0	0	0	0], ...
                                   'F2'  [2	1  -2	0	0  -1], ...%BCCenergy_pa instances
                                  'CO2'  [2	1  -2	0	0  -1], ...
                                  'FX2'  [2	1  -2	0	0  -1], ...
                                  'JG2'  [2	1  -2	0	0  -1], ...
                                  'MP2'  [2	1  -2	0	0  -1], ...
                                  'PY2'  [2	1  -2	0	0  -1], ...
                                  'H2'   [2    0   0   1   0   0], ...%BCCmagmom instances
                                  'CQ2'  [2    0   0   1   0   0], ...
                                  'FZ2'  [2    0   0   1   0   0], ...
                                  'JI2'  [2    0   0   1   0   0], ...
                                  'MR2'  [2    0   0   1   0   0], ...
                                  'QA2'  [2    0   0   1   0   0], ...
                                   'I2'  [3	0	0	0	0  -1], ...%BCCvolume_pa instances
                                  'CR2'  [3	0	0	0	0  -1], ...
                                  'GA2'  [3	0	0	0	0  -1], ...
                                  'JJ2'  [3	0	0	0	0  -1], ...
                                  'MS2'  [3	0	0	0	0  -1], ...
                                  'QB2'  [3	0	0	0	0  -1], ...
                                   'J2'  [3	0	0	0	0  -1], ...%BCCvolume_padiff instances
                                  'CS2'  [3	0	0	0	0  -1], ...
                                  'GB2'  [3	0	0	0	0  -1], ...
                                  'JK2'  [3	0	0	0	0  -1], ...
                                  'MT2'  [3	0	0	0	0  -1], ...
                                  'QC2'  [3	0	0	0	0  -1], ...
                                  'K2'   [0	0	0	0	1	0], ...%BoilingT instances
                                 'CT2'   [0	0	0	0	1	0], ...   
                                 'GC2'   [0	0	0	0	1	0], ...  
                                 'JL2'   [0	0	0	0	1	0], ...
                                 'MU2'   [0	0	0	0	1	0], ...
                                 'QD2'   [0	0	0	0	1	0], ...
                                   'L2'  [-1	1  -2	0	0	0], ...%BulkModulus instances
                                  'CU2'  [-1	1  -2	0	0	0], ...
                                  'GD2'  [-1	1  -2	0	0	0], ...
                                  'JM2'  [-1	1  -2	0	0	0], ...
                                  'MV2'  [-1	1  -2	0	0	0], ...
                                  'QE2'  [-1	1  -2	0	0	0], ...
                                  'N2'   [1	0	0	0	0	0], ...%CovalentRadii instances
                                 'CW2'   [1	0	0	0	0	0], ...
                                 'GF2'   [1	0	0	0	0	0], ...
                                 'JO2'   [1	0	0	0	0	0], ...
                                 'MX2'   [1	0	0	0	0	0], ...
                                 'QG2'   [1	0	0	0	0	0], ...
                                  'O2'   [1	0	0	0	0	0], ...%CovalentRadius instances
                                 'CX2'   [1	0	0	0	0	0], ...
                                 'GG2'   [1	0	0	0	0	0], ...
                                 'JP2'   [1	0	0	0	0	0], ...
                                 'MY2'   [1	0	0	0	0	0], ...
                                 'QH2'   [1	0	0	0	0	0], ...
                                  'P2'   [1	0	0	0	0	0], ...%Density instances
                                 'CY2'   [1	0	0	0	0	0], ...
                                 'GH2'   [1	0	0	0	0	0], ...
                                 'JQ2'   [1	0	0	0	0	0], ...
                                 'MZ2'   [1	0	0	0	0	0], ...
                                 'QI2'   [1	0	0	0	0	0], ...
                                 'Q2'    [-1	1  -2	0	0	0], ...%ElasticModulus instances
                                'CZ2'    [-1	1  -2	0	0	0], ...
                                'GI2'    [-1	1  -2	0	0	0], ...
                                'JR2'    [-1	1  -2	0	0	0], ...
                                'NA2'    [-1	1  -2	0	0	0], ...
                                'QJ2'    [-1	1  -2	0	0	0], ...
                                 'R2'    [-1	1  -2	0	0	0], ...%ElectricalConductivity instances
                                'DA2'    [-1	1  -2	0	0	0], ...
                                'GJ2'    [-1	1  -2	0	0	0], ...
                                'JS2'    [-1	1  -2	0	0	0], ...
                                'NB2'    [-1	1  -2	0	0	0], ...
                                'QK2'    [-1	1  -2	0	0	0], ...
                                'S2'     [2	1  -2	0	0  -1], ...%ElectronAffinity instances
                               'DB2'     [2	1  -2	0	0  -1], ...
                               'GK2'     [2	1  -2	0	0  -1], ...
                               'JT2'     [2	1  -2	0	0  -1], ...
                               'NC2'     [2	1  -2	0	0  -1], ...
                               'QL2'     [2	1  -2	0	0  -1], ...
                               'U2'      [2	1  -2	0	0	0], ...%FirstIonizationEnergy instances
                              'DD2'      [2	1  -2	0	0	0], ...
                              'GM2'      [2	1  -2	0	0	0], ...
                              'JV2'      [2	1  -2	0	0	0], ... 
                              'NE2'      [2	1  -2	0	0	0], ...
                              'QN2'      [2	1  -2	0	0	0], ...
                               'W2'      [2	1  -2	0	0	0], ...%GSbandgap instances
                              'DF2'      [2	1  -2	0	0	0], ...
                              'GO2'      [2	1  -2	0	0	0], ...
                              'JX2'      [2	1  -2	0	0	0], ...
                              'NG2'      [2	1  -2	0	0	0], ...
                              'QP2'      [2	1  -2	0	0	0], ...
                              'X2'       [2	1  -2	0	0  -1], ...%GSenergy_pa instances
                             'DG2'       [2	1  -2	0	0  -1], ...
                             'GP2'       [2	1  -2	0	0  -1], ...
                             'JY2'       [2	1  -2	0	0  -1], ...
                             'NH2'       [2	1  -2	0	0  -1], ...
                             'QQ2'       [2	1  -2	0	0  -1], ...
                              'Y2'       [1	0	0	0	0	0], ...%GSestBCClatcnt instances
                             'DH2'       [1	0	0	0	0	0], ...
                             'GQ2'       [1	0	0	0	0	0], ...
                             'JZ2'       [1	0	0	0	0	0], ...
                             'NI2'       [1	0	0	0	0	0], ...
                             'QR2'       [1	0	0	0	0	0], ...
                             'Z2'        [1	0	0	0	0	0], ...%GSestFCClatcnt instances
                             'DI2'       [1	0	0	0	0	0], ...
                             'GR2'       [1	0	0	0	0	0], ...
                             'KA2'       [1	0	0	0	0	0], ...
                             'NJ2'       [1	0	0	0	0	0], ...
                             'QS2'       [1	0	0	0	0	0], ...
                             'AA2'       [2    0   0   1   0   0], ...%GSmagmom instances
                             'DJ2'       [2    0   0   1   0   0], ...
                             'GS2'       [2    0   0   1   0   0], ...
                             'KB2'       [2    0   0   1   0   0], ...
                             'NK2'       [2    0   0   1   0   0], ...
                             'QT2'       [2    0   0   1   0   0], ...
                             'AB2'       [3	0	0	0	0  -1], ...%GSvolume instances
                             'DK2'       [3	0	0	0	0  -1], ...
                             'GT2'       [3	0	0	0	0  -1], ...
                             'KC2'       [3	0	0	0	0  -1], ...
                             'NL2'       [3	0	0	0	0  -1], ...
                             'AC2'       [2	0  -1	0	-1	0], ...%HeatCapacityMass instances
                             'DL2'       [2	0  -1	0	-1	0], ...
                             'GU2'       [2	0  -1	0	-1	0], ...
                             'KD2'       [2	0  -1	0	-1	0], ...
                             'NM2'       [2	0  -1	0	-1	0], ...
                             'QV2'       [2	0  -1	0	-1	0], ...
                             'AD2'       [2	1  -2	0	-1 -1], ...%HeatCapacityMolar instances
                             'DM2'       [2	1  -2	0	-1 -1], ...
                             'GV2'       [2	1  -2	0	-1 -1], ...
                             'KE2'       [2	1  -2	0	-1 -1], ...
                             'NN2'       [2	1  -2	0	-1 -1], ...
                             'QW2'       [2	1  -2	0	-1 -1], ...
                             'AE2'       [2	1  -2	0	0  -1], ...%HeatFusion instances 
                             'DN2'       [2	1  -2	0	0  -1], ...
                             'GW2'       [2	1  -2	0	0  -1], ...
                             'KF2'       [2	1  -2	0	0  -1], ... 
                             'NO2'       [2	1  -2	0	0  -1], ...
                             'QX2'       [2	1  -2	0	0  -1], ...
                             'AF2'       [2	1  -2	0	0  -1], ...%HeatVaporization instances 
                             'DO2'       [2	1  -2	0	0  -1], ...
                             'GX2'       [2	1  -2	0	0  -1], ...
                             'KG2'       [2	1  -2	0	0  -1], ...
                             'NP2'       [2	1  -2	0	0  -1], ...
                             'QY2'       [2	1  -2	0	0  -1], ...
                             'AJ2'       [1	0	0	0	0	0], ...%IonicRadii instances
                             'DS2'       [1	0	0	0	0	0], ...
                             'HB2'       [1	0	0	0	0	0], ...
                             'KK2'       [1	0	0	0	0	0], ...
                             'NT2'       [1	0	0	0	0	0], ...
                             'RC2'       [1	0	0	0	0	0], ...
                             'AK2'       [2	1  -2	0	0	0], ...%IonizationEnergy instances
                             'DT2'       [2	1  -2	0	0	0], ...
                             'HC2'       [2	1  -2	0	0	0], ...
                             'KL2'       [2	1  -2	0	0	0], ...
                             'NU2'       [2	1  -2	0	0	0], ...
                             'RD2'       [2	1  -2	0	0	0], ...
                             'BI2'       [0	0	0	0	1	0], ...%MeltingT instances  
                             'ER2'       [0	0	0	0	1	0], ...   
                             'IA2'       [0	0	0	0	1	0], ...
                             'LJ2'       [0	0	0	0	1	0], ...
                             'OS2'       [0	0	0	0	1	0], ... 
                             'SB2'       [0	0	0	0	1	0], ...
                             'BZ2'       [0   -1	4	2	0	0], ...%Polarizability instances
                             'FI2'       [0   -1	4	2	0	0], ...
                             'IR2'       [0   -1	4	2	0	0], ... 
                             'MA2'       [0   -1	4	2	0	0], ...
                             'PJ2'       [0   -1	4	2	0	0], ...
                             'SS2'       [0   -1	4	2	0	0], ...
                             'CB2'       [2	1  -2	0	0	0], ...%SecondIonizationEnergy instances (no Element)
                             'FK2'       [2	1  -2	0	0	0], ...
                             'IT2'       [2	1  -2	0	0	0], ...
                             'MC2'       [2	1  -2	0	0	0], ...
                             'PL2'       [2	1  -2	0	0	0], ...
                             'CC2'       [-1	1  -2	0	0	0], ...%ShearModulus instances
                             'FL2'       [-1	1  -2	0	0	0], ...
                             'IU2'       [-1	1  -2	0	0	0], ... 
                             'MD2'       [-1	1  -2	0	0	0], ...
                             'PM2'       [-1	1  -2	0	0	0], ...
                             'SU2'       [-1	1  -2	0	0	0], ...
                             'CE2'       [2	0  -1	0	-1	0], ...%SpecificHeatCapacity instances
                             'FN2'       [2	0  -1	0	-1	0], ...
                             'IW2'       [2	0  -1	0	-1	0], ...
                             'MF2'       [2	0  -1	0	-1	0], ...
                             'PO2'       [2	0  -1	0	-1	0], ...
                             'SW2'       [2	0  -1	0	-1	0], ...   
                             'CF2'       [1	1  -3	0	-1  0], ...%ThermalConductivity instances
                             'FO2'       [1	1  -3	0	-1  0], ...
                             'IX2'       [1	1  -3	0	-1  0], ...
                             'MG2'       [1	1  -3	0	-1  0], ...
                             'PP2'       [1	1  -3	0	-1  0], ...
                             'SX2'       [1	1  -3	0	-1  0], ... 
                             'CG2'       [0	0	0	0   -1  0], ...%ThermalExpansionCoefficient instances
                             'FP2'       [0	0	0	0   -1  0], ...
                             'IY2'       [0	0	0	0   -1  0], ...
                             'MH2'       [0	0	0	0   -1  0], ...
                             'PQ2'       [0	0	0	0   -1  0], ...
                             'SY2'       [0	0	0	0   -1  0], ...
                             'CH2'       [2	1  -2	0	0	0], ...%ThirdIonizationEnergy instances
                             'FQ2'       [2	1  -2	0	0	0], ...
                             'IZ2'       [2	1  -2	0	0	0], ...
                             'MI2'       [2	1  -2	0	0	0], ...
                             'PR2'       [2	1  -2	0	0	0]}
                    
                             
%% Compute U-Terms

% Number of dimensional variables
N_dim=round(length(Features)/2);

% Construct the Dimensional Matrix 'M'
M=zeros(length(Features{2}),N_dim);
for k=1:N_dim
    M(:,k)=Features{2*k}';
end

% Nullspace of M
N=null(M,'r'); % 'r' returns a "rational" basis for the nullspace of M

% Number of U-groups
[a,b]=size(N);
No_groups=b;

%% U-Groups Excel implementation 

for n=1:No_groups
    % Find non-zero values
    NZ=find(N(:,n)~=0);
    U{n}=[];
    for k=1:length(NZ)
        U{n}=[U{n} Features{2*NZ(k)-1} '^' num2str(N(NZ(k),n)) ' '];
    end
end

for n=1:No_groups
    %Find non-zero and negative exponents
    NZ=find(N(:,n)~=0);
    Neg=find(N(:,n)<0);
        if ~isempty(Neg)
            U{n}=['U' num2str(n) ',']; 
        else
            U{n}=['U' num2str(n) ','];
        end
end      

% Excel Post-Processing: '^(1)' ---> ''  and  '*)' ----> ')' 
for n=1:No_groups
    U_Excel{n} = strrep(U{n}, '^(1)', '');
    U_Excel{n} = strrep(U_Excel{n}, '*)', ')');
    U_Excel{n}  
end

%% U-Groups Definitions Excel implementation 

for n=1:No_groups
    % Find non-zero values
    NZ=find(N(:,n)~=0);
    Def{n}=[];
    for k=1:length(NZ)
        Def{n}=[Def{n} Features{2*NZ(k)-1} '^' num2str(N(NZ(k),n)) ' '];
    end
end

for n=1:No_groups
    %Find non-zero and negative exponents
    NZ=find(N(:,n)~=0);
    Neg=find(N(:,n)<0);
        if ~isempty(Neg)
            Def{n}=['' '= ('];     
        else
            Def{n}=['= ('];
        end
        
    for k=1:length(NZ)
        if N(NZ(k),n)>0
            Def{n}=[Def{n} Features{2*NZ(k)-1} '^(' num2str(N(NZ(k),n)) ')*'];
        end
    end
    if ~isempty(Neg); Def{n}=[Def{n} '']; end
    
    for k=1:length(NZ)
        if N(NZ(k),n)<0
            Def{n}=[Def{n} Features{2*NZ(k)-1} '^(-' num2str(-N(NZ(k),n)) ')*'];
        end
    end
    Def{n}=[Def{n} '),'];
end

% Excel Post-Processing: '^(1)' ---> ''  and  '*)' ----> ')' 
for n=1:No_groups
    Def_Excel{n} = strrep(Def{n}, '^(1)', '');
    Def_Excel{n} = strrep(Def_Excel{n}, '*)', ')');
    Def_Excel{n}
end

%% Write csv-file

fid = fopen('MAGPIE.csv', 'w'); 
fprintf(fid,'%s');

for n=1:No_groups     % Writes first row of the file (U-Group Numbers)
    fprintf(fid,'%s',U_Excel{n});
end

fprintf(fid,'\n'); 

for n=1:No_groups
    fprintf(fid,'%s',Def_Excel{n}); % Writes second row (U-Group cell definitions)
end

fprintf(fid,'%s');
fclose(fid);

%--------------------------------------------------------------------------
