Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E0CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Lv9o061EuaZrXJeVsbV30sxFkjrU+JEV+O5HKiQ/VQ=; b=TUw632KerA4PePilcISkNbLDcU
	WsDZbQDOMtmcXdrSUg8Y/4NnNEexEek+oTw9PixAdeVRrPuPPxT9Qghis7LKdvJqzPRrIWEiFMXdU
	tYcvPHvv+e5RCbvSq3Xgt3JEzabzdu+LuS9We5/WXoJ8tQM4UShVuUM3U7zah9c1MySu+n8dDJ5Ah
	9xDALC7RaNC657c3ml7kH4uxYbu4HJfGFFtVVBmgApKr+0mW+Bi4zvgXLSXlv9DyLngrH6VXLgb75
	2kVZFv7uLBjwqIhZUehdNqaoN4vWBJMA/Czd//SMZWDXQ86hKULNsDCt7gnnHwDCoRv/AvPFWPD++
	pDlHHPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Oc-00000005bqD-2ZbJ;
	Sat, 20 Sep 2025 16:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OM-00000005bde-1CZh;
	Sat, 20 Sep 2025 16:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D32244CCA;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D867C113CF;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=qb2+EkBXp7Hgrg+P1wF5GIqdIOe/IYDimtrwxuCDjmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F/qrcZPWLw7tQe9MPG1XnGMnfhs3LFogPoB66NSxfnupZ4kB94+6FTQTT2mT4JRYh
	 9yVbrZfDqcMfULLP/ge8vdGq9hVNtM3IlDRDJQl8B2vKuVpBWvBDpY9mV9yKRz7yR4
	 onxgpfZW3wNPPfNbr5SBplumk0d85wg2y2F03s6C49lihE9WAT397Ig1fZEZYx7xIF
	 3NmZZfpDLU0N7D/3ubbfUVgx+w/4CfI+OYnqBObXTImN2DMfp9pAiTvnrOD99286IN
	 cRgkvfkZLtCirrvEeKVynuAWy7o36/Dvc3XC4SwGSEyJhcd6TRO6U1D0CnQukiHMYs
	 B9IqE6Nud0xSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A34CAC5AD;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:29 +0200
Subject: [PATCH 04/10] ARM: dts: mediatek: mt6582: sort nodes and
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-4-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=3996;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=Z1S2PzSFTRUHdm6e5KvQH8f0VJGVi1iLBc3KX94/HbU=;
 b=FQWueJz6fpe77OaZh5ItLntT/nNPCZOu63nJSRYJV7jq1NjhxWRXdvUnJxw9UR4CUIP3IznxY
 UHp1qlhmqfVCmY0/5UixAQOQI4bbNxzXkG2hfTt/7J2KCsgnT8JYP8a
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092454_373938_10C049AD 
X-CRM114-Status: GOOD (  10.37  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Sort fixed clocks nodes by clock frequency and memory mapped device
nodes by reg address. Also, sort properties as shown in dt-bindings
examples.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6582.dtsi | 46 +++++++++++++++-------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index 37d2b8786188aecb65c0a6e0d31aabc3b66e2bd7..8ada8c6518661509ebee647367064187f4376ab9 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -13,8 +13,8 @@ / {
 	interrupt-parent = <&sysirq>;
 
 	cpus {
-		#address-cells = <1>;
 		#size-cells = <0>;
+		#address-cells = <1>;
 
 		cpu@0 {
 			device_type = "cpu";
@@ -38,22 +38,22 @@ cpu@3 {
 		};
 	};
 
-	system_clk: dummy13m {
+	uart_clk: dummy26m {
 		compatible = "fixed-clock";
-		clock-frequency = <13000000>;
 		#clock-cells = <0>;
+		clock-frequency = <26000000>;
 	};
 
-	rtc_clk: dummy32k {
+	system_clk: dummy13m {
 		compatible = "fixed-clock";
-		clock-frequency = <32000>;
 		#clock-cells = <0>;
+		clock-frequency = <13000000>;
 	};
 
-	uart_clk: dummy26m {
+	rtc_clk: dummy32k {
 		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
 		#clock-cells = <0>;
+		clock-frequency = <32000>;
 	};
 
 	soc {
@@ -62,6 +62,11 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt6582-wdt", "mediatek,mt6589-wdt";
+			reg = <0x10007000 0x100>;
+		};
+
 		timer: timer@11008000 {
 			compatible = "mediatek,mt6577-timer";
 			reg = <0x10008000 0x80>;
@@ -71,18 +76,17 @@ timer: timer@11008000 {
 		};
 
 		sysirq: interrupt-controller@10200100 {
-			compatible = "mediatek,mt6582-sysirq",
-				     "mediatek,mt6577-sysirq";
+			compatible = "mediatek,mt6582-sysirq", "mediatek,mt6577-sysirq";
+			reg = <0x10200100 0x1c>;
+			interrupt-parent = <&gic>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
-			interrupt-parent = <&gic>;
-			reg = <0x10200100 0x1c>;
 		};
 
 		gic: interrupt-controller@10211000 {
 			compatible = "arm,cortex-a7-gic";
-			interrupt-controller;
 			#interrupt-cells = <3>;
+			interrupt-controller;
 			interrupt-parent = <&gic>;
 			reg = <0x10211000 0x1000>,
 			      <0x10212000 0x2000>,
@@ -91,8 +95,7 @@ gic: interrupt-controller@10211000 {
 		};
 
 		uart0: serial@11002000 {
-			compatible = "mediatek,mt6582-uart",
-				     "mediatek,mt6577-uart";
+			compatible = "mediatek,mt6582-uart", "mediatek,mt6577-uart";
 			reg = <0x11002000 0x400>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
@@ -100,8 +103,7 @@ uart0: serial@11002000 {
 		};
 
 		uart1: serial@11003000 {
-			compatible = "mediatek,mt6582-uart",
-				     "mediatek,mt6577-uart";
+			compatible = "mediatek,mt6582-uart", "mediatek,mt6577-uart";
 			reg = <0x11003000 0x400>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
@@ -109,8 +111,7 @@ uart1: serial@11003000 {
 		};
 
 		uart2: serial@11004000 {
-			compatible = "mediatek,mt6582-uart",
-				     "mediatek,mt6577-uart";
+			compatible = "mediatek,mt6582-uart", "mediatek,mt6577-uart";
 			reg = <0x11004000 0x400>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
@@ -118,18 +119,11 @@ uart2: serial@11004000 {
 		};
 
 		uart3: serial@11005000 {
-			compatible = "mediatek,mt6582-uart",
-				     "mediatek,mt6577-uart";
+			compatible = "mediatek,mt6582-uart", "mediatek,mt6577-uart";
 			reg = <0x11005000 0x400>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&uart_clk>;
 			status = "disabled";
 		};
-
-		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt6582-wdt",
-				     "mediatek,mt6589-wdt";
-			reg = <0x10007000 0x100>;
-		};
 	};
 };

-- 
2.49.0



