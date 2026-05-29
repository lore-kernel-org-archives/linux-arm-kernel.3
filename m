Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724D7CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVvGpZVbgfNh7wolCwvE0ghD3nqiaYT40C2yK739Pw8=; b=EAzkWQdK2nWLfbmHBdKAznLUjO
	wh29DiOtmvZo9pkvvDJ/uCcXJ8gXeGAngXUKs/R7IIeYakXrPRrDI343+WualuNAe2vyIE0pmfdeg
	FKktEUerb6CBSkyZTxvsEmI2PS5kDsgktSQAYEJ/p3ruVOhQ8+PNZfkmkTdrRSX386ypNYoWrS67V
	SLoXo09cOwZ/gTmZ4aGFxQmL/6k4lVHZT8Uf8aHlMfc9tmSaySsHkI+Y62SH4BWBC8IKqTQNjUd6E
	Qq2/6Zotzx0mh8hutyapvNPZV6yxshPQAStxKlnd5V3mgT1dxBWGzVANTnQ6amHmriBj8chNwkkvv
	uI5Voh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Mx-00000007vYx-3xBd;
	Fri, 29 May 2026 16:47:35 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Mu-00000007vYW-2aNf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780073240;
	bh=JVvGpZVbgfNh7wolCwvE0ghD3nqiaYT40C2yK739Pw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R9XI+hpA7VQRt8YfW2NlbI+bwtYErbwAFIfb6gIKY3ReW/RXAyg5TLYoIbW0Iwenx
	 RSze0tZQM0f4/CoSd8OooMXhZgB+77lOSouebFQdWI0ydJHbq/yozjU5CndTEv+Iv4
	 3Dvin/PXUYk9jwIJeJZ0V+GJT5/PJZ2YdCl3pi/M=
Received: from LAPTOP-JJ91J38E.localdomain ([222.125.130.99])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id BD230674; Sat, 30 May 2026 00:47:18 +0800
X-QQ-mid: xmsmtpt1780073238t8ug9n6mv
Message-ID: <tencent_D9CDCA221D0AF5EDF260559734464D39B708@qq.com>
X-QQ-XMAILINFO: OedO1VJQO5LrvC24y5F2mOvinXoZ6aK1mrP8eIF0xMqf/sBGynbGIw8+ZegpHj
	 uXr2Ys3xkdz7wl83b1+4sFIKieCFkvtedA7hUChnKo41DRXmVccT0hrB0R6kZiSdbeTVaOAmgfRg
	 CHjoI/j1/3ikZT83M3mFOZqagrd1M5tQUvwWeqiMZYZpFNBXb8XcjeJzW7YVv9M012Ko3sQaP8+f
	 JLAX4dICv+vH5aY8xsICdHMEszd2iGxHHUC3tduxtWw0RGAhHwC7iy/Kpo3HKac0Rl037Khd2VMM
	 tsVnBGdn0dlZvZ3yhmlS0UR1vFlAVHiS1k2S25+VDgV1B4ZZQKEo2eeM/TxZIsAVW+HNfe01PIYn
	 FUJJnl5zPIVUDUQSK89JLpQ/MSuyUlGoPMjrcPo/0EerMzwkHNXO1agAM6saJ+k9R7oMlMgwzdKr
	 Ah3ku4c1Wt7XTelUfvXQLmbh8y5Ag+OpRsOhqiiXu5ndpF5MjoOlryLSE7rNDaoRXazxNKPfacU8
	 xCCi/Oqh7DE5Wc5dp04q3CdqAQgELSMQsMImh9gALZddJ2NGDC3FwL6CKpPYKzfDEY3Jh83dCEGj
	 /t7BJ5mYYiJvfFvsz2t3up4xvcLnoWkjqcGpCtV151RMI3yPYbd8aJcZ9/YkAQIkLGkGJMpUMv/+
	 VvxIYEWO0+ApKSSmUrXjleZDWL2acRaKS+upcGMQBuwvKaFAoBrsq965bMx/fSD2815zCJhLLsHv
	 KxTglrgdDANI0HTHJdIG4i2aSYnZl0wovuii+QxYkyQh1/Ajj4rNs2JzcF2kwQQW3HxHqkWiwacF
	 RZNULx6NWN8RfoboH3HEfgwCgwiRsPdLGk0zW8fOZf1YbPMpCK937juALTzDjqwONy2uKnq2ibts
	 /rDckhZhriedMySeRHLwWLlGzqxrFWwqeQW6FLG/eLkr77taCrkZy00YnIelBfL2rnbqYWGKjSmc
	 sGZe1xlg4o9vGGSJue4ljYOycAoRRPTzLOVf0OeCORAqnSRg5A/8MVFMvYIR+T9Y0d8QzZVUSAVH
	 mqFQiLUxforjkPscpERfCXAOJNybFquJhdj7Sj9hWde88zhTfg+FwPQ05tpWi2pOLxAiVH9atli5
	 dLYny+Bcj6qI/GDUIYaBK+Iu5rf3uwmB91nSdl
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Egg12138 <egg12138@foxmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Junzhe <egg12138@foxmail.com>
Subject: [PATCH v2] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Sat, 30 May 2026 00:46:08 +0800
X-OQ-MSGID: <20260529164608.1870192-1-egg12138@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_69DC6E2A5B77E4D567CA4F552DD3A835590A@qq.com>
References: <tencent_69DC6E2A5B77E4D567CA4F552DD3A835590A@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_094733_213002_EE70FEF6 
X-CRM114-Status: GOOD (  11.34  )
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

