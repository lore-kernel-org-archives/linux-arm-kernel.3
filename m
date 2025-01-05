Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF26E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bi3b0iaxAGMYq3H3T2oiDYRYb0F8Bg5ziLpCMOTKhfQ=; b=fOjrv9/N9Ov4GwAGSqSHmJNcxP
	o+TxTzEdnurLrWm7ILhxa01+LLULKV0QdiMSubD6sQDZV/v6g/D8sdEIgu88nA0o1nfyKfYXs1Pe3
	j5p7f74pU4skAVYUmQ9LaMn/ru7iRXXqw9Yg7eMEvu40zP4Udia98EqjC/KidS4tD82KbKj0GXvU7
	7aBsQe5yw4UZZDHuP3Lo/AJ/ck9JLZ7A3Hgvl9abvXy+CBYUJ30t3DlqChU2cChM33usvtRG9y/IP
	uhGQjQCPJKZkiUNQ/+Uh3DCDS9PH+NGXh4CTdcElQVDaykCj2wU66eOLWXlizP0e6rxmVZzyk2oe4
	OXkZ/yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOeU-0000000Gjey-1eUy;
	Sun, 05 Jan 2025 11:18:38 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOdJ-0000000GjYx-14kz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 11:17:26 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=SM6yMRd3Hqtj0r2xYpEIYXlc91x+C2N52mU8JPCbBEX16cExNWDnvZhtrGJeopLEdi2jLDOuF7MrzCsZ1Bit5lVG2sJiuPQtta5rGvNVJkirPMrj5lPOwZkj+C38pPMKLsDrKQOQZ69KhE3d3SBhqxxlvJ6AEruIsasTWkNL2scmhRkoMoJ2iYNVqFso4lMY9PlG5c5IRt/KnB021wgXk1yxRzjTO+3tYlaZ7Os9gxZhxHLMX2vcUSZbw6dAKKSlFMsXu9W90pk7vbY6Yzx4PlDog+VfM3ihz9MfQ8jLuUwb+G6IoBq5WY3BD4PuoMF+E6Xh0ctycNLXduSJnBsysA==; s=purelymail3; d=purelymail.com; v=1; bh=ihccTKagyfOXUt72u6sJq5P8m6g06t7vUfHKvBhxIfE=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 785472672;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 11:17:13 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 05 Jan 2025 12:16:03 +0100
Subject: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAPJpemcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwNT3YLcUt3i/KKSzLx03dRkM0tTkySzJDNTSyWgjoKi1LTMCrBp0bG
 1tQBMP4PPXQAAAA==
X-Change-ID: 20250105-pmu-sorting-ec6954b6b659
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736075832; l=2748;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=ihccTKagyfOXUt72u6sJq5P8m6g06t7vUfHKvBhxIfE=;
 b=djFv+D0LC/0LU7YAQlvFmm1QzIGBu5KXkOnfENoAQncUpXjP2wpa5OozY7dHC2GqAKs4u/8Eh
 PwWZTnJ1OF4AJD0rJbkry67MhrQqYmFhyi2D3I9ueNQNK9+T/1xqNh/
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_031725_490128_0BD35886 
X-CRM114-Status: UNSURE (   9.65  )
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

These nodes were sorted by name, but it's nice to have the same class of
devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
This keeps consistency between other Exynos SoCs too.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 62 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 9d017dbed9523e874891f13258d331c3e829ca03..fc2c5049d764c3f50be7337bc777bb9561f88790 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -25,37 +25,6 @@ aliases {
 		pinctrl6 = &pinctrl_vts;
 	};
 
-	arm-a55-pmu {
-		compatible = "arm,cortex-a55-pmu";
-		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-affinity = <&cpu0>,
-				     <&cpu1>,
-				     <&cpu2>,
-				     <&cpu3>;
-	};
-
-	arm-a76-pmu {
-		compatible = "arm,cortex-a76-pmu";
-		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-affinity = <&cpu4>,
-				     <&cpu5>;
-	};
-
-	mongoose-m5-pmu {
-		compatible = "samsung,mongoose-pmu";
-		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-affinity = <&cpu6>,
-				     <&cpu7>;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -163,6 +132,37 @@ oscclk: clock-osc {
 		clock-output-names = "oscclk";
 	};
 
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>;
+	};
+
+	pmu-mongoose-m5 {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu6>,
+				     <&cpu7>;
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "hvc";

---
base-commit: 7c19e0e190aebd1c879a3913f1a8855a88d73a2a
change-id: 20250105-pmu-sorting-ec6954b6b659

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


