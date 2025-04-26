Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16333C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUkyhwd0tkAn+q1KRmYSietLOA39X6W8XboDOqfhjl0=; b=A0U5OospMvfrycTxxq230AFBas
	8jurcq0UUpPXh/rJnAyI8KZX6UkQPiROw4VQiVQnVPI2HhOav+dySEbvn76q/KXj5M5pZgL54uSqP
	3yLIU67+DJKSvjSgGzChMJ2ydWgmsc5bwMkRm/5wClFgn52EJe0N0n/0CsZA0tISwuvgghREMuq2I
	nZewFwj23TOtReDAj2F5jt8RmDoeaF60QZk/04SOMFxOoCuQBLKVbuCXtdaWoTth2zFS5OYSqmQDE
	91AUWV/yV+zIR8tawhNyk1IeEymxFX+tXVvf1cCU0dmuzlACh53IEZ3fn29jSVUdSz1uKcG5C4B5S
	Wu4qaH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ftj-000000027CQ-0uPa;
	Sat, 26 Apr 2025 13:48:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eea-00000001zAI-1cgD
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 12:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JUkyhwd0tkAn+q1KRmYSietLOA39X6W8XboDOqfhjl0=; b=O3G7w0Q9J5OOB4FhyqeTBoLjbh
	LW4aKV+cpvfCoZvN6EZMLSxS9PlzJr56NPmS7ksWRmMLSiIQVKHT6hsjvyzCrGBjldxfswbuzO+tA
	DYj9Y/heAM6kJwJOaKi/26lUi8zpT1Du6+R9fGMcDm0Vfh0IDkqH/eDpD9ogiVv+3UKr8VkmPJ6l+
	ItJ2krozGWiiE5z8sWUWKuJCbJDBc2TY5r9s70D4SxzjNG5Oof5v832L1VFZS0U6LxxjXrTsDecB/
	pN6jvGyWOB+lxQZVbJhEGu0hOsQir+Kxv9f55Vb0BZx9VYVUOOPDEKnbotZJ2kFu5Q5dzNlgvF1zA
	Ba6ydJXg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8eeX-0000000CGHG-0SNd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE8CF5C4B17;
	Sat, 26 Apr 2025 12:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAE8C4CEEC;
	Sat, 26 Apr 2025 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670543;
	bh=4WYD9k5iZXYoTz9SVu8G5PaJMteBaRIKSX4S+mBaJms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UuQ9qeuK8FhDnFHQ8t1m9Av6l1+bEpEVPBP31N1O3fYTYj0xpDpR9fpoo2Zaazd82
	 RNI/jPCnmeT1QjRae5D39668HSD3D9l5nFkaXwEMIq3Sjz4YEFIf7xCeKwcrTj4ma3
	 Uhn0T7HDQ3T4WMNsqZLJePoij2cTIpJWV0Z/ywJS2zMORJEc0CabtlVHoZkCvfFNoe
	 P6GTf2YnMUH+oXvD639jh1xNkV+Z8hrXVw8g/9tF9/N4Fzo+yINeCrQkSnxFzglqqA
	 xz0xPbYd4a2pfb/iToBvljpN6Mg8tl5fjYzkQWsAc7BflN8GU9tuZk2IKDeR1peBRi
	 xHuOZW5PKYspw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeT-0092VH-M0;
	Sat, 26 Apr 2025 13:29:01 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 41/42] KVM: arm64: Add FGT descriptors for FEAT_FGT2
Date: Sat, 26 Apr 2025 13:28:35 +0100
Message-Id: <20250426122836.3341523-42-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_132905_587317_E364C873 
X-CRM114-Status: GOOD (  11.98  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Bulk addition of all the FGT2 traps reported with EC == 0x18,
as described in the 2025-03 JSON drop.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 83 +++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 9c7ecfccbd6e9..f7678af272bbb 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1385,6 +1385,24 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_AIDR_EL1, 		HFGRTR, AIDR_EL1, 1),
 	SR_FGT(SYS_AFSR1_EL1, 		HFGRTR, AFSR1_EL1, 1),
 	SR_FGT(SYS_AFSR0_EL1, 		HFGRTR, AFSR0_EL1, 1),
