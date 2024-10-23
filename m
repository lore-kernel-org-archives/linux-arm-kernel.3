Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE9CFA443
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLVa/LSKgDXmHVWD+RdWwWfMZCFujFxhI9xmUpJHz1E=; b=sItyfCfLudn4inWioTNDINt5M8
	bw73aULrR4lsc9fuZnUWjEb+phtU43v0fo4fgG7mvq4cmg9265PYSpXbVIXKi1PPJ0Bm8QIR3H8Zd
	NsL3GNnW2VpcDwG+9Usp5TbyljgW7k37q07tPpkvjSsh6xHEsils3bEUxz7UP89svnIVtscjwzxqE
	FmswCiNUxIukoov5KU7apI4jTwfbY+16+bRX9/rC+4yGp8H74LCx7QuHUKQpidFOGwtn8JgATWizJ
	oZngIPoGgaq2nzcWLoEWMVxTDPm5xdwq7vwcJrghUA6R+SkNB50RVsLagKtpaAwlBDr8sBuqnfJs0
	uVVJfTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dRx-0000000EzXJ-0XvO;
	Wed, 23 Oct 2024 15:39:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckQ-0000000EpRL-0a7x
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PLVa/LSKgDXmHVWD+RdWwWfMZCFujFxhI9xmUpJHz1E=; b=VM0WvUfyVjFFg8wm+Asy7D78Z7
	UEwxUIWLpkKApSmjO+frNyIOAMAG19Ybbz6QYFaXa08TeDIyOSdBl05PRnWmvDHnJH+OD23IBYZPG
	NgojShedjj4ZAjvwRYvscewy+AOIQpIV2S/GHQp/NWHWwBX6ToV4SC60e6Ynj/E8waf5+Z41IUWgc
	71XV4FvOzQ6A2PQyGBSve/3LfYarcwoeaq/Xdtxh9amyFYEsZGM2I8oCEUaHNFX6HHDxngw8uL1i9
	JPxfl53UtjhFxdB3Z336azC36wxnGSzDBqwCUFU+IVyfF09H1KCqWeWB3E03IPAnFgyhfmHELRrQP
	NaEEK7vg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckM-00000008QdM-1ad4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62776A45012;
	Wed, 23 Oct 2024 14:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D26C4CEC6;
	Wed, 23 Oct 2024 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695236;
	bh=Z8WBcz5Si77SBcfr8MaYZQ0v/JOuWhBTSqcbOWFch5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pdjU8qdjWo5PWkb2A2HRHysqYakAp/rqFYb8y+KcEEZNT8Q49Fib1KkFFpndf9ZI5
	 tGp2olr5JPaA2c0Guu3CG/XoT35lrUp+sT/NMzzrTLvEyfr7K4aHVaceGH7qlLEXKs
	 t/5xkvekkwSmXDb7oLHir3SdVtB69XnGYtPt4Q1w1LrOYj2EpEaMK0vsy2Ww/XFQRI
	 GintBM5kbzuVc/4bYewd/hoPkLu5F2cRf9WYpM+JTu+PpknDJzjgPdfV0cuLsulCQK
	 yOGYNnQLZz4x9h/BASf2jeCGgvysfFkmbZgxEfrLJCzU1jp6O585Ppp/uzTfJV638g
	 tC/zQi0hFZCYw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckE-0068vz-EZ;
	Wed, 23 Oct 2024 15:53:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 24/37] KVM: arm64: Hide TCR2_EL1 from userspace when disabled for guests
Date: Wed, 23 Oct 2024 15:53:32 +0100
Message-Id: <20241023145345.1613824-25-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155402_947740_06F19221 
X-CRM114-Status: GOOD (  18.12  )
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

From: Mark Brown <broonie@kernel.org>

When the guest does not support FEAT_TCR2 we should not allow any access
to it in order to ensure that we do not create spurious issues with guest
migration. Add a visibility operation for it.

