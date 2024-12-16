Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6EFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9lkhbZv94nQzAEPru091ExF96XSPssPaswLVu4E+ps=; b=zVsz7s8vNKYLsNnJXNd1p+WaKZ
	xAO6/PIuPEf2SL441rKveoqVdWZHOPqcLk7KGRsc5imewrW+o80KQCFxC19csc6ZB2n8BVhAquhfT
	pWKs82fzic6t05K58eEJQcjvztlvXxwNJODe5KklxnxkxZ6GuS5oxPzPcwtuwgal9QHqjtoI1EhzW
	FWb6zgpfHBqlym+lTdxBmTSoxivJvSfrax4VIXAqaY5czma1FUIqBDiS/jQ16CPHwltsw7V31qEj3
	ef/UofusctgQWql2kaImIhgQ3Tr4xF+w1y9jIblnS88OTKQsQSiE47m7vX6VaweVgHAW2vcCqcbld
	SAB5pnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8xj-00000009mcp-0kYb;
	Mon, 16 Dec 2024 11:08:31 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8hH-00000009k2N-10cR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so36767655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346289; x=1734951089; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9lkhbZv94nQzAEPru091ExF96XSPssPaswLVu4E+ps=;
        b=A17PNrlhsRh//dji6pDlNtHOFEbfJiDDL4ZsSXwIptxz9tnL8Y+G2zM0C1qCUx//KH
         iy9L6NsVM9qJ3r/KFrndeXaTN3UNBVD9fAt5UnSSL9O20TXoh2PWbfwT4Scnq32Y6hn3
         Sg0B6KN+ZpGUNTTVKZAyk19CuuRRHs6sVfFrtJxTLDpYYpy+PmouK150Y8bVo4sYQPDs
         lDeVn1+YyS3dhUAH6K7Aa1ydVAQFzp/PHCIr99Rfgz97RgC2vg7T9sF9VBhTgzGNzP8A
         5bj4/MQV611NWOgXvPoUZ+ISSpKb6IC9FQTNyCMm1tV5kskQmBpPFO5WA0HCF0agjTP6
         XyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346289; x=1734951089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9lkhbZv94nQzAEPru091ExF96XSPssPaswLVu4E+ps=;
        b=D4ljx4oSBLAmUPd+sq0k4STl+r8F7LErIbQQ1vZ74QZljZSc1mbb16IoGBuZIb2Rcm
         oKsaE28fwtSQoXAuL3vINiDPcymWjyw1M/QlThMFTRCu4NpBiqqADL6CJ9GPZyd+00En
         kyvV6JoEkkh3wofq6PIhlFbxWsSQ1IPzUQZbM2z8s4jy+kD6RQdtVgg5hipRwOZo8B+k
         DbCczps9rA8TTKXD+7fHL0K+hwSnT0PD1AzHgovPw+TYkP8EA8VL1gf2D0lBRk6jVQn9
         gXasurahXkOgOLCk1E46yPyP0qylwSBEeTy3BvWJLclAfS3Rz22G6ylNDRPiYej90ZZn
         s+lg==
X-Forwarded-Encrypted: i=1; AJvYcCVYD8WubodyZ/wP+7cWau9sCNBMbPHO9uqGzSKqVTDsN+DpideAr+pfVG0WVmIU5TqHbUQ8BMItkOmQT1qBi/AL@lists.infradead.org
X-Gm-Message-State: AOJu0YyUqYiLf8ZKLXJoIweH+cKdyDIdWVEPKiDKjW/8R9VcBTnXnRkN
	yJ7PqfGkCFelb/1iodcBVybimpTXt1GL7i5eYWYJLZjTD+8vdZ1POzUHDSxCpox745xV444tPg=
	=
X-Google-Smtp-Source: AGHT+IESyDEBagJjrpkm2+JYqdqxE5fOYGYPEc2dByMrXgiPzaaS7F/bOwkNg3P5spfnL0ck9YqBisGzEw==
X-Received: from wmna1.prod.google.com ([2002:a05:600c:681:b0:434:a2a5:1fb5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:524c:b0:436:2238:97f6
 with SMTP id 5b1f17b1804b1-4362aa1af5emr93349025e9.1.1734346289797; Mon, 16
 Dec 2024 02:51:29 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:55 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-16-tabba@google.com>
Subject: [PATCH v5 15/17] KVM: arm64: Remove PtrAuth guest vcpu flag
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025131_276761_DC3627DA 
X-CRM114-Status: GOOD (  13.30  )
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

The vcpu flag GUEST_HAS_PTRAUTH is always associated with the
vcpu PtrAuth features, which are defined per vm rather than per
vcpu.

Remove the flag, and replace it with checks for the features
instead.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  5 -----
 arch/arm64/include/asm/kvm_host.h    |  7 +++----
 arch/arm64/kvm/hyp/nvhe/pkvm.c       | 13 -------------
 arch/arm64/kvm/reset.c               |  4 ----
 4 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 6602a4c091ac..406e99a452bf 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -691,9 +691,4 @@ static inline bool guest_hyp_sve_traps_enabled(const struct kvm_vcpu *vcpu)
 {
 	return __guest_hyp_cptr_xen_trap_enabled(vcpu, ZEN);
 }
-
-static inline void kvm_vcpu_enable_ptrauth(struct kvm_vcpu *vcpu)
-{
-	vcpu_set_flag(vcpu, GUEST_HAS_PTRAUTH);
-}
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 69cb88c9ce3e..e6be8fe6627a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -866,10 +866,8 @@ struct kvm_vcpu_arch {
 #define GUEST_HAS_SVE		__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
 #define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
-/* PTRAUTH exposed to guest */
-#define GUEST_HAS_PTRAUTH	__vcpu_single_flag(cflags, BIT(2))
 /* KVM_ARM_VCPU_INIT completed */
-#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(3))
+#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(2))
 
 /* Exception pending */
 #define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
@@ -965,7 +963,8 @@ struct kvm_vcpu_arch {
 #define vcpu_has_ptrauth(vcpu)						\
 	((cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH) ||		\
 	  cpus_have_final_cap(ARM64_HAS_GENERIC_AUTH)) &&		\
-	  vcpu_get_flag(vcpu, GUEST_HAS_PTRAUTH))
+	 (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||       \
+	  vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
 #else
 #define vcpu_has_ptrauth(vcpu)		false
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 956385ee4aa2..b399d69b4b67 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -278,18 +278,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
 }
 
-static void pkvm_vcpu_init_ptrauth(struct pkvm_hyp_vcpu *hyp_vcpu)
-{
-	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
-
-	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||
-	    vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC)) {
-		kvm_vcpu_enable_ptrauth(vcpu);
-	} else {
-		vcpu_clear_flag(&hyp_vcpu->vcpu, GUEST_HAS_PTRAUTH);
-	}
-}
-
 static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
 {
 	if (host_vcpu)
@@ -359,7 +347,6 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 		goto done;
 
 	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
-	pkvm_vcpu_init_ptrauth(hyp_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 470524b31951..1cfab6a5d8a5 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -211,10 +211,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 		kvm_vcpu_reset_sve(vcpu);
 	}
 
-	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||
-	    vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC))
-		kvm_vcpu_enable_ptrauth(vcpu);
-
 	if (vcpu_el1_is_32bit(vcpu))
 		pstate = VCPU_RESET_PSTATE_SVC;
 	else if (vcpu_has_nv(vcpu))
-- 
2.47.1.613.gc27f4b7a9f-goog


