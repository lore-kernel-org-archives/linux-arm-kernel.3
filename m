Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF00CCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWUfbOwLRmgvifQwuHOsnJSFyVzOli75ouengbmsVxs=; b=Nh/i2vn0Sy1SmV6tIPbGg299Ns
	jZksWXX2F67k1dsXsWtEhK1BOmr0KEyuUZl06sM0nYc5Expt5OQ3/O7gzYRDsP8BEb3O94KobHeDQ
	9fq96LSCEDHqVnqDydjAy3TGZFAo3y0rePZziREIHmcr8nKWnOTI1xICEGh4xTzSL1g3U6+iniU/l
	0hfC8NTW4/kGo/dvJBrIrwnWuDyXhuNxGcPyYXruLss2NEA+gx5JOLmWdIIH4+aX/ol29bs1uNzdY
	z3XM6QiFlzVtFQFM0rXRoOM+eiUBN+pP5gbYY7+tgh8IqQV3Q7oJb2TZpzblnQ7CaaciDPVZ9qxyO
	0lENapxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY7-00000003XKN-2qsM;
	Fri, 16 Oct 2026 17:16:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY6-00000003XII-2L5C;
	Fri, 16 Oct 2026 17:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2108144011;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC8B9C2BD00;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171014;
	bh=j5PGiHN8MxOx6b2HlHbfR/xFaJPKZMsv4wXCLcjvvas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KoO4b2rBwtijMrAX0mj1df/DJ0qQtegIfs6I81wa6Y3NTS0tbruAOpeF14beD6kdO
	 cMj1bpibMVy3Cu3+7vaf0vKPiZUN/HuYmgNrcEDkiu/XMf6kLIrNiV2Kt7wGsnHkco
	 +Q5EKaM11IcGypafrOIog+YEjDWIt2tjuPOdZOIhw7JqRDWe+vc37kMIQH1xvfsbdN
	 v8srCdaHQjtexwNmODjujJDdWGNMmj4Xezo3sFrrAzpGEN88u94Oh2vLFJZvTZOIKP
	 ouY0tegWUYrvH1sqSVvW3ivKYnLzZBK5C+HRKhiQztsDDidm/s7Jlq8yufsAH8gA+m
	 TGa4McARf/7AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B13CCF2C2;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 16 Oct 2026 19:16:09 +0200
Subject: [PATCH v7 3/4] arm64: dts: amlogic: t7: Add thermal zones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-add-thermal-t7-vim4-v7-3-6eede5450fd4@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5125;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=52I+VOEdRiSnUkjtrqlQ7dMwblwo8ibc7BbApDWcABI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9alGIYlxmmLDD/+nPtxdX9A1N65M0REq3dt3nT27qyZX
 muyTWcf6ShlYRDjYpAVU2Tpn2t54t3lo2e+7lFPgZnDygQyhIGLUwAmcuskw/985T2sRz2uxCtP
 fpHeLtbOcjzQn93LwDhjYsP+U2IWLkkM/6zObhZ1vfFCc+nu5oWlx37OdX9YvSnnSPKXcsULm2P
 mfGcFAA==
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

Add thermal zones for all six sensors: a53, a73, gpu, nna, vpu, and hevc.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 179 ++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c81632d3984e8..52e106d931db0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/amlogic,t7-scmi.h>
 #include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -885,6 +886,184 @@ hevc_tsensor: temperature-sensor@9a000 {
 				amlogic,secure-monitor = <&sm 5>;
 			};
 		};
+	};
+
+	thermal-zones {
+		a53_thermal: a53-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&a53_tsensor>;
+
+			trips {
+				a53_passive: a53-passive {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "passive";
+				};
+
+				a53_hot: a53-hot {
+					temperature = <95000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "hot";
+				};
+
+				a53_critical: a53-critical {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-a53 {
+					trip = <&a53_passive>;
+					cooling-device =
+						<&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		a73_thermal: a73-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&a73_tsensor>;
+
+			trips {
+				a73_passive: a73-passive {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "passive";
+				};
 
+				a73_hot: a73-hot {
+					temperature = <95000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "hot";
+				};
+
+				a73_critical: a73-critical {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-a73 {
+					trip = <&a73_passive>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu_thermal: gpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&gpu_tsensor>;
+
+			trips {
+				gpu_passive: gpu-passive {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu_hot: gpu-hot {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu_critical: gpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		hevc_thermal: hevc-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&hevc_tsensor>;
+
+			trips {
+				hevc_passive: hevc-passive {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				hevc_hot: hevc-hot {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				hevc_critical: hevc-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nna_thermal: nna-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&nna_tsensor>;
+
+			trips {
+				nna_passive: nna-passive {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nna_hot: nna-hot {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nna_critical: nna-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vpu_thermal: vpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&vpu_tsensor>;
+
+			trips {
+				vpu_passive: vpu-passive {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				vpu_hot: vpu-hot {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				vpu_critical: vpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
 	};
 };

-- 
2.49.0



