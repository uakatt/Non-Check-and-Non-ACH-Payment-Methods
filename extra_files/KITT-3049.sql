
C:\java\liquibase>java -jar c:\java\liquiBase\liquibase-1.9.5.jar --defaultsFile=c:\java\LiquiBase\renwoluk.properties --changeLogFile=KITT-3049.xml updateSQL 
-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: KITT-3049.xml
-- Ran at: 3/13/12 11:44 AM
-- Against: RENWOLUK@jdbc:oracle:thin:@uaz-dv-n10.mosaic.arizona.edu:1523:UAZKFDEV
-- LiquiBase version: 1.9.5
-- *********************************************************************

SELECT COUNT(*) FROM DATABASECHANGELOGLOCK WHERE ID=1;

SELECT COUNT(*) FROM DATABASECHANGELOGLOCK WHERE ID=1;

-- Changeset KITT-3049.xml::FP_PMT_MTHD_T::hlo::(MD5Sum: ed7a5bef9c1c788d5073259e91111)
CREATE TABLE FP_PMT_MTHD_T (PMT_MTHD_CD CHAR(1) NOT NULL, OBJ_ID VARCHAR2(36) NOT NULL, VER_NBR NUMBER(8,0) NOT NULL, PMT_MTHD_NM VARCHAR2(40), BNK_CD VARCHAR2(4), FEE_IND CHAR(1) DEFAULT 'N' NOT NULL, PDP_IND CHAR(1) DEFAULT 'N' NOT NULL, INTERDEPT_IND CHAR(1) DEFAULT 'N' NOT NULL, CLR_ACCT_IND CHAR(1) DEFAULT 'N' NOT NULL, DV_DISPLAY_IND CHAR(1) DEFAULT 'N' NOT NULL, VENDOR_DISPLAY_IND CHAR(1) DEFAULT 'N' NOT NULL, ACTIVE_IND CHAR(1) DEFAULT 'Y' NOT NULL, CONSTRAINT FP_PMT_MTHD_TP1 PRIMARY KEY (PMT_MTHD_CD), CONSTRAINT FP_PMT_MTHD_TC0 UNIQUE (OBJ_ID));

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Create Table', '', 'ed7a5bef9c1c788d5073259e91111', 'FP_PMT_MTHD_T', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::FP_PMT_MTHD_T-constraint::hlo::(MD5Sum: c79267b1b8c4e481d2678c107dce979c)
ALTER TABLE FP_PMT_MTHD_T ADD CONSTRAINT FP_PMT_MTHD_TR1 FOREIGN KEY (BNK_CD) REFERENCES FP_BANK_T(BNK_CD);

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Add Foreign Key Constraint', '', 'c79267b1b8c4e481d2678c107dce979c', 'FP_PMT_MTHD_T-constraint', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::FP_PMT_MTHD_CHART_T::hlo::(MD5Sum: 6e3955d887a82b49238a2afeeacd6)
CREATE TABLE FP_PMT_MTHD_CHART_T (PMT_MTHD_CD CHAR(1) NOT NULL, FIN_COA_CD VARCHAR2(2) NOT NULL, EFF_DT DATE NOT NULL, OBJ_ID VARCHAR2(36) NOT NULL, VER_NBR NUMBER(8,0) NOT NULL, fee_inc_fin_coa_cd VARCHAR2(2), fee_inc_account_nbr VARCHAR2(7), fee_inc_obj_cd VARCHAR2(4), fee_exp_obj_cd VARCHAR2(4), fee_amt NUMBER(19,2), clr_fin_coa_cd VARCHAR2(2), clr_account_nbr VARCHAR2(7), clr_obj_cd VARCHAR2(4), ACTIVE_IND CHAR(1) DEFAULT 'Y' NOT NULL, CONSTRAINT FP_PMT_MTHD_CHART_TP1 PRIMARY KEY (PMT_MTHD_CD, FIN_COA_CD, EFF_DT), CONSTRAINT FP_PMT_MTHD_CHART_TC0 UNIQUE (OBJ_ID));

ALTER TABLE FP_PMT_MTHD_T ADD CONSTRAINT FP_PMT_MTHD_TR1 FOREIGN KEY (BNK_CD) REFERENCES FP_BANK_T(BNK_CD);

