Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0458C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fO3W5/3LWJfCV2T1tm7UEtCzh/Z+fuFVMokrPkEPZU=; b=BMbs08cLLlPmbDtpx8+gSulEdw
	MC59mUWhrcubpLs55X3mc+OuHrZ3BO67YYcROXA0QwDK/85vaRWxl0GQsouRdWAu2alGE5LYAlpcM
	bWJfcQ+8LXdq/LaomyqWG/5+pdGJeo7kbvTiWLhtIZ/HbCDcl/FDlS9TNfNRetkR5+EaowUBF3JH+
	gXRh5qvFnfmS9/sDtqSZIUhPv0UAjCQERwH1Kx8YT8ZjIu86u4ZbhntNKm0sGpZPFE/oDRqBt4Wmg
	N/5+2c59UAGMK6WflzetAyXnwH3hBJencNd/QNKDTfBpdUIQFoOmTPaJOC0vPNkY6lj05q8EoR4GF
	Bssamv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lx-000000046GA-3zun;
	Tue, 08 Apr 2025 13:13:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZT-00000003kb6-0rgY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6fO3W5/3LWJfCV2T1tm7UEtCzh/Z+fuFVMokrPkEPZU=; b=A3wfgJMTQuPfjLexTZ1kg1YY2E
	3uHJKOqAHQL1X7cSFlI5FqfQhbbqrZY0E1xG3R+G5PCryOj+8/pAL6TFiwblEJAU0LYE6nbdLPF9N
	dEUF+iExmWYhXSjbSYuvUtgUklQfIgjlrACPPo3cNnVjpy9O4E6OJQ25L2ZeMH82uju7SJRd5ht5U
	7lEewnTu0f82FzfYrgcweJn0rh+6vMHNUJNjV/IaWk+9XnX+4a/xZI7V93xVaQ/2ZcnZ9ZDU+vpSu
	nYc8aLP+q0xdsvTrXswYTlQOq+vvUzQrGn8tEB+tOJEy2amBMysnfdJTuyWPnw8vNbZ8RG04JMAvG
	2AHfrX3w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZP-00000008GRe-0Ggk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5FCD5C5C7C;
	Tue,  8 Apr 2025 10:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AA2C4CEEB;
	Tue,  8 Apr 2025 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109561;
	bh=UVi8agAZ1sB+I6A2ZnkIrJN5dALwNQw2NTXFDupKEJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdN8pIqI+1JPDfdui1iwztd08GD6fd3JUPLbhZfFtdHGIdkm5Nfpg7AsGYX19SRQ3
	 xS/vNejDbth+L/txfNXIKJBLOLEbThcoW0RPHq0f9LphAo0Ook/k89trqiRJa5/87Y
	 HOCFLPSIoRfce31zRDYQx6wTyj+mYXlsMh/nVkYhpcUkQlb73XFsUl8LmkO5uqLuMD
	 N1Fq29P6X5fMy2/1n4ac9wzx9U9Inqsjy06GKV9xCpXAodFGZSP9UlUt0RyG/6i0ii
	 lisREbwnqtquo1D4XmQpatUM7ASHb92B7QRo6OlKS72IjGpk/ulPfeoh6oD+r2DTnh
	 GopxiV1Rkox3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZL-003QX2-Gx;
	Tue, 08 Apr 2025 11:52:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 13/17] KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2
Date: Tue,  8 Apr 2025 11:52:21 +0100
Message-Id: <20250408105225.4002637-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250408105225.4002637-1-maz@kernel.org>
References: <20250408105225.4002637-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115243_414265_45A85CAB 
X-CRM114-Status: GOOD (  20.18  )
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

A TLBI by VA for S1 must take effect on our pseudo-TLB for VNCR
and potentially knock the fixmap mapping. Even worse, that TLBI
must be able to work cross-vcpu.

For that, we track on a per-VM basis if any VNCR is mapped, using
an atomic counter. Whenever a TLBI S1E2 occurs and that this counter
is non-zero, we take the long road all the way back to the core code.

There, we iterate over all vcpus and check whether this particular
invalidation has any damaging effect. If it does, we nuke the pseudo
TLB and the corresponding fixmap.

Yes, this is costly.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h   |   3 +
 arch/arm64/include/asm/kvm_nested.h |   1 +
 arch/arm64/kvm/hyp/vhe/switch.c     |   8 ++
 arch/arm64/kvm/nested.c             | 193 ++++++++++++++++++++++++++++
 4 files changed, 205 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d87fed0b48331..b2c535036a06b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -390,6 +390,9 @@ struct kvm_arch {
 	/* Masks for VNCR-backed and general EL2 sysregs */
 	struct kvm_sysreg_masks	*sysreg_masks;
 
+	/* Count the number of VNCR_EL2 currently mapped */
+	atomic_t vncr_map_count;
+
 	/*
 	 * For an untrusted host VM, 'pkvm.handle' is used to lookup
 	 * the associated pKVM instance in the hypervisor.
diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index ea50cad1a6a29..0bd07ea068a1f 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -336,6 +336,7 @@ int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 /* VNCR management */
 int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
 int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu);
