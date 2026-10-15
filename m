Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3A0C2D0A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/2nlJKeMHzRGJoz3ngrUIKM3zER3xTjgVTcUe81TFQ=; b=NsXGkYGvZ4PJAKQYB01A7cgM6F
	dW0XPfAtkgcBIhhLReR1KSL/pKE8W2JkSS/0YMkfFORCKj1LoR+F5KLhp6c1ZmjPOWn02t1/dmV2b
	so9vQu84nN7n7x5IQshiCWa8NBaT2oFtbWv8h0YzDFTP2Ojd0s9CLERYvnGR+pvDWlqpPoqmBXcX2
	EpaKIUam7y+cUG5NPmSD1ulK7cICtrCRifExv9aCswTDTyj37JAeRzVeqST53FNYxEKyefVokWqzL
	gvYkLrJp+X70Bf4/s3pV2b9fgoHSPjz+lTduJt9rIsZ3iIW8XrUD9jSM3tQTsC79VBBskOJA2nq3t
	x0b3B4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfn-000000013oR-3ZkM;
	Thu, 15 Oct 2026 17:55:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfl-000000013nE-2H4X;
	Thu, 15 Oct 2026 17:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18E5A4479B;
	Thu, 15 Oct 2026 17:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFF50C2BD00;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792086920;
	bh=/JenFN3bz6fw80osHxU1tpnQrOoApF4JacLry3vDh+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AE2vhVI/9pAdh1ZINwpGV4zIK71JFUY18770dsbpAbQrRPg6FYW3CYrHvgn0HhRyT
	 gJa8eIY7XTuROSok3mukokwcBoCtNiV9m7abFY7ODAK3Q7WUU8jsXFGX41CNpdluFt
	 bK965LhG6iLnIJuDoFdRpHhKJhmusmxmmxymgHFSeo3cIIDV1jd1jCEn+RijnhoNQR
	 PjK5xL1QZMmTAuyjBH74Mt9p0zBLasChFdzNeSEjElJ0S2kralIV7F77x+CvBAnu1p
	 +wZr1FbeP52eaSar+Vk5gsjyRo3x+8G7fWR21wIGJfRzIhwdypdpH2JAcQWgKJUcSL
	 d2BhjOAOViCfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FF6CCA465;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 15 Oct 2026 19:54:11 +0200
Subject: [PATCH v6 3/4] arm64: dts: amlogic: t7: Add thermal zones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
In-Reply-To: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5141;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=wIHFSWTa/ahxGaNhARxAPcmftNjWS1UV0jpS/csXAdE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZF4bqSi37ZKcwRFt7V+qZXlyzramheri+Rzd565tmm3
 P4I/YkdpSwMYlwMsmKKLP1zLU+8u3z0zNc96ikwc1iZQIYwcHEKwEScbzIy9Mjs6Nxvtcb7cUm0
 WQ2bqvWRVJslRWe9qvWal+qWtXS8Z/indvQPy4mFhn/Lwk7MeGKaN/WG2pMJRXI6d+1nlPPePPG
 XGQA=
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
index c81632d3984e8..454a042865a5a 100644
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
+					type = "passive";
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
+					type = "passive";
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
+					type = "passive";
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
+					type = "passive";
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