ALTER TABLE fp_pmt_mthd_chart_t ADD CONSTRAINT fp_pmt_mthd_chart_tr1 FOREIGN KEY (pmt_mthd_cd) REFERENCES fp_pmt_mthd_t(pmt_mthd_cd);

ALTER TABLE fp_pmt_mthd_chart_t ADD CONSTRAINT fp_pmt_mthd_chart_tr2 FOREIGN KEY (fin_coa_cd) REFERENCES ca_chart_t(fin_coa_cd);

ALTER TABLE fp_pmt_mthd_chart_t ADD CONSTRAINT fp_pmt_mthd_chart_tr3 FOREIGN KEY (fee_inc_fin_coa_cd) REFERENCES ca_chart_t(fin_coa_cd);

ALTER TABLE fp_pmt_mthd_chart_t ADD CONSTRAINT fp_pmt_mthd_chart_tr4 FOREIGN KEY (fee_inc_fin_coa_cd,fee_inc_account_nbr) REFERENCES ca_account_t(fin_coa_cd,account_nbr);

ALTER TABLE fp_pmt_mthd_chart_t ADD CONSTRAINT fp_pmt_mthd_chart_tr5 FOREIGN KEY (clr_fin_coa_cd) REFERENCES ca_chart_t(fin_coa_cd);

ALTER TABLE fp_pmt_mthd_chart_t ADD CONSTRAINT fp_pmt_mthd_chart_tr6 FOREIGN KEY (clr_fin_coa_cd,clr_account_nbr) REFERENCES ca_account_t(fin_coa_cd,account_nbr);

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Create Table, Add Foreign Key Constraint (x7)', '', '6e3955d887a82b49238a2afeeacd6', 'FP_PMT_MTHD_CHART_T', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::AP_PMT_RQST_T::hlo::(MD5Sum: 3f4e4a44ca46cb5d428b3ca253c572a)
ALTER TABLE AP_PMT_RQST_T ADD PMT_MTHD_CD CHAR(1) DEFAULT 'A';

ALTER TABLE AP_PMT_RQST_T ADD CONSTRAINT AP_PMT_RQST_TR3 FOREIGN KEY (pmt_mthd_cd) REFERENCES fp_pmt_mthd_t(pmt_mthd_cd);

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Add Column, Add Foreign Key Constraint', '', '3f4e4a44ca46cb5d428b3ca253c572a', 'AP_PMT_RQST_T', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::AP_CRDT_MEMO_T::hlo::(MD5Sum: a20616c7a35863583a1d8ddc8b4639)
ALTER TABLE AP_CRDT_MEMO_T ADD PMT_MTHD_CD CHAR(1) DEFAULT 'A';

ALTER TABLE AP_CRDT_MEMO_T ADD CONSTRAINT AP_CRDT_MEMO_TR2 FOREIGN KEY (pmt_mthd_cd) REFERENCES fp_pmt_mthd_t(pmt_mthd_cd);

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Add Column, Add Foreign Key Constraint', '', 'a20616c7a35863583a1d8ddc8b4639', 'AP_CRDT_MEMO_T', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::PUR_VNDR_DTL_EXT_T::hlo::(MD5Sum: 3c66b34d16bd7547b6365c21cd2c85)
ALTER TABLE PUR_VNDR_DTL_EXT_T ADD DFLT_B2B_PMT_MTHD_CD CHAR(1) DEFAULT 'A';

ALTER TABLE PUR_VNDR_DTL_EXT_T ADD CONSTRAINT PUR_VNDR_DTL_EXT_TR1 FOREIGN KEY (DFLT_B2B_PMT_MTHD_CD) REFERENCES fp_pmt_mthd_t(pmt_mthd_cd);

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Add Column, Add Foreign Key Constraint', '', '3c66b34d16bd7547b6365c21cd2c85', 'PUR_VNDR_DTL_EXT_T', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::GL_OFFSET_DEFN-DATA-DVNC::hlo::(MD5Sum: 205ee2a5a6a263e8dbb2b5ece880f3a6)
DELETE FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVNC';

INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
			(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'DVNC', FIN_COA_CD, SYS_GUID(), 1
			FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVWF');

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Custom SQL (x2)', '', '205ee2a5a6a263e8dbb2b5ece880f3a6', 'GL_OFFSET_DEFN-DATA-DVNC', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::GL_OFFSET_DEFN-DATA-PRNC::hlo::(MD5Sum: 5251431cdbd316ceef4a27244239a0e1)
DELETE FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'PRNC';

INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
		(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'PRNC', FIN_COA_CD, SYS_GUID(), 1
		FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVWF');

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Custom SQL (x2)', '', '5251431cdbd316ceef4a27244239a0e1', 'GL_OFFSET_DEFN-DATA-PRNC', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::GL_OFFSET_DEFN-DATA-CMNC::hlo::(MD5Sum: fa9efe1f1d46c66dbeb1f423b54065)
DELETE FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'CMNC';

INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
		(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'CMNC', FIN_COA_CD, SYS_GUID(), 1
		FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVWF');

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Custom SQL (x2)', '', 'fa9efe1f1d46c66dbeb1f423b54065', 'GL_OFFSET_DEFN-DATA-CMNC', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::krew_doc_typ_t-inserts::hlo::(MD5Sum: 5e99281a52cb737cd2e6c39379e14f6)
DECLARE
    		PaymentMethodParent NUMBER;
    		LedgerOnlyParent    NUMBER;
    	BEGIN
    		SELECT doc_typ_id
    		INTO PaymentMethodParent
    		FROM krew_doc_typ_t
    		WHERE doc_typ_nm = 'FPSM'
    		  AND cur_ind = 1;
    		SELECT doc_typ_id
    		INTO LedgerOnlyParent
    		FROM krew_doc_typ_t
    		WHERE doc_typ_nm = 'FSLO'
    		  AND cur_ind = 1;
			INSERT INTO krew_doc_typ_t(DOC_TYP_ID, PARNT_ID, DOC_TYP_NM, DOC_TYP_VER_NBR, ACTV_IND, CUR_IND, LBL, RTE_VER_NBR, VER_NBR, OBJ_ID)
			VALUES(krew_doc_hdr_s.NEXTVAL, PaymentMethodParent, 'PMCD', 0, 1, 1, 'Payment Method', '2', 1, SYS_GUID());
			INSERT INTO krew_doc_typ_t(DOC_TYP_ID, PARNT_ID, DOC_TYP_NM, DOC_TYP_VER_NBR, ACTV_IND, CUR_IND, LBL, RTE_VER_NBR, VER_NBR, OBJ_ID)
			VALUES(krew_doc_hdr_s.NEXTVAL, LedgerOnlyParent, 'DVNC', 0, 1, 1, 'Disbursement Voucher - Non Check', '2', 1, SYS_GUID());
			INSERT INTO krew_doc_typ_t(DOC_TYP_ID, PARNT_ID, DOC_TYP_NM, DOC_TYP_VER_NBR, ACTV_IND, CUR_IND, LBL, RTE_VER_NBR, VER_NBR, OBJ_ID)
			VALUES(krew_doc_hdr_s.NEXTVAL, LedgerOnlyParent, 'PRNC', 0, 1, 1, 'Payment Request - Non Check', '2', 1, SYS_GUID());
			INSERT INTO krew_doc_typ_t(DOC_TYP_ID, PARNT_ID, DOC_TYP_NM, DOC_TYP_VER_NBR, ACTV_IND, CUR_IND, LBL, RTE_VER_NBR, VER_NBR, OBJ_ID)
			VALUES(krew_doc_hdr_s.NEXTVAL, LedgerOnlyParent, 'CMNC', 0, 1, 1, 'Credit Memo - Non Check', '2', 1, SYS_GUID());
			COMMIT;
		END;

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Custom SQL', '', '5e99281a52cb737cd2e6c39379e14f6', 'krew_doc_typ_t-inserts', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::krew-inserts::hlo::(MD5Sum: a2e2b4fd6aa3e5a316d8a15ea1c22d8)
DECLARE
		PROCEDURE update_dt_acct_orghier( DocTypeCode IN VARCHAR2 ) IS
			CurrDocTypeId NUMBER;
			NextDocTypeId NUMBER;
			RouteNodeId1 NUMBER;
			RouteNodeId2 NUMBER;
			RouteNodeId3 NUMBER;
		BEGIN
			-- document type
			SELECT doc_typ_id INTO CurrDocTypeId FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = DocTypeCode AND CUR_IND = 1;
			SELECT krew_doc_hdr_s.NEXTVAL INTO NextDocTypeId FROM dual;
			INSERT INTO KREW_DOC_TYP_T(
				DOC_TYP_ID, PARNT_ID, DOC_TYP_NM, DOC_TYP_VER_NBR, ACTV_IND, CUR_IND, LBL, PREV_DOC_TYP_VER_NBR, DOC_HDR_ID, DOC_TYP_DESC, DOC_HDLR_URL, POST_PRCSR, JNDI_URL, BLNKT_APPR_PLCY, ADV_DOC_SRCH_URL, CSTM_ACTN_LIST_ATTRIB_CLS_NM, CSTM_ACTN_EMAIL_ATTRIB_CLS_NM, CSTM_DOC_NTE_ATTRIB_CLS_NM, RTE_VER_NBR, NOTIFY_ADDR, SVC_NMSPC, EMAIL_XSL, SEC_XML, VER_NBR, BLNKT_APPR_GRP_ID, RPT_GRP_ID, GRP_ID, HELP_DEF_URL, OBJ_ID )
            (
                SELECT NextDocTypeId, PARNT_ID, DOC_TYP_NM, DOC_TYP_VER_NBR + 1, ACTV_IND, CUR_IND, LBL, CurrDocTypeId, NULL, DOC_TYP_DESC, DOC_HDLR_URL, POST_PRCSR, JNDI_URL, BLNKT_APPR_PLCY, ADV_DOC_SRCH_URL, CSTM_ACTN_LIST_ATTRIB_CLS_NM, CSTM_ACTN_EMAIL_ATTRIB_CLS_NM, CSTM_DOC_NTE_ATTRIB_CLS_NM, RTE_VER_NBR, NOTIFY_ADDR, SVC_NMSPC, EMAIL_XSL, SEC_XML, 1, BLNKT_APPR_GRP_ID, RPT_GRP_ID, GRP_ID, HELP_DEF_URL, SYS_GUID() 
                    FROM KREW_DOC_TYP_T
                    WHERE DOC_TYP_ID = CurrDocTypeId
            );
			UPDATE KREW_DOC_TYP_T
			SET CUR_IND = 0
			WHERE DOC_TYP_ID = CurrDocTypeId;
			-- Route nodes
			SELECT krew_rte_node_s.NEXTVAL INTO RouteNodeId1 FROM dual;
			SELECT krew_rte_node_s.NEXTVAL INTO RouteNodeId2 FROM dual;
			SELECT krew_rte_node_s.NEXTVAL INTO RouteNodeId3 FROM dual;
			INSERT INTO KREW_RTE_NODE_T(RTE_NODE_ID, DOC_TYP_ID, NM, TYP, 
                RTE_MTHD_NM, RTE_MTHD_CD, FNL_APRVR_IND, MNDTRY_RTE_IND, 
                ACTVN_TYP, BRCH_PROTO_ID, VER_NBR, CONTENT_FRAGMENT, GRP_ID) 
            VALUES(RouteNodeId1, NextDocTypeId, 'AdHoc', 'org.kuali.rice.kew.engine.node.InitialNode', 
                NULL, NULL, 0, 0, 
                'S', NULL, 1, NULL, NULL);
			INSERT INTO KREW_RTE_NODE_T(RTE_NODE_ID, DOC_TYP_ID, NM, TYP, 
                RTE_MTHD_NM, RTE_MTHD_CD, FNL_APRVR_IND, MNDTRY_RTE_IND, 
                ACTVN_TYP, BRCH_PROTO_ID, VER_NBR, CONTENT_FRAGMENT, GRP_ID) 
            VALUES(RouteNodeId2, NextDocTypeId, 'Account', 'org.kuali.rice.kew.engine.node.RoleNode', 
                'org.kuali.rice.kew.role.RoleRouteModule', 'RM', 0, 0, 
                'P', NULL, 1, NULL, NULL);
			INSERT INTO KREW_RTE_NODE_T(RTE_NODE_ID, DOC_TYP_ID, NM, TYP, 
                RTE_MTHD_NM, RTE_MTHD_CD, FNL_APRVR_IND, MNDTRY_RTE_IND, 
                ACTVN_TYP, BRCH_PROTO_ID, VER_NBR, CONTENT_FRAGMENT, GRP_ID) 
            VALUES(RouteNodeId3, NextDocTypeId, 'OrganizationHierarchy', 'org.kuali.rice.kew.engine.node.RoleNode', 
                'org.kuali.rice.kew.role.RoleRouteModule', 'RM', 0, 0, 
                'P', NULL, 1, NULL, NULL);
			-- Link the nodes
			INSERT INTO KREW_RTE_NODE_LNK_T(FROM_RTE_NODE_ID, TO_RTE_NODE_ID) 
            VALUES(RouteNodeId1, RouteNodeId2);
			INSERT INTO KREW_RTE_NODE_LNK_T(FROM_RTE_NODE_ID, TO_RTE_NODE_ID) 
            VALUES(RouteNodeId2, RouteNodeId3);
			-- main routing branch
			INSERT INTO KREW_DOC_TYP_PROC_T(DOC_TYP_PROC_ID, DOC_TYP_ID, INIT_RTE_NODE_ID, NM, INIT_IND, VER_NBR) 
            VALUES( krew_rte_node_s.NEXTVAL, NextDocTypeId, RouteNodeId1, 'PRIMARY', 1, 1);
			-- Add the route node configuration parameters
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId1, 'contentFragment', '<start name="AdHoc"/>');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId1, 'ruleSelector', 'Template');

			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId2, 'contentFragment', '<role name="Account"><qualifierResolverClass>org.kuali.rice.kns.workflow.attribute.DataDictionaryQualifierResolver</qualifierResolverClass><activationType>P</activationType></role>');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId2, 'ruleSelector', 'Template');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId2, 'activationType', 'P');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId2, 'qualifierResolverClass', 'org.kuali.rice.kns.workflow.attribute.DataDictionaryQualifierResolver');

			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId3, 'contentFragment', '<role name="OrganizationHierarchy"><qualifierResolverClass>org.kuali.rice.kns.workflow.attribute.DataDictionaryQualifierResolver</qualifierResolverClass><activationType>P</activationType></role>');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId3, 'ruleSelector', 'Template');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId3, 'activationType', 'P');
			INSERT INTO KREW_RTE_NODE_CFG_PARM_T(RTE_NODE_CFG_PARM_ID, RTE_NODE_ID, KEY_CD, VAL) 
            VALUES(krew_rte_node_cfg_parm_s.NEXTVAL, RouteNodeId3, 'qualifierResolverClass', 'org.kuali.rice.kns.workflow.attribute.DataDictionaryQualifierResolver');
		END;
		BEGIN
			update_dt_acct_orghier( 'ALOC' );
			update_dt_acct_orghier( 'CASM' );
		END;

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Custom SQL', '', 'a2e2b4fd6aa3e5a316d8a15ea1c22d8', 'krew-inserts', 'KITT-3049.xml');

