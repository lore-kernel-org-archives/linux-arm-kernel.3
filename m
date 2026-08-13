Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2129EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXtwe5b9kaAIJD3I4Sv2SVuC9mzCwMD5FZDQNwnTjVQ=; b=F15lmmKO+rji7FDg0VziTlxWcB
	nAq5HZrrpW/Vfrr1133NjZu3zAaF9H1/EP+9CUfLQnaHxENo+7oL4eyFsjxAJiRG5GtKpLwsibhzl
	C0q1Wf2FhvGBTO8ECPNUPgow0nbxF5BkATTZiRdm2v7KV17HNEy9++ltL8XnGkuU/OENvPVdxfU8B
	1v3vcfZOalCatDLNBRchv9tuoBuBaYON1TW7ttAVAIYIYoqIsYRBGr36zVmi6qW6I7fvfFefoMmmh
	tBxzs5aJn5rNfpwssQK8/jBx8X6JXfS3Ky94JQft0QhJ5183SIdB6yeB/40YgrHveRfcWs53mOWbx
	3ne5xoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBU-00000000OVL-3ooc;
	Thu, 13 Aug 2026 09:57:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBU-00000000OTA-075N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9137644082;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 712CFC2BD05;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=u1O2yyg4IFgXvWdBWEfBf7DSbFAtEAmAyY6MwVpsw88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rBSuYI8PDxgBrevDwj5Va/zkiTPCOCJSYDpXxDYqy7D6z3qOSW+N3MtWqy4GcGsUJ
	 Fg8S/Fh3jG4oLSCk87gwvXQtZSRpk/xCp2Rk+bQwiVMJFCfq9dz5/HPNkOSrvdCHUo
	 m4X4xwyx7Th4+d6RBto8WSncZHnozJ+BCyNiqRSb/ewvYF5tfT76QdDHNaCFLmSa7X
	 wNExHkXwteFYTcR6zKHbXijuU7xW5PuSL59IbE9yDbT2HBtKmeZzb2Qu86x3GBJeOn
	 inPgO5Agc3qTGuhJk0WKzLVJQnuYu8gbLW/SxmrGe664WrIopAU6xTbsdKZ1gbQnJo
	 qRTGKDRsHEFHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D1C5DF66;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:17 +0800
Subject: [PATCH v3 6/6] MAINTAINERS: add ARM/AMBARELLA SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-6-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=1193;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=FMdxZub31R7avQT3Ojw4RWRGTKHK7OVLHXgrDSDBBvo=;
 b=/IQi7jn1+JWAK5SDTA0CYa9LQ8IsAgoKCWXSJ1vjrygfa08jTqnQYQK7RoBkFPXbPUzRStR44
 Tt0+6EgTg3iC0Wg4BUURRCOrjGJpk7Jik3Csir8PaPEUJignncdS9I2
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



