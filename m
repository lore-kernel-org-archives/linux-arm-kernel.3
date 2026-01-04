Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D54C2A069
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df3Z6RKlukZJKt5/tUtKTYu9n9DGWqJ7aW4/X5F1X/Q=; b=PUTULDW4hR5mDsuL/3Lq8KfwWw
	0bLOiF5WyseG2zTsOtO+2o3QqmUM7IIFNfWxjHMjAoRypg6vgnyB+B1nRq5dN4NhIOJg1V7MFUjiY
	wBLK+U22XybdIx69h4qYQju6Ip+YJJKpeJMEnv1zEu8Vib+Yylab08CudqmhOoaMiuVXWFuhZkmGB
	xJr0q8tPaFtKPKnTbmjIn1KOAb6/koABKEHNt3yhmjjMLZV/FcgnJqM4meq0Kuh6EHoSHjJX4wIRZ
	GGtpbynaHgWuTqe832PFrFNoH090ftWWxokJjau8WBMstILlN7jMFo3zYM32Suzcw2EeODbkNJr1G
	btNaPpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZM-0000000AOml-4B7N;
	Sun, 04 Jan 2026 19:15:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZJ-0000000AOk4-1Wvk;
	Sun, 04 Jan 2026 19:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=Df3Z6RKlukZJKt5/tUtKTYu9n9DGWqJ7aW4/X5F1X/Q=; b=2UgbNcUtaOV3ZgkWhQudl2hpQL
	81ZGCkf8pW9ZdPmy5rbFnbWlsp0wuoa4BebETcdh1wgiOusFgyWxUtzjOW/jPspSPDsV4eAGykeMJ
	F2aE32RHnig6hiOL+vlz66UVFFk4uAokMJEq4ML5yJP0i51dO3xhTFTnNlstcVRe6SQI5N2gVGqDO
	Di66ZEbeVQ9gL23RFCzFmBvyGlgZ2AzHwyu/yz4dmGQFTx6Mcr4v6nBH8oCSur1TCsNSGF77pZIWO
	DPiYrqjV/4Vbl1rJwod9epdOImkzYTsFnBKimJTcDg+KOPIY+Q2u+l0d1noBA69GL9r9z2aa2ecQy
	996HMpqA==;
Received: from i53875ac4.versanet.de ([83.135.90.196] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vcTZ9-0012Mf-Vb; Sun, 04 Jan 2026 20:15:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	uwe@kleine-koenig.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: rockchip: Move SoC include to individual QNAP TSx33 boards
Date: Sun,  4 Jan 2026 20:14:44 +0100
Message-ID: <20260104191448.2693309-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260104191448.2693309-1-heiko@sntech.de>
References: <20260104191448.2693309-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_111513_406589_3A314D40 
X-CRM114-Status: GOOD (  13.48  )
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

The TS133 while mostly similar, is based around the RK3566 variant, so
needs a different SoC include.

By moving the SoC include to the board devicetrees, we can still keep
the shared common setup, while supporting the different base SoCs.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts  | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts  | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
index f16d1c628793..9a7d58e7ccc0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include "rk3568.dtsi"
 #include "rk3568-qnap-tsx33.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index d1e3b7e7a280..02d0974d79be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include "rk3568.dtsi"
 #include "rk3568-qnap-tsx33.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
index f009275c72c8..c372ca40fd50 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
@@ -1,7 +1,6 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/gpio/gpio.h>
-#include "rk3568.dtsi"
 
 / {
 	aliases {
-- 
2.47.2