-- Changeset KITT-3049.xml::gl_offset_defn_t::hlo::(MD5Sum: a7f94d1a5136c5e76a50d94dc040eefe)
BEGIN
			INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
			(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'DVNC', FIN_COA_CD, SYS_GUID(), 1
			FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVWF'
			);
	
			INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
			(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'PRNC', FIN_COA_CD, SYS_GUID(), 1
			FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVWF' AND FIN_BALANCE_TYP_CD = 'AC'
			);
	
			INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
			(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'PRNC', FIN_COA_CD, SYS_GUID(), 1
			FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'PREQ' AND FIN_BALANCE_TYP_CD = 'EX'
			);
	
			INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
			(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'CMNC', FIN_COA_CD, SYS_GUID(), 1
			FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'DVWF' AND FIN_BALANCE_TYP_CD = 'AC'
			);
	
			INSERT INTO gl_offset_defn_t ( FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, FDOC_TYP_CD, FIN_COA_CD, OBJ_ID, VER_NBR )
			(SELECT FIN_BALANCE_TYP_CD, FIN_OBJECT_CD, UNIV_FISCAL_YR, 'CMNC', FIN_COA_CD, SYS_GUID(), 1
			FROM gl_offset_defn_t WHERE fdoc_typ_cd = 'CM' AND FIN_BALANCE_TYP_CD = 'EX'
			);
		END;

INSERT INTO DATABASECHANGELOG (DATEEXECUTED, AUTHOR, LIQUIBASE, DESCRIPTION, COMMENTS, MD5SUM, ID, FILENAME) VALUES (SYSDATE, 'hlo', '1.9.5', 'Custom SQL', '', 'a7f94d1a5136c5e76a50d94dc040eefe', 'gl_offset_defn_t', 'KITT-3049.xml');

-- Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKEDBY = NULL, LOCKGRANTED = NULL, LOCKED = 0 WHERE  ID = 1;