+
+	/* HFGRTR2_EL2, HFGWTR2_EL2 */
+	SR_FGT(SYS_ACTLRALIAS_EL1,	HFGRTR2, nACTLRALIAS_EL1, 0),
+	SR_FGT(SYS_ACTLRMASK_EL1,	HFGRTR2, nACTLRMASK_EL1, 0),
+	SR_FGT(SYS_CPACRALIAS_EL1,	HFGRTR2, nCPACRALIAS_EL1, 0),
+	SR_FGT(SYS_CPACRMASK_EL1,	HFGRTR2, nCPACRMASK_EL1, 0),
+	SR_FGT(SYS_PFAR_EL1,		HFGRTR2, nPFAR_EL1, 0),
+	SR_FGT(SYS_RCWSMASK_EL1,	HFGRTR2, nRCWSMASK_EL1, 0),
+	SR_FGT(SYS_SCTLR2ALIAS_EL1,	HFGRTR2, nSCTLRALIAS2_EL1, 0),
+	SR_FGT(SYS_SCTLR2MASK_EL1,	HFGRTR2, nSCTLR2MASK_EL1, 0),
+	SR_FGT(SYS_SCTLRALIAS_EL1,	HFGRTR2, nSCTLRALIAS_EL1, 0),
+	SR_FGT(SYS_SCTLRMASK_EL1,	HFGRTR2, nSCTLRMASK_EL1, 0),
+	SR_FGT(SYS_TCR2ALIAS_EL1,	HFGRTR2, nTCR2ALIAS_EL1, 0),
+	SR_FGT(SYS_TCR2MASK_EL1,	HFGRTR2, nTCR2MASK_EL1, 0),
+	SR_FGT(SYS_TCRALIAS_EL1,	HFGRTR2, nTCRALIAS_EL1, 0),
+	SR_FGT(SYS_TCRMASK_EL1,		HFGRTR2, nTCRMASK_EL1, 0),
+	SR_FGT(SYS_ERXGSR_EL1,		HFGRTR2, nERXGSR_EL1, 0),
+
 	/* HFGITR_EL2 */
 	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
 	SR_FGT(OP_COSP_RCTX, 		HFGITR, COSPRCTX, 1),
@@ -1494,6 +1512,11 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_IC_IVAU, 		HFGITR, ICIVAU, 1),
 	SR_FGT(SYS_IC_IALLU, 		HFGITR, ICIALLU, 1),
 	SR_FGT(SYS_IC_IALLUIS, 		HFGITR, ICIALLUIS, 1),
+
+	/* HFGITR2_EL2 */
+	SR_FGT(SYS_DC_CIGDVAPS,		HFGITR2, nDCCIVAPS, 0),
+	SR_FGT(SYS_DC_CIVAPS,		HFGITR2, nDCCIVAPS, 0),
+	
 	/* HDFGRTR_EL2 */
 	SR_FGT(SYS_PMBIDR_EL1, 		HDFGRTR, PMBIDR_EL1, 1),
 	SR_FGT(SYS_PMSNEVFR_EL1, 	HDFGRTR, nPMSNEVFR_EL1, 0),
@@ -1886,6 +1909,59 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_DBGBCRn_EL1(13), 	HDFGRTR, DBGBCRn_EL1, 1),
 	SR_FGT(SYS_DBGBCRn_EL1(14), 	HDFGRTR, DBGBCRn_EL1, 1),
 	SR_FGT(SYS_DBGBCRn_EL1(15), 	HDFGRTR, DBGBCRn_EL1, 1),
