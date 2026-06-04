Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69266CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j/oZhJVx107l//gullK2VkJorHFGxa6Du/1X7jFvu9o=; b=A8zLPpjJGANVUy8wA7JiREOwSV
	Yd/Rvg5Q2DxSlhkmQWdiZVUNvvakfXLMyNhN+0cPQV3FC7OEXjT7fvyHLwWjjfKx/jt9FRaVTcGI6
	L8kOwzd8EXWhQ3/dj50a8vLg9mR11wfGcPHKAD3uQ0W5sx+brWqsN4oiSG9od4tfuq5htae5k1cVM
	KQkb0B9Pur390S1FEMsh8elnIqbo80f3IcrZQ6FVprJzKdGMosuelOe3E2zqwnbR3+keCLOUmzZy4
	Z39Q6n8dn/VHRk3NtLH8Zax3LikNHQsubcK/KrXiQaAfFh/kH+vzczfqmOAAIECrc1tgFOlvUlNzL
	eRdYS3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k5-0000000GxxV-0vc7;
	Thu, 04 Jun 2026 15:12:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k2-0000000GxwV-29OU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:19 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b93debc8so7109505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780585936; x=1781190736; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j/oZhJVx107l//gullK2VkJorHFGxa6Du/1X7jFvu9o=;
        b=olc0TH3CysEEPgBNyiD4XYTb6HJbbs1sWi2TvYigy//dIzMkZCQuAkEUgwwBJ8mp7S
         4Kqbrdl6LL7L6ohLeUeUqYvgSUdIpERgi+v6GX2/ub6B1/v9qtypPvp69rzfpvXtimwz
         WP6QaNVRZQpSVKDCK97zGW3NBmVSKG1Vfi91If2u/E0i9AbPC5pug85Cd71RQGnXCFiZ
         zistcA5Y5FASWXy8bCLEYxPg8k5IOUGGwtYc6lR39Lebc0cr57crQ+cHzV8kj7X8iYlr
         f0bXx5BFlWekfv6mOMxhTUpGMnuyzloxh22iYNduGWVwmSIYy8C363q8HRj6+JMDbMfr
         9JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585936; x=1781190736;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/oZhJVx107l//gullK2VkJorHFGxa6Du/1X7jFvu9o=;
        b=UMpAnkXeXA6RN0u0uzTrKP8cU44kgNR/2F+ekCpWRJSrOKDawhOcd+R3P1jKUfHBs7
         K9QxOZ3qJzUVW/TPG26W2a3ZTgHbowOVsoB1h4fDg6eWy8o1oMeK6BBNBGKI7s5M954B
         TEPmE5/B6YVwzHQyipmJFPkCuc4bkSTMqF1Or1thcVxhSag17PBEXGHzDEhG47J6jFy3
         zsYVu8s7WOecT1kSBFxJIzPpryKZb0NNn9tROH96x1uB88KB61HmlQwfLd6TpA1FDblW
         qaFZUZ2qzPXIHMFMZAX6+UiR1ETfx35WrQJPeMdfjWQzHZ/MjKGtgAbukYXA4liQxZfK
         PS5Q==
X-Gm-Message-State: AOJu0YyHlzv9cR20B98COIPyQej71jyk2YzZSsr4GKYmjtSVqKXIU96F
	4oJpiz1jdI6JYY11Xaw4CMsa7raGFbvlw2J0KJ8jrp1ZgntFasndplxfFal7FzV/mPIB0LIW+WN
	j2oqseCUjuUJAqVyU/i75FzHC3JQwIgUSn0BGS6oXXkWWflEnwI/zlHa6Jh6lZ/zrOa/nueg3gO
	8U+N0BLX7J+vszjV8TKoE3U/JQIY8IY7hF+1VA4TOIUDRE
X-Received: from wrri18.prod.google.com ([2002:adf:fc12:0:b0:45e:f772:335c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b30:b0:48f:e26a:1744
 with SMTP id 5b1f17b1804b1-490b5eb4aeemr138962085e9.9.1780585935968; Thu, 04
 Jun 2026 08:12:15 -0700 (PDT)
Date: Thu,  4 Jun 2026 17:11:52 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=ardb@kernel.org;
 h=from:subject; bh=wxu2qKrIqHRRqwxiQshadwjn/FVZ9lSy+5Qx4CfSQS4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtx6g5e1p9FqYGFfB8zuza+XLx/VkbVy9LLulG5x65xz
 g6xXGzWUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSdYmR4VnTgWV39aPSTA7k
 qp6KqbLw+/M39d6fp7udZ/u3sek2lDL8M+cSOvRz3tUVggsEzptHMkeJpCmJmS1z5839scvf8Ek pJwA=
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604151151.150377-7-ardb+git@google.com>
Subject: [PATCH v2 0/5] fixes for data/bss linear alias unmap series
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_081218_562001_7330CF9B 
X-CRM114-Status: GOOD (  11.53  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Fixes for the data/bss linear alias unmap series:

- Fix KASAN related issue reported by Mark, by moving all KASAN page
  tables out of BSS [on arm64], not just the ones defined under
  arch/arm64

- Fix two issues spotted by Sashiko

- Fix the CKI reported WARN() splat on BBML2_NOABORT systems that try to
  split block mappings too early.

Changes since v1:

- Split .bss..pgtbl changes off into separate patch
- Take Catalin's suggestion on how to address MTE issue with the
  read-only zero page
- Improved commit logs

Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Ard Biesheuvel (5):
  arm64: Rename page table BSS section to .bss..pgtbl
  kasan: Move generic KASAN page tables out of BSS too
  arm64: Avoid double evaluation of __ptep_get()
  KVM: arm64: Omit tag sync on stage-2 mappings of the zero page
  arm64: mm: Defer remap of linear alias of data/bss

 arch/arm64/include/asm/linkage.h |  2 ++
 arch/arm64/include/asm/mmu.h     |  2 --
 arch/arm64/include/asm/pgtable.h |  4 ----
 arch/arm64/kernel/vmlinux.lds.S  |  8 ++++----
 arch/arm64/kvm/mmu.c             |  5 +++++
 arch/arm64/mm/fixmap.c           |  6 +++---
 arch/arm64/mm/kasan_init.c       |  2 +-
 arch/arm64/mm/mmu.c              | 20 +++++++++++++-------
 include/linux/linkage.h          |  4 ++++
 mm/kasan/init.c                  | 10 +++++-----
 10 files changed, 37 insertions(+), 26 deletions(-)


base-commit: 63e0b6a5b6934d6a919d1c65ea185303200a1874
-- 
2.54.0.1032.g2f8565e1d1-goog