From: Xiao Junzhe <egg12138@foxmail.com>

Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN,
and related macros") made scripts/module.lds.S merge module input
.text.* sections into the output .text section.

On ARM, the paired unwind input sections keep their original names.  A
module can therefore contain .ARM.exidx.text.unlikely with sh_link
pointing at .text, while .text.unlikely no longer exists.

This is a valid ELF relationship, but ARM module_finalize() does not use
sh_link when registering module unwind tables.  It derives the target
text section from the exidx section name instead:

  .ARM.exidx.text.unlikely -> .text.unlikely

The lookup fails and the unwind table is not registered for the actual
.text range.  This can make module stack unwinding fail with:

  unwind: Index not found

Keep the ARM module unwind output names in sync with the text sections
that scripts/module.lds.S now produces.  Coalesce the .ARM.exidx/.ARM.extab
section associated with .text.*, into the
stable output names expected by the existing ARM module unwind code.

Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
Signed-off-by: Xiao Junzhe <egg12138@foxmail.com>
---
Changes in v2:
  - Quote ARM unwind input section patterns and split them across separate
    linker-script entries to avoid checkpatch false positives on wildcard
    syntax.
  - No functional change: the script still folds .ARM.extab.text.* and
    .ARM.exidx.text.* into the stable .ARM.extab/.ARM.exidx output sections.

 arch/arm/include/asm/module.lds.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
index 0e7cb4e314b4..19ceb8cf235f 100644
--- a/arch/arm/include/asm/module.lds.h
+++ b/arch/arm/include/asm/module.lds.h
@@ -1,4 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef CONFIG_ARM_UNWIND
+SECTIONS {
+	.ARM.extab		0 : {
+		*(.ARM.extab)
+		* (".ARM.extab.text")
+		* (".ARM.extab.text.[0-9a-zA-Z_]*")
+	}
+	.ARM.exidx		0 : {
+		*(.ARM.exidx)
+		* (".ARM.exidx.text")
+		* (".ARM.exidx.text.[0-9a-zA-Z_]*")
+	}
+}
+#endif
+
 #ifdef CONFIG_ARM_MODULE_PLTS
 SECTIONS {
 	.plt : { BYTE(0) }
-- 
2.43.0


