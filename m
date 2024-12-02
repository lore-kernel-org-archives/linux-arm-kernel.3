Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B401ED78339
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Px3aMU5Y6YCbaWuFPyuPTWUD9wSZx6wmkm2Yp6OKqIc=; b=FDG9cWqhD97gSNXqKcq7LNu7TK
	w3cgVmeUNiFGwLvLD962pluP9qz6TbyLZbv/Gybm3r0F08r31/uQF8gRLf6NAdVzTuE81IcXV2E7z
	MuC3YtaP5zYCqy/16TK0owzFEbcFciP49wpO6cYZLdqkR4riZqZWe1STLz+He6GUWk9YPK+zyXKXx
	nl2YuXRheSaMU9IikNyu2+S3+RUZTmXkugOrU6eGAPYSKazaIboNwtKj78AhVFsdQEPMDePuIjapQ
	f8GaOKkPsj9VbEuK//wT0RaY/X8YOwqom7ptgm6Fxq50BAbrn0fgNq5tmEcG496BI/5mtdxelNCFZ
	mBxf/bnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIADa-000000070rk-3TSr;
	Mon, 02 Dec 2024 17:28:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7u-00000006zza-1i78
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Px3aMU5Y6YCbaWuFPyuPTWUD9wSZx6wmkm2Yp6OKqIc=; b=IJ4lN/JJ3zSYNsX8r+lZnujGyl
	bmAviCQt/iqxXpsLCYlO5rY4zwO7JhYfeMZF4AdCI9RMtIP/0cRXP0JZCmK9zsKnMMkDA1ZbWk5fa
	nxvrj6SnGjjuXgjYLpDFBxENHaHksD2sgBEZuLuUV4b8FFhVH0E7Fnm3MOLe/3jklubdlhXeHKt8K
	/DS8m2AJ9i9MrDuu956U0xBCL+zjuAhmc2I6FzBBXSS+mYIZB1HywIarT/pjlkDCm+5pSwKjvlmpY
	Z0SnpkrM729l7p3UqfBz2T1+MeClkrCsaqWDR7oGoMHhfoe9YkMT6ocFux/3lr4tr+su7XStXVbWM
	QwPqrlRA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7p-00000002D6t-3vs7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D76A5C567D;
	Mon,  2 Dec 2024 17:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F1DC4CED9;
	Mon,  2 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160138;
	bh=J7TuCkQQXw+zmd80r09KMLYg2hEdv2a0XVnhIHkAbss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdcoHz4iTIJIXtUnsr61yVLJ8PmKBzRNZKiU81xSEL+NiO3t2JPPtc1OrgHlwRyM2
	 H70RAVFBHtpl9zDZKhpRJ+fuiOtZA6FRkvm+uaiCmJ3X7BUNUdthCi5WC+O/3RKRi/
	 DL4L04g+IxHM3AwSQM3Y728ZDnBhfc9BRdWUiR4CtQEI728XAnbV+u+Mux3mETLnIT
	 /glsemXKqWYqIG/6np74nCuk++sZINMLMfc3zrJZCo3K5Up7xgx8jI5b94UmmgO0LL
	 g9YQa+yKB9sOG53wJcG0NJOBmfms95UZ2KMlPsLaxzQ2UY1LKpCNYgjDJtNwrpERgo
	 yEdhUutLoqAjQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7k-00HQcf-Of;
	Mon, 02 Dec 2024 17:22:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 05/11] KVM: arm64: nv: Accelerate EL0 timer read accesses when FEAT_ECV in use
Date: Mon,  2 Dec 2024 17:21:28 +0000
Message-Id: <20241202172134.384923-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172222_299500_AD894DBE 
X-CRM114-Status: GOOD (  15.44  )
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

Although FEAT_ECV allows us to correctly emulate the timers, it also
reduces performances pretty badly.

Mitigate this by emulating the CTL/CVAL register reads in the
inner run loop, without returning to the general kernel.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c     | 15 -------
 arch/arm64/kvm/hyp/vhe/switch.c | 71 +++++++++++++++++++++++++++++++++
 include/kvm/arm_arch_timer.h    | 15 +++++++
 3 files changed, 86 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index c9a46d34b40cf..2c4499dd63732 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -101,21 +101,6 @@ u64 timer_get_cval(struct arch_timer_context *ctxt)
 	}
 }
 
