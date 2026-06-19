Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C339CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fDThUXERwUUEs/z9ucajXv7UAnqFyxEUTJ+qPyvpvk=; b=ap3qYPc+Rm2fM/xui+cb6wk3BV
	hyGNspSQm6TeoK8oiTfZHcon3O1up55E+C5HTIaNUvIT2YhckQps4zhwhTt86WzxpNXKLYVTzuPfo
	ziJsz5NaqIzD6+/OsYgRdUX7rEbU1NPs+54Tx6NEXMb2aHLJXtcRH/wYSUTi/GEsQsH81DlDtF5s9
	+zlqs+ui1YTnhga2DkL3Q/StcSDUMo2F7j79j64CIB80FNjPI+D3TKrV87e4Z7p93cIvfH/HMMK+F
	Qvwkbd8YM+a2Ulz4QPV+sQraZOBDhaWIWtBQmTXIDankIHsPAtaDL7FsupmPJvube1v3C2YCc95Ro
	Rn3w0sUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacGX-00000002mmL-0r8x;
	Fri, 19 Jun 2026 16:40:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacGS-00000002mkz-0lHs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:40:23 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-463dd955dafso1438167f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781887218; x=1782492018; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/fDThUXERwUUEs/z9ucajXv7UAnqFyxEUTJ+qPyvpvk=;
        b=t1MCCyT/DL+/eA1Jgr6vJGi/TW641H/R8a9REhU6xLJ/csZkdEkIl5DCDYfGd1/qj1
         pBbhQGpAnD6CW5igMOenX7po8B7t3xD5jhunUe0LLtqQ+jeAi02UjoYTZj7v86AuAyoO
         ktcFfynt2Nc9aYPIrHZaH8SbVor4CIABL4Kg75QimoNrTYEHNvZg3wAJ6ksATAJoMRU1
         noMq980l2MP2TLBH5nE+1heLkb3J2FMInkndtcHhOg1jXBc2g7p24X/UHN1z9bRbmaLo
         Zos7vpyhIUsW/rC0kjDoXQlY9XLIxrMtNzDoPi0lqUt4UP04FGuPvwYjS7wIbQD0he2H
         Ut5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887218; x=1782492018;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fDThUXERwUUEs/z9ucajXv7UAnqFyxEUTJ+qPyvpvk=;
        b=So8TetL4R/7E+mW3iBfrdxAQSZ1eoxEJ8yVbl79ntdSwvw6gQsLa0My/COat0nWQ5y
         yNXVHOJUA37uxhKB7BTqDYLsLjLAceOZxSpvrfED8erzHlSc6GVPyWuA7o9l3lycSyM/
         F9W8C+xerNxqo5gD4lCMwz8JcLsqWNx2T/XwRwV1qaxRp1vKxAd1SzaZ8MOfkmA6a1Ox
         jacU8zM9JFUlMp1qwcKXCSdz3BMa2tZDYz39RWA60uBjo9ssOhUPm1Ot8mkoeVi8vgJ6
         5S76/vpZ3bD4vT17Lmp0SaGAynXLVOj16fTir8l2l0mDgMFeWTzMByXTfXOMzP5qgZXZ
         FX+w==
X-Gm-Message-State: AOJu0YznxlBaKpm6FsVbdVE103/Z1/GOCefQJDB2I5ztikIIpqLDTVXl
	zdnOdeXN1pFeB1Nw/y1ZoyTHHmuFVBLTwjUdGqSSu1aMqcB2YVVwvDD6yVum9kbOFHVMZwmx+g+
	MAhh2kvTcHECGpTJwV3MNsTaYdDFhHnDNKJYSCOueJSJ3xZnoliJCPB7BCrJ5IYrwX8auZVSikT
	WF2pwpS/lEAQOGtbG57G7Z95tOpsLG5Sz+rG3GzsJCG8Nk
X-Received: from wmbiw8.prod.google.com ([2002:a05:600c:54c8:b0:48f:de4f:a90])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b21:b0:490:bd66:e523
 with SMTP id 5b1f17b1804b1-4923f5721d3mr84433615e9.20.1781887217523; Fri, 19
 Jun 2026 09:40:17 -0700 (PDT)
Date: Fri, 19 Jun 2026 18:39:41 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=ardb@kernel.org;
 h=from:subject; bh=FiCLQUGsKnSPIAZDP2PiOA1tidCSE9QccB+wefg2gW0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIcu04KxD+RSxUHeV+d9vrZH98iZmT4NDZ8rTTuYd5ht1T
 wuqvVToKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABP5sYGR4Xdd39bnqz4zR3Jf
 PDA1r/CE3uEnmgKp/CL5mf7yV4TX8TL899aL8+PcZXatfqLm3JMKa99+r5r6aJZn2fVyj50Lv1u JswAA
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619163940.3185308-2-ardb+git@google.com>
Subject: [PATCH] arm64: mm: Defer read-only remap of data/bss linear alias
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_094020_270100_DB91789C 
X-CRM114-Status: GOOD (  14.22  )
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

Fuad reports that in some cases, the KVM init code may apply relocations
to variables that reside in .data, and does so via the linear map. This
means that remapping .data read-only beforehand is a bad idea, and
results in an early boot crash.

These variables in .data are only present when CONFIG_NVHE_EL2_DEBUG or
CONFIG_NVHE_EL2_TRACING are enabled, which is why it was not spotted in
testing.

So move the remap to mark_rodata_ro(), which is a reasonable place to
put this, and ensures that it happens much later during the boot. It
also means that rodata=off is now taken into account, and so the linear
alias will remain writable in that case.

Cc: Fuad Tabba <fuad.tabba@linux.dev>
Fixes: f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9f354971b7e4..1f7eca86b5c1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1198,11 +1198,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__bss_stop));
 }
 
 void mark_rodata_ro(void)
@@ -1221,6 +1216,12 @@ void mark_rodata_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
 			    (unsigned long)_stext - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	/* Map the kernel data/bss read-only in the linear map */
+	update_mapping_prot(__pa_symbol(__init_end),
+			    (unsigned long)lm_alias(__init_end),
+			    (unsigned long)__bss_stop - (unsigned long)__init_end,
+			    PAGE_KERNEL_RO);
 }
 
 static void __init declare_vma(struct vm_struct *vma,
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


