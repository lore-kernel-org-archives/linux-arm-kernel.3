Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97057C44518
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI+cUwEfyE2a+gu1ATLfc07lH9nySXv25IWkxp3VnGc=; b=Sfz3NmR2fJQWrfII/AQqTP3wnp
	n7Zr6tWUIc1rVk3mATuOQho1AYKen5OHI5RsGvXdbKxYAIukvQpA3npnXm7AZ8LNdLPQzHZW0xTta
	OcLtwX2wZ/n3PPJgqVl7Zf5EVkESQBCcNyQemjZE0dlt+1cpMKMhTFMPVmzUu5yAGd81/7BZe1Ui1
	6rzsXAiOuTU5iiLbQbjBnUJ0xpPLJkevYSdOTd3m2p3RERCFsHCgLAR6hcY6jQJdLPXeSxV1jH3JP
	yHdPO3am4C//KSK1jrYGFFobZRjLyd2a3d7GdYYAQsY6IuSgHvFDPCCFqrh6FZDxsTz0udUQwIsT8
	rsufIllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPfw-00000000F6M-0QyU;
	Thu, 16 Jul 2026 17:15:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPft-00000000F4f-3eia
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 341FF423E3;
	Thu, 16 Jul 2026 17:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BAF0C2BCF5;
	Thu, 16 Jul 2026 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222105;
	bh=hBEunpQWvteHiQBkH6asR7vbgoJFracR/Af+GMB/nmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M/b6fDHrwKdK46qiPKEL7v2r5Uf+EkYj4Xl1q2FVzoSMoZ/VvmWuMZ3EIzztEHFsL
	 gxG6iEE2+p5hiov/tdD2dNRWQWLrdOvNnFxcgzP7gPQtM4gv+9gpyYEz0vd+3inL1E
	 V9i1RjOXP6Rq3nxq2lkZ4OfJZLWMnkOHkNro5ckjkLG55oqWsalHGuNZuJAgOstvX+
	 oBab+/MJJXuuRIOp0ta1Dg388N9vkm3W3jPWVsC2CXc0Xt4pEnxrpvFEw9fjc04dip
	 S2FKUDZ/CmBzgshjFtvQRXpfBtqcupYvJAZyObWTercaiEMJE58h41TGVOpiXLVqdV
	 Uw48/+VHiiNKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2E5C44518;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Date: Thu, 16 Jul 2026 20:14:59 +0300
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for Exynos9610
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-exynos9610-clocks-v2-5-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
In-Reply-To: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=938;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=E1bSKMgEPtMif3Sdy3gDrAXfrBKn4CyIguCFFF+2z0k=;
 b=n/yIIHt/0i3lrYnCiW57+C73q+GrdrF3E7W62qTJpaUVRoTX6GF8REncb6qpBXC4Vi3Pmmib5
 ftMoztZEG5iCYzMucGoacXv/Vte2XaNiRBji4c8FcG2Ye0qwqxLIeis
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
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
Reply-To: alex@chimac.ro
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandru Chimac <alex@chimac.ro>

Add maintainers entry for Samsung Exynos9610-based platforms.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd2c02840336..7c26c3ce1696 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24073,6 +24073,15 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	arch/arm64/boot/dts/exynos/exynos8855*
 
+SAMSUNG EXYNOS9610 SoC SUPPORT
+M:	Alexandru Chimac <alex@chimac.ro>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.yaml
+F:	drivers/clk/samsung/clk-exynos9610.c
+F:	include/dt-bindings/clock/samsung,exynos9610-cmu.h
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0



