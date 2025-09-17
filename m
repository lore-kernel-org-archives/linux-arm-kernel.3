Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0286CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8nMbtF83ZYtz2l9mfpcIZhhnstM4fj0En2ikZPXdwXw=; b=xy97s2B4SD2n2TWaSQuBGHLDCe
	mkl/FBxsayTEdCC1t5k45awOQrj66DvFzJPQPLCAzMX402MeTRES85TRFgLFCOAJVd7wzP5BKYQ/u
	zMdo61un9aXpQM3e8KnIaGJ6exXxvO3rNlqKHm6jFuoIuJeIskkxpva3yOubHPar1kN5FaUHSZSwT
	hYLxdhXRkHwb1aKfI4crN0p98qyeQ/N0/mBi9NrCEzzC37F5RgI+mUXwhtR24YVOpK0zU1eAIppsW
	hbk6EPFfVmIBAiWJWb8w0BK2LZY0yEKQOZQrKhgsIYNiLXF/9ZupeYYYKYz1zKye+09MKa4S4SQUV
	ARdgxq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrsu-0000000BXzD-0dJu;
	Wed, 17 Sep 2025 13:07:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrsr-0000000BXuk-0DWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:07:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45ceeae0513so41459945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758114459; x=1758719259; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8nMbtF83ZYtz2l9mfpcIZhhnstM4fj0En2ikZPXdwXw=;
        b=Vmfw3D6BlIUhYXMN2WH9OObConPEvLpw3lXmBhzV3emLf6Rzu+ZxoOwkR59Ehc+kx8
         NXt48SvklGtUYmeznEHHsGQoIY/TbwR7ovv0/oMstDpOEIuCQecRQcHHmF/sSSoN1b3E
         WLpW39DsytwVcTsjVhywGIuqTQmeV0BO+E4jbLIgzPS7QwNElAeVTy/iQyAUA0GuynkK
         PaYC/RNtfdcGTfCw73zOX48dm0Xi967MPxeFVzW2WVeAFBQBGtW1WbTIpilFDZMmHhLQ
         CnuayRIqQVzrZeOcR0OhXpkgG0G5h5e4qWiGVDB4ZhrfU2s2w240PbYlv/kJrNptMVrK
         aPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758114459; x=1758719259;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nMbtF83ZYtz2l9mfpcIZhhnstM4fj0En2ikZPXdwXw=;
        b=LwBUxHnWfZ1tNGYMEGoSfSm2FKdu27SvyteMt2+1ErJhMpj68lUD37eSgKYhhuEDVJ
         q05miRSQxxZUJ2PX5y6NpfwrcSIuizZqMYLZdcLbOX623jCtaZtBwK/LytGIcj4ThmhM
         mXtIOJEeL8zsF0j2V32xBcIek0sqdg7z8WcrII8tevHKG8PTA6Za0Bug/nWzNtsgqWik
         v4yduzfYnZvtUDX5WGKkqkyNlnWhYtW1LIOEWlzJ6KqFzroz2xihgwn5vlifhWqRj2mJ
         6EOI65mIiC07dhwTjevgLBqSiUaesADearOhOfcUuFgbZS8eGLVQxaQlLXp4wBrkFtZf
         OZIg==
X-Forwarded-Encrypted: i=1; AJvYcCUO5ZkCyzVrK6BN9EEdNcvrQoxZsDxy+rAJS1X02neSLFViohHij90i0ZcvqUoLcf6Ob6LGG7k5xhFCMic4KBTR@lists.infradead.org
X-Gm-Message-State: AOJu0YyXPJkAsEFeOwW6oQ7qEVdHD0hh7+U6NifnjNLCr66oPb35wEBW
	WorBWmfvgUpTAJnyP9CFzG2UoLzaUefP6Y0JA+SAFVUabybCuiyZ3XKPubww/EQE5VpLEbzKWnh
	c+g==
X-Google-Smtp-Source: AGHT+IHWGmjnQP9pG3qanj1Q5J98tdnrDnaB3XFkq7Nm5Anu//i+9DZtynKA62hFBPQHVSIzroNa5bSyaA==
X-Received: from wmpl42.prod.google.com ([2002:a05:600c:8aa:b0:45d:e45e:96aa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b8a:b0:45d:d50d:c0db
 with SMTP id 5b1f17b1804b1-46202de09d9mr21103345e9.15.1758114458792; Wed, 17
 Sep 2025 06:07:38 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:07:37 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917130737.2139403-1-tabba@google.com>
Subject: [PATCH v1] KVM: arm64: Fix page leak in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, ankita@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_060741_120207_A91A76FE 
X-CRM114-Status: GOOD (  12.86  )
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

The user_mem_abort() function acquires a page reference via
__kvm_faultin_pfn() early in its execution. However, the subsequent
checks for mismatched attributes between stage 1 and stage 2 mappings
would return an error code directly, bypassing the corresponding page
release.

Fix this by storing the error and releasing the unused page before
returning the error.

Fixes: 6d674e28f642 ("KVM: arm/arm64: Properly handle faulting of device mappings")
Fixes: 2a8dfab26677 ("KVM: arm64: Block cacheable PFNMAP mapping")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
Based on Linux 6.17-rc6
---
 arch/arm64/kvm/mmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 86f3d80daf37..d57afca8afb4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1706,7 +1706,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			 * cache maintenance.
 			 */
 			if (!kvm_supports_cacheable_pfnmap())
-				return -EFAULT;
+				ret = -EFAULT;
 		} else {
 			/*
 			 * If the page was identified as device early by looking at
@@ -1729,7 +1729,12 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 	if (exec_fault && s2_force_noncacheable)
-		return -ENOEXEC;
+		ret = -ENOEXEC;
+
+	if (ret) {
+		kvm_release_page_unused(page);
+		return ret;
+	}
 
 	/*
 	 * Potentially reduce shadow S2 permissions to match the guest's own

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
-- 
2.51.0.384.g4c02a37b29-goog


