Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AA1C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vMILSUdPeuh5R2mDAsbU7AQScdiUCH/IkBAMcb64AA=; b=vPMnNiYWJPUKjQ7pxRZDR5bVk1
	BGKryIgHq0tmJrEGbraJbDA4kgRD6Iy+ITliUXjiNGoaapM2ZW10+AaKdPy3edPRhGkPJmFiN9FvT
	3UdVmn1thsaLVTrCGL8lxjF9pJHGiVP5AfYvPqlvEVWt1lxP4Urma6+6XKxQ3BSneZ6hJLSBEeEn9
	O+KaRgYP4dqGex526WaVFdzxkelr9NHPuVzxTJV7ZckxCzTWOHwK/VWDo+Y6zDPKnDZVc7+0r0SU4
	Qzx6Vvtee/o+xv3jd5ImuIl2L4BP19xn45xrg0wlXETsurrfgY0TKvqdE+e1bwVWjBpfHUx185PXC
	MBHwD1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRa-00000006Xx5-46Lc;
	Tue, 15 Sep 2026 12:39:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRQ-00000006XYL-1FHE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1vMILSUdPeuh5R2mDAsbU7AQScdiUCH/IkBAMcb64AA=; b=CGVAD4S8hvxoF6MvfhnA7raMUq
	aj9fLscp3HCFrgGMfWKpkMw5oWWgHoH7cNz15fM1IBxVOibeVMUigk+unbzugUrSadjsGwCJLQIpH
	gCDvMBlxSc6zqHEH9XqSx8VMS9JmcFu5QRmVx09HPsA+d5O80G6fziHtqvZ1TF/B5Sr7dNzStLvOo
	fxsgr6X4g0rb9oMyE5X+w8ApuuUr4+KuKXH0YwWlIsZFEmQeftHWrGPqMCZ/o6HO/9asBwJ0N93bF
	U29V3YCZAwN9b980GP2BJPt4XqjAN1O4xFgjEol0SZPzQDMRLR6axfJjCe+5eofV7DoFZiXg54fgv
	+eElZrpQ==;
Received: from out-80.mta0.migadu.com ([2001:41d0:1004:224b::50] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SRF-00000006kJG-1k2d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Z1wZ7qftvFZJFjW6nJ8b01fzq25gfbzkB8VJg4lTex4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789475942; v=1; x=1790080742;
 b=IwRTgGHBLRhXI6M7ejiElg1x5WeHu1G6hl1TcpyOrU/a3C6jBI4Gw4RJEt+tjL/QEdn+++Yd
 jzsTYfSudbmSGkq6fDj9s3AWq8dThDBdF1eSw5J45Sv6pIsd/hIp++uvj+u0tF3wiq69a5ZbLHl
 kDzv8LUTzDaTeugOkaXSrMy0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5ea5cd6d44487e6a;
	Tue, 15 Sep 2026 12:39:02 +0000
X-Mizu-Trace-ID: 5ea5cd6d44487e6a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH 4/7] KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
Date: Tue, 15 Sep 2026 13:38:43 +0100
Message-Id: <20260915123846.2317931-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915123846.2317931-1-fuad.tabba@linux.dev>
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133905_652146_9DAC26A7 
X-CRM114-Status: GOOD (  16.10  )
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

On an MTE-capable host under pKVM, enter_exception64() reads the VM's
MTE flag through vcpu->kvm, which for a host vCPU is a host-writable
pointer nothing validates. The host can point it at any address in the
hyp linear map and read back bit 1 of that word through PSR_TCO in the
vCPU's CPSR, or panic the hypervisor with an unmapped one.

Get the VM through a get/put pair around the read: a loaded vCPU's is
the hyp VM, an unloaded host vCPU's is read once and pinned, and a
pointer the host never shared leaves TCO clear.

Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260914070536.877D91F000FF@smtp.kernel.org/
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/exception.c             |  5 ++-
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 28 ++++++++++++++++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |  2 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c             | 37 ++++++++++++++++++++++
 4 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 754e2dc1df54a..6e60d890afa4a 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -70,6 +70,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 			      enum exception_type type)
 {
 	unsigned long sctlr, vbar, old, new, mode;
+	struct kvm *kvm;
 	u64 exc_offset;
 
 	mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
@@ -109,8 +110,10 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 	new |= (old & PSR_C_BIT);
 	new |= (old & PSR_V_BIT);
 
-	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
+	kvm = vcpu_get_kvm(vcpu);
+	if (kvm && kvm_has_mte(kvm))
 		new |= PSR_TCO_BIT;
+	vcpu_put_kvm(vcpu, kvm);
 
 	new |= (old & PSR_DIT_BIT);
 
diff --git a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
index 4fdfeabefeb43..f55950ee2a7e4 100644
--- a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
+++ b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
@@ -13,6 +13,34 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_host.h>
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/pkvm.h>
+
+/* Under pKVM a host vCPU's ->kvm is host-writable. */
+static inline struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
+{
+	if (is_protected_kvm_enabled())
+		return pkvm_vcpu_get_kvm(vcpu);
+
+	return kern_hyp_va(vcpu->kvm);
+}
+
+static inline void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
+{
+	if (is_protected_kvm_enabled())
+		pkvm_vcpu_put_kvm(vcpu, kvm);
+}
+#else
+static inline struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
+{
+	return vcpu->kvm;
+}
+
+static inline void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
+{
+}
+#endif
+
 static inline void kvm_skip_instr(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_mode_is_32bit(vcpu)) {
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c904647d2f760..5ddb407149667 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -83,6 +83,8 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 					 unsigned int vcpu_idx);
 void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void);
+struct kvm *pkvm_vcpu_get_kvm(struct kvm_vcpu *vcpu);
+void pkvm_vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm);
 
 struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
 struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 4c33c863e90e1..737f3a5c4f640 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -304,6 +304,43 @@ struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
 
 }
 
+static struct pkvm_hyp_vm *pkvm_get_loaded_hyp_vm(struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+
+	if (hyp_vcpu &&
+	    (vcpu == &hyp_vcpu->vcpu || vcpu == hyp_vcpu->host_vcpu))
+		return pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
+
+	return NULL;
+}
+
+/*
+ * A loaded vCPU's VM is the hyp VM. An unloaded host vCPU's is mapped at
+ * EL2 only while pinned, so it's read once and pinned; the pin fails for
+ * memory the host isn't sharing.
+ */
+struct kvm *pkvm_vcpu_get_kvm(struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *hyp_vm = pkvm_get_loaded_hyp_vm(vcpu);
+	struct kvm *kvm;
+
+	if (hyp_vm)
+		return &hyp_vm->kvm;
+
+	kvm = kern_hyp_va(READ_ONCE(vcpu->kvm));
+	if (hyp_pin_shared_mem(kvm, kvm + 1))
+		return NULL;
+
+	return kvm;
+}
+
+void pkvm_vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
+{
+	if (kvm && !pkvm_get_loaded_hyp_vm(vcpu))
+		hyp_unpin_shared_mem(kvm, kvm + 1);
+}
+
 struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
-- 
2.39.5


