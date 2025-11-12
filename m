Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9989ACD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h9UV3nYWC6hYsHPBAX2lZPJFbMaZGkJN8sutubEAEQ=; b=UvxKU4uCh3aNjZljfH7LjxxWL2
	br7ZhQrFXfRAtKk0PIpBOQNwZPXC/dRFoDoFQj1wmT/kEF/69tLtce7H6s3wMpid60hgMSmACxB2t
	mtsZZnLHKanqXJPk7ojxee80LFOW03hFUeG7L3j9Axcn1TB85AFHL1pudH36ljVKmPvm1JgmqPXW8
	f6Q7B9t8OgzzOemDJ5kIqKvuhCCxUsTqdArX6n3i0Iwmfxa0jssEB8nvw6vgFrvM1L3al2YnljFWt
	MF/8e5L5dMhaYEJTIk7d2Du4tnh7FCk4S6g82edBESDRUIrN/+sjvG140TCazQ+pNm76X/9nZEa71
	0ELiAqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72C-00000008RrH-3Ec9;
	Wed, 12 Nov 2025 09:21:00 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ729-00000008Rnx-0z52
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:20:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4777b59119dso5171105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939255; x=1763544055; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7h9UV3nYWC6hYsHPBAX2lZPJFbMaZGkJN8sutubEAEQ=;
        b=oIlHOxFzJ/YM6si/Z+OX190hVPYpKOlQWfUh8A06j/L/ZIzt5zjL8bssnn6PRNiJ+v
         Y59SAL+XybnMmKhS9LYdaKU1PbCY8x9AgySpzrSQLOc6MotoNWtTwA+LrXmaM/FHvIOO
         EIx0xfAsLDtKjBfXv2R4CLp+Rb3JHUC8h8C9FsWaAt7E/dZFdFCb3cjCa00xagbTsp7e
         Vu80LLzJ6TLP4TcGIuuJzPWxE0/fbkbDbvI00VRnjhUpFa5k6gPchmneK+3KevWFVKfX
         Bd4Z8l7vm0NT0MGDU8hn6xY53nODGPLPRp+dVt49PDKyH+LUp7gRBGTtTKe/ZCcJL7EA
         4emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939255; x=1763544055;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7h9UV3nYWC6hYsHPBAX2lZPJFbMaZGkJN8sutubEAEQ=;
        b=CUf0V74sgF2A82F3yqX4uom1NSwoJx56clucQU5fq1s43kcVrIMD856zbi6unVlqO+
         UO8jodfRYZuQX2W+NoIwndO5tAbcV8lNDEvOiir1S01wOUceBy2XgI/HqqJdRxVVqe5q
         60I8t7mafXdayfbup8bGJgc3r9vlbYd25aWXaMV8pvz5bNmpnLP2i2lbm13FwhI2iRZe
         hbVb00N66H3PY7j5v6XH7LS7HNyFK24XKApoCKCbMpPVBW15KS2URjP5zKzTyKrpif8F
         gVctE/F/52IEXD0YPwGIQmWtE29tdbQcoU7x8JUscnqophN122tH88c4vdgSh2dcXpnF
         nEZA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/+eBIjRKMQa7U6/2aAVXS/twm72xTtqjbXoPXjVv/1cVvnVpen+5VgUWi13iu9krs6OXDCkEZ5sLsSZzADUk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo2pBeK3k8IiTxIGUejQE0JlSKOk0vUj8/ke2HUkSMaJw/8BdO
	oOjHAPKBGQXyylq6nvRrl8VqDq1YClYb/e1fxnSsYo94DHqlf1M3Sxy5C6n4Wvw9wj5TFr4bC4t
	NMw==
X-Google-Smtp-Source: AGHT+IF+dsx1c4LF0aiVAUBfRYuGGbYQKD+wAzOKX8ydw/hwxgLYI8Qn1guhrPUGrrVE73xmb603B6Usqg==
X-Received: from wmhf7.prod.google.com ([2002:a7b:cc07:0:b0:475:dc01:3dbb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3145:b0:477:76c2:49c9
 with SMTP id 5b1f17b1804b1-477870718cdmr21988195e9.2.1762939254762; Wed, 12
 Nov 2025 01:20:54 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:46 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-4-tabba@google.com>
Subject: [PATCH v4 3/8] KVM: arm64: Fix MTE flag initialization for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012057_291574_5915B053 
X-CRM114-Status: GOOD (  15.75  )
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

The function pkvm_init_features_from_host() initializes guest
features, propagating them from the host. The logic to propagate
KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
has a couple of issues.

First, the check was in the common path, before the divergence for
protected and non-protected VMs. For non-protected VMs, this was
unnecessary, as 'kvm->arch.flags' is completely overwritten by
host_arch_flags immediately after, which already contains the MTE flag.
For protected VMs, this was setting the flag even if the feature is not
allowed.

Second, the check was reading 'host_kvm->arch.flags' instead of using
the local 'host_arch_flags', which is read once from the host flags.

Fix these by moving the MTE flag check inside the protected-VM-only
path, checking if the feature is allowed, and changing it to use the
correct host_arch_flags local variable. This ensures non-protected VMs
get the flag via the bulk copy, and protected VMs get it via an explicit
check.

Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f6f8996c4f97..16d7bf493c18 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
-	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
-		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
-
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
 		hyp_vm->kvm.arch.flags = host_arch_flags;
@@ -354,6 +351,9 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		return;
 	}
 
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE))
+		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
+
 	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
 
 	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
-- 
2.51.2.1041.gc1ab5b90ca-goog


