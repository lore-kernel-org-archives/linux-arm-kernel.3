Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CC6FCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC/fzyqVGHZKvcyWeaBpziHPy4Pw3dVxglK2ima2i9k=; b=BXsRRWlh1d06aJaKWH0ERlYzXk
	siTLIwp3NGcqMsXlEZlFC+s2NK10HgH2XTjjJVAMXN1BsfinVroCOgkJJF0X7iKvlq7UakVguq3aI
	W9WW+J4iUD1/UyincnwFZ2EfERquWF0c9fzyrV3wTNQxhceoBRXPW99yzE8jutqL9tldqRddPLTAY
	VI7RtmY4GVXXOIggvZfqoyvpizza1hVJqs/nBUIL9122yoQyGtQuJ6nv+jeiI+77tSRhiQBCqaJWI
	l0HZvBFxuNak28XULomBLeAlq+5FeuH/bKLnmolUK5uSVmGAA0CX6fzPuB/ZQPaVMOlB52HMpa85I
	f6GxoqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgX-00000004Cra-0Ise;
	Fri, 06 Mar 2026 17:09:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgW-00000004CqT-0mDP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 17:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RC/fzyqVGHZKvcyWeaBpziHPy4Pw3dVxglK2ima2i9k=; b=YsE4HkXCEvz2l1iPqRbiWKz1Hu
	tuGzZYFTA5yTQljC5rWcUQwimajsmtb4PsG2lkdDtRz6dE4N5G0hMFkQchRs5hrY+KlaGSKcKqKxT
	v0GMXuisPSGA30PjDnNTI7aWLG5xqX9P7ZYufwCJjLwSOyJwR9HlZpP1WVglkcbiyIILSzDs9DEsE
	sUm5vuNV/eVFvyYljqr6u2X4rkquznqhJQlgmdc224vvg2R81LyTgCTrn2xUWt6xshzE8YmBUXKJq
	R5rpS9vI5z9dHzP6dr+4qtawvlwpEwhaeYFWt31ix07yQ9C8EanHudM1l3zuhx0xr9MCUyEmTNJmE
	3oL/9CRg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgT-00000009JJO-0XX8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:09:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0F9042E06;
	Fri,  6 Mar 2026 17:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6475C19425;
	Fri,  6 Mar 2026 17:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772816991;
	bh=FbDjUlkeVQonqZmxtMpNg1hWpmAleRhNyM/CAB2skO0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ieyo51tATWDI+S8I3Gz+De+jhyw22b9XQ+1Zu92Ss6S0H7ATsoIoULiqSJH5Bipue
	 9Uygsp66B3MTsLoaNqhqvruNLONw7r6dAhIPQp7nZLcPcpyoVtDsmtjKzDdSwPMfyx
	 heH43tYpv88SExAWXqbAJ5ujzakRZV+GQIVbE05kLh8xFoTXf7zu1npmBZLan6WmBz
	 3ur8KQx0W6l3KW8BP+z/7+5ukrEM+2wAkq0Bd7ilTtO4Cn9fvtwPmcEtICiYEWEOa2
	 7Ik5fy6b9TX2q2VHgJL6gijq39TXZCjbudV1W9vzoKWLHgH/qPwvNNJJyHREPqy3wA
	 nDnNFd9K+MUEA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:00:58 +0000
Subject: [PATCH v10 06/30] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-6-43f7683a0fb7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3951; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FbDjUlkeVQonqZmxtMpNg1hWpmAleRhNyM/CAB2skO0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwotBwe6WGrNGhWACEQm6DwKxwb/T5p3br7f0
 yYxgcLYIv2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKLQAKCRAk1otyXVSH
 0PjdB/9hLoYW+EFNZxW/Glm2n30jgDHfGudVVssSx/ZbgkT0RciL7KB/ZZFsRtcZbsyMLSEs8hS
 PwBgKQ1/wnuRA0JJvbrmdRzEfYR4+MbsXYkgZo9rvtMNUU48hqJEDGM7haxw3pwQ8cRbugiq+AN
 QSfoAJMYd0WuvnDtevUTiZM3T4karmPm21X6SAQ6zOez0cu7bW/+26xq7Voi6+c3g5QvA48tuvM
 JT3yvDYUnH5e2QD8m0O0qxaPzEqWRIjYJJ61YQJNtcKPp+70SDwaRe3Quy9ZnU6LENOSu+sqCFM
 bUQfofBtkZxztAHMvvj233KCR6pfUxIQiw6oGeHvuTzp0P9g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_170953_519635_29B94062 
X-CRM114-Status: GOOD (  11.56  )
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

Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
pull all their definitions to the top of sysreg-sr.h so they're all
available to all the individual save/restore functions.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 84 +++++++++++++++---------------
 1 file changed, 41 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index a17cbe7582de..5624fd705ae3 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -16,8 +16,6 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
-
 static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
@@ -28,47 +26,6 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 	return vcpu;
 }
 
-static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
-{
-	return host_data_ptr(host_ctxt) != ctxt;
-}
-
-static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
-
-	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
-		return &vcpu->arch.external_mdscr_el1;
-
-	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
-}
-
-static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
-{
-	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
-
-	if (!(ctxt_is_guest(ctxt) &&
-	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
-		return read_cpuid_id();
-
-	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
-}
-
-static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
-{
-	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
-
-	// POR_EL0 can affect uaccess, so must be saved/restored early.
-	if (ctxt_has_s1poe(ctxt))
-		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
-}
-
-static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
-{
-	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
-	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
-}
-
 static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
@@ -131,6 +88,47 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
 	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
 }
 
+static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
+{
+	return host_data_ptr(host_ctxt) != ctxt;
+}
+
+static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
+
+	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
+		return &vcpu->arch.external_mdscr_el1;
+
+	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
+}
+
+static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
+{
+	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
+
+	if (!(ctxt_is_guest(ctxt) &&
+	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
+		return read_cpuid_id();
+
+	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
+}
+
+static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
+{
+	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
+
+	// POR_EL0 can affect uaccess, so must be saved/restored early.
+	if (ctxt_has_s1poe(ctxt))
+		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
+}
+
+static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
+{
+	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
+	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+}
+
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);

-- 
2.47.3


