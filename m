Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57277E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA16CpWSjw4J8hytyuNewMCyl42cawlROSmZZIo9OEU=; b=h/FIOumvPlPNBQYune+yiX3f2R
	pvhB+HIhMrvAlvrjvI5ma7eQ0Q4xQXlgLYJMba7jCWaf52xdPSAoG3pSpr7hNF4+2/DlwmyQDIDTA
	KUghmNsiCsCysbdCf3ecfnf35iE5m+yxdWcSuJN+pdXAkaaHPfHsfgEV45OSRShUBQJptfRinXin6
	0+VSa0f26KyZqqn8Xcbz42/iFWI6f70FDdNy6IyD34HicLsTiRkL8PrGKy0mC+chvGj6Fj+xG95Cd
	jeYb6c3LsCmvlh/KpqWqYuGU0lYhjzQrXDmxFqZvBqljUIuK2/ONt6Igl74A5LMZ8fwK/C8JU22NB
	Wyi7gkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO0Ay-000000000Hf-35h6;
	Wed, 18 Dec 2024 19:57:44 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzvK-0000000HYPr-3SaO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:35 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa6732a1af5so616117766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550893; x=1735155693; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FA16CpWSjw4J8hytyuNewMCyl42cawlROSmZZIo9OEU=;
        b=G9TbQ9LxPnChv7ip8gaNrHaoVG0D1OYb9/ha2IiaEXjzi/iIPTkf8Ww1byI9Qibpbe
         1+PqFmCKxOCeNbx8/i3DnnHEI0cWbDRbxcGAb/gjBoBAOPciKxh10nBQS87y1g8MDoPM
         CvC5QLoh3bk0/yqpny1lwFXUZqwophR183UQoaYRaFSXHkR+osTJyaKz2eJuAzN80+nj
         xWC9BO8Hfkm0B1pVaxK2+IRup1Q8m/F2CMsvNODUt1/JprgaqHv1coynHSYEbQVAO7h1
         B8CmaJQ6t1swIhP7rq2iV/phExPG86AOMM02NpVvTy2gLpqWLw+hEeVsrLTi2ADdHa0o
         N7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550893; x=1735155693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FA16CpWSjw4J8hytyuNewMCyl42cawlROSmZZIo9OEU=;
        b=QbEje5AV52mycdRF5q4ui11cWYYsncG4VE50jMjYzH5mOKuqkI16pCUsGish7B94Gj
         +MGpyhdYkv4lF4wF2A+Exdtzxy2p2zgMqJdLP53hEUQb8iY8U6woeQk9C+Q3LDA4b31X
         En9nWNXsP7KBHNW4zdutdMGetEpzdLYWo1j9+ykgN29hZoUrrvWFL+knRZIsMlSZp/RV
         DWMfJxws1hLdgLcRc5p2hu/8YZc8bQNeNYqSHfq3cYSfqP+Cn2+NSw6AnxxmKEeumnmu
         e2DrDLc9CrF0djwaBEtFJt3WW22UWGbkT2CytDFEpPWcVCwcOhLG2Nxz3F0kKPBVRKPM
         3Q7g==
X-Forwarded-Encrypted: i=1; AJvYcCW4pWCwa4ge4EmsL+6wbpPzeV0WAfZTy9n7FcPHUSnpXUk/UGR+jf8VLf956ai5nY2cAwMgI9jPYVl58NodZr/R@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJm1Qhrj5Djj7QBgAOryZWftzm9YB2sDGrbXv1aDjvGq6+7pF
	5PrU51neVTbyIWffRZYmzcDEBFPJWowWTbcKPukPdJonFE//BrV+efAPRjFdwUN8EDsVv1Krvin
	H5lCAeg==
X-Google-Smtp-Source: AGHT+IG8EXE2W+9QfjAAeb4en8etMIJHTOmKwloyUtafN8OWJRimmwomZbfFp5X5CMVOuBoShjXizcAXD0pD
X-Received: from edbfi23.prod.google.com ([2002:a05:6402:5517:b0:5d4:8b0:1df0])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:3297:b0:aa6:66bc:8788
 with SMTP id a640c23a62f3a-aabf48cf088mr348264866b.45.1734550893196; Wed, 18
 Dec 2024 11:41:33 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:55 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-15-qperret@google.com>
Subject: [PATCH v4 14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
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
X-CRM114-CacheID: sfid-20241218_114134_865313_E6E7FC2D 
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

Plumb the kvm_stage2_test_clear_young() callback into pKVM for
non-protected guest. It will be later be called from MMU notifiers.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 22 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 ++++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 8663a588cf34..4f97155d6323 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 0bbfb0e1734c..74bd6c72fff2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -44,6 +44,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 98d317735107..616e172a9c48 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -303,6 +303,27 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(bool, mkold, host_ctxt, 3);
+	struct pkvm_hyp_vm *hyp_vm;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vm = get_np_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+
+	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -516,6 +537,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
+	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 94e4251b5077..0e42c3baaf4b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1530,3 +1530,22 @@ int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 
 	return ret;
 }
+
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