+void kvm_handle_s1e2_tlbi(struct kvm_vcpu *vcpu, u32 inst, u64 val);
 
 #define vncr_fixmap(c)						\
 	({							\
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 5eaff1ae32b29..5902e5f15d091 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -484,6 +484,14 @@ static bool kvm_hyp_handle_tlbi_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (ret)
 		return false;
 
+	/*
+	 * If we have to check for any VNCR mapping being invalidated,
+	 * go back to the slow path for further processing.
+	 */
+	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu) &&
+	    atomic_read(&vcpu->kvm->arch.vncr_map_count))
+		return false;
+
 	__kvm_skip_instr(vcpu);
 
 	return true;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c1572fe60555f..6bb0b744a8384 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -47,6 +47,7 @@ void kvm_init_nested(struct kvm *kvm)
 {
 	kvm->arch.nested_mmus = NULL;
 	kvm->arch.nested_mmus_size = 0;
+	atomic_set(&kvm->arch.vncr_map_count, 0);
 }
 
 static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
@@ -755,6 +756,7 @@ void kvm_vcpu_put_hw_mmu(struct kvm_vcpu *vcpu)
 		clear_fixmap(vncr_fixmap(vcpu->arch.vncr_tlb->cpu));
 		vcpu->arch.vncr_tlb->cpu = -1;
 		host_data_clear_flag(L1_VNCR_MAPPED);
