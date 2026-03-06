Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA16FCB638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLRuOrnGf7BREJV0+gasDhvlfygu7Rn2xYX881hrsX0=; b=XsNwHbM1jaD5nzA2zVHDbd0Hmx
	LAYTLExwn8v8eGgwhQVsfYLXRvi4VrPR3voFfvCNWvJRdOmhCXc32zBGRoydBK/o/I4tqbRYYblWF
	fJzW6D8k17MffYWL/+foXk0hjE20PctOVyGFYmJu0GK2xH05uxbJBGX2wqKKHYzYJp7+i4visYtsn
	mRg70rHZV4/pzCs91MvzLpb21KEAnXsQmMqM7rahKpBWNCJ0vUEPswwOb8tmQNcCaFT6mpX7q+lWP
	6E2eNpIp8fgrS0a2BvbeX7Ypr2nzh/VapCK7UDrtsJMaE29YxvMDLvBX2TtTvn6z9TWcdKwxtRnyu
	T70WeNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhF-00000004DcR-03WW;
	Fri, 06 Mar 2026 17:10:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhE-00000004DbA-1j5f
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 17:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YLRuOrnGf7BREJV0+gasDhvlfygu7Rn2xYX881hrsX0=; b=IFHke3jwyy5eBe9sG4tZqJ7Njg
	dq4FY3k+NKgQCUyhv4bV+t+2jTVffmZa2o3z7RC0DrpiNK7NLApBXLy8JcRBdHedMHXmothlEHjet
	hsGz0+IGF36U4KvX/mS5vMfnguYaTpVKs9hLNAv8Vta5X7l4pgEd60tBlltWCCYhXwFW7jqJSiWPG
	1TJk2AcpdMawWj7FLCe+auKEqBChsJhNiwl2zh+taq0aHHDof3Oypl2q5MikImiYSjmsFtHa46xau
	4qIzpkHv7BcMOuGRJqOIFd/4JlBG4CHOGQwqOpE+A9CQzvPgjgcoyGdEOjVWux+wuXSJv2py1/wtb
	wJqOJ4EQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhB-00000009JaS-2C7K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1910D4029D;
	Fri,  6 Mar 2026 17:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED45FC19425;
	Fri,  6 Mar 2026 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817035;
	bh=WfGxhqhjq10VSZV2h4qBa1D5MAiiOjvTsGIutBZvgzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YGQF1lpWRSNCgIY7ZSXaI+wlaPYuTpKe7GWuHTZlkTV4EmygG5gPWR4TpekpDfek7
	 9SKQuzptPALC/VjW1Rb7bnWEEAq+QMxfkERwsp7pDfrNfOoKelAItMonhu4zmZvM6x
	 E2ubrJ74qHgeuOF+XCJKxAe9lmZC59ZrEGGz2J1a4114Z3Coxte7YW4Y1mWeS/amlS
	 YmXBKezMUx43vs01pf3wnQbqzLDcr3+qfNVWKnrSFuI7OS43Wx1iNsq2EYcvGSrHFi
	 EKj2vMB/u2L7g6UNtCmx1YRAwMbzbnIX3mXVK1tRwmqwed1ezShH/SRObdkHYOMj6m
	 ulFxdD2xug7pg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:08 +0000
Subject: [PATCH v10 16/30] KVM: arm64: Support TPIDR2_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-16-43f7683a0fb7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WfGxhqhjq10VSZV2h4qBa1D5MAiiOjvTsGIutBZvgzc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo1v7dD/KcG9s1sYihJjHjqzTXtoGqAjolYy
 d2DqFiDNKWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKNQAKCRAk1otyXVSH
 0OTvB/97FvvhkZuzELh6GOdRs9rjuutO8EvVc+/Z/UoedyQy3bhhUUa81iUPK4TUX6dRAlSWyRj
 yngohaEvhpTlOOS2oNqJZoYk1AU4/kcjQQ3oKm/f6LU566xg2v7SCzM+qZB0or89nDT4J29AliJ
 zF3EGfPafDtb6ah3hxN9dAfSbLdLea0nLhxha1mzdSmoYL61Hnwj9tIHDpaJu6a/6jkiJrVu5P5
 xYRnFkoewo2fmAgJOM7JunfhXZTBroKTKiCtC2GOL6nZnSg32qd0+OT0p29barLlUOYOwtyVLP6
 wx3H0YqJwLDTakRDeK1To9odEizdPUz2lnUKrmcaoMK08ONB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_171037_927118_2704B4F9 
X-CRM114-Status: GOOD (  14.84  )
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

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
 arch/arm64/kvm/sys_regs.c                  |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e5194ffc40a7..ec1ede0c3c12 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -445,6 +445,7 @@ enum vcpu_sysreg {
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
index f13ff8e630f2..66248fd48a7d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3511,7 +3511,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
 	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
-	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
+	{ SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
+	  .visibility = sme_visibility},
 
 	{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
 

-- 
2.47.3


