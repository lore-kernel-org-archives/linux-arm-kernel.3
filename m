Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEE6D41C26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcRdDF/JGouVFt3/hu1n8HoEXy2nZFfL1yfhHE+a+Gw=; b=FxuNG5/d1+hiduXxZ5ujEK/twH
	/biYrM8qynI/27kp4jkGH0VYgYR5WYCbkDxpr3Zmqbpqj0ICR9qLMBJNLAvgGrrqlFdGyiC6xz+Dz
	FSpLfdHX6tCCx3xMAXf+vTsRUo1cNzmfQC6AUi3lsSKdb/hYGiXbAOWB9kr/Dfw9D7wW0QXVAFT7p
	33pinaky22Ic/enfzceCh1ubUyTRikgWadl1l/dWn0gLwXedPvsNBkREQw6KzxOnpp2KLly9XFgbl
	caODUeTQLyFb3CWjgHgGLoW/8KmiLp65thldi9vmLan1uhM7aWj/n72d7GsRaGZpDpyRjixl6DiUp
	vFrevV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0G-0000000GYAd-345t;
	Thu, 11 Dec 2025 11:38:37 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0C-0000000GY81-2XNp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:38:33 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso6679085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765453110; x=1766057910; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcRdDF/JGouVFt3/hu1n8HoEXy2nZFfL1yfhHE+a+Gw=;
        b=xZJAlOAPtA+pgrTxdJ22wti3JT7gEEGuCNd7zFFWPRVxBgJiMFS2UpS0boauE/7DzH
         bzeRcLbgnibAgOBO+6mA2ioVY2VhPbRQ+eezcJGgJsaIyppsD7cWnZawAaos3Qm4FKIY
         lzhWdExubVgaI4om1BNI6Ig8bld2NQzwinQchl0PvfNkLBDsmjexpISBLKJyz04n8lSJ
         bcUqAF7HBz9Z3wJVGqSPWVfmmuBxoblPjp7UTiHyNEhqNditisx7M/ZC8gKBV9VM6par
         AXd2x5nfmHwDl3hGs80NH+wXBgdcFfAzFD4wGKgnhJZ/uiqPBtKX4j8RcKKu6ni60e7P
         Es9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453110; x=1766057910;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcRdDF/JGouVFt3/hu1n8HoEXy2nZFfL1yfhHE+a+Gw=;
        b=P1Q00gqzXP1I0OPjoPS32Z+ZRvHivkX2F63HybXJhmHeTiPHCa2ATzp/hawekzcCkI
         WVfMV5KWYJ7pJSYGRmWAB7UB2MVhS4oEPvAM391zdLeHvp9ByVKH7es9tL3LBxi+nLB5
         UerdcAEXwq7zoZ7ks1S/xYcxOkBj/NV/hp832o1ZB6cS3a6g7XgaTEsg2K860NflB5mu
         /62ARDW92CJsnG/a4qMOodOByiPaBpsVhfmU4s8u9hJVfO5ZHA6l12oLqT8r1R4UuhTx
         Um1zqgLP85tYeWN7WpclKoOGcsAuyRidToqeobMWvihcihc1cjiIA6JTlw9Apl7ko2HV
         yWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6MhKvf/DQQBWmxtJwAxGZnNL07I/NyWKK6irGdnifLCqf/8Iv1J9NJvHJcx/LUZnv7pPC6/vgwpkibLBYqeSD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7wFCjLaEaQdCpIjsv+bS1GP1r15uVKJ5W+zBl1XzdlZPmsBn7
	8njqLZJfzNk0zHjbFrRDgJwAZKkd67tnORXUfsI5HCTmqt48lFixKenxmWTHi/MjgBQpb57nzfu
	3/w==
X-Google-Smtp-Source: AGHT+IEXP199c0OfjJCPkUfufV8iONK1QKNXqhB6nNKq41PANPaUQSofuGGpisFKi1nFzFQZ/XuatPAPIw==
X-Received: from wmbhi3.prod.google.com ([2002:a05:600c:5343:b0:477:c551:bdb9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548f:b0:477:b0b9:3131
 with SMTP id 5b1f17b1804b1-47a83745633mr60726405e9.8.1765453110322; Thu, 11
 Dec 2025 03:38:30 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:24 +0000
In-Reply-To: <20251211113828.370370-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211113828.370370-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211113828.370370-2-tabba@google.com>
Subject: [PATCH v2 1/5] arm64: Remove dead code resetting HCR_EL2 for pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033832_649463_37B905A1 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

The pKVM lifecycle does not support tearing down the hypervisor and
returning to the hyp stub once initialized. The transition to protected
mode is one-way.

Consequently, the code path in hyp-init.S responsible for resetting
EL2 registers (triggered by kexec or hibernation) is unreachable in
protected mode.

Remove the dead code handling HCR_EL2 reset for
ARM64_KVM_PROTECTED_MODE.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index aada42522e7b..0d42eedc7167 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -260,11 +260,6 @@ reset:
 	msr	sctlr_el2, x5
 	isb
 
-alternative_if ARM64_KVM_PROTECTED_MODE
-	mov_q	x5, HCR_HOST_NVHE_FLAGS
-	msr_hcr_el2 x5
-alternative_else_nop_endif
-
 	/* Install stub vectors */
 	adr_l	x5, __hyp_stub_vectors
 	msr	vbar_el2, x5
-- 
2.52.0.223.gf5cc29aaa4-goog