Fixes: fbff56068232 ("KVM: arm64: Save/restore TCR2_EL1")
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20240822-kvm-arm64-hide-pie-regs-v2-2-376624fa829c@kernel.org
[maz: simplify by using __el2_visibility(), kvm_has_tcr2() throughout]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  3 +++
 arch/arm64/kvm/at.c                        |  2 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  2 +-
 arch/arm64/kvm/nested.c                    |  2 +-
 arch/arm64/kvm/sys_regs.c                  | 27 ++++++++++++++++++----
 5 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1a5477181447c..197a7a08b3af5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1511,4 +1511,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(system_supports_fpmr() &&			\
 	 kvm_has_feat((k), ID_AA64PFR2_EL1, FPMR, IMP))
 
+#define kvm_has_tcr2(k)				\
+	(kvm_has_feat((k), ID_AA64MMFR3_EL1, TCRX, IMP))
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 3d93ed1795603..a9f665d5ceb0b 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1099,7 +1099,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TTBR1_EL1),	SYS_TTBR1);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
-	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, TCRX, IMP)) {
+	if (kvm_has_tcr2(vcpu->kvm)) {
 		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
 		if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP)) {
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index d67628d01bf5e..c92c2c0b86aa8 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -69,7 +69,7 @@ static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
 		return false;
 
 	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64MMFR3_EL1, TCRX, IMP);
+	return kvm_has_tcr2(kern_hyp_va(vcpu->kvm));
 }
 
 static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index b4b3ec88399b3..e6d7114ef4d39 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1029,7 +1029,7 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= HCRX_EL2_PTTWI;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, SCTLRX, IMP))
 		res0 |= HCRX_EL2_SCTLR2En;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, TCRX, IMP))
+	if (!kvm_has_tcr2(kvm))
 		res0 |= HCRX_EL2_TCR2En;
 	if (!kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
 		res0 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index cfb1e58a31c06..9b26514cf131f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -446,7 +446,7 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	u64 val, mask, shift;
 
 	if (reg_to_encoding(r) == SYS_TCR2_EL1 &&
-	    !kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, TCRX, IMP))
+	    !kvm_has_tcr2(vcpu->kvm))
 		return undef_access(vcpu, p, r);
 
 	BUG_ON(!p->is_write);
@@ -471,7 +471,7 @@ static bool access_tcr2_el2(struct kvm_vcpu *vcpu,
 			    struct sys_reg_params *p,
 			    const struct sys_reg_desc *r)
 {
-	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, TCRX, IMP)) {
+	if (!kvm_has_tcr2(vcpu->kvm)) {
 		kvm_inject_undefined(vcpu);
 		return false;
 	}
@@ -2350,6 +2350,21 @@ static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
+static unsigned int tcr2_visibility(const struct kvm_vcpu *vcpu,
+				    const struct sys_reg_desc *rd)
+{
+	if (kvm_has_tcr2(vcpu->kvm))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
+static unsigned int tcr2_el2_visibility(const struct kvm_vcpu *vcpu,
+				    const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, tcr2_visibility);
+}
+
 /*
  * Architected system registers.
  * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
@@ -2534,7 +2549,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
 	{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
-	{ SYS_DESC(SYS_TCR2_EL1), access_vm_reg, reset_val, TCR2_EL1, 0 },
+	{ SYS_DESC(SYS_TCR2_EL1), access_vm_reg, reset_val, TCR2_EL1, 0,
+	  .visibility = tcr2_visibility },
 
 	PTRAUTH_KEY(APIA),
 	PTRAUTH_KEY(APIB),
@@ -2871,7 +2887,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
 	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
-	EL2_REG(TCR2_EL2, access_tcr2_el2, reset_val, TCR2_EL2_RES1),
+	EL2_REG_FILTERED(TCR2_EL2, access_tcr2_el2, reset_val, TCR2_EL2_RES1,
+			 tcr2_el2_visibility),
 	EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
 	EL2_REG_VNCR(VTCR_EL2, reset_val, 0),
 
@@ -4740,7 +4757,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
 			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
 
-		if (kvm_has_feat(kvm, ID_AA64MMFR3_EL1, TCRX, IMP))
+		if (kvm_has_tcr2(kvm))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
 
 		if (kvm_has_fpmr(kvm))
-- 
2.39.2


