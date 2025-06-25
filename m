Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0EEC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiqxtEy5s2ppOL+XzTp4LZ5dUYiZ1SdEuwU1clCZ3Os=; b=LlwGs++T+QEYQ31ADhg8oShghr
	8xiqkmQvFj/9JETW7EmXniWT0ZzWC1sPpflHNZ2t04fpX2gBjQzXS8QO22+jocxqy6VLK5TJ0qsHT
	KprLWhWvueJvTo9QA3GSypS6mBeMgxsMgxs0GPMw2kksghWLeto6Vo+uWT3IKsL0ZfrDegu4eBRh3
	b3yqd3tt0RapWj/Qp/xCuc4/YZVJS55oXW231Yf7jrR/LWwFkQ8xR75vvR+Y9zHgT/OtAPucFKywt
	sX6obF6uIvkM/WpxDZhCVTVtVh5ZSwNldRvlxSCaqEQpn5TZjzwOeU9vEmgu1KewMWYHtuBVFUeBN
	Yp0i6Www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSFq-000000099Nv-1yfS;
	Wed, 25 Jun 2025 15:41:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGI-00000008SvB-29BW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 11:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yiqxtEy5s2ppOL+XzTp4LZ5dUYiZ1SdEuwU1clCZ3Os=; b=RRU3AMyPnoP9tfPtQEziP4MAaV
	DI7pcu8ReyBz9Oqna64/M4i36T8SRTQL3JvuG/G119a/zmjqUuB9BtMtSIQt9WSXYBhPVHhTQr5CD
	zmPwlswWr20//s+i/XuHqqEB1s2lNKqIVIOtMuWpxm/OvJS5NSbDLEeT2G4uk2c82uDHT2D0XJrnz
	Wb9WNspzaEWdJ7wpcB6gDW0OiQz0SrOL+He9kFqM6YzSviSNSH8mKBcOdXQSuu0JH544dC1qQVyZj
	ZCW3taAPP7FQ6WcG0cfB2/gZXQ9tVx6zXRg7buj0n3Wu72zGRnY9RFEsbz/ccxv14QL94O6lrei0W
	KZzWU1Sg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGF-00000005p4n-2uvG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A66B5C6428;
	Wed, 25 Jun 2025 11:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30471C4CEF0;
	Wed, 25 Jun 2025 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850749;
	bh=QJQHUAMW8r5F6GKVZSnOYzg0vb/nAN5jmjGWnBd733g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n4gsm5YC8/Bq9q5kJQvXi8Es93buxrbp930eF1n1AHmk3nLaT3m/fA9EWLeLvj4MG
	 k9d0STQ7srHWAIxbQ4MSi3zOIx1UiNGVR0zJtwq6Vh2eJNSEHtvGSlnlkaI/XRz0Gk
	 6Bf7oInuoswuJe+WNhnWoPpzlJq4GgL3iVjxD8wy1ErJ1R9iNDapOZUmbNiyh8Dqq9
	 nKRYJk576ZSSpQRSDUx9IzuH7eXTGnpbk5MJjZOWMXC7fMxnA+obC4yvaP0mQRIYrU
	 sACTflwDZNLmQrpWKOXG1/ggS7leEV+9ZDM9mvdfF9Y9UdKwnSa3Y66hmAw3OBP2MV
	 bp/lMnl28geOQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:48:08 +0100
Subject: [PATCH v6 17/28] KVM: arm64: Support SME identification registers
 for guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-17-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=5391; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QJQHUAMW8r5F6GKVZSnOYzg0vb/nAN5jmjGWnBd733g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xyedImk1DyVTTDOWwqVQ2omp2HQOxkrUZad
 ofMWuIZIyaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvccgAKCRAk1otyXVSH
 0N0tB/9sfmdk+z3bP5LajBZOqhA7CEYD8+ADKyXhfg2Th7MN9RDtgJ+y9fIeV3Sf3wTm0Dl9q34
 FSnKC+H0gdZyZzbiGAs50I9/c/AaXaT02uROVCDxdE9fS2qtZ0V7I6nvYG3XwE09h9Wjxmmpm2f
 GNmveYb4sFm1/lDYsr0WXka53TWuz3XibFsA7QbiX0To8WMRLHWEh/mp73brumfXhp7xc1lUpBU
 RZntIxp5Jhm5e7KC1PVHnOl4NhwpM8TXYZKrjETjpBCWJcfM3B5hg6+XAKqY8DDuwoyxoiUNRsf
 afcYvxo51SG/97KTJdgCiwzCWiisHJE8Nzu70aV+Qxlzys9g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_122552_129301_1C02D32F 
