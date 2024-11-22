Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39237D75E28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ME9UsezPGt4WGSKA1VLgt1h56+I05ddJ2XsR+2perQ=; b=gd/5Z6bESzL1557sWWCIS1wDbK
	1FJxbqdlByzOyv2E7T5fYT1alzaVu7Sk1V+6co5LcBB/saiGgOT00RW3b5VONU1hsRFrmTXX//QIq
	m+X2glN3NwTxGqTnPGRthMLCh9cSvr5yiPkhK/A4hmnHWQDLjMnJpbn92dVYc3W9AY+iMzYY46IQ9
	bDYA3XM7WoP99kP6mk1Wuj8AtBd9BcjeM+CCPs6JRP8EqlfBzcL73mWMA7KW0WXvZLOF8UQavE1nc
	gTeogNlbpbgi0niKgym81k8aofpGUeudEp1Ly78hl9kMF4AicwGLGLncvVa6W6Bqh8DZaTcLP3bCb
	ctmp5OBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERa7-00000002KOB-0pI9;
	Fri, 22 Nov 2024 11:12:11 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUk-00000002JRf-2Rh4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:39 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e293150c2c6so3731702276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273597; x=1732878397; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ME9UsezPGt4WGSKA1VLgt1h56+I05ddJ2XsR+2perQ=;
        b=dxniO3PBJKOo+M7GEAk3QaX80+fBy4UMpW6ca69qRIPJP4UhySCw8xA1q6ep1q4evb
         u19kB4aIv14fmr8nKat2/TAzDqUW0B7HgfYg5Slm5QRyisS8N8ITOaTREElJ4dPIdsa0
         NcD5s7RmipesFjMMJvSBB0R8EUjaRB36JGjcE26cVHzg4VCXI0peiuEAyHaS7Z9EEpcC
         KOsQP4znlVHeHcBoRg9NsLv3oxM7ptfkMD5+NlNNMFfzxowbGRPFVQmx67yWMYHqLRjl
         N3mthX//fU2c4xIncD8WGAmEEZYk0QWItmqx2qnW+CzfNlJzqzbWNKxkp5n/avKd0GJJ
         wUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273597; x=1732878397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ME9UsezPGt4WGSKA1VLgt1h56+I05ddJ2XsR+2perQ=;
        b=MUPJgmUGaX/tLtmCoBawKEayMNjO+Ujlrac2zmsTnUp2A2yth1E0L3inmUDFGJ+XaO
         //lgSd07ziDHGZjrmkFlUeOfZGApVvvTbJvcVxjnwr8iRBbWOJ6LjlPv/SAIhmiqD9b4
         xcHqlMdOMsHprWgef5CgrzfmFZ09Hx2dntC50SlzorW1HcBjs/JjAP6iY/9UZJ8boSN+
         xy6tIYTg/jqqG/vP7DXI8fiRcc7AaSwTYkoeU7RNupQcdlHg97UqxM5t7sa/HKXy4lSo
         fKooY9O2SSUoMCm5QnYvFLDB56UxV4m43LSb4e0M/nCnisaU1WQLMXrKVW2J4UCkg38c
         9bOw==
X-Forwarded-Encrypted: i=1; AJvYcCXsIh/2ZUpyjtyjmN+Xgzkg1v/8T/bwv6OedNrHGEkUjFAeCUfu+mEG85BHAJJ6GEvmev60+qDKzvXK6Yibk4ao@lists.infradead.org
X-Gm-Message-State: AOJu0YxO1JxqA7CIGGNS6DsUoHjgjiCzo6F6RQqNkyHGIjp8dXWVqLHo
	N5rpFdmZc5/I3BOwLNclGL42SYs3WXGMdSzBzEMvgQS2Ju+RJfZ11a/+1xETjACVvUtg9WZPtQ=
	=