-static u64 timer_get_offset(struct arch_timer_context *ctxt)
-{
-	u64 offset = 0;
-
-	if (!ctxt)
-		return 0;
-
-	if (ctxt->offset.vm_offset)
-		offset += *ctxt->offset.vm_offset;
-	if (ctxt->offset.vcpu_offset)
-		offset += *ctxt->offset.vcpu_offset;
-
-	return offset;
-}
-
 static void timer_set_ctl(struct arch_timer_context *ctxt, u32 ctl)
 {
 	struct kvm_vcpu *vcpu = ctxt->vcpu;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 80581b1c39959..b014b0b10bf5d 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -256,6 +256,74 @@ void kvm_vcpu_put_vhe(struct kvm_vcpu *vcpu)
 	host_data_ptr(host_ctxt)->__hyp_running_vcpu = NULL;
 }
 
+static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	u64 esr, val;
+
+	/*
+	 * Having FEAT_ECV allows for a better quality of timer emulation.
+	 * However, this comes at a huge cost in terms of traps. Try and
+	 * satisfy the reads from guest's hypervisor context without
+	 * returning to the kernel if we can.
+	 */
+	if (!is_hyp_ctxt(vcpu))
+		return false;
+
+	esr = kvm_vcpu_get_esr(vcpu);
+	if ((esr & ESR_ELx_SYS64_ISS_DIR_MASK) != ESR_ELx_SYS64_ISS_DIR_READ)
+		return false;
+
+	switch (esr_sys64_to_sysreg(esr)) {
+	case SYS_CNTP_CTL_EL02:
+		val = __vcpu_sys_reg(vcpu, CNTP_CTL_EL0);
+		break;
+	case SYS_CNTP_CTL_EL0:
+		if (vcpu_el2_e2h_is_set(vcpu))
+			val = read_sysreg_el0(SYS_CNTP_CTL);
+		else
+			val = __vcpu_sys_reg(vcpu, CNTP_CTL_EL0);
+		break;
+	case SYS_CNTP_CVAL_EL02:
+		val = __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0);
+		break;
+	case SYS_CNTP_CVAL_EL0:
+		if (vcpu_el2_e2h_is_set(vcpu)) {
+			val = read_sysreg_el0(SYS_CNTP_CVAL);
+
+			if (!has_cntpoff())
+				val -= timer_get_offset(vcpu_hptimer(vcpu));
+		} else {
+			val = __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0);
+		}
+		break;
+	case SYS_CNTV_CTL_EL02:
+		val = __vcpu_sys_reg(vcpu, CNTV_CTL_EL0);
+		break;
+	case SYS_CNTV_CTL_EL0:
+		if (vcpu_el2_e2h_is_set(vcpu))
+			val = read_sysreg_el0(SYS_CNTV_CTL);
+		else
+			val = __vcpu_sys_reg(vcpu, CNTV_CTL_EL0);
+		break;
+	case SYS_CNTV_CVAL_EL02:
+		val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
+		break;
+	case SYS_CNTV_CVAL_EL0:
+		if (vcpu_el2_e2h_is_set(vcpu))
+			val = read_sysreg_el0(SYS_CNTV_CVAL);
+		else
+			val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
+		break;
+	default:
+		return false;
+	}
+
+	vcpu_set_reg(vcpu, kvm_vcpu_sys_get_rt(vcpu), val);
+	__kvm_skip_instr(vcpu);
+
+	return true;
+}
+
 static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	u64 esr = kvm_vcpu_get_esr(vcpu);
@@ -409,6 +477,9 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_hyp_handle_tlbi_el2(vcpu, exit_code))
 		return true;
 
+	if (kvm_hyp_handle_timer(vcpu, exit_code))
+		return true;
+
 	if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
 		return true;
 
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 6e3f6b7ff2b22..c1ba31fab6f52 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -156,4 +156,19 @@ static inline bool has_cntpoff(void)
 	return (has_vhe() && cpus_have_final_cap(ARM64_HAS_ECV_CNTPOFF));
 }
 
+static inline u64 timer_get_offset(struct arch_timer_context *ctxt)
+{
+	u64 offset = 0;
+
+	if (!ctxt)
+		return 0;
+
+	if (ctxt->offset.vm_offset)
+		offset += *ctxt->offset.vm_offset;
+	if (ctxt->offset.vcpu_offset)
+		offset += *ctxt->offset.vcpu_offset;
+
+	return offset;
+}
+
 #endif
-- 
2.39.2


