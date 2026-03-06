Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3AEFCB638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWx6Mq8P3WUXXBF2OQEtmsOt4W6UvChFPVQF4VYRNJk=; b=U6R/g2acetzrrDAAXYfpT/JZtA
	gyPFRIgmRQkCu/WzZHoIWKWULJLr2Q5qtYIni55r8plodPb3EW18v4jTYR9MuLL63DsjqJZeQ+69N
	gWHG6BaGDgZ3JjL/W9H+gAOwRgWUxJjuRTmMYcHKnG4xRdbNvRBCjWkv59BH6X0fTUmM1v6Q7+o/m
	iPc+iTvQPOWWILBOCKmf5swaKJw4xZbotCaG6PO3rNr7ozE/vXTqdeY1YoQX3zW1i7abrPVrWhN1N
	Jokm8Bj6q0BlL+BTSdeWohJbyy0bBQyZGRRyo++TuCxQZmuqQPlhb8x+Od3NXLMWpQpiI7L+d07q8
	fgQpPQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhC-00000004DZu-2BeZ;
	Fri, 06 Mar 2026 17:10:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhA-00000004DX2-2GOy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 17:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xWx6Mq8P3WUXXBF2OQEtmsOt4W6UvChFPVQF4VYRNJk=; b=G+0Z3dUUFXtMwwDs4nuXYz/SUL
	7v35rhpQ3ElrTshf0Rq1Ihr2f2DJVMtQgVWnu2Ij2WRr1ax6rcDl82EcK0h59y0z/QSZ10t8egp/E
	eH3NkxD07TgOf5AQG4oCQ5ibENP8crxHtd5fCQolGh85yIdj5cqGf4gn9M8OgINJf8UHLFHKfN03j
	TMpOxlOnpM4YOlYE9qh1LrgBTdPelCXtvYghHQvU4HwkT2TIgjYvEl2KpwkDfUA7YXqIAS8JiCjl8
	cfAJQzd08LTJgN5d/2cQqo0ipOJ5BUJU9+q8texwCc7v6ty1BMifpZU6ZW01fJrntEpd0Zi23bW28
	dSq/V92g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYh6-00000009JYY-3oeB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A50E34029D;
	Fri,  6 Mar 2026 17:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8501DC2BCAF;
	Fri,  6 Mar 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817031;
	bh=CI3d6HjSk1kWGGzg+r1F0ReSlxp80t7nIiipNLFyh7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F9TBBTsO/exmA3tPMd3/zMqL2e2ahulLF2PDSXYatdSpep1yf9k9HSq/cjOHGTkdp
	 7AU979F0LhxVJK/0iClC5w75w/NTTAXTuCIx0ulpUk+RoDxwmfZp9Jqn5VRR5IfGne
	 c0abyWLjWrv78UozGSm7ywWa14oqa+YRNBABROXfmv8GwpaHypuzt333vF6AskyR8a
	 EHYDRrgwC3YHfqfb2CFMuiGGRig15smdOG1jHg8gEWIE4iCNWWHRznnu1L4uWX+/4e
	 wK3saOi4gCvfFfLMEs9fkV85DwtUGF3v5T6KTFqUZcB/2xnFnWukBkXG0uybBKn8aB
	 BzY6Tj/Pm2guw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:07 +0000
Subject: [PATCH v10 15/30] KVM: arm64: Support SME control registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-15-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=5603; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CI3d6HjSk1kWGGzg+r1F0ReSlxp80t7nIiipNLFyh7M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo0vYQqOWqmTv91ilv1KmSqhfnPdE8h0fnI9
 xOXSCFz5aGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKNAAKCRAk1otyXVSH
 0M/vCACE0nqoYGDRv24kYVfEkp2q1gp+FGrz7LbjbDXU7Rui/GROpKizVM0k2/MqmeQ3aRcbGy4
 6g3E2IRQ1Kw1FR8ieLAOJZFS+Q0Lg5fchdntzcfX5YvV2pniFpbfT9I8pvfwHkjKdcEm9bp4YrK
 0ciXP+4udZPB+m4qfV5kbqxtyzW+BQQx1ETM7FEmCv4OsO5m9uwXsq7jlR9U3bwLa1C0ZVf2ocY
 2NK8xYSVcbGTTAObFy3werpGpAtGiFvUto3HykYzghRoMbzJOLlMHhfU5xAzUhbEfJ7J/42/LCo
 pQ3650uVUhuktpbw2uZ3wvOgx+exBZbA/IYlcMvmMDcC08iJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_171033_797037_8D4C51E5 
X-CRM114-Status: GOOD (  15.16  )
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

