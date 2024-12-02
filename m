Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC4BD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57d11+Vl+NAgbTWF6Laovcj658EA1KvcaSswzHFN5Sc=; b=3MBrUgcD0OWFDr9Vdbmj71KmmF
	VqjGsU9BBo/OK2gsd7NNs+qoTOZH/C4Kichvz+cZ2rRU3XsV02dRhOU2olcyVExbjZ8QxNvMOlu/i
	GQc264tX+8X+u4u669+PSPhE9rduu4pOPcfQl8JJYoBomitBx6Whi69SJWVPyXp48CQprBDKwwtVl
	wRltRhlh/nnDfT4gHgnMMSWYMElvVUeLeWujAEQrILgQr54zgYt8FTUn9vupG+lLQcQp1uQ1XyjDU
	B7Vc7VhZoZoV6D2mU+NEI8SyniRxzyv8RB14gqWJ3e+CISNZrz185OOYgKaTyu7retHdB4RvygPrE
	B0whPsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8q5-00000006l1y-1rtg;
	Mon, 02 Dec 2024 15:59:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eR-00000006iSw-2PPy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a37a57dfso36241655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154474; x=1733759274; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=57d11+Vl+NAgbTWF6Laovcj658EA1KvcaSswzHFN5Sc=;
        b=h/AfU1vm7g6ahj8ppIpNLdjkvXyxP2ZNDz7nc82Uv2uym2ru5Qu4QWJavt6acDXcl+
         JqVH/y7hBb3PxUjm32DVMGvEJZvF0+dNMYoPnMkD9WPanyWSa8oOiT+Nmljx6TzmCpr+
         rPJ7dJbM3I8+xW+A/9RUOEnZG+a0HUMi0y8cP1qiXjBt+KpwQazXH1fvOKqpCXWNmUYr
         GLREmP1kdV7NLoAwhjgrJ5MpECiP2re5XOoaUDxJCJlVTeCEhWG5TBkR0kxoO/19rV2C
         /yssIdS+kvqAl10sbOG0U0etid6+FOufSetP8KHyGUOQduD25Ln6rw+52PuMz/aV16i+
         FawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154474; x=1733759274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57d11+Vl+NAgbTWF6Laovcj658EA1KvcaSswzHFN5Sc=;
        b=hvOUKdN2WDOEZj8RKGsXPvoPE6ZIOdROIh34xLxHpulfpigSz5wTxZpNPU/8RjqmjT
         bxGU05dS9gLoHb+1xxXs5PP+AsH9EKMlLpJ8gRebk1UZhEhURLXEc83iMPFIRSqfhGiz
         L0egHlahygXNNFewOc7IRocvMjzIc79ytT+0dlWnTBnRAfKNnaBTniNvRWKDk40uywHG
         Ih/yVjlrAYB3jLwjDv14Ppbs72njFyL4tkjgtaue1bFzPfIFlUF62I8eUgvokHy9wFSn
         sWZnnqfswhNRkZo9fs0WJNI1BfWxWzRsU3bJLedgAzhe+bHE5u8+BSwCREjJtaG+sUcc
         f8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWA3icEsY47Frj6Y80ZcuRjmsQbRGtqbMY6S/PalCWVBT/rI9i1JfvTWg/eZkbaGJLVuxs+DpPKizggaB5aQA49@lists.infradead.org
X-Gm-Message-State: AOJu0YwuqnKZ60uikxsc2KcNN0yDLnPt+xgvQg4igPrBd7ZxvCLGgyvS
	PAxqSDbdRw7aX6tjoZKDi3oUwyiwZ5mYA672dm5QRx9KhmE2RwZvWKzyfFCYuJUd+kC9FbhfPw=
	=
X-Google-Smtp-Source: AGHT+IEX7W6aLBuxPdDXg5idWYuhPush+WW2wT9LWR15gRkb5XnLTnQL1UMoLIX3aV+mT2vF0Pr+zZMq4A==
X-Received: from wmqm13.prod.google.com ([2002:a05:600c:4f4d:b0:434:a346:77e5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4686:b0:434:a923:9313
 with SMTP id 5b1f17b1804b1-434a9de55b4mr195058375e9.25.1733154474044; Mon, 02
 Dec 2024 07:47:54 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:32 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-6-tabba@google.com>
Subject: [PATCH v4 05/14] KVM: arm64: Initialize feature id registers for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074755_605048_366878BE 
X-CRM114-Status: GOOD (  17.28  )
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
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 42 +++++++++++++++++--
 3 files changed, 44 insertions(+), 3 deletions(-)

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
index 59fb2f056177..1261da6a2861 100644
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
+	if (reg >= sys_reg(3, 0, 0, 1, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
+		return kvm->arch.id_regs[IDREG_IDX(reg)];
+
+	return 0;
 }
 
 /* Handler to RAZ/WI sysregs */
@@ -448,6 +462,28 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Performance Monitoring Registers are restricted. */
 };
 
+/*
+ * Initializes feature registers for protected vms.
+ */
+void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_arch *ka = &kvm->arch;
+	u32 r;
+
+	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
+		return;
+
+	/*
+	 * Initialize only AArch64 id registers since AArch32 isn't supported
+	 * for protected VMs.
+	 */
+	for (r = sys_reg(3, 0, 0, 4, 0); r <= sys_reg(3, 0, 0, 7, 7); r += sys_reg(0, 0, 0, 0, 1))
+		ka->id_regs[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
+
+	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+}
+
 /*
  * Checks that the sysreg table is unique and in-order.
  *
-- 
2.47.0.338.g60cca15819-goog


