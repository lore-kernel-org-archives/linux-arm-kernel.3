Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F9FED3EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5jKYK3SVCBM5M3v1mWTtrIjlLHTeh+s6YWPEKI1oME=; b=X0yxZHdNHRI9eaZmaVmNX0XnTq
	uLBzLBx65lf9ur+CFKziDjIXXPOc1Ef0eLw1VcGq21P9y/+g8RBedyTAGlFZGPOWwAlPU1B+DPcAu
	o6CNWSb4rW4dhmMX2J/oOKks8rYeXzMmvJEVGtsmY+UeuiN8jDP5S+/N7veOsxF/SImv3LPd+/W9P
	rSbI7VMKbbzYr6T2h+yvmDUrJNC+vDPBWQQuARYGYfnT/91M01aG1ANP8/V4TeY819Yjxm9ru5zFo
	9YtC+PvMgmqp8rfq+M7m+IFHRvAJBate0WsrHoc/EoxnYYyhqlR76bFHTu4PC/dlHQOcscA0Mbwwk
	pk5VAHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIkv-0000000DP3i-3AA5;
	Fri, 24 Apr 2026 15:47:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIkk-0000000DOvI-2Fso;
	Fri, 24 Apr 2026 15:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56A3E446F8;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35ECEC2BCF5;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777045656;
	bh=FWFOLyF0x63/LZtObhZ1J4jCUtWE2TThSzrDcSn/OZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YkPaXvEhFirAM1TLs8tPKmtOxcP/Q2eDBqOh1XoQobziFGpR4j9ef74jPhce/Ylj+
	 d9+h6cfCvKEzKGxF7KFaPJskbsMa2y86vRhsssxYlp8rRPnEw5puvXduMtKXR6eECP
	 8tekguDeNggNAKkfnHO1YH8CJLY7ltuTrsYXmi8huQ+f/VC/gglvv+BpGJ2Xai55vw
	 76ku3Ubk/SPA0iLtlybfoTAJLfzoqTBJ9zHy5LInaWExmnI/0xZHBFOx/LqR7HYf91
	 rBmV8dHrfZHLysyrPe8OcoezzGN3skBg1Zjs3sncTiBqos1ZAXnT1O9MjYESvAUEy4
	 UcdymyBStb5/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC4EFED3EC;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 17:45:14 +0200
Subject: [PATCH v5 6/8] arm64: dts: amlogic: t7: Add thermal sensor nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-add-thermal-t7-vim4-v5-6-9040ca36afe2@aliel.fr>
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
In-Reply-To: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=a30MjY4dgn60IwOqeBdliR8IJEpyrJadRABAdDxz05M=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brCRPqWg3qp8zRLXr2rFp++43GJXO6lsX5Vb3bGufG+
 EPuo6BSRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRbe8ZGY551a22thf1jvjx
 Zn3/xdtB/rKlbf8DZRYFV19eFM59tZrhv8uP111rpJ2eFx2Q6PQ9uvvvil0fP0tLOnotebKgrGD
 jEWYA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_084738_622876_E157A5B6 
X-CRM114-Status: UNSURE (   6.75  )
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
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7aec65f036a9c..62f259b2b17d2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -656,6 +656,24 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			a73_tsensor: temperature-sensor@20000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 1>;
+			};
+
+			a53_tsensor: temperature-sensor@22000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x22000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 2>;
+			};
+
 			pwm_ao_ef: pwm@30000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x30000 0x0 0x24>;
@@ -770,6 +788,46 @@ sd_emmc_c: mmc@8c000 {
 				assigned-clock-parents = <&xtal>;
 				status = "disabled";
 			};
+
+			gpu_tsensor: temperature-sensor@94000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x94000 0x0 0x50>;
+				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				power-domains = <&pwrc PWRC_T7_MALI_TOP_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 3>;
+			};
+
+			nna_tsensor: temperature-sensor@96000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x96000 0x0 0x50>;
+				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				power-domains = <&pwrc PWRC_T7_NNA_TOP_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 4>;
+			};
+
+			vpu_tsensor: temperature-sensor@98000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x98000 0x0 0x50>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				power-domains = <&pwrc PWRC_T7_VPU_HDMI_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 6>;
+			};
+
+			hevc_tsensor: temperature-sensor@9a000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x9a000 0x0 0x50>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				power-domains = <&pwrc PWRC_T7_DOS_HEVC_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 5>;
+			};
 		};
 
 	};

-- 
2.49.0



