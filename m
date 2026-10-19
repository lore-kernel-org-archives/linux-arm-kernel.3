Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C55ACCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 04:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=; b=0iuHGm5xQ8pTtVy5mVsyvQgYyk
	/hkwBzCrKsDq/CbmZRZfVNllw2aa/XmpYplXbDRMu7uodwIgCbnNQ956mYpCvQpQAKSscTo8IZCsG
	tOQQonB/EE4/F8JXq9dy6Vkdk+0H5oR1AVzvZuELj6s7vkA2nk0U3SCcmQ20xW/2EhsRRvhXbM9hW
	8K/OdS57sGETOGVjeH+8HqzoJ3GrBUlQzNuEYjgFPSGJV46eOvn4LVcbRiwEdPV/5Is2Vxhlf0Bg3
	oZls9irf9HxSUjlqmHCyPo1c4QV/2y7oZ6z91Ok74eMZIbwdZQtrK42UoxstO+nyplEq37HwDBmjv
	hSX3G9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIfPY-00000006baB-3anP;
	Mon, 19 Oct 2026 04:55:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIfPX-00000006bZQ-2v55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 04:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAE174481F;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F11EC2BD00;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792385746;
	bh=zgU3iQM72YbxnsGmykO32NltLNkwhLgTNSOphGXHrLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dDUOh1najE5HwJKKBPGOlvwphz8vKNHYlwMo/Zn6uK+loUruSTaUzEUvMxDfgaraN
	 2nIZZjvStcCpi43Q3C2ToauRNydNK82MSgUATWoauDVw9J2I+X+fZs5H/b298Es4/0
	 SL9CqfWfWWV1HdM05mC3L4mJuXSfhxTbu3R+2xWc4QrA76RwKsQe+UNpaNUP9Fpdo/
	 DwK8aQVsp1Ln6iBJlA92v7ergIUmnepXm5JUL4w8M+fVOPdNV/1WtlX+8sTekM+OEs
	 v2bRE72xQeblrCDyUiCNB5hhnki940UNjgJVCILU+vyOygfUq90uxzpYwflKie4jNc
	 KP6iD96NrS9ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB86CCF2D3;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Mon, 19 Oct 2026 12:55:43 +0800
Subject: [PATCH v10 5/5] MAINTAINERS: add ARM/AMBARELLA SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-cv75-soc-v10-5-d386065e2dd5@ambarella.com>
References: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
In-Reply-To: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792385744; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=+2HZXt/Q1o7OE8loSEe3SRjzhikyIx1oW7WWR5j768z5zP8/8XhOMTTprPKVPUvp/qWlqsLLA
 h/uxZj1JR3oBcnfZXwmupuPJLt8PwULXa6I9OlYVXjJmUnMczA1BChx
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1



