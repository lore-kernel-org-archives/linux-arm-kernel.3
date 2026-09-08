Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D154EC79FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2OcsfQB2rXyV+qEnim3LyzT5vfleOs/dQwzAKYIyC8=; b=HS+v7dav50+OYq
	cSrgSky8kJ8fph0r+jZHkSLlnRlqwomhr8bxUsQ+qmYM30onSefveSeMFfkEL/gI2WhU3kV52VLzI
	dWwrPwIIWWtPUSNgOCfpWvIPv6sxfoyzIvO9Eg3uUHLbvI6OsdmXklO19ct0l4N+NHm6fQwbxntYi
	hdCjbwHitcTtUlioku3S+rn6Hu2AU5OYFzx7yCdJtuGMwSYOkzl2NLXmLPiI4Or3acKhBmE8T0fIs
	Y5DoFlYjgfi8/D4xzGyNFjq13oA9howeCtQ9yaqGONNFLKW24y4nFJAOYDMoukx6CbDsreyELtqdn
	ZismkvkRPNnaqZpUxNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xeW-00000009SlN-1pxM;
	Tue, 08 Sep 2026 15:22:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xeV-00000009SkV-08aN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T2OcsfQB2rXyV+qEnim3LyzT5vfleOs/dQwzAKYIyC8=; b=PX4QvquRUYiA360eBIizK3sBLJ
	YMboDCLZyJSE83JwYH1V6+bDaooDLKWucp9d1B27U3TYj/aqcyR/LtNGnF1ameqB6zwG9ndWAg9XU
	36/5Qm5Vz6IsqJ7m6YkQVxfkEdH+gc52oItHBaYM7dtlwzC0KXsu7bWwhuUzlAkF2IjiMfzt36Xj1
	V9DY/T4TOBYC2dJI2rBHz1F0qwwo/zcKfqoW8F0tNOlRV6I7Ea77CQlq0MN0FX9NITVWmeWMK1/74
	fpUUNKQ+ph1pBppMerB79RABGXZ9DsI1M5ZTrrmuWvSBnFZszGn+ebtgMQRZfSimp68WQdKRmQkpT
	UvTUrcTg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xeS-000000000mH-0aXJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 682281C14;
	Tue,  8 Sep 2026 08:22:19 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 545643F7B4;
	Tue,  8 Sep 2026 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880943; bh=pUyEkl4bH7bjN7cz2XbK3Pl6rivIm/Z5yqVzikq2V+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsfPGzHPBxawavvaQDfuX6xD0H6IW52/osuv7hqwOc67pn/cj/YkkXtt/1jrlxNzT
	 WVk+e6qOQgpRhPfHB7PEz36ypDnGhg4WnDYxW75Np6Cl89QR7CflKXDb2cZwbRGoQb
	 Nj5ijfMl0b/t/WjRs6Z4b7GibxibRU68+z0zUnDY=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 12/21] arm64: entry: sdei: Restore all clobberable GPRs
Date: Tue,  8 Sep 2026 16:17:32 +0100
Message-Id: <20260908151741.394589-13-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_162224_381520_6D972539 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently __sdei_asm_handler() avoids restoring x20 to x27, as these are
not be clobbered by existing code. This is correct today, but it makes
it awkward to rework __sdei_asm_handler(). Given the rarity of SDEI
events, restoring x20 to x27 should not have a measurable impact.

Restore x20 to x27 when returning from an SDEI event handler. This will
free up those GPRs for usage in __sdei_asm_handler() prior to return.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/entry.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc6..a6ec5c5a2d29c 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -1044,10 +1044,14 @@ SYM_CODE_START(__sdei_asm_handler)
 	bl	__sdei_handler
 
 	msr	sp_el0, x28
-	/* restore regs >x17 that we clobbered */
+	/* restore regs >x17 that firmware won't restore */
 	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
-	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
 	ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
+	ldp	x20, x21, [x4, #SDEI_EVENT_INTREGS + 16 * 10]
+	ldp	x22, x23, [x4, #SDEI_EVENT_INTREGS + 16 * 11]
+	ldp	x24, x25, [x4, #SDEI_EVENT_INTREGS + 16 * 12]
+	ldp	x26, x27, [x4, #SDEI_EVENT_INTREGS + 16 * 13]
+	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
 	ldp	lr, x1, [x4, #SDEI_EVENT_INTREGS + S_LR]
 	mov	sp, x1
 
-- 
2.30.2