SME is configured by the system registers SMCR_EL1 and SMCR_EL2, add
definitions and userspace access for them.  These control the SME vector
length in a manner similar to that for SVE and also have feature enable
bits for SME2 and FA64.  A subsequent patch will add management of them
for guests as part of the general floating point context switch, as is
done for the equivalent SVE registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h  | 14 ++++++++++++
 arch/arm64/include/asm/kvm_host.h     |  2 ++
 arch/arm64/include/asm/vncr_mapping.h |  1 +
 arch/arm64/kvm/sys_regs.c             | 42 ++++++++++++++++++++++++++++++++++-
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5bf3d7e1d92c..7a11dd7d554c 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -89,6 +89,14 @@ static inline void kvm_inject_nested_sve_trap(struct kvm_vcpu *vcpu)
 	kvm_inject_nested_sync(vcpu, esr);
 }
 
+static inline void kvm_inject_nested_sme_trap(struct kvm_vcpu *vcpu)
+{
+	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SME) |
+		  ESR_ELx_IL;
+
+	kvm_inject_nested_sync(vcpu, esr);
+}
+
 #if defined(__KVM_VHE_HYPERVISOR__) || defined(__KVM_NVHE_HYPERVISOR__)
 static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
 {
@@ -688,4 +696,10 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
 	}
 }
+
+static inline bool guest_hyp_sme_traps_enabled(const struct kvm_vcpu *vcpu)
+{
+	return __guest_hyp_cptr_xen_trap_enabled(vcpu, SMEN);
+}
+
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fe663d0772dc..e5194ffc40a7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -500,6 +500,7 @@ enum vcpu_sysreg {
 	CPTR_EL2,	/* Architectural Feature Trap Register (EL2) */
 	HACR_EL2,	/* Hypervisor Auxiliary Control Register */
 	ZCR_EL2,	/* SVE Control Register (EL2) */
+	SMCR_EL2,	/* SME Control Register (EL2) */
 	TTBR0_EL2,	/* Translation Table Base Register 0 (EL2) */
 	TTBR1_EL2,	/* Translation Table Base Register 1 (EL2) */
 	TCR_EL2,	/* Translation Control Register (EL2) */
@@ -539,6 +540,7 @@ enum vcpu_sysreg {
 	VNCR(ACTLR_EL1),/* Auxiliary Control Register */
 	VNCR(CPACR_EL1),/* Coprocessor Access Control */
 	VNCR(ZCR_EL1),	/* SVE Control */
+	VNCR(SMCR_EL1),	/* SME Control */
 	VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
 	VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
 	VNCR(TCR_EL1),	/* Translation Control Register */
diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index c2485a862e69..44b12565321b 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -44,6 +44,7 @@
 #define VNCR_HDFGWTR_EL2	0x1D8
 #define VNCR_ZCR_EL1            0x1E0
 #define VNCR_HAFGRTR_EL2	0x1E8
+#define VNCR_SMCR_EL1		0x1F0
 #define VNCR_TTBR0_EL1          0x200
 #define VNCR_TTBR1_EL1          0x210
 #define VNCR_FAR_EL1            0x220
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f94fe57adcad..f13ff8e630f2 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2830,6 +2830,43 @@ static bool access_gic_elrsr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static unsigned int sme_el2_visibility(const struct kvm_vcpu *vcpu,
+				       const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, sme_visibility);
+}
+
+static bool access_smcr_el2(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	unsigned int vq;
+	u64 smcr;
+
+	if (guest_hyp_sme_traps_enabled(vcpu)) {
+		kvm_inject_nested_sme_trap(vcpu);
+		return false;
+	}
+
+	if (!p->is_write) {
+		p->regval = __vcpu_sys_reg(vcpu, SMCR_EL2);
+		return true;
+	}
+
+	smcr = p->regval & ~SMCR_ELx_RES0;
+	if (!vcpu_has_fa64(vcpu))
+		smcr &= ~SMCR_ELx_FA64;
+	if (!vcpu_has_sme2(vcpu))
+		smcr &= ~SMCR_ELx_EZT0;
+
+	vq = SYS_FIELD_GET(SMCR_ELx, LEN, smcr) + 1;
+	vq = min(vq, vcpu_sme_max_vq(vcpu));
+	smcr &= ~SMCR_ELx_LEN_MASK;
+	smcr |= SYS_FIELD_PREP(SMCR_ELx, LEN, vq - 1);
+	__vcpu_assign_sys_reg(vcpu, SMCR_EL2, smcr);
+	return true;
+}
+
 static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
 				     const struct sys_reg_desc *rd)
 {
@@ -3294,7 +3331,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
 	{ SYS_DESC(SYS_TRFCR_EL1), undef_access },
 	{ SYS_DESC(SYS_SMPRI_EL1), undef_access },
-	{ SYS_DESC(SYS_SMCR_EL1), undef_access },
+	{ SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
 	{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
@@ -3656,6 +3693,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
 
+	EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
+			 sme_el2_visibility),
+
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
 	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),

-- 
2.47.3