+
+	/* HDFGRTR2_EL2 */
+	SR_FGT(SYS_MDSELR_EL1,		HDFGRTR2, nMDSELR_EL1, 0),
+	SR_FGT(SYS_MDSTEPOP_EL1,	HDFGRTR2, nMDSTEPOP_EL1, 0),
+	SR_FGT(SYS_PMCCNTSVR_EL1,	HDFGRTR2, nPMSSDATA, 0),
+	SR_FGT_RANGE(SYS_PMEVCNTSVRn_EL1(0),
+		     SYS_PMEVCNTSVRn_EL1(30),
+		     HDFGRTR2, nPMSSDATA, 0),
+	SR_FGT(SYS_PMICNTSVR_EL1,	HDFGRTR2, nPMSSDATA, 0),
+	SR_FGT(SYS_PMECR_EL1,		HDFGRTR2, nPMECR_EL1, 0),
+	SR_FGT(SYS_PMIAR_EL1,		HDFGRTR2, nPMIAR_EL1, 0),
+	SR_FGT(SYS_PMICFILTR_EL0,	HDFGRTR2, nPMICFILTR_EL0, 0),
+	SR_FGT(SYS_PMICNTR_EL0,		HDFGRTR2, nPMICNTR_EL0, 0),
+	SR_FGT(SYS_PMSSCR_EL1,		HDFGRTR2, nPMSSCR_EL1, 0),
+	SR_FGT(SYS_PMUACR_EL1,		HDFGRTR2, nPMUACR_EL1, 0),
+	SR_FGT(SYS_SPMACCESSR_EL1,	HDFGRTR2, nSPMACCESSR_EL1, 0),
+	SR_FGT(SYS_SPMCFGR_EL1,		HDFGRTR2, nSPMID, 0),
+	SR_FGT(SYS_SPMDEVARCH_EL1,	HDFGRTR2, nSPMID, 0),
+	SR_FGT(SYS_SPMCGCRn_EL1(0),	HDFGRTR2, nSPMID, 0),
+	SR_FGT(SYS_SPMCGCRn_EL1(1),	HDFGRTR2, nSPMID, 0),
+	SR_FGT(SYS_SPMIIDR_EL1,		HDFGRTR2, nSPMID, 0),
+	SR_FGT(SYS_SPMCNTENCLR_EL0,	HDFGRTR2, nSPMCNTEN, 0),
+	SR_FGT(SYS_SPMCNTENSET_EL0,	HDFGRTR2, nSPMCNTEN, 0),
+	SR_FGT(SYS_SPMCR_EL0,		HDFGRTR2, nSPMCR_EL0, 0),
+	SR_FGT(SYS_SPMDEVAFF_EL1,	HDFGRTR2, nSPMDEVAFF_EL1, 0),
+	/*
+	 * We have up to 64 of these registers in ranges of 16, banked via
+	 * SPMSELR_EL0.BANK. We're only concerned with the accessors here,
+	 * not the architectural registers.
+	 */
+	SR_FGT_RANGE(SYS_SPMEVCNTRn_EL0(0),
+		     SYS_SPMEVCNTRn_EL0(15),
+		     HDFGRTR2, nSPMEVCNTRn_EL0, 0),
+	SR_FGT_RANGE(SYS_SPMEVFILT2Rn_EL0(0),
+		     SYS_SPMEVFILT2Rn_EL0(15),
+		     HDFGRTR2, nSPMEVTYPERn_EL0, 0),
+	SR_FGT_RANGE(SYS_SPMEVFILTRn_EL0(0),
+		     SYS_SPMEVFILTRn_EL0(15),
+		     HDFGRTR2, nSPMEVTYPERn_EL0, 0),
+	SR_FGT_RANGE(SYS_SPMEVTYPERn_EL0(0),
+		     SYS_SPMEVTYPERn_EL0(15),
+		     HDFGRTR2, nSPMEVTYPERn_EL0, 0),
+	SR_FGT(SYS_SPMINTENCLR_EL1,	HDFGRTR2, nSPMINTEN, 0),
+	SR_FGT(SYS_SPMINTENSET_EL1,	HDFGRTR2, nSPMINTEN, 0),
+	SR_FGT(SYS_SPMOVSCLR_EL0,	HDFGRTR2, nSPMOVS, 0),
+	SR_FGT(SYS_SPMOVSSET_EL0,	HDFGRTR2, nSPMOVS, 0),
+	SR_FGT(SYS_SPMSCR_EL1,		HDFGRTR2, nSPMSCR_EL1, 0),
+	SR_FGT(SYS_SPMSELR_EL0,		HDFGRTR2, nSPMSELR_EL0, 0),
+	SR_FGT(SYS_TRCITECR_EL1,	HDFGRTR2, nTRCITECR_EL1, 0),
+	SR_FGT(SYS_PMBMAR_EL1,		HDFGRTR2, nPMBMAR_EL1, 0),
+	SR_FGT(SYS_PMSDSFR_EL1,		HDFGRTR2, nPMSDSFR_EL1, 0),
+	SR_FGT(SYS_TRBMPAM_EL1,		HDFGRTR2, nTRBMPAM_EL1, 0),
+
 	/*
 	 * HDFGWTR_EL2
 	 *
@@ -1896,12 +1972,19 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	 * read-side mappings, and only the write-side mappings that
 	 * differ from the read side, and the trap handler will pick
 	 * the correct shadow register based on the access type.
+	 *
+	 * Same model applies to the FEAT_FGT2 registers.
 	 */
 	SR_FGT(SYS_TRFCR_EL1,		HDFGWTR, TRFCR_EL1, 1),
 	SR_FGT(SYS_TRCOSLAR,		HDFGWTR, TRCOSLAR, 1),
 	SR_FGT(SYS_PMCR_EL0,		HDFGWTR, PMCR_EL0, 1),
 	SR_FGT(SYS_PMSWINC_EL0,		HDFGWTR, PMSWINC_EL0, 1),
 	SR_FGT(SYS_OSLAR_EL1,		HDFGWTR, OSLAR_EL1, 1),
+
+	/* HDFGWTR_EL2 */
+	SR_FGT(SYS_PMZR_EL0,		HDFGWTR2, nPMZR_EL0, 0),
+	SR_FGT(SYS_SPMZR_EL0,		HDFGWTR2, nSPMEVCNTRn_EL0, 0),
+
 	/*
 	 * HAFGRTR_EL2
 	 */
-- 
2.39.2


