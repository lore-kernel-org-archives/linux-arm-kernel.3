Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C4FCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ytrHI1NAcV1X0TRAEuLH3Qut13RJxS0IznS6P86zRXI=; b=aqLHwX9KiIRrTPKrMT7u90wYek
	BdS4IN6QzFcjYSQPy5gY/X5Yom/eOkgLozvbRzQzR69GRjB74ohgQ0l27B+ZmUfXBrxRhooeNThVm
	1vIb5l42c/87y+bM5BIvWEw0sS9H4nvLYf/DQ5AN1Pp2PR0V9lVOWhlUlbi5D+DfZDq62Lkac6/jA
	C6Zg6joFnHZE0Ck8mBUO8pEcLAWNXb0906kVADN5EpFFC7IsfArsdv17ICeRK5pVakx6TxzFRcCb7
	ZLpEFpou5hAAilhoDvHbNp1YRSNFGmEGncCi2NzpvLTm+ywzavnYRJjrqfe5Q7wJ7w47mpDm/uDMQ
	ADbX1y6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5mp-00000008QAO-1TsC;
	Thu, 21 May 2026 15:58:15 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5ml-00000008Q8Z-1lR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779379077;
	bh=ytrHI1NAcV1X0TRAEuLH3Qut13RJxS0IznS6P86zRXI=;
	h=From:To:Cc:Subject:Date;
	b=xM7DFqLmbgXusspiE15/iu4WLkTuAtjgspMk8uXOHMcXzq6MNIehssc8CLzNKNDit
	 I0/4zgFuYjpEumI8Msw5tD9hEmtTeYuEKzEnfmS763hsrMTg5fJmRl1lWq2rCHXKSk
	 WztukGKxISYnf6I5khx7j3a7ZzkHcQp7RIqaOQ54=
Received: from LAPTOP-JJ91J38E.localdomain ([222.125.130.99])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id E77A8EE9; Thu, 21 May 2026 23:57:55 +0800
X-QQ-mid: xmsmtpt1779379075thg884qg7
Message-ID: <tencent_69DC6E2A5B77E4D567CA4F552DD3A835590A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznY8aeuYkUt7jNUdYLELDhEQzJByuH55MeT06gyCHyxpTBwJI07h
	 oovc7YTCwnTGVXFHFMPQnXLRkizYoRXiP+2Hj13D4ltmYMrenZHnx0fX1rcUH8bldNoNvrh345Kl
	 du4Kl0PShCb2KYoSE/eqN+OuKu2UnRqLW11GZy1bz50/YdxZcZ08bWk+nf9xLo1JcqhOXDbozwqk
	 pGdnLXN+Idbf4houwfcF9HUPrhMg812nfTO4i9Iqdcz5nCV4gJfh3GGnHiPiK9y395J+4MlMQY80
	 qOtEOposP2PfeItTi1gOp6ou9u66J8YTvSHEE5Q3fMOvoQJRVCeLf4Izf6vlIg3Dkg7y5sbhB03c
	 92hlDtvVmBGd/bOiNXEsCk71B86xQdGYQSfXDGa+/PBFa6Gkh6FprIf6iaGJyKL/SPZVRjL9TUQq
	 1aDR38MgumR8V2QPF/M/Sdwv7OeiYiQmBRyT5Uwop6LFoW1U9IDfmGO4U6qbl3RF7SRLUnXZRpmz
	 H6uGnQS7nCWvThtmainSJYa4ztGH0wEddPViB4WZvRzIoYORgRetV+OZdh0nFmZyFapcKJgc++ft
	 u5oALwm+TRG3Aor9RYrIpKbvz/NChCyQ87+1cjTCmF03s+6ExkdY/wMn1LvXkTDMKPHmTJZB0BmL
	 KRNcUlwFlUnwdkHViLgDxP6RCqnkGw7Pl6wiFSczAMW4VAVi57AJWcenlOrjp5M1Z6cIBJaSIBby
	 dHuCQB//5SebKcdIc+GUcJ9TTxObknDrqj9N3+vIwmcruOmmId4Z4uIfv0qIXNph5397o1dtJQVz
	 jRBU+zLPkVczuG+T0Mes11eISEgNTIiMkZzJezWZP3QUn9cbDSUYByLfjryHXV3iAlnXNAHe4Twg
	 L6UdbNFcmGcY2MWJO9IqWKZJJfYb1ouzdUh7wUbmRsAMw2fd3UBVf7ZK2eq1QG7fPbfF6I48NuJ4
	 5oFymP1kXnYP9d2WmBV7xClFpuhu9kt9X66tZpL9IuHqKtcyfVzooRCBFLepJmwkINFnLWxEUW03
	 dZPltvt86UaQFp+oZyKqs8bUVoUaRJ2oKaX00004IP+dG0kWpnr4yKLTupFkurz/DkUSFA7bYApq
	 qukXRm
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Egg12138 <egg12138@foxmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Egg12138 <egg12138@foxmail.com>
Subject: [PATCH] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Thu, 21 May 2026 23:57:53 +0800
X-OQ-MSGID: <20260521155753.882044-1-egg12138@foxmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_085812_021617_FEF0CFF8 
X-CRM114-Status: UNSURE (   9.49  )
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
sections associated with .text.*, into the
stable output names expected by the existing ARM module unwind code.

Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
Signed-off-by: Egg12138 <egg12138@foxmail.com>
---
 arch/arm/include/asm/module.lds.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
index 0e7cb4e314b4..dc9adf8fa50e 100644
--- a/arch/arm/include/asm/module.lds.h
+++ b/arch/arm/include/asm/module.lds.h
@@ -1,4 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef CONFIG_ARCH_WANTS_MODULES_TEXT_SECTIONS
+SECTIONS {
+	.ARM.extab		0 : { *(.ARM.extab .ARM.extab.text .ARM.extab.text.[0-9a-zA-Z_]*) }
+	.ARM.exidx		0 : { *(.ARM.exidx .ARM.exidx.text .ARM.exidx.text.[0-9a-zA-Z_]*) }
+}
+#endif
+
 #ifdef CONFIG_ARM_MODULE_PLTS
 SECTIONS {
 	.plt : { BYTE(0) }
-- 
2.43.0


