Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E29C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/DcuaVQAIM0MMCqrA/e+ttiOmDBAdtgQtzmFkmYrQM=; b=KyGMJBfsgHDu2j2bEjc85OV4lT
	go4zX/t+Rc05cNyUASYRhKINOpV2dzIrE86vD63UuXlhBfNEUQnUWgSHHV3jIqSEIyTuskkBZf6HZ
	g7IBAfavSGTdzgSVUvx8sFdiJFb3S7cd7oRPlDY/exh/VPxGkR9IzrKsPB2AvSm4l1/WlAsWGRCMq
	DZOFbaAAMnPiv5RxK3yO2209WDGIZns8eB7VVbDQEEfBXqUNZ5JncN5rZedljm4y1CycSthVqznLh
	Nj5mci4paYhJNR0jiL/rYgopKGZfeWKcadzGDbDJhEjy1lyV8PODuymO+KdwUk5d2XhTfa+aaGvRF
	NInhe4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fXc-000000024ud-38np;
	Sat, 26 Apr 2025 13:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeU-00000001z79-0NTf
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 12:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d/DcuaVQAIM0MMCqrA/e+ttiOmDBAdtgQtzmFkmYrQM=; b=ZiYlJXlm5LVfA3rKF3x7PaHI2y
	O6W01sJj2aTKcaPCVfoIKCSmYk/4KRytdpwbYSh8qXzYjEXpae5DgHmVaOJ3i+7nsXTMr3MPllksV
	QdqmMH+Az8eccKZMH5x0tT/31uF6NUuSjFJLnxQ5NnlFGSGGuEzUlo9KEmb2F5GKVET8JTW6oHEbk
	jPD2Rv/ZsAhmFhAGfG9nM3bmlwPWhZ3HwNV4UEc3wmg12mSIYLw49D46gngfk/HEIHr39ShbbZVx+
	eZtjqFY36NK/HHnyPmuSIfKlaKrCzMIyiV2Z97QpiKg18lDv0WlCnNXknid2aNbK59fRM6lyRpwIz
	bGk2V7fA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8eeQ-0000000CGFb-3xIk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BF7E4A6D5;
	Sat, 26 Apr 2025 12:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A2EC4AF0B;
	Sat, 26 Apr 2025 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670533;
	bh=Wx52G5fJ77nIURvNqC1cFOpUV+HYXyuUHEQTcLPJWco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apjGdmNrbUgVWk9kbLVmzSP3JinxKWYFX9/jtQt3UVmm6Si4Lmj3vLV4RWHBr2W+2
	 +3Xz47pEje9bqu5Zw63oOwCFZP6yz3wTCfAPYQdEbUXD6I2zIReRMIVZWfJUG7knf9
	 cBkwXfgx8P9xbj8J7LCByY/oaqt14kKT7qyuQLkxBdQml77Dts/GX6zB2v3LMo6PfP
	 OkB70AGmacJT50kHRjh1TjYu3zWjOzmMbj7CvarGLGqqhf6mM4j9Z9UZIvNq6aX5Yk
	 bu/XocAr/axdfu24vr1KP62KXR0NQ5JEWw8jHHwM7wSLvUHryyeSVO2xQOiuys/kwu
	 wWzaHU5uh1urQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeJ-0092VH-MZ;
	Sat, 26 Apr 2025 13:28:51 +0100
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
Subject: [PATCH v3 12/42] arm64: tools: Resync sysreg.h
Date: Sat, 26 Apr 2025 13:28:06 +0100
Message-Id: <20250426122836.3341523-13-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250426_132859_408316_B858F71A 
X-CRM114-Status: GOOD (  12.52  )
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

Perform a bulk resync of tools/arch/arm64/include/asm/sysreg.h.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/arch/arm64/include/asm/sysreg.h | 65 ++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index b6c5ece4fdee7..690b6ebd118f4 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -117,6 +117,7 @@
 
 #define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
 
+/* Data cache zero operations */
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
 #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
 #define SYS_DC_IGDSW			sys_insn(1, 0, 7, 6, 6)
@@ -153,11 +154,13 @@
 #define SYS_DC_CIGVAC			sys_insn(1, 3, 7, 14, 3)
 #define SYS_DC_CIGDVAC			sys_insn(1, 3, 7, 14, 5)
 
-/* Data cache zero operations */
 #define SYS_DC_ZVA			sys_insn(1, 3, 7, 4, 1)
 #define SYS_DC_GVA			sys_insn(1, 3, 7, 4, 3)
 #define SYS_DC_GZVA			sys_insn(1, 3, 7, 4, 4)
 
