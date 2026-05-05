Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32BDFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MHm+BE45gld4PlAAsx6bWNk1naCvu52znLRb6ksdbg=; b=ooQA3R7w0uePUr1+r36IVBr38G
	JvoxqbIc5yLbB2BR5yxrmkLipCHJjGbqp+wW6ryC42izkcsQRpTXCL/5xyfWH/RXSex2GAXAdekp/
	eAIe0lSDQa8Wq8ixYeqU2E1kh4U1w1L01yY7mVCWWZIBVc8uHxAaBWT89vlPtvE3GERbyqHGdETHj
	rRk4KLvu5iadau/fxkinV/cHAINk565LfdUa2l76zSCr1qGmZHyIug8G1g26+57rJ7spcNsqOkJr3
	a/52YI1soBV/C/vhfzaUfEbsOoOSdhIXtb1z051ABgGCotg+gQEcjM4FMT4BiPDAa4YdCKIKt8ZTA
	KLEOLiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJF-0000000Gn7J-18E1;
	Tue, 05 May 2026 16:07:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJE-0000000Gn6A-3QLb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 16:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+MHm+BE45gld4PlAAsx6bWNk1naCvu52znLRb6ksdbg=; b=WEUiSE5dX7ljkDyTdqk2IFcdmh
	KVPezn5V3qWdAGuqMgF+80vMZ5UcJSwuiAo8urHWJbKu9VM7txABsxM/wxFt51eXzKpKvTHE9qFVJ
	IS3tk9uj6wtV8AHO9o96O50dSG+pQa5lnfVxEBHtMGUgiS+NuwxrIe5L9eE3UA90roO3BxUJfrTnw
	5zx75JZFsiL8hOn/bDOEN447nc1eskoQAcePpbUB9IAgLzZBgo4JqlrrbkwXrDtdVyvt/yGj3l1A5
	cRrqwxVEZC2DWlbF7ifiEYXQCdg44gTADXfKFv+bm1VQR2GGVo9y7xdKr4Mmauwm8LrsZ+OT3jR9v
	9Irimz+Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJB-0000000Dyn1-1iK6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:07:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F23014BF;
	Tue,  5 May 2026 09:07:35 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76B503F763;
	Tue,  5 May 2026 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777997260; bh=g5SIlfhNFVkGHqg4H9aglJHNTgTJdaH8G/qaojIJDnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KkYtO8mZqdaw92smrCGaZTzZI/VIzEyKkmaReuGHOucgR+tC88xl9fofAudD6UVpk
	 k8mMgNRteA9j5G51xbINy6Vsrn2R/ZjvzJ3WLH6+D35W1zPhu88N6Lht8mUvcMEWUs
	 dFkjBvRkKGt4/X16YT0hU7+djWqlw+f9qAt5Hw2s=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 05 May 2026 17:05:57 +0100
Subject: [PATCH RFC v7 08/24] arm64: Initialize POR_EL1 register on
 cpu_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-kpkeys-v7-8-20c0bdd97197@arm.com>
References: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
In-Reply-To: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777997220; l=1238;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=X72DCdJX2SxlqX4hafcg68D9WxF9xj/CvQA2EQYYzDc=;
 b=fim2j4aK2yghbZYMjdBQCOZyKY91r9Ul0SwmGZQdrKUeEhqyNGE1v6WJFGHlbNiKl5XqoqcSj
 w/Gou1BnYSkAXgMZuyZl+N93zHfpv3GYcZkYHunaDhY0KWNQFbc8UfN
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_170741_852420_14E8B952 
X-CRM114-Status: GOOD (  11.08  )
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

From: Yeoreum Yun <yeoreum.yun@arm.com>

The POR_EL1 register is reset to an unknown value after cpu_suspend().
Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/sleep.S | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..e0a6ad85cd24 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -3,6 +3,7 @@
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
+#include <asm/kpkeys.h>
 #include <asm/smp.h>
 
 	.text
@@ -134,6 +135,17 @@ SYM_FUNC_START(_cpu_resume)
 	/* load sp from context */
 	ldr	x2, [x0, #CPU_CTX_SP]
 	mov	sp, x2
+
+#ifdef CONFIG_ARM64_POE
+alternative_if_not ARM64_HAS_S1POE
+	b	.Lskip_por_set
+alternative_else_nop_endif
+	mov_q	x2, POR_EL1_INIT
+	msr_s	SYS_POR_EL1, x2
+	/* isb can be skipped since cpu_do_resume() will do it. */
+.Lskip_por_set:
+#endif /* CONFIG_ARM64_POE */
+
 	/*
 	 * cpu_do_resume expects x0 to contain context address pointer
 	 */

-- 
2.51.2


