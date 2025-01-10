Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE83E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=216Hvw4Kr0N9yi9qygoM0UbLo+UOwuXQ6VgkiK1VAkE=; b=RCy4W/KGOTG22IVYTJSPJQBxCi
	uh4ODr9cfyu7We/s/z0FQjXUrSKtOmj/0I/09M+vZjEA/lD8hFO4BDABjAYjvUxWgjR+Z1LeTMhdd
	NSYfAYqRa2Efspig4LVZ196vwW0GFohH6ngAgzl7JWsJrWyLqFAvuuvviQqiySZWwSsDkR8tPjHIq
	nKQmrP0tipbxxBlKOboJz0He23zz0Kx36wquXN3Lqx/G2uCfDw6S090Zcx26KOJ5qTCFW/Q/QjmHd
	ETLfDL2SBakkIAWPXOQcAcwLOhDXkeBBSDdBlV5XhjCve+CRbvlxT2QFA/u1Gm6yLpsdKj32Ss1W9
	iGW/j/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKM2-0000000Gi8U-38zh;
	Fri, 10 Jan 2025 19:07:34 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJAo-0000000GUlO-0e24
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:51:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43619b135bcso11923685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 09:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736531511; x=1737136311; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=216Hvw4Kr0N9yi9qygoM0UbLo+UOwuXQ6VgkiK1VAkE=;
        b=MkCY+BOZQ1jT7Q2JMRP6F5qypjoMuuIbzhA0wLM74oJZ1vdo7SQyKns4p1fmhFCYcA
         8ARiCcPrIuTVgpRxUYHZWcPo6Wm2cKBhWYRHdEJgsUi1tmQM8nIT5NPIdj1gTHgq1N9A
         X+EGPArVpcevg2pWsnUm/+fH5LiOnX23T/IcZC7d+CMqKWTrJ/nrHhnDMRtp79amwoQZ
         B2MzsTBd+tGHwYc5h5KpdTmSlRhsd95DNkHJDRBJQKbTxTAfJasONrPYWpdYIsTiFi3k
         V5Jh3nbbWr5Hla5+2ptIIdPyepC21RlBAZe2Qzctah+vD/mdrHDffovSniUhpmSFSeha
         kl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531511; x=1737136311;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=216Hvw4Kr0N9yi9qygoM0UbLo+UOwuXQ6VgkiK1VAkE=;
        b=pxSx2i1PtImWyNflvQ7meFFHrVi43rUDNpJ8B8q76dnwdx/AA5q3k2qysIU7EhJDb2
         JRfdYPwQ79FwhzmkJCrl4tOwBQtpu05LD+5BUqgN6KgbDfNvqpXUcqbws4oGf6Y7OaH+
         pDPgZrZ4LoMpayvl043HEcuJPS1W2RXPviP+aFOA5Le31bKKOvC9NDFfsIin5Kn+53M+
         9X2Vzjng+3eedlwCOphq7SW6pFZwowOrvF4f0BYCyhKP7brM7I5BvwXmoirgbehVxSmz
         akr+4akj34PtH5lvvg/DdZAOQfDihICxXxVG3xVrFlEYEW12JQpWEaHX24xAbyv8nNiK
         vhpA==
X-Gm-Message-State: AOJu0YwADh+nh6xV33JIljsnDyo98ttYZ8iI7niQdyp+7UCzgkjCdISV
	ZThIXCi7GObGf2y5gimdHIFXFzESnG5pSIKc1ZTx/xy8VK36vk+EmQvtd1vvRbyxWGF1jmTPuRo
	HQzNERel+FICerHtJ+iGooHzbfjFcJn/t1Ont+oR/R0vzVv4g+etmllsjUMB1VMDx0nwvM0UhQs
	D6u5hTZXLmmlnaHIInMt0C9306P+bOL3jD0Ow+zy0Y
X-Google-Smtp-Source: AGHT+IF61jcgnMjLBm3jBZKuxzLimGMLuUoEmkVfquWe+Hg6uGK/07anD4U88A7ZmbgZoB0iY8kl5Y88
X-Received: from wmbid23.prod.google.com ([2002:a05:600c:a197:b0:436:6f93:80cf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e0b:b0:431:5044:e388
 with SMTP id 5b1f17b1804b1-436e26e4c61mr95369675e9.22.1736531511708; Fri, 10
 Jan 2025 09:51:51 -0800 (PST)
Date: Fri, 10 Jan 2025 18:51:46 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=ardb@kernel.org;
 h=from:subject; bh=bZXyrwzxQW9uW2wgA8lGUHNaU6p3I9tabjX9Q096pzc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIb0xzuhPtftvz3b2W60erw5ePLVhQeGrV5+tWy8+3rOVZ
 91l9TOPOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEjrEzMhytNWvb86qSf41X
 5sY/ZQx3PRRst9RsljSS3bTnUW36WSGG/z6pG44fM7JXYXs9e878N5OvHOA64WXp0rHSt/pWT+W 0Wk4A
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250110175145.785702-2-ardb+git@google.com>
Subject: [PATCH] arm64: Fix 5-level paging support in kexec/hibernate trampoline
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_095154_190603_238BBC11 
X-CRM114-Status: GOOD (  12.00  )
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

Add the missing code to allocate P4D level page tables when cloning the
the kernel page tables. This fixes a crash that may be observed when
attempting to resume from hibernation on an LPA2 capable system with 4k
pages, which therefore uses 5 levels of paging.

Presumably, kexec is equally affected.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/trans_pgd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 0f7b484cb2ff..84594f02f780 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -162,6 +162,13 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
 	unsigned long next;
 	unsigned long addr = start;
 
+	if (pgd_none(READ_ONCE(*dst_pgdp))) {
+		dst_p4dp = trans_alloc(info);
+		if (!dst_p4dp)
+			return -ENOMEM;
+		pgd_populate(NULL, dst_pgdp, dst_p4dp);
+	}
+
 	dst_p4dp = p4d_offset(dst_pgdp, start);
 	src_p4dp = p4d_offset(src_pgdp, start);
 	do {
-- 
2.47.1.688.g23fc6f90ad-goog