+#define SYS_DC_CIVAPS			sys_insn(1, 0, 7, 15, 1)
+#define SYS_DC_CIGDVAPS			sys_insn(1, 0, 7, 15, 5)
+
 /*
  * Automatically generated definitions for system registers, the
  * manual encodings below are in the process of being converted to
@@ -475,6 +478,7 @@
 #define SYS_CNTFRQ_EL0			sys_reg(3, 3, 14, 0, 0)
 
 #define SYS_CNTPCT_EL0			sys_reg(3, 3, 14, 0, 1)
+#define SYS_CNTVCT_EL0			sys_reg(3, 3, 14, 0, 2)
 #define SYS_CNTPCTSS_EL0		sys_reg(3, 3, 14, 0, 5)
 #define SYS_CNTVCTSS_EL0		sys_reg(3, 3, 14, 0, 6)
 
@@ -482,23 +486,36 @@
 #define SYS_CNTP_CTL_EL0		sys_reg(3, 3, 14, 2, 1)
 #define SYS_CNTP_CVAL_EL0		sys_reg(3, 3, 14, 2, 2)
 
+#define SYS_CNTV_TVAL_EL0		sys_reg(3, 3, 14, 3, 0)
 #define SYS_CNTV_CTL_EL0		sys_reg(3, 3, 14, 3, 1)
 #define SYS_CNTV_CVAL_EL0		sys_reg(3, 3, 14, 3, 2)
 
 #define SYS_AARCH32_CNTP_TVAL		sys_reg(0, 0, 14, 2, 0)
 #define SYS_AARCH32_CNTP_CTL		sys_reg(0, 0, 14, 2, 1)
 #define SYS_AARCH32_CNTPCT		sys_reg(0, 0, 0, 14, 0)
+#define SYS_AARCH32_CNTVCT		sys_reg(0, 1, 0, 14, 0)
 #define SYS_AARCH32_CNTP_CVAL		sys_reg(0, 2, 0, 14, 0)
 #define SYS_AARCH32_CNTPCTSS		sys_reg(0, 8, 0, 14, 0)
+#define SYS_AARCH32_CNTVCTSS		sys_reg(0, 9, 0, 14, 0)
 
 #define __PMEV_op2(n)			((n) & 0x7)
 #define __CNTR_CRm(n)			(0x8 | (((n) >> 3) & 0x3))
+#define SYS_PMEVCNTSVRn_EL1(n)		sys_reg(2, 0, 14, __CNTR_CRm(n), __PMEV_op2(n))
 #define SYS_PMEVCNTRn_EL0(n)		sys_reg(3, 3, 14, __CNTR_CRm(n), __PMEV_op2(n))
 #define __TYPER_CRm(n)			(0xc | (((n) >> 3) & 0x3))
 #define SYS_PMEVTYPERn_EL0(n)		sys_reg(3, 3, 14, __TYPER_CRm(n), __PMEV_op2(n))
 
 #define SYS_PMCCFILTR_EL0		sys_reg(3, 3, 14, 15, 7)
 
+#define	SYS_SPMCGCRn_EL1(n)		sys_reg(2, 0, 9, 13, ((n) & 1))
+
+#define __SPMEV_op2(n)			((n) & 0x7)
+#define __SPMEV_crm(p, n)		((((p) & 7) << 1) | (((n) >> 3) & 1))
+#define SYS_SPMEVCNTRn_EL0(n)		sys_reg(2, 3, 14, __SPMEV_crm(0b000, n), __SPMEV_op2(n))
+#define	SYS_SPMEVFILT2Rn_EL0(n)		sys_reg(2, 3, 14, __SPMEV_crm(0b011, n), __SPMEV_op2(n))
+#define	SYS_SPMEVFILTRn_EL0(n)		sys_reg(2, 3, 14, __SPMEV_crm(0b010, n), __SPMEV_op2(n))
+#define	SYS_SPMEVTYPERn_EL0(n)		sys_reg(2, 3, 14, __SPMEV_crm(0b001, n), __SPMEV_op2(n))
+
 #define SYS_VPIDR_EL2			sys_reg(3, 4, 0, 0, 0)
 #define SYS_VMPIDR_EL2			sys_reg(3, 4, 0, 0, 5)
 
@@ -518,7 +535,6 @@
 #define SYS_VTCR_EL2			sys_reg(3, 4, 2, 1, 2)
 
 #define SYS_VNCR_EL2			sys_reg(3, 4, 2, 2, 0)
-#define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
 #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
 #define SYS_ELR_EL2			sys_reg(3, 4, 4, 0, 1)
 #define SYS_SP_EL1			sys_reg(3, 4, 4, 1, 0)
@@ -604,28 +620,18 @@
 
 /* VHE encodings for architectural EL0/1 system registers */
 #define SYS_BRBCR_EL12			sys_reg(2, 5, 9, 0, 0)