X-Google-Smtp-Source: AGHT+IFUC+e6lyJm7zGvYcxKJA1IAW1b9/r6RFtf7kaaoJE5CoVHncZPv0RFttxq9UWxn9otjbK1Y2/pAQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:2b07:0:b0:e38:1d14:64f4 with SMTP id
 3f1490d57ef6-e38f8b9ef19mr996276.6.1732273596763; Fri, 22 Nov 2024 03:06:36
 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:15 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-6-tabba@google.com>
Subject: [PATCH v2 05/12] KVM: arm64: Initialize feature id registers for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030638_652322_ED80E995 
X-CRM114-Status: GOOD (  18.07  )
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

The hypervisor maintains the state of protected VMs. Initialize
the values for feature ID registers for protected VMs, to be used
when setting traps and when advertising features to protected
VMs.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 54 +++++++++++++++++--
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
index d1e59b88ff66..69e26d1a0ebe 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
@@ -201,6 +201,7 @@
 u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id);
 bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
+void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
 
 #endif /* __ARM64_KVM_FIXED_CONFIG_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 59ff6aac514c..4ef03294b2b4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -381,6 +381,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
 	hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
+	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
 
@@ -419,6 +420,9 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		kvm_init_pvm_id_regs(&hyp_vcpu->vcpu);
+
 	ret = pkvm_vcpu_init_traps(hyp_vcpu);
 	if (ret)
 		goto done;
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 59fb2f056177..7008e9641f41 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -204,8 +204,7 @@ static u64 get_pvm_id_aa64mmfr2(const struct kvm_vcpu *vcpu)
 	return id_aa64mmfr2_el1_sys_val & PVM_ID_AA64MMFR2_ALLOW;
 }
 
-/* Read a sanitized cpufeature ID register by its encoding */
-u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
+static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 {
 	switch (id) {
 	case SYS_ID_AA64PFR0_EL1:
@@ -240,10 +239,25 @@ u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 	}
 }
 
+/* Read a sanitized cpufeature ID register by its encoding */
+u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
+{
+	return pvm_calc_id_reg(vcpu, id);
+}
+
 static u64 read_id_reg(const struct kvm_vcpu *vcpu,
 		       struct sys_reg_desc const *r)
 {
-	return pvm_read_id_reg(vcpu, reg_to_encoding(r));
+	struct kvm *kvm = vcpu->kvm;
+	u32 reg = reg_to_encoding(r);
+
+	if (WARN_ON_ONCE(!test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags)))
+		return 0;
+
+	if (reg >= sys_reg(3, 0, 0, 4, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
+		return kvm->arch.id_regs[IDREG_IDX(reg)];
+
+	return 0;
 }
 
 /* Handler to RAZ/WI sysregs */
@@ -448,6 +462,40 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Performance Monitoring Registers are restricted. */
 };
 
+/*
+ * Initializes feature registers for protected vms.
+ */
+void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
+{
+	const u32 pvm_feat_id_regs[] = {
+		SYS_ID_AA64PFR0_EL1,
+		SYS_ID_AA64PFR1_EL1,
+		SYS_ID_AA64ISAR0_EL1,
+		SYS_ID_AA64ISAR1_EL1,
+		SYS_ID_AA64ISAR2_EL1,
+		SYS_ID_AA64ZFR0_EL1,
+		SYS_ID_AA64MMFR0_EL1,
+		SYS_ID_AA64MMFR1_EL1,
+		SYS_ID_AA64MMFR2_EL1,
+		SYS_ID_AA64MMFR4_EL1,
+		SYS_ID_AA64DFR0_EL1,
+	};
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long i;
+
+	if (WARN_ON_ONCE(test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags)))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(pvm_feat_id_regs); i++) {
+		struct kvm_arch *ka = &kvm->arch;
+		u32 reg = pvm_feat_id_regs[i];
+
+		ka->id_regs[IDREG_IDX(reg)] = pvm_calc_id_reg(vcpu, reg);
+	}
+
+	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+}
+
 /*
  * Checks that the sysreg table is unique and in-order.
  *
-- 
2.47.0.371.ga323438b13-goog


