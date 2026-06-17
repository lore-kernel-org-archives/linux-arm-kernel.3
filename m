Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E1CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qjkZjhMKdgVqRMkCoanmUdUt3sYnMDgOICyf5NDOycQ=; b=4Pw8aOfqyfZyhPS0neDMMRXbVh
	F2pptLAUbEf49fStVGcIWJjCQt1AG24LUOf7PJvHqnl4QDZnE32zSpwpmCQycR75bwQRiVVVyrl69
	dtAmZJv9HjWJHeQGYUr9zfNLHa4vBWWv8CIbkzHlyhK511YrijpxRxQHPWOKotflr/++i6mlLtRiZ
	pKLLWLf1VG19U5vkeHfT27Nz3YScxxqnWgbRjiQ2s5O6iw5hEXKOPolAjOp1Jbiy52uKJ2RXJZSvD
	upe1fLCVN1LhDl/PinlIglPLF6GM8Y0qoXrcFZZOHeXTgK+i9gsdt9GcVEaIntn6q5BGgpbjAif5Z
	w5LXMdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZq4Q-0000000HOvK-1kMI;
	Wed, 17 Jun 2026 13:12:42 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZq4O-0000000HOv1-1aHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:12:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4923411f041so9469085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781701958; x=1782306758; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qjkZjhMKdgVqRMkCoanmUdUt3sYnMDgOICyf5NDOycQ=;
        b=RMb6eEAugh9GoVrVVXILBVJNYMf7MJsEUUqdTwIEACLAmnwOKrM8cFEWqNAkCbGITv
         B8FR6sewliYY0CuNFTeP9uBoXuuFkBduUdSfSuIKTARYPNTDYztF7td44n4prSW4e50m
         snqFqAtlSAcBhR5HIf8gsMi1nvXfr9YigQpUgxFgj9YmaHLAaRF19eYttGt9NXEOiRgE
         wuQbevG4+yeLS/eiWEOqDxv9LMEmL2xMVU2gkUhXq7SecGVHJnJ44ppmwJM2QrzeNTOK
         3PSUNsj965fSIq8X65lkqTTjTJwwnAiCOrf34UUwrU0rdiBXs6bwh+Rngg/l0SfljZPW
         v3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701958; x=1782306758;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjkZjhMKdgVqRMkCoanmUdUt3sYnMDgOICyf5NDOycQ=;
        b=JrhLzA7RwBZC9z0ya/37dztF/oMcrtoBIRWD1rtZPo+AHQ0mUMHukDx052F8o4hjDT
         wmH8+7kdZbX1df0YO13aZHmOf8c3GJ92Aj83KqtrSlEoFjexnPNGPrPtMDQWl4FchtO1
         XaMA1A11j0WjylKtZIdGs8oObcCc8jWbQYEFDo0xTlPODez7zFH8N3f4ldSVHvrwsY22
         yIKCkepfUnFnUk8M1zfPR5a71M1yEOC+xKxlcRp0MeSx0RE1Ysvo9FZHUZhP+9qit3nO
         MVjwLkU6hnrZv8inUVSuCBHdy+O5Lyj8RMF+kYT8geOyYsDTthcmeb9b0IyU3WDd2UYl
         3bZA==
X-Forwarded-Encrypted: i=1; AFNElJ+EFsSF8NCl5RPIfzGGeA8YWmZEZM1ZXKPmL2jBbnifgfVlskrLOBgDzitQ+ZaFxmdhBYpaWWwmx1a/FjlLe5oG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy36OzsSZJs2k3PQZB05sG1bL+4oBezxBCpmwYHxLHdR1d/BgXn
	x1Gsg+5/mDRC7L7SBTqf0ekBX9fs4B3OvQXh2dF7gHI7N0cDOyW5dI9VogPYASDTCPaM5CysBSP
	exA==
X-Received: from wmsk20-n2.prod.google.com ([2002:a05:600d:8494:20b0:490:b475:af3a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c8:b0:48f:d1b8:9ab1
 with SMTP id 5b1f17b1804b1-492333aa56fmr66371605e9.9.1781701957711; Wed, 17
 Jun 2026 06:12:37 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:12:36 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617131237.2842619-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: Add Fuad Tabba as a reviewer
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_061240_419716_6CAF7BC4 
X-CRM114-Status: UNSURE (   8.87  )
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

I have been working on KVM/arm64 for a couple of years, mostly on
pKVM, and am currently upstreaming protected guest support, with more
to come later. I already review KVM/arm64 patches more broadly, and
am happy to continue doing so in an official capacity.

Add myself to the KVM/arm64 reviewer list.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..61eb5dc2bd03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13991,6 +13991,7 @@ F:	virt/kvm/*
 KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
 M:	Marc Zyngier <maz@kernel.org>
 M:	Oliver Upton <oupton@kernel.org>
+R:	Fuad Tabba <tabba@google.com>
 R:	Joey Gouly <joey.gouly@arm.com>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
 R:	Zenghui Yu <yuzenghui@huawei.com>
-- 
2.54.0.1136.gdb2ca164c4-goog


