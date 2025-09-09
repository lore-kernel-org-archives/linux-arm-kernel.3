Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B529CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvS7suGai3RogclrAtRQ2NtllrH/ITXs0daVVO19SRk=; b=ZTBu9L8BEg+jlp08nU8DKbmMs4
	iLpb85/bKGCR892L6TvIuPVENf9rUUqWsF8T9pSrBTyycgIkqpFSSfoQr75vhghdCReoTcEGNsQob
	mngAliFRi06E7V8qpD4K5SiQoj0ub7JRgj6A3jPhZ9QzlW8DifycxkOs3O0D5kBnPwkjOM2ykpmle
	lmXc4hb67jTzWS4iDTKNm6IAk80nr4RG56QQWygxf8lRv4Vx/2U14RSc5ErvPlA7OxBr/rAuRAIm2
	K/tsV5YyzpGBdEmiWtLwr85C9vWZVfeMk+Mf0WuLVpS35w2FyZrv+YZrIXT0RLL6PvP9pJgayL8nC
	27ExZmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuPj-00000005rC5-08dn;
	Tue, 09 Sep 2025 09:13:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsiZ-000000058vA-32MP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:44 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45b98de0e34so40844525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402682; x=1758007482; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvS7suGai3RogclrAtRQ2NtllrH/ITXs0daVVO19SRk=;
        b=IQg0dux9x6JHFq5U0RSASB+acnslEgi7cn7lBFkPgaRjS92vfJy+xJ4FC+3fyf0CtU
         Ra8+qaBkCG9fTC37S0WCAoI9C9lEGwA1LuLB4T6ivqZi7zaUPDfdh+wgIynnH7ID7XQz
         JbgT8io2XE6mPCeFi19XlDafi942aDOBu3hk2UpR8N6XKzFPOEwGBrqEeScflAtdbZDS
         cRMLzWIB7JeRA4+zUCvkuBfXBIS1g4AaywzWia3F992iknhOp0uaiYDc3ugllYDAYphf
         FHTQV+EavPn65ZCdLieaRSTeHIAbSn3Ro0NUvUO0Gq35CN3QJ0lclNRlms1e766bPlTW
         MS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402682; x=1758007482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XvS7suGai3RogclrAtRQ2NtllrH/ITXs0daVVO19SRk=;
        b=X5jWNaNBIHrMiYe6oR+sLSGHstPu/yEXv01Ot6lB7SzE/Q3Z7VHrMXe76OEB3/YaUV
         KYWlv/9+SID0AKR82FfwznEcGqxmPZhCehoAZdgbrVKeEIx0a1l3Uas/KtC5vqor1D4s
         NT9TWrpSTxG5k89mTkE0ES7GxFDizLvE9YGbixbTtLxvMza0s1fxmH8Q0jttetuDa6ow
         N46iZKjGEHkgqwGLFR8N2q5jaPlZpEoGH/EfbKa9vK3g9QTqv5oXpMnWI4pfrOiAN5bW
         pG8fgnvRvk4jp8FfOQoUW2eoe0D+xjkv1tIrMdMXgSCIjBszO+BBAtQvMe0eOpOqY6u8
         61jw==
X-Forwarded-Encrypted: i=1; AJvYcCW4ReWUim0e9xzrtG2DHZ2uMgj/WD/J7chCkp6zouDSA315N2x8h4D8N7EEPj+9fP8gF85VGbOGba1zfuirLx8r@lists.infradead.org
X-Gm-Message-State: AOJu0YwCG5/lqUMU8y1aP0wauhVwAw7VgcbelI3UPqg8Xk8BUMSfI7A5
	h3AbJh+9IWr/IiUfe37ZT488x0p7nBPd+h4HGwY3TVcilaA4j4oht0n5qt6/j8txHXS5FoR8rBd
	c6w==
X-Google-Smtp-Source: AGHT+IGCQIIQO3QV9jVW7Oz8ZQmopDoADhxOWLjQ3E53XncqD6Lg+ss+CmkgZdMZsNfhbiDRQEOa0wFZjQ==
X-Received: from wmbes11.prod.google.com ([2002:a05:600c:810b:b0:458:bf93:f0e1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1987:b0:458:b01c:8f
 with SMTP id 5b1f17b1804b1-45ddde8a55cmr115788295e9.8.1757402682154; Tue, 09
 Sep 2025 00:24:42 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:32 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-6-tabba@google.com>
Subject: [PATCH v4 5/9] KVM: arm64: Decouple hyp VM creation state from its handle
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002443_784827_5FAD97BB 
X-CRM114-Status: GOOD (  16.42  )
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

Currently, the presence of a pKVM handle (pkvm.handle != 0) is used to
determine if the corresponding hypervisor (EL2) VM has been created and
initialized. This couples the handle's lifecycle with the VM's creation
state.

This coupling will become problematic with upcoming changes that will
allocate the pKVM handle earlier in the VM's life, before the VM is
instantiated at the hypervisor.

To prepare for this and make the state tracking explicit, decouple the
two concepts. Introduce a new boolean flag, 'pkvm.is_created', to track
whether the hypervisor-side VM has been created and initialized.

A new helper, pkvm_hyp_vm_is_created(), is added to check this flag. All
call sites that previously checked for the handle's existence are
converted to use the new, explicit check. The 'is_created' flag is set
to true upon successful creation in the hypervisor (EL2) and cleared
upon destruction.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/asm/kvm_pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c    |  1 +
 arch/arm64/kvm/pkvm.c             | 11 +++++++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7ad997dabddb..8ede884f091d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -253,6 +253,7 @@ struct kvm_protected_vm {
 	struct kvm_hyp_memcache teardown_mc;
 	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool is_protected;
+	bool is_created;
 };
 
 struct kvm_mpidr_data {
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 35f9d9478004..0aecd4ac5f45 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -18,6 +18,7 @@
 
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
+bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index abe173406c88..969f6b293234 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -407,6 +407,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
 	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
+	hyp_vm->kvm.arch.pkvm.is_created = true;
 	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 358168572482..2138dbfcb04b 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -87,12 +87,13 @@ void __init kvm_hyp_reserve(void)
 
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	if (kvm->arch.pkvm.handle) {
+	if (pkvm_hyp_vm_is_created(kvm)) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
 					  kvm->arch.pkvm.handle));
 	}
 
 	kvm->arch.pkvm.handle = 0;
+	kvm->arch.pkvm.is_created = false;
 	free_hyp_memcache(&kvm->arch.pkvm.teardown_mc);
 	free_hyp_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 }
@@ -165,6 +166,7 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_vm;
 
 	kvm->arch.pkvm.handle = ret;
+	kvm->arch.pkvm.is_created = true;
 	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
@@ -176,12 +178,17 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 	return ret;
 }
 
+bool pkvm_hyp_vm_is_created(struct kvm *kvm)
+{
+	return READ_ONCE(kvm->arch.pkvm.is_created);
+}
+
 int pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	int ret = 0;
 
 	mutex_lock(&kvm->arch.config_lock);
-	if (!kvm->arch.pkvm.handle)
+	if (!pkvm_hyp_vm_is_created(kvm))
 		ret = __pkvm_create_hyp_vm(kvm);
 	mutex_unlock(&kvm->arch.config_lock);
 
-- 
2.51.0.384.g4c02a37b29-goog