-#define SYS_SCTLR_EL12			sys_reg(3, 5, 1, 0, 0)
-#define SYS_CPACR_EL12			sys_reg(3, 5, 1, 0, 2)
-#define SYS_SCTLR2_EL12			sys_reg(3, 5, 1, 0, 3)
-#define SYS_ZCR_EL12			sys_reg(3, 5, 1, 2, 0)
-#define SYS_TRFCR_EL12			sys_reg(3, 5, 1, 2, 1)
-#define SYS_SMCR_EL12			sys_reg(3, 5, 1, 2, 6)
 #define SYS_TTBR0_EL12			sys_reg(3, 5, 2, 0, 0)
 #define SYS_TTBR1_EL12			sys_reg(3, 5, 2, 0, 1)
-#define SYS_TCR_EL12			sys_reg(3, 5, 2, 0, 2)
-#define SYS_TCR2_EL12			sys_reg(3, 5, 2, 0, 3)
 #define SYS_SPSR_EL12			sys_reg(3, 5, 4, 0, 0)
 #define SYS_ELR_EL12			sys_reg(3, 5, 4, 0, 1)
 #define SYS_AFSR0_EL12			sys_reg(3, 5, 5, 1, 0)
 #define SYS_AFSR1_EL12			sys_reg(3, 5, 5, 1, 1)
 #define SYS_ESR_EL12			sys_reg(3, 5, 5, 2, 0)
 #define SYS_TFSR_EL12			sys_reg(3, 5, 5, 6, 0)
-#define SYS_FAR_EL12			sys_reg(3, 5, 6, 0, 0)
 #define SYS_PMSCR_EL12			sys_reg(3, 5, 9, 9, 0)
 #define SYS_MAIR_EL12			sys_reg(3, 5, 10, 2, 0)
 #define SYS_AMAIR_EL12			sys_reg(3, 5, 10, 3, 0)
 #define SYS_VBAR_EL12			sys_reg(3, 5, 12, 0, 0)
-#define SYS_CONTEXTIDR_EL12		sys_reg(3, 5, 13, 0, 1)
 #define SYS_SCXTNUM_EL12		sys_reg(3, 5, 13, 0, 7)
 #define SYS_CNTKCTL_EL12		sys_reg(3, 5, 14, 1, 0)
 #define SYS_CNTP_TVAL_EL02		sys_reg(3, 5, 14, 2, 0)
@@ -1028,8 +1034,11 @@
 #define PIE_RX		UL(0xa)
 #define PIE_RW		UL(0xc)
 #define PIE_RWX		UL(0xe)
+#define PIE_MASK	UL(0xf)
 
-#define PIRx_ELx_PERM(idx, perm)	((perm) << ((idx) * 4))
+#define PIRx_ELx_BITS_PER_IDX		4
+#define PIRx_ELx_PERM_SHIFT(idx)	((idx) * PIRx_ELx_BITS_PER_IDX)
+#define PIRx_ELx_PERM_PREP(idx, perm)	(((perm) & PIE_MASK) << PIRx_ELx_PERM_SHIFT(idx))
 
 /*
  * Permission Overlay Extension (POE) permission encodings.
@@ -1040,12 +1049,34 @@
 #define POE_RX		UL(0x3)
 #define POE_W		UL(0x4)
 #define POE_RW		UL(0x5)
-#define POE_XW		UL(0x6)
-#define POE_RXW		UL(0x7)
+#define POE_WX		UL(0x6)
+#define POE_RWX		UL(0x7)
 #define POE_MASK	UL(0xf)
 
-/* Initial value for Permission Overlay Extension for EL0 */
-#define POR_EL0_INIT	POE_RXW
+#define POR_ELx_BITS_PER_IDX		4
+#define POR_ELx_PERM_SHIFT(idx)		((idx) * POR_ELx_BITS_PER_IDX)
+#define POR_ELx_PERM_GET(idx, reg)	(((reg) >> POR_ELx_PERM_SHIFT(idx)) & POE_MASK)
+#define POR_ELx_PERM_PREP(idx, perm)	(((perm) & POE_MASK) << POR_ELx_PERM_SHIFT(idx))
+
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
 
 #define ARM64_FEATURE_FIELD_BITS	4
 
-- 
2.39.2


