Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFEFCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7NC/pwDsi12NprNlnn8EP1++3buNk7W62sBVMqd9ZEo=; b=UFlD24z1IDSWf6S4Bzw0NhtsFy
	KEkcXgiU5DUO2oFoJ52FVHugM9E0wy199/x+6lDjjxK2BcbQmhMumaeO7o4EdHGHdNAnxzwg3ugPR
	Lm497wfVoG7gxKcvWq5HdgIkdX7XE5bPXAveE9TBZUKamHcmVxpC38vMTLYjtuT2zPqYyteXfuULx
	OyQYn+y5UF4+HCXZRz/l9Vv57LjDVHp5RW34268m28NKwjQIWD0j7znkdKy4UVBuTfQp9CVCUkEwa
	ZHTpnJ+4J9W5TSw2BYCuKJJ0E+UXr1c1d6bx8aJoEWNyxNpOqi9lh4xhl7lvZ+jOuq5O1zEi0ybfb
	6Re8ZUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPp5i-00000005wBd-1k0w;
	Wed, 20 May 2026 22:08:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPp5f-00000005wBC-3kup
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:08:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fe44ce385so43052325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779314914; x=1779919714; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7NC/pwDsi12NprNlnn8EP1++3buNk7W62sBVMqd9ZEo=;
        b=wQgkJBp2GSgVZJJiFlhUjLJIIzBm/jfT4FSI8rsdDxrgbRURmYcXzgAIrGmxTZEIYC
         hgJGI4gPGQCQvAXZgu78feZ7iyQ5I1gclmBkt0R4TxqThvtcM1/9R37hwjpiA5UW2Kop
         KSE18Pe2jygwRkWCxXnQ0ma1uRmo6X/dSJ2IYNKbCJOfcbbXGsIU9MZEnXER89hi/0Yc
         GCSvFdtXcki9ysdvwwDufSJXxGCSu8PM18tXNFIzxESYGMTD2VMcU0q4lbiIbo2s5r2B
         NcSDUkmW7eNdSM3ottn6zPjSVB4v4oLtqTRVNyUC/gXfV81WX2qXuFFIjenw1VZbqPSA
         CCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314914; x=1779919714;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NC/pwDsi12NprNlnn8EP1++3buNk7W62sBVMqd9ZEo=;
        b=sgDG/uL8HC670kURFGNCfvQXKaOK7E8e+RSGNhWPt33L/zcZ1l4EKFnlsEfnd0uRCY
         bIYsP0TLy7MJBc0nIOLO3c+0LimcwufBu6wRQ7omI0zpyrci9FPIgL4eTIhldEdmf0s3
         oRCIhdSnY35YxP2P8PNEgykalFElWU4ChBAZJlidedLRiPHiC5gZtjpRM64fkc4/AEdd
         c1ZWIsRxJNbq95LlKoTZp3eLnkOMIRWwE6mxWRS1PDdGADMWMz/nVlMHPEma4ANYeMV9
         2QJtO4gTz9x9YVyl88zdW/a7SE8v+DJ0CVN3JpVGUk3zIRGpSXOoPFPZrQRKD8+gvYUa
         akgw==
X-Gm-Message-State: AOJu0YwDmbtwV2EkYebQHEhuYkiJyCufnj4HJu8YAP02iNkUe6mzOZSH
	qRN7v58gwQwFTMBxP8HUPgUlW8sRwcXR4j4iqu9WxXkDip/V+Y9B4y/1MN4WSwv2u25yUlpahfV
	l4pxEyFbXMtT267Jp+NFz8g==
X-Received: from wmsk23-n1.prod.google.com ([2002:a05:600d:8497:10b0:48f:dc9f:6f14])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:848a:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-4903609d60amr2113425e9.19.1779314913611;
 Wed, 20 May 2026 15:08:33 -0700 (PDT)
Date: Wed, 20 May 2026 23:08:30 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260520220830.273289-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Fix CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_150835_941119_CB8E3D81 
X-CRM114-Status: UNSURE (   6.64  )
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

A typo in the config guard in __hyp_do_panic broke the stage-2 disabling
and made backtraces for pKVM quite unreliable.

Fix that typo.

Fixes: 9019e82c7e46 ("KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index f337770ec459..9393fe3ea6a1 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -120,7 +120,7 @@ SYM_FUNC_START(__hyp_do_panic)
 
 	mov	x29, x0
 
-#ifdef PKVM_DISABLE_STAGE2_ON_PANIC
+#ifdef CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC
 	/* Ensure host stage-2 is disabled */
 	mrs	x0, hcr_el2
 	bic	x0, x0, #HCR_VM

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


