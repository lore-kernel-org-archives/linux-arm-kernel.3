Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5712E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgRs0HkjSCh59IZhf7+TrvM3b16VAv7mDc29HHStdgo=; b=uFPzANE2b8FcaRIV5Mib6j8LY0
	cs0wr/MzlmlUtHsji6JYpwOD92nzLjDkFX/pPnY11Wu8j1GptlfSOHUP7SWd08HqAMU2csxOQEkQy
	8HaqOlLVrjNeIi/bIQ+0tr6XGeEQskhNCUBKTKlm0PWmKfLn8NaP4iungwCd41lgj+uvMY6me81OJ
	/wC+HbKwYGqeyaCppCEBknL9Lnd65hDK1R1fI/c8+ylu04OiN1/JZEn6CyZLdVDh4eWgmFFyktd1d
	mxqvurYDxJONpUok3y0Gmhdm3H55Awq32nToXCbrtCB7MMKveLfuHZEDAjmTNW7OmFqVIg3VkVzvU
	PeDEQLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQXM-000000099Nb-2keK;
	Tue, 03 Dec 2024 10:53:48 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQIF-000000095js-1WUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:38:12 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa53beff6f0so173541666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222289; x=1733827089; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EgRs0HkjSCh59IZhf7+TrvM3b16VAv7mDc29HHStdgo=;
        b=uJggSyTheOSroqk/d+40gdOg1KxLlXwtfMJhO+BpTORP6YxGJyVgz8WwYVfx4MPAr4
         1UsiYg9S/ADmYeGEM2SL2GnQMGNdIAwWRGTRYo3SkGZwT6ag657omsihr4PqyErBJ6Fi
         aCnhj4PrGC6nz5Oj9rdKJTWpsKHcqN3ForQohc2cphlj8N0yCW7dja4Oj4H21Orq5Mc4
         wlcJ+EpKDTIoga40GV/EL2DVIasE55l5yveRs9gHXQkSvxbn4ZuIwZJscFwXQpNspmRh
         f6CM7QWiSSEIU/qj9z/QCxjyEwLg9yUAniInKdJ0whjHVUAbvIprpPOPBCbLekwOx5cl
         0h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222289; x=1733827089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgRs0HkjSCh59IZhf7+TrvM3b16VAv7mDc29HHStdgo=;
        b=K4bVjyjWpHGJdF49LZKiGzHkYOi8ZUA0q5+Yk7CADoRChy6mQ/TxNrBMuMxtUvXibH
         T6Dz+aPn/UXM64Lby+Rzgn8ifWg2nBFRPL0ZVXNu8thquKiDw99Uz1RkaMGaeeLc27cD
         fXFNDVXPlYtfbjx0wusdDHd/5uFgHHnctgUGYO654BEAtNQlqEl7ENQsWoi4/inro2YN
         AVaOZpvbTMt1Whp4ZX7OSM4dBhnAZaEJZIO0H9v8ruBqe6oJSeCxe4k3HJgo943LMikt
         reSdZczUdxARH3M1EveCeNreREfcF8CYlfMl9cjT5sP9ss9/Y75fx6C33E25SgbNxZV4
         8A8w==
X-Forwarded-Encrypted: i=1; AJvYcCWTGLC88Pmn1dSUcN4USn2D9ZOlLXe4WmF2zZQpsJU62ahoIsgPEOOtkG5dRPzzc7RvTLuXP9+AnBnVpUTxLvWF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc7zKCi/5fCKeCua739e1kX+nAhkZlLeYVHO0BzXm3s4WjxbT0
	xk2LFSxRF3DTrgxK8p8r+Ax7StION0NeNpSDvP8bbw/CR+e8Jc7OmwIb4Pb3TaEo59dMqV9E2wn
	ZNa0OcQ==
X-Google-Smtp-Source: AGHT+IGowzrGpSC0FLSlw3WKUPPBp1evDjYqr9UC0mO5wZAxbWJofoXIaJzqMrV6fp0J8VpSR7nkc7pw29FT
X-Received: from edql9.prod.google.com ([2002:aa7:c309:0:b0:5cf:ad96:abb])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5243:b0:5d0:bf5e:eb8
 with SMTP id 4fb4d7f45d1cf-5d10cb800fcmr1839841a12.23.1733222289249; Tue, 03
 Dec 2024 02:38:09 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:32 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-16-qperret@google.com>
Subject: [PATCH v2 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023811_400558_7D7F31CD 
X-CRM114-Status: GOOD (  13.05  )
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

Plumb the kvm_pgtable_stage2_mkyoung() callback into pKVM for
non-protected guests. It will be called later from the fault handling
path.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 19 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index cb676017d591..6178e12a0dbc 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 554ce31882e6..3ae0c3ecff48 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -44,6 +44,7 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
+int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 67cb6e284180..de0012a75827 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -333,6 +333,24 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, gfn, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = __pkvm_host_mkyoung_guest(gfn, hyp_vcpu);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -547,6 +565,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
+	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 0e064a7ed7c4..7605bd7f80b5 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1541,3 +1541,23 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *
 
 	return ret;
 }
+
+int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_unshare_guest(vm, &phys, ipa);
+	if (!ret)
+		kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


