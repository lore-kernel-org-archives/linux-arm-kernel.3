Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF87CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s2JIhr6kqeQn6ELJOtjE/E16B/iQOXIXCDrOzxfZKEc=; b=t8i3Gvzo9hM9az41pRd0pAw6s4
	+Sz2yCrKfgs1U1YZpaevXRLaX0Hfj3ZTy/xc79uzogYl4v6YbbNRjFjC6X8mP62XIiCUim+VeJVbj
	jlGudSeuwjsrkVebVvYJbKwm95smkNKOCTSq/yuIFcESu/JMQtHZYY7vF65tsJewf30sbMfW5nZaU
	vfeZwUZ00gY1MVig91t6gdGYWqXgiaW/hyAxy30u8dAkk0VuABalcF1msiJcZnt+a+Lcr0XmkACJ5
	zBnFskDpeCJ1t2E6yEtX2436e/Zvqvl+ceA6XpX3UwrvR7qAFnZdafYzgfg42fk7atcPLeclqrnS2
	XMWXOIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPi-0000000EsQP-25ch;
	Wed, 03 Jun 2026 11:05:34 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPg-0000000EsPS-1t3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:05:33 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b56bf7bcso9565575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780484730; x=1781089530; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2JIhr6kqeQn6ELJOtjE/E16B/iQOXIXCDrOzxfZKEc=;
        b=EqEeYGOC8nWlVQfjZWEl8euB8em+znFVe47SGgNb0Afm0eBZPPU6uy7HwDhFRrfLsu
         VfqV/rbnVDByGZj8Aa3zlcsTg0eM127HAoXJEhozyk9U8JGuFcwN9sfIa9K9h8YXLEmH
         xa6G8WaPnkCi+Fc6dMbArklnnvyLfChzgFgzC3axZM2f9c5kQbIkhNk+BeRf02UyeLaz
         5P5kjlWZB9h92pKBlVGNjLpEBW349tJyRgmJJxy51Vjw0e70RfOxGYZJ5cL9Y3495uH+
         XTOq/dbtZp5rGqFynT1DkcAIBrgu4F9e1l8iJb26hxt7lLZsQqsOicm6UEvakMV2d3sB
         qU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484730; x=1781089530;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2JIhr6kqeQn6ELJOtjE/E16B/iQOXIXCDrOzxfZKEc=;
        b=YbXRgzYSm1tml4sX4VZirRb9Bq4Z1B0v4aO+tDtg7EgNaICB/5/X4FnzpGdd9TLJdU
         3CNciM3nmOyNpW8UjyBOog253Fd7NT0raYIsD0NarmiWqtfdyiSRmH6L5FHpXl1PNKJg
         ppDAS7+wEO4+ErYie1Gm1RePGYfuxOQzGR50PCVl1108YUa8QsC3J9JD1ltGLu3m5wPT
         mcp9mfrEIDQSzQOctgBme5QKtiMolaWouH9usH23jdbJNAoLGrNvuVboxx3NVnpwRQWJ
         jFB6vAF23wd0sNTJnOnGkZLMzl2OHAt/MSofaiA3MsBLh5eZKJNGzlW+qJAna4PqA0I2
         81nQ==
X-Gm-Message-State: AOJu0Yx/jfAgwbEuOy7gqc+ekBGDaXh5NqiTsUxR1GDEQQNOj7iIQMSo
	jAtE2nnXuyib6JNY9CDVry9mp/aKuJ4lsRo10Qoesu7IILHSK8lanHfc/qAUB5tXPzrgaTjVlXz
	mK/ohmBNqu2Jrxgsuic+5XE2M12A3MTHPMKcdZXAOClhVP0wQhJRi8NAWK71ZFiMAu9V0nYFfXN
	XgV9+76+uPpbydUMkc9B3HyZ763TewctTk77OltUqnPyqXNvi6VPkonnOmsXO9BQfHyg==
X-Received: from wmbjd23.prod.google.com ([2002:a05:600c:68d7:b0:490:af61:3390])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a16:20b0:490:6869:7d8b with SMTP id 5b1f17b1804b1-490b5e8f064mr34662755e9.15.1780484729649;
 Wed, 03 Jun 2026 04:05:29 -0700 (PDT)
Date: Wed,  3 Jun 2026 11:05:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260603110522.3331819-1-smostafa@google.com>
Subject: [PATCH 0/3] arm64/coco: Convert pKVM to a CC platform
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org, 
	rppt@kernel.org, maz@kernel.org, aneesh.kumar@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040532_501787_637D788E 
X-CRM114-Status: GOOD (  10.14  )
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

The goal of series is to convert pKVM as a CC platform similar to
ARM CCA, that makes CC guests consistently discovered which avoid
breaking it by the ongoing DMA rework [1]

The first patch is a minor clean up I noticed while reading the code.

And the second patch is a bug fix found by Sashiko.

The third patch is the main one.

[1]https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/

Mostafa Saleh (3):
  arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
  drivers/virt: pkvm: Fix end calculation in mmio_guard_ioremap_hook()
  arm64/coco: Add pKVM as a CC platform

 arch/arm64/include/asm/hypervisor.h           | 13 ++++++++++
 arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
 arch/arm64/kernel/rsi.c                       | 12 ---------
 arch/arm64/mm/init.c                          | 26 +++++++++++++------
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  5 +++-
 5 files changed, 37 insertions(+), 22 deletions(-)

-- 
2.54.0.1032.g2f8565e1d1-goog