+		atomic_dec(&vcpu->kvm->arch.vncr_map_count);
 	}
 
 	/*
@@ -854,6 +856,196 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 	}
 }
 
+struct s1e2_tlbi_scope {
+	enum {
+		TLBI_ALL,
+		TLBI_VA,
+		TLBI_VAA,
+		TLBI_ASID,
+	} type;
+
+	u16 asid;
+	u64 va;
+	u64 size;
+};
+
+static void invalidate_vncr_va(struct kvm *kvm,
+			       struct s1e2_tlbi_scope *scope)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+		u64 va_start, va_end, va_size;
+
+		if (!vt->valid)
+			continue;
+
+		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
+							   vt->wr.level));
+		va_start = vt->gva & (va_size - 1);
+		va_end = va_start + va_size;
+
+		switch (scope->type) {
+		case TLBI_ALL:
+			break;
+
+		case TLBI_VA:
+			if (va_end <= scope->va ||
+			    va_start >= (scope->va + scope->size))
+				continue;
+			if (vt->wr.nG && vt->wr.asid != scope->asid)
+				continue;
+			break;
+
+		case TLBI_VAA:
+			if (va_end <= scope->va ||
+			    va_start >= (scope->va + scope->size))
+				continue;
+			break;
+
+		case TLBI_ASID:
+			if (!vt->wr.nG || vt->wr.asid != scope->asid)
+				continue;
+			break;
+		}
+
+		invalidate_vncr(vt);
+	}
+}
+
+static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
+				  struct s1e2_tlbi_scope *scope)
+{
+	switch (inst) {
+	case OP_TLBI_ALLE2:
+	case OP_TLBI_ALLE2IS:
+	case OP_TLBI_ALLE2OS:
+	case OP_TLBI_VMALLE1:
+	case OP_TLBI_VMALLE1IS:
+	case OP_TLBI_VMALLE1OS:
+	case OP_TLBI_ALLE2NXS:
+	case OP_TLBI_ALLE2ISNXS:
+	case OP_TLBI_ALLE2OSNXS:
+	case OP_TLBI_VMALLE1NXS:
+	case OP_TLBI_VMALLE1ISNXS:
+	case OP_TLBI_VMALLE1OSNXS:
+		scope->type = TLBI_ALL;
+		break;
+	case OP_TLBI_VAE2:
+	case OP_TLBI_VAE2IS:
+	case OP_TLBI_VAE2OS:
+	case OP_TLBI_VAE1:
+	case OP_TLBI_VAE1IS:
+	case OP_TLBI_VAE1OS:
+	case OP_TLBI_VAE2NXS:
+	case OP_TLBI_VAE2ISNXS:
+	case OP_TLBI_VAE2OSNXS:
+	case OP_TLBI_VAE1NXS:
+	case OP_TLBI_VAE1ISNXS:
+	case OP_TLBI_VAE1OSNXS:
+	case OP_TLBI_VALE2:
+	case OP_TLBI_VALE2IS:
+	case OP_TLBI_VALE2OS:
+	case OP_TLBI_VALE1:
+	case OP_TLBI_VALE1IS:
+	case OP_TLBI_VALE1OS:
+	case OP_TLBI_VALE2NXS:
+	case OP_TLBI_VALE2ISNXS:
+	case OP_TLBI_VALE2OSNXS:
+	case OP_TLBI_VALE1NXS:
+	case OP_TLBI_VALE1ISNXS:
+	case OP_TLBI_VALE1OSNXS:
+		scope->type = TLBI_VA;
+		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
+		if (!scope->size)
+			scope->size = SZ_1G;
+		scope->va = (val << 12) & ~(scope->size - 1);
+		scope->asid = FIELD_GET(TLBIR_ASID_MASK, val);
+		break;
+	case OP_TLBI_ASIDE1:
+	case OP_TLBI_ASIDE1IS:
+	case OP_TLBI_ASIDE1OS:
+	case OP_TLBI_ASIDE1NXS:
+	case OP_TLBI_ASIDE1ISNXS:
+	case OP_TLBI_ASIDE1OSNXS:
+		scope->type = TLBI_ASID;
+		scope->asid = FIELD_GET(TLBIR_ASID_MASK, val);
+		break;
+	case OP_TLBI_VAAE1:
+	case OP_TLBI_VAAE1IS:
+	case OP_TLBI_VAAE1OS:
+	case OP_TLBI_VAAE1NXS:
+	case OP_TLBI_VAAE1ISNXS:
+	case OP_TLBI_VAAE1OSNXS:
+	case OP_TLBI_VAALE1:
+	case OP_TLBI_VAALE1IS:
+	case OP_TLBI_VAALE1OS:
+	case OP_TLBI_VAALE1NXS:
+	case OP_TLBI_VAALE1ISNXS:
+	case OP_TLBI_VAALE1OSNXS:
+		scope->type = TLBI_VAA;
+		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
+		if (!scope->size)
+			scope->size = SZ_1G;
+		scope->va = (val << 12) & ~(scope->size - 1);
+		break;
+	case OP_TLBI_RVAE2:
+	case OP_TLBI_RVAE2IS:
+	case OP_TLBI_RVAE2OS:
+	case OP_TLBI_RVAE1:
+	case OP_TLBI_RVAE1IS:
+	case OP_TLBI_RVAE1OS:
+	case OP_TLBI_RVAE2NXS:
+	case OP_TLBI_RVAE2ISNXS:
+	case OP_TLBI_RVAE2OSNXS:
+	case OP_TLBI_RVAE1NXS:
+	case OP_TLBI_RVAE1ISNXS:
+	case OP_TLBI_RVAE1OSNXS:
+	case OP_TLBI_RVALE2:
+	case OP_TLBI_RVALE2IS:
+	case OP_TLBI_RVALE2OS:
+	case OP_TLBI_RVALE1:
+	case OP_TLBI_RVALE1IS:
+	case OP_TLBI_RVALE1OS:
+	case OP_TLBI_RVALE2NXS:
+	case OP_TLBI_RVALE2ISNXS:
+	case OP_TLBI_RVALE2OSNXS:
+	case OP_TLBI_RVALE1NXS:
+	case OP_TLBI_RVALE1ISNXS:
+	case OP_TLBI_RVALE1OSNXS:
+		scope->type = TLBI_VA;
+		scope->va = decode_range_tlbi(val, &scope->size, &scope->asid);
+		break;
+	case OP_TLBI_RVAAE1:
+	case OP_TLBI_RVAAE1IS:
+	case OP_TLBI_RVAAE1OS:
+	case OP_TLBI_RVAAE1NXS:
+	case OP_TLBI_RVAAE1ISNXS:
+	case OP_TLBI_RVAAE1OSNXS:
+	case OP_TLBI_RVAALE1:
+	case OP_TLBI_RVAALE1IS:
+	case OP_TLBI_RVAALE1OS:
+	case OP_TLBI_RVAALE1NXS:
+	case OP_TLBI_RVAALE1ISNXS:
+	case OP_TLBI_RVAALE1OSNXS:
+		scope->type = TLBI_VAA;
+		scope->va = decode_range_tlbi(val, &scope->size, NULL);
+		break;
+	}
+}
+
+void kvm_handle_s1e2_tlbi(struct kvm_vcpu *vcpu, u32 inst, u64 val)
+{
+	struct s1e2_tlbi_scope scope = {};
+
+	compute_s1_tlbi_range(vcpu, inst, val, &scope);
+	invalidate_vncr_va(vcpu->kvm, &scope);
+}
+
 void kvm_nested_s2_wp(struct kvm *kvm)
 {
 	int i;
@@ -1189,6 +1381,7 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	if (pgprot_val(prot) != pgprot_val(PAGE_NONE)) {
 		__set_fixmap(vncr_fixmap(vt->cpu), vt->hpa, prot);
 		host_data_set_flag(L1_VNCR_MAPPED);
+		atomic_inc(&vcpu->kvm->arch.vncr_map_count);
 	}
 }
 
-- 
2.39.2


