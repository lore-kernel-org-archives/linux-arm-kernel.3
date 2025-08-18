Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6ECA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OH1cdcIwLbHj9b9TDgmclt0bqqFEVSxJAiUw7x5ysn8=; b=Rz0L5leUdOu9t1zwEu+IBI+dPW
	07M1W2xz7WBYh2gK524ZegL2/6Zo8wOikb+xfKVdBaUL9gvsFOgdCRqpdBSQQAzBt9f9DEnr4BMo8
	PtjunmlDfkyQ/2gpdN5TA9+t8adC6zz76cViBqGx129ZWpx2+FTUP/F+grtOMpIpxL+FE1IjJzSKn
	29g6LC/mRrCJ+yKbISLM4NZ/1g2dIs8FotxzTL5iOTSR5hypgJEj+TdVUY8TQj8+7chwxVe4/jApg
	huhbuPGetKSSiWIuB3EH0sQFlyVmv0Fnp200d6/lwsdmqd5W4ERLFtJMjbZyjrSN9FV6RpO6rjMOk
	EwhgD5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Zd-00000008We6-2AhT;
	Mon, 18 Aug 2025 19:31:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4zG-00000008QCt-0S7B;
	Mon, 18 Aug 2025 18:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=OH1cdcIwLbHj9b9TDgmclt0bqqFEVSxJAiUw7x5ysn8=; b=adJ7g3Kjn4P3LsdRmu3hk6HtaR
	DrZGWCSghynMpZaa3+n+fwAGPMmSNxpR+z6JzqraYuEqykZSoccVE3GIeaNBzottpN+cDc9Xv/p2m
	NW17PtYVdgEMzbEveSZSbS2suFgeq/uCC763qnGqtFJoR1Wd1zi4crI3N5Mc6M0dgVaGCJkYr9sVU
	K7HtTcMHhMPlr/c21kjAO7RgH2rsd4WDBM0JQYbLsDYBMyHNxI+UwKAMocos1ZQieiOQ/B6CUSX6z
	YUF361pd9RfG8FYQhNhpy2Qz9SDUZP+KGZHy6UxT2oijRDzy/6uM2Jb2A32wBcx01V9lT6Eos+QQn
	HuUQoEoA==;
Received: from i53875ad4.versanet.de ([83.135.90.212] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uo4zE-0000jH-Qm; Mon, 18 Aug 2025 20:53:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: move cpu_thermal node to the correct position
Date: Mon, 18 Aug 2025 20:53:36 +0200
Message-ID: <20250818185337.2584590-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250818185337.2584590-1-heiko@sntech.de>
References: <20250818185337.2584590-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115342_144564_F9CE8447 
X-CRM114-Status: GOOD (  16.05  )
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

The &cpu_thermal node was added at the wrong position, move it to
the correctly sorted one.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 96 +++++++++----------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 6ae4316761c4..5656554ca284 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -196,6 +196,54 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+/*
+ * The MCU can provide system temperature too, but only by polling and of
+ * course also cannot set trip points. So attach to the cpu thermal-zone
+ * instead to control the fan.
+ */
+&cpu_thermal {
+	trips {
+		case_fan0: case-fan0 {
+			hysteresis = <2000>;
+			temperature = <35000>;
+			type = "active";
+		};
+
+		case_fan1: case-fan1 {
+			hysteresis = <2000>;
+			temperature = <45000>;
+			type = "active";
+		};
+
+		case_fan2: case-fan2 {
+			hysteresis = <2000>;
+			temperature = <65000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		/*
+		 * Always provide some air movement, due to small case
+		 * full of harddrives.
+		 */
+		map1 {
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+			trip = <&case_fan0>;
+		};
+
+		map2 {
+			cooling-device = <&fan 2 3>;
+			trip = <&case_fan1>;
+		};
+
+		map3 {
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+			trip = <&case_fan2>;
+		};
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
@@ -492,54 +540,6 @@ rgmii_phy0: ethernet-phy@3 {
 	};
 };
 
-/*
- * The MCU can provide system temperature too, but only by polling and of
- * course also cannot set trip points. So attach to the cpu thermal-zone
- * instead to control the fan.
- */
-&cpu_thermal {
-	trips {
-		case_fan0: case-fan0 {
-			hysteresis = <2000>;
-			temperature = <35000>;
-			type = "active";
-		};
-
-		case_fan1: case-fan1 {
-			hysteresis = <2000>;
-			temperature = <45000>;
-			type = "active";
-		};
-
-		case_fan2: case-fan2 {
-			hysteresis = <2000>;
-			temperature = <65000>;
-			type = "active";
-		};
-	};
-
-	cooling-maps {
-		/*
-		 * Always provide some air movement, due to small case
-		 * full of harddrives.
-		 */
-		map1 {
-			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
-			trip = <&case_fan0>;
-		};
-
-		map2 {
-			cooling-device = <&fan 2 3>;
-			trip = <&case_fan1>;
-		};
-
-		map3 {
-			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
-			trip = <&case_fan2>;
-		};
-	};
-};
-
 &pcie30phy {
 	data-lanes = <1 2>;
 	status = "okay";
-- 
2.47.2