X-CRM114-Status: GOOD (  20.56  )
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

The primary register for identifying SME is ID_AA64PFR1_EL1.SME.  This
is hidden from guests unless SME is enabled by the VMM.
When it is visible it is writable and can be used to control the
availability of SME2.

There is also a new register ID_AA64SMFR0_EL1 which we make writable,
forcing it to all bits 0 if SME is disabled.  This includes the field
SMEver giving the SME version, userspace is responsible for ensuring
the value is consistent with ID_AA64PFR1_EL1.SME.  It also includes
FA64, a separately enableable extension which provides the full FPSIMD
and SVE instruction set including FFR in streaming mode.  Userspace can
control the availability of FA64 by writing to this field.  The other
features enumerated there only add new instructions, there are no
architectural controls for these.

There is a further identification register SMIDR_EL1 which provides a
basic description of the SME microarchitecture, in a manner similar to
MIDR_EL1 for the PE.  It also describes support for priority management
and a basic affinity description for shared SME units, plus some RES0
space.  We do not support priority management and affinity is not
meaningful for guests so we mask out everything except for the
microarchitecture description.

As for MIDR_EL1 and REVIDR_EL1 we expose the implementer and revision
information to guests with the raw value from the CPU we are running on,
this may present issues for asymmetric systems or for migration as it
does for the existing registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/sys_regs.c         | 46 +++++++++++++++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c26099f74648..29b8697c8144 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -494,6 +494,7 @@ enum vcpu_sysreg {
 	/* FP/SIMD/SVE */
 	SVCR,
 	FPMR,
+	SMIDR_EL1,	/* Streaming Mode Identification Register */
 
 	/* 32bit specific registers. */
 	DACR32_EL2,	/* Domain Access Control Register */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index caa90dae8184..b11bb95e9e35 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -774,6 +774,38 @@ static u64 reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 	return mpidr;
 }
 
+static u64 reset_smidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
+{
+	u64 smidr = 0;
+
+	if (!system_supports_sme())
+		return smidr;
+
+	smidr = read_sysreg_s(SYS_SMIDR_EL1);
+
+	/*
+	 * Mask out everything except for the implementer and revison,
+	 * in particular priority management is not implemented.
+	 */
+	smidr &= SMIDR_EL1_IMPLEMENTER_MASK | SMIDR_EL1_REVISION_MASK;
+
+	vcpu_write_sys_reg(vcpu, smidr, SMIDR_EL1);
+
+	return smidr;
+}
+
+static bool access_smidr(struct kvm_vcpu *vcpu,
+			 struct sys_reg_params *p,
+			 const struct sys_reg_desc *r)
+{
+	if (p->is_write)
+		return write_to_read_only(vcpu, p, r);
+
+	p->regval = vcpu_read_sys_reg(vcpu, r->reg);
+
+	return true;
+}
+
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
@@ -1607,7 +1639,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
 		}
 
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+		if (!vcpu_has_sme(vcpu))
+			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
@@ -1723,6 +1757,10 @@ static unsigned int id_visibility(const struct kvm_vcpu *vcpu,
 		if (!vcpu_has_sve(vcpu))
 			return REG_RAZ;
 		break;
+	case SYS_ID_AA64SMFR0_EL1:
+		if (!vcpu_has_sme(vcpu))
+			return REG_RAZ;
+		break;
 	}
 
 	return 0;
@@ -2905,7 +2943,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MTE_frac |
 				       ID_AA64PFR1_EL1_NMI |
 				       ID_AA64PFR1_EL1_RNDR_trap |
-				       ID_AA64PFR1_EL1_SME |
 				       ID_AA64PFR1_EL1_RES0 |
 				       ID_AA64PFR1_EL1_MPAM_frac |
 				       ID_AA64PFR1_EL1_RAS_frac |
@@ -2913,7 +2950,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64PFR2_EL1, ID_AA64PFR2_EL1_FPMR),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
-	ID_HIDDEN(ID_AA64SMFR0_EL1),
+	ID_WRITABLE(ID_AA64SMFR0_EL1, ~ID_AA64SMFR0_EL1_RES0),
 	ID_UNALLOCATED(4,6),
 	ID_WRITABLE(ID_AA64FPFR0_EL1, ~ID_AA64FPFR0_EL1_RES0),
 
@@ -3112,7 +3149,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
-	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	{ SYS_DESC(SYS_SMIDR_EL1), .access = access_smidr, .reset = reset_smidr,
+	  .reg = SMIDR_EL1, .visibility = sme_visibility },
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,

-- 
2.39.5


