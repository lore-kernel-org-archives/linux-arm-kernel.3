Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34809CCF2C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR39sy8DNKw1ZDp7svnLRx/eWgcsHY1Z/PHczB4iT6o=; b=UQ4/q7wssIvmTnNA+pc4tx5e5a
	2frvstSsDao75wTPK5mn0rPsbYwkGFCne347owUsTVI9QkXuM+3c/76icNy/zg/sTjhGy9SHkYJew
	f2rDZyGB9rp9xUD8bsCthgSv7VLUQpWNGTuufPVGG2CRCgnVeug3pgu5AfoB/c4o5skwL+PSV05YJ
	YVstsuMMmv+h3rjPqF3sRh3JWqhvi6HL6g4ghZCAdMbrqPdUhqkd0tHlIBzark3kYiwm7i546e4U4
	d166jsBeCTC4EQ06Diz2woBLCuUH3OD0ZZgQNxV6+MPOwJEKJRfOiXcoXlQ1V+Ki9aR+gspJKqzKA
	v0edLHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY7-00000003XJn-1zcA;
	Fri, 16 Oct 2026 17:16:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY6-00000003XIH-2MvN;
	Fri, 16 Oct 2026 17:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12A5143EC4;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0593C2BCFB;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171013;
	bh=N8NEwzojQLQla3jklAl3N85hxfcgpsBNXfZR/hJZlhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WZNy3kvdk9rjaubTdFjrB3M+jaV03tomFfvC/t3Jb/uVwh6aoKwTeGskC/Mvs8o4H
	 LPRCX+o5EqaxKq+X0RwTITSB/iJG2683GpGWFyWakLn41LEdVjswHJeW6xw4xJAJXQ
	 4FVyysetUBhbuTGb2DJLyX7eH9M+m1/JF6iAgyVs6RPEae8NKlkmulb9VUurwvi5OY
	 LaAg3QAntgbmwa0Q2/gCsScsmb2P9ZJC//OXmSrJDQ6efcVvF8+SXjuf3Wbz7xc3p1
	 Qf2NCvxBd4hAOGIGtMcN8mxqFkNS9J8BhAms9rgA1ovW20tUBTnTkeb1SGK4G5Mnmt
	 KAcsfNOjKzYrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D9CCA462;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 16 Oct 2026 19:16:08 +0200
Subject: [PATCH v7 2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=rtWuGUHxUnyMFKCauIYV7dFBkIsewyYeUUnSeGS6n8c=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9al6L9xesu5MirzSo6qR09S27CcNdhW2ED5m/SB+z+3u
 R/ZOcOvo5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZhIOwfDf8+XkrzCQQn/m49f
 XtS+bvnupQ3r5TY9+p31ZrLP06ZbyVyMDOu3+ThrVf197at6tUjRYsE5/4YTO1deTLGViJrbzyC
 wlxsA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add six temperature sensor nodes using the amlogic,t7-thermal compatible:
a73, a53, gpu, nna, vpu, and hevc. Each sensor retrieves its calibration
data from the secure monitor via the amlogic,secure-monitor phandle with
the corresponding tsensor_id argument.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8aa85aab30469..c81632d3984e8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -696,6 +696,26 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			a73_tsensor: temperature-sensor@20000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_A73>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 1>;
+			};
+
+			a53_tsensor: temperature-sensor@22000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x22000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_A53>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 2>;
+			};
+
 			pwm_ao_ef: pwm@30000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x30000 0x0 0x24>;
@@ -818,6 +838,52 @@ sd_emmc_c: mmc@8c000 {
 				assigned-clock-parents = <&xtal>;
 				status = "disabled";
 			};
+
+			gpu_tsensor: temperature-sensor@94000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x94000 0x0 0x50>;
+				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_GPU>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_MALI_TOP_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 3>;
+			};
+
+			nna_tsensor: temperature-sensor@96000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x96000 0x0 0x50>;
+				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_NNA>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_NNA_TOP_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 4>;
+			};
+
+			vpu_tsensor: temperature-sensor@98000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x98000 0x0 0x50>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_VPU>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_VPU_HDMI_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 6>;
+			};
+
+			hevc_tsensor: temperature-sensor@9a000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x9a000 0x0 0x50>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =
+					<&clkc_periphs CLKID_SYS_TS_HEVC>,
+					<&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_DOS_HEVC_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 5>;
+			};
 		};
 
 	};

-- 
2.49.0



