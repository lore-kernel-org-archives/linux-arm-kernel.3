Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC1DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJRlv5UOGfcUPVoc2PKAdr3wDfuDwyNBC6vBC34SzAY=; b=ak/OqEjVt23/y86cAUisrBLvDi
	UFoakz/GlpbE5V64+EVjwDyrEK/cDi913oHIdW0ohsW6c9diPpOlMGIWImPs7o4I+1zcQCOU74taf
	R/8wrIXJg+u0cVCU9EtszRTHYUjKIxCmojnrxBmu4Y0vuD/khqcd8nIQz5o1vkMWe2NCzAd3qRaSU
	MtjBVw8aqukR6xsiQCZLxqHPSpqflTHm+uQ4T4UKljMgoeVQc1IDFT3mvLB380grFkp6+QpRPnGpR
	CqyRW6wrbEzrjC40ipEz4BPcuP3cK4hM5oXtXexXA7thco42hMVdbUjENVRH7Qns4i8f9M21yv+E2
	skL3opcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upM1N-00000001nHu-3c1s;
	Fri, 22 Aug 2025 07:17:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH0Q-00000001Boc-3b6s
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 01:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZJRlv5UOGfcUPVoc2PKAdr3wDfuDwyNBC6vBC34SzAY=; b=JIMbA/SUpTKhsk0fLN7bwIo3g5
	3IaT4YcRpRF10RxoYlEXAchl8FQ+KPhEaUpqVFMQx6fwrdyFrdO8BvZgV1/zeVpLKyMHmbQ+13/8r
	6D07I8Pe7SBmbf4/X/jQGt/YbmKFu7kmmJKpyOOlyFxwewj5hR0TLDw5eyyat241gBs27p8yyslxz
	zDxWzg3eAoWBz8/HpWXz50lgm+JqD1qivtX7YjzIgowsjj3kXShcPUKyL9M1I2SccXNKoz63vx1Fc
	hVo5rltCU/emA2GmWjW/3JWkUKxHvTFN1/1wghhJlIGxiRqkFzyLKMMHF285pM4yf//nIhSvwcp0M
	FJKfBopg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH09-00000000js8-2sI7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73DEF419A4;
	Fri, 22 Aug 2025 01:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D9FC4CEEB;
	Fri, 22 Aug 2025 01:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827731;
	bh=s9OgbUV3jMegR4yK5YJZn39bA8MN2bqc20M/qGI/rlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r8+F/bPwDnjx3PW+1K+PfYpsYZOG3boGlYS+v7yXc7666DiMo7cMMmz/C1F/CjieN
	 A0V1++nJtJzwRwweFNbHcrf/TWyOGGvb5J0eZYOg3Tzr3/SNfFV6V4n+2qSPH46jxl
	 Ql2ZGOO4r0dl93hQ9pTxaMKQ57LaGgjenFlNsb++ZBXX804NZCHK7cmGKqzhs23HyF
	 Y2YNpLNtHsiAw0cp1Qr84ek3m2FuXqGauacG70TP1Bs5/hDmoscVDIW1EM4RDM7/PQ
	 v5u6UK97sPmkW7U4+SZPAQlR+X2zsoZb7BUUmbg2a3KvvJIJYoB6iZ621Tx48+J843
	 s5C+NDIoLew9Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:46 +0100
Subject: [PATCH v7 17/29] KVM: arm64: Support TPIDR2_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-17-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s9OgbUV3jMegR4yK5YJZn39bA8MN2bqc20M/qGI/rlg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83FGVS0KWqKNvAlONV3hETel4NcSUAM/aj0j
 0aoaNpVSJKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNxQAKCRAk1otyXVSH
 0NzWB/9KKtPaXuIKr/ECc2Rv/FcTi1K4u1461JdAw19F2JZS2w0WMjSSN+prsvnTIFjqaA27yzm
 kZxn+CdPlsC3RwDbbgnjTZ8OzsG1wcMltmWAGyzbnbbi4pPE8y3bzED/RqusY4UROoav0ULUPTX
 Rd2QJNU99KfdK0R2wPtITQyZy2B4dyA7gyX5IePoGQfmZ9IpMSBc551EvH57sLEfOJZ3OOYUw32
 mfpOMd8YYv0T7iyM9udn5dtJEHlIJo1IoKlanksKx6Avq9Rm0OQUwQqoMDgsLvbUtv/ubKMlzFO
 1NCSjIB6blIgQNFm88TNL/rbX6ggGBpBtHLogWsi3M2Zj97O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_025537_862893_9098B138 
X-CRM114-Status: GOOD (  15.75  )
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

SME adds a new thread ID register, TPIDR2_EL0. This is used in userspace
for delayed saving of the ZA state but in terms of the architecture is
not really connected to SME other than being part of FEAT_SME. It has an
independent fine grained trap and the runtime connection with the rest
of SME is purely software defined.

Expose the register as a system register if the guest supports SME,
context switching it along with the other EL0 TPIDRs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
 arch/arm64/kvm/sys_regs.c                  |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index edb2acdb4bd1..632c74397fa9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -450,6 +450,7 @@ enum vcpu_sysreg {
 	CSSELR_EL1,	/* Cache Size Selection Register */
 	TPIDR_EL0,	/* Thread ID, User R/W */
 	TPIDRRO_EL0,	/* Thread ID, User R/O */
+	TPIDR2_EL0,	/* Thread ID, Register 2 */
 	TPIDR_EL1,	/* Thread ID, Privileged */
 	CNTKCTL_EL1,	/* Timer Control Register (EL1) */
 	PAR_EL1,	/* Physical Address Register */
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 5624fd705ae3..8c3b3d6df99f 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -88,6 +88,17 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
 	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
 }
 
+static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!system_supports_sme())
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_sme(kern_hyp_va(vcpu->kvm));
+}
+
 static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
 {
 	return host_data_ptr(host_ctxt) != ctxt;
@@ -127,6 +138,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		ctxt_sys_reg(ctxt, TPIDR2_EL0)	= read_sysreg_s(SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
@@ -204,6 +217,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 81742e9237c0..4166d396450d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3243,7 +3243,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
 	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
-	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
+	{ SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
+	  .visibility = sme_visibility},
 
 	{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
 

-- 
2.39.5


