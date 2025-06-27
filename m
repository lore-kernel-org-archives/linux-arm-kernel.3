Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C1C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yj3XMBNCtAxRXf3xdEbKn11k/ymHDdZg+9AzRzbtJkg=; b=UW+zOY6tuBnpC5WO5N375gW2TU
	Ya6Eevd2DS12US0vkeRArV6EnCc6M/AdpMCaYqwdNeKeLxlvzbKZ96l1fZOTrXIfZzVF97YC3ztCZ
	XG2JDfihRYNNOa7rF2vyGC4OArYOIs0CTRQ84czqSXqengz3IMpeFCeO2TVamN+UswPzAg7+gAI5w
	FGxsKYbv7ysrFGya2+DIi54jld4HM16qeLRbZJQ//2n5hlFTnllqpOG/V6Hi/k0clI67OIM9D7sLT
	cRFhyyqoHfFa+3+pbXPvsemnHu1GAh7kYQudbEK8ZHQwQdfJXy6RNmiQJqxm9P8HctKbpV24nlOIv
	cb0cQUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBo0-0000000FEhY-2cju;
	Fri, 27 Jun 2025 16:20:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB19-0000000F6dz-1VAm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84B20A52FAE;
	Fri, 27 Jun 2025 15:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3042C4CEF3;
	Fri, 27 Jun 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751038170;
	bh=LsM/oKAoyeVrerWCsGQ8qkJnLZGaVDxv1+0mdy8Bbow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WenOP8PHK54BpguPCGqN18tbpif+eHEwWcahV5qmVT/6mzlrR/UYs8eZWUf0uLGtq
	 ctzHnFY1AEgvkiJK9SH+iK7T9KOLa6BATLbG9HoNaJBpMNgf7gAoUjtKEdMEBc/BIH
	 T1knLPaUKHZCXMfvmFEcLximJTRYKJQtJTm/IDxB3fIn1sKOt/4QMPnSWjQYH6jvec
	 WaTHuq6PK8059ndMHc9Zvkp0gkP0dzAiM7D0Q9d+bYY4JGXAhJLO2NeImTPRjU1tJD
	 tM0ug3rBiz9+ymzGK6y71ZPG8D9V+qkqInbENL3CrVZibO+YbGArB3Wd8nJsVvfUU0
	 8dP1I/pq56IBg==
Received: by wens.tw (Postfix, from userid 1000)
	id 456665FFC8; Fri, 27 Jun 2025 23:29:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: allwinner: a523: Add power controller device nodes
Date: Fri, 27 Jun 2025 23:29:18 +0800
Message-Id: <20250627152918.2606728-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250627152918.2606728-1-wens@kernel.org>
References: <20250627152918.2606728-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082931_466454_7BE7BDFD 
X-CRM114-Status: GOOD (  11.64  )
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

From: Chen-Yu Tsai <wens@csie.org>

The A523 SoC family has two power controllers, one based on the existing
PPU, and one newer one based on ARM's PCK-600.

Add device nodes for both of them.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 6f62201fd739..255e0ef98219 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+#include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+#include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -576,6 +578,14 @@ mdio0: mdio {
 			};
 		};
 
+		ppu: power-controller@7001400 {
+			compatible = "allwinner,sun55i-a523-ppu";
+			reg = <0x07001400 0x400>;
+			clocks = <&r_ccu CLK_BUS_R_PPU1>;
+			resets = <&r_ccu RST_BUS_R_PPU1>;
+			#power-domain-cells = <1>;
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun55i-a523-r-ccu";
 			reg = <0x7010000 0x250>;
@@ -622,6 +632,14 @@ r_i2c_pins: r-i2c-pins {
 			};
 		};
 
+		pck600: power-controller@7060000 {
+			compatible = "allwinner,sun55i-a523-pck-600";
+			reg = <0x07060000 0x8000>;
+			clocks = <&r_ccu CLK_BUS_R_PPU0>;
+			resets = <&r_ccu RST_BUS_R_PPU0>;
+			#power-domain-cells = <1>;
+		};
+
 		r_i2c0: i2c@7081400 {
 			compatible = "allwinner,sun55i-a523-i2c",
 				     "allwinner,sun8i-v536-i2c",
-- 
2.39.5


