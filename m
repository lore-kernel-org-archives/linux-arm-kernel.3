Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C02B1098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FREiFmsRIXiOQcSDf+g4S+t23y0B3LOgQe0t9T04+rU=; b=JgWbMgUe4scooK2m/UZ4VmHZlr
	hrVAdK2qaaPT2NrfkSK1ROA7gn/gSKsPPQZIdC5mOwMKtaM2LdQ5KSpURSU7S7cJKY6KMCbu7zRm9
	8SsUtEqQPBldsPpN87fVEiSMlvWvCHArxuFND2l3wAmaHK4xd7dRVcS5uKK6e1LRC+r6zq0QEg3IF
	EN5K8RjmBQitgwQCCI37aHx91si21ALOeAPxaVYRxMi8OYdyo2+GuSH8F1tya6ZEFzv6T5EwChjvm
	5VUt7NisiWNvfqsHJNQaw4/zDQzHXLVZNMqxKWNzoVeFmTKiy4W2Vdef+xz6tgxVBVUajKlZJDPrA
	ixwFHjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKu-0000000Cyku-109n;
	Fri, 20 Mar 2026 15:00:28 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKZ-0000000CyRm-0F71
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:08 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-486fe36cf73so7101905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018805; x=1774623605; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FREiFmsRIXiOQcSDf+g4S+t23y0B3LOgQe0t9T04+rU=;
        b=tGS6jkH14tVoI3nKlVOjfl/bbH6UDYcjafNGp/9PgOsqGUhhNmTE+auNpC212OA1Hj
         3JTLmQURBSwiZvIKr586FTuHqVT79wpPFM7QoHXB0ThooP9QIquxrP3XB51Xf1Miexz+
         T+Bp+1tS7MWuKL8Bvvn914j1RlJFEgxLgLvRC7rY6SUbOUvOMmAQIzJ0Iti86xZhaxxC
         ji5yI5wph2EtkGs0ARuzkg51KbiNum4VmSbXVokLPRao0dnqsqxgAKVHnUl4ONKkshVC
         hhZhWAPf6UTcBSu+86+qL1s8NhZyGuBFWgJoRYd1CrmBI0vJcwHXj7ePVQ9BL/FMVG5F
         Gr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018805; x=1774623605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FREiFmsRIXiOQcSDf+g4S+t23y0B3LOgQe0t9T04+rU=;
        b=LKVnPyfKQN1SViXIFV7989NnatfbQzcqHzUm70tTMJQXhtb313cQcz3WPq/+omqAVO
         uzg6HyDUKD8sXdnAHnm6mAngakhm+AtFpsotyldjEJvwmuo3y3gdfdHyh08KuKcBekqz
         SccWuRFd01DtpT0ei6QNlyV09jAaqi5NogjQGIEAWw/PCnl9Pyu58CobXEyVqEFdtBr7
         HBVOYbaE5gy1XqTchvhURCB/0j4vGgftiwzb0YYzSbFtbZ2dbH67UthFSDh4FS2Bs13f
         7726yF6T37YBpKj936b8NibdL3QcploulA31TIhVB80ZLnMG+vHT3ST46otzp9qztkvl
         4gQg==
X-Gm-Message-State: AOJu0Yy2YRZ0XYeyRq5y1ObNND6Zg+Nfe2ut5kY7BepsDky7cJogSnNO
	4N3GJ1TPMy2ImJVy8gSrnriED/093762dKEdwzUvNS6M4lrqv6u7WTHCrVTmak1r4W0Dm5XTxQ=
	=
X-Received: from wrwp1.prod.google.com ([2002:a5d:68c1:0:b0:43b:443c:fc00])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f0e:b0:486:5f71:5829
 with SMTP id 5b1f17b1804b1-486fedab740mr49836565e9.5.1774018804352; Fri, 20
 Mar 2026 08:00:04 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:41 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=ardb@kernel.org;
 h=from:subject; bh=E+pO5/eHkkh2sajPGACS/nW0kkP4G/kfrd6uShLIRX4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwn1xAS6VoMiOyA2+FtGnPNwL5JMFZkScquZs1dh6u
 t1XqKejlIVBjItBVkyRRWD233c7T0+UqnWeJQszh5UJZAgDF6cATCR+GSPDoSuMq7lCWb9aveeY
 7Bn0TcF2hdf55QUZssayBlVT/HlnMjKs/79HqyM9/M2u1Qa/OsRvb2R5csxUmk3+gI7K2Rfx28T 4AQ==
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-21-ardb+git@google.com>
Subject: [PATCH v3 06/13] arm64: mm: Permit contiguous descriptors to be rewritten
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080007_142569_5B32528B 
X-CRM114-Status: GOOD (  11.83  )
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

Currently, pgattr_change_is_safe() is overly pedantic when it comes to
descriptors with the contiguous hint attribute set, as it rejects
assignments even if the old and the new value are the same.

So relax the check to allow that.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 744cf76f25aa..6780236b6cf8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -140,10 +140,6 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new)
 	if (pte_pfn(__pte(old)) != pte_pfn(__pte(new)))
 		return false;
 
-	/* live contiguous mappings may not be manipulated at all */
-	if ((old | new) & PTE_CONT)
-		return false;
-
 	/* Transitioning from Non-Global to Global is unsafe */
 	if (old & ~new & PTE_NG)
 		return false;
-- 
2.53.0.959.g497ff81fa9-goog


