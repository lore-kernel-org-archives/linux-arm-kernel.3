Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C770FD132CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBItirLg5Oir0h+eEpcfLT0BceEfQcKCnavoc0LgXGQ=; b=y+DwqvMh/xl8oowwQDfiJiBgu4
	SklujRHvDHBiSkha9AaYYZ5g/OBYaMoBbOZHOJpH70yG7YYDidPCQMil0Dc1BxgBk+j2YM/as1onO
	IlZE2bgAt9i7nkp8gPbFVH77rxdAmpokKGHxaG18CEwnVhvRvOtI2Bah18uQ1IivfAUQA+lKDDGyQ
	FKC6iM13nmIdQGGDbrAA11Po1vrRWxryF+M7G5fxAvV3S/fJpdNYCVGcNk1mnyPFq6VHpisNc8EJp
	10fY92jtsW4jVYj/gKKWy3RHBajbQPjL4KclZ5jZ9o3d40nPiNU3pUZmRk9m29raZ+bz3v39OgaDY
	PY4bPwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xYx-0000000DxGr-0gfB;
	Mon, 04 Nov 2024 13:56:11 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xC3-0000000DsN0-2OuP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:32 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e293b3e014aso7044437276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727150; x=1731331950; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBItirLg5Oir0h+eEpcfLT0BceEfQcKCnavoc0LgXGQ=;
        b=gM5IANTXeRyclKCL7vMZFOahd/o9+omTerslwkkiH3GgRBBLZg8uGwJgkifVJRde30
         waJr3lnCZEVpDqyVMtFf9igOrXKBRrshG5o6+imP8tGCxdFhX1r+6SWFTinI/HIUolCH
         L8zGUzDMXbhYg2DeiNmlagAP8+wcqxvvgLclKPOgdN+0F10rz0HB/akSafkJeV4UjImf
         30SZmt93cJ1I7kKeENGxtJBhPnQr1BEqPTAe/63r5CIQ1u93UM7jEDURWE/aRUm585Cu
         5Kty0ViFau9X8TejODst19TEgo7K5KKFhuitDLub7l5w7TDqec5BqmQne6eSB/qsls01
         uK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727150; x=1731331950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBItirLg5Oir0h+eEpcfLT0BceEfQcKCnavoc0LgXGQ=;
        b=EA6HOEKC0b7BoVz4U/N3g//h7v8H+7eADVRkSSWUb/KHfh+/L7de9ZKWCXbtUhulMv
         xEJ1gHTgFQ7MPW4J4cu6OJ3Rh9WjA83FEW53eUdnkUBOeDOca6qQMW3dUG4PUtrocnzr
         mdjNSBqScgnrG3hCU8qb9i2u8fqgk813eOLg5IcegvOtDX44Ou5jB055vn4nLVN24ucO
         VlDLltcv9K6fh6jmQk25jxSSMIK0bs4xA0RTcdYNXN6g6pi7glv5WObdcNsmAV6EGkgu
         4puDDMxARZ/8zFGgT1eL7Ltudw5X4f3ioqEdvfWY26ofi6p7ZXrvmYcHb03MyfIa3JlJ
         Evnw==
X-Forwarded-Encrypted: i=1; AJvYcCXE5OIrJdYhCwFgZDkTIWhXk/JdKkizNX8w/rmpBypQ2PMeeinf6JOIZUQSzz53FVhtN1DEbtJp9kRGxqYyrgjl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt08w9xQB6sGcnxZuiZ0eZ7J9N9uUMLdlMvaUfNdy2Ef9J++04
	a4gkI9orKjjNCVMS4vVuvxiw4bNEjE2ctNVr0FPhrBJoObEGXkWPptpCi8biChVRZ08KS9a1mvm
	xMFUAnw==
X-Google-Smtp-Source: AGHT+IFvrgh3CVf1TWze2me+UFlYP3CJE1J8M2LCwjOfq5XmD1MuK3gwOqhUj0cOzAZs1ZrUlVldZRwY5pmA
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a25:2bc9:0:b0:e27:3e6a:345 with SMTP id
 3f1490d57ef6-e33026dcafemr8506276.10.1730727149901; Mon, 04 Nov 2024 05:32:29
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:55 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-10-qperret@google.com>
Subject: [PATCH 09/18] KVM: arm64: Introduce {get,put}_pkvm_hyp_vm() helpers
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
X-CRM114-CacheID: sfid-20241104_053231_641555_EA151F68 
X-CRM114-Status: GOOD (  10.55  )
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

In preparation for accessing pkvm_hyp_vm structures at EL2 in a context
where we can't always expect a vCPU to be loaded (e.g. MMU notifiers),
introduce get/put helpers to gettemporary references to hyp VMs from
any context.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 6940eb171a52..be52c5b15e21 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -77,4 +77,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void);
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
+
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 9ed2b8a63371..d242da1ec56a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -317,6 +317,26 @@ struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
 	return __this_cpu_read(loaded_hyp_vcpu);
 }
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+
+	hyp_spin_lock(&vm_table_lock);
+	hyp_vm = get_vm_by_handle(handle);
+	if (hyp_vm)
+		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+
+	return hyp_vm;
+}
+
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
+{
+	hyp_spin_lock(&vm_table_lock);
+	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+}
+
 static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
 {
 	if (host_vcpu)
-- 
2.47.0.163.g1226f6d8fa-goog


