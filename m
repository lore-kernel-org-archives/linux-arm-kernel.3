Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24051098792
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjzcF7K4l6kuyuHp5hOrQQC0yTx4zgF02dd3Je0OTIw=; b=oHAxD7bAkby6PDZfreHzW83JJ0
	Ygs5n292+4GdYCUFW6IVSXasfibW6oB+U95Ig1J4rSwQkqT7Vpw8t53cvUzlKrZ2DSnICkz3G2Y5T
	rKfhTXCvzOUD70HBs6nQjjv3uynxNiQG3TeEAzjQDximloFEfhLjkvN2BSdk7uKSs7DSkiqyFnaTE
	aGR7joK9+3L8z96Hq55iPrrTYrW1T/uLQCdLpeYLJ/VaGWOqoZe3Fc+OEdYCDUdGL7m61zq9V0Z/h
	q8bIE6TSU0xOwxBg0ropWQ9Oc90cpXqEVkcHWvYSYt9hgF2J3NwUhpbt9hHLRE0ItJcLNcb1Etooe
	NaQ6F13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKy-0000000CyrJ-42tS;
	Fri, 20 Mar 2026 15:00:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKg-0000000CyZ0-0iiz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:15 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48534941525so6485535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018812; x=1774623612; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjzcF7K4l6kuyuHp5hOrQQC0yTx4zgF02dd3Je0OTIw=;
        b=bfP28RtzC89fCulE0xwWVDhn+/0mzgD+iESJcFkAyTlbCDiG3kDU1sHW2rLvv/o+X0
         3m1ACba9FpVzgV4JABU9R+qoTTo8tRbrW77KHDMrQi7wdBJ3c3drmj7yOezdWXImfhlW
         4ZylRttzzIk02Vt3JVHhilVwd5730UZsXCbcBeiyUSmac4A1VVcQB1tjl7iSyjd7h0rg
         28268z7vi5C1kbmi73x9Z/WaueCTlBsWyrycq4ZZD4WmFXR+uad3DTVLhzGXJwL1xpT0
         5DElzqCXWSMrbtP9IFgpX9i8EKJABgt8rEmdDCzASOFASxLvX2olPtnVlh2Pw0RG+at0
         754Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018812; x=1774623612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjzcF7K4l6kuyuHp5hOrQQC0yTx4zgF02dd3Je0OTIw=;
        b=C+axtBzMsXM4dROt60+EWLf75QX1SYw+QrQiHfw5lmwTuj4LYIxFL41ppoLrpo42OD
         buaGtPFySdKdtioxkShZSxuymODKJhRDodTiFS7BnxIvZFmw45CewS52LUe7Vo2xlzrW
         wNZG1SewlK0RJIrJxDFVnHny7GGela4nCvCzTMPljzaic1c5LQ8Z6cTNoRHkyQgXR2CG
         /O39RDEXQEP21KemlZZrLusbEgijH0qpQ+ktt9mDhKN035SgNSeEYA4IAQl0gtB8Kg3/
         70vgdz8Pgyx+14BKySPbflW33oVA2qWOQDHwc+OY91v4EEw0C4Kj3fCfyAYLHDjVoO7G
         cFKQ==
X-Gm-Message-State: AOJu0YwfQL8Xq8vmSPVFBpYaLgkU2i1cBM5X2+ZNaE5iVRpy6lWYwnZr
	aoQgxJ4xPFd566u/QpXV5CKVFGvmv0XymeV0HpBDToFcjidQBzADnt3HYzIQkQQYUh+rhYi0bA=
	=
X-Received: from wrbcp39.prod.google.com ([2002:a05:6000:4027:b0:43b:5b92:aa63])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a402:b0:485:5981:1423
 with SMTP id 5b1f17b1804b1-486fede720fmr41862035e9.3.1774018810476; Fri, 20
 Mar 2026 08:00:10 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:46 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314; i=ardb@kernel.org;
 h=from:subject; bh=e+g1FyvCjZvn4UCkoUHoA+5i42in8tqyf6pjup/50iM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwrPN+XcrfM5u2LGPW+l33FZpAYFdgfsmi8y9Msn/u
 Okuo4KajlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRpS8Y/juyPTwoeO9PblKs
 9p6b8z4Y8ecpv3vDdOhIwerefXKx7vIM/wMC9nOH+KRE51akbLd6u845sLdNp/q7lFtNWsibC2F cnAA=
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-26-ardb+git@google.com>
Subject: [PATCH v3 11/13] arm64: mm: Don't abuse memblock NOMAP to check for overlaps
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
X-CRM114-CacheID: sfid-20260320_080014_242053_8EE67ED7 
X-CRM114-Status: GOOD (  13.36  )
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

Now that the DRAM mapping routines respect existing table mappings and
contiguous block and page mappings, it is no longer needed to fiddle
with the memblock tables to set and clear the NOMAP attribute. Instead,
map the kernel text and rodata alias first, so that they will not be
added later when mapping the memblocks.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 23 ++++++--------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b52254790fda..34ad45a2d95f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1128,12 +1128,14 @@ static void __init map_mem(void)
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	/*
-	 * Take care not to create a writable alias for the
-	 * read-only text and rodata sections of the kernel image.
-	 * So temporarily mark them as NOMAP to skip mappings in
-	 * the following for-loop
+	 * Map the linear alias of the [_text, __init_begin) interval
+	 * as non-executable now, and remove the write permission in
+	 * mark_linear_text_alias_ro() above (which will be called after
+	 * alternative patching has completed). This makes the contents
+	 * of the region accessible to subsystems such as hibernate,
+	 * but protects it from inadvertent modification or execution.
 	 */
-	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, flags);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1145,17 +1147,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/*
-	 * Map the linear alias of the [_text, __init_begin) interval
-	 * as non-executable now, and remove the write permission in
-	 * mark_linear_text_alias_ro() below (which will be called after
-	 * alternative patching has completed). This makes the contents
-	 * of the region accessible to subsystems such as hibernate,
-	 * but protects it from inadvertent modification or execution.
-	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
-	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
 void mark_rodata_ro(void)
-- 
2.53.0.959.g497ff81fa9-goog


