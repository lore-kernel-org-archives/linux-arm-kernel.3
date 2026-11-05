Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116F7606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OIGavLzE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZY0mixJ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=; b=OIGavLzEapxdwzGG07yDF801ud
	1sT4ZT55g35QqSSeG3a8n0vR3dJIp6dQAzGe/ZvxjzcrXxRQjv2eZcHLsuFvRJfRyaBWfa3snIkCb
	EGGLDLAWVUpIQkvBSfNJJ3Egxz8wfcQtN1UrlLfwBX5Nue22r15pkVg3JFoRuhTTyAFoE2dOBCGXA
	hjQm2Bbks0pGix3gFWsuJoazZnY5TCEI9AYk7BlU1CfF3kHeP5pCcoIAVPokZvGwe3ygH0CIxTPtR
	dzuWrCa+25O2pE+JzIxPp8f9isQqrbpE84AU2hNBUpUskq43ryb9o+u1b+umNOoG+XxiUuL5mID/h
	31xmqFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuXq-00000008RKs-1HdI;
	Thu, 05 Nov 2026 10:18:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuXn-00000008RKB-1xcv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:18:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11946405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873885; x=1794478685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=ZY0mixJ+6umsCzCqphU7gHKdzdYVBqx6x/OIZxpmF3NHoQuJGHx+zsgeRv5vJegdg9
         J+r59IKovPJxnDL/21faePTpGLTxb/htWnkRcJ9VOQwMPPMQFjBbs4JTs4IcEc66aKh6
         rswowUeGiBEDmK53d0VmPcCr55Mcg3a8i/ogP4dZ0cIVYzIFpmUNpE24YEtQR77oHkAV
         anAnusbGtnT78sVmDKR+px6P/HQoVochI84ykPvLKLwjMvf3TZTIIpqzbQdSNKHdoqZk
         2zqwFDGOpJDujgPSj6VtB3Hto6cq+1u8svQI45OvYU96g54JFZPRgJi/vpt6BDDiA/MR
         mJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873885; x=1794478685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=IcfJuEgbnT6AMaArsLfOL1c6zkixI0S0Ajhf+VRbFmeqdGCtvY8853Px+qXPs2gmSF
         RfGsS9x9d7zslNJBUwVAi3c22ihIybMlt6kkIAVRb6RnSS7vBwULvOHWmVYifglazibs
         mLwaX7ee/Q1a09ISfAWplXWbpOXzEA/WcmMlsw3zY/sdaUsiuVQvPO/TdbmtO0ZfEa7N
         hehmsmEx6XamgRvNHiN5uz5W7f7YnjyBZAjfcre9MC1eQRr7T/xj9x5Z34b9zLLd+qgg
         rkuz16Q7HQVwfU8pr30qIKMI8gbzreYBR3ZU0lw+rdFzZuw2orv/SM/4HUY9qSt0O2Ex
         CHow==
X-Forwarded-Encrypted: i=1; AKwUvBxU5mzWIAADpyOrF1RP4lMm+UpT+J+vlCJU2D0SWFkjtK3ZQ6vHrgxb5po8wJMgJ5Z8/X8FkWdeaRDYE+1Fxk8J@lists.infradead.org
X-Gm-Message-State: APuU4Z+ce0K+3uDjtGmY12CPQw0ONaxJfHxrzVDUpZhi43dm9YCnTKxd
	wcwi9233vJrXROfP0O8jCMH8qJQCZSqL1jVYmkZ9VdSrIp2kfsGRqg2H
X-Gm-Gg: AYBFou345221fu1wmQu/+lwwrEpJNAHq0p/4jwVg0cfyzB30d5ysPHy2aSxxf/Vrxxa
	US+ZMqbeLGxam/z7ewZzYoNw07vQc/fS53g//GuLpfIKHON8tCHxB+wc6ZwU4AWg7PsaFtJYOcU
	C5kOw6FxgxI58S2j1WolDcpOEiCCvAquDi4CVG+PQyjRo18j63KWZBby27r30fWV2VvEhG7tHiP
	WrevATWVSqOA8cC1jbxf4Xp6lK8RVwvaLGhpgTaTFqJCfppf66NwfZrrX+D8ppdhFfOnU1Ixuzh
	S1Hy3ny+KczYL/QzBOs36wKV19agSFGyN3V7nHqH61pQDnpxRasY0Azz1f/Qq0DZ/2X/LsnZ7vE
	z+l7/NoyDUoNuGwU0ZqSU2Fv/RgUauFvcbpVRIZF9PJGu9qDKFADw67z5AOkJV7zGhcgc4Exvmr
	f+k2QJe3wt0CGJ5fA//1TIqX9JveBD1SBp54+CA/cSkHCkqe6ibWmFFDJ47XluiNea6VQ5hQppc
	0o0uv7uc+8u4Hm7CfIfQJknOEcqNcUpNaAlBUcoI7vvZt44h6uW81f55w9dPqev9dXm21BYOBld
	VIssovLS9nSmVz427EXTuxMqKsBMWklOVEsUKL1hAuWweXEqFnxrxaf6XtzmqJZog3pyQQEZtsn
	1ebjSoSKbDcUAZ1S6UPJp6Wo9NZFT5ZPKQGjtyGqxThYyH9qYxnvr
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr374298825e9.29.1793873884933;
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm59305215e9.10.2026.11.05.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet LEDs to carrier boards
Date: Thu,  5 Nov 2026 11:17:39 +0100
Message-ID: <20261105101739.10614-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_021807_579952_018DA070 
X-CRM114-Status: GOOD (  13.81  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet LEDs are physically on the carrier boards, but the
VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
include their LED nodes. Other carriers therefore inherit LED definitions
that may not match their wiring.

Move the LED nodes to the Symphony and Sonata board descriptions through
ethphy0 references, along with the LED binding includes where needed.
Keep the existing LED properties unchanged.

Fixes: c277a3d535bb ("arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY")
Fixes: d3ad2ce2116f ("arm64: dts: freescale: Add support for Variscite DART-MX91")
Fixes: 947771d00bdc ("arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY")
Fixes: bec2988b470e ("arm64: dts: freescale: Add support for Variscite DART-MX95")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 20 -----------------
 .../dts/freescale/imx91-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 20 -----------------
 .../dts/freescale/imx93-var-som-symphony.dts  | 21 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     | 19 ----------------
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 20 -----------------
 8 files changed, 87 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e928a3d44b1d..49d20db7de5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -3,6 +3,7 @@
  * Copyright 2024 Variscite Ltd.
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mp-var-som.dtsi"
 
 / {
@@ -129,6 +130,27 @@ ethphy1: ethernet-phy@5 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 61786eee0e82..cbf58aed180a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -8,7 +8,6 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
@@ -155,25 +154,6 @@ ethphy0: ethernet-phy@4 {
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
 			vddio-supply = <&reg_phy_vddio>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index f7e32f9375f5..0f2be56ff7ca 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx91-var-dart.dtsi"
 
 / {
@@ -173,6 +174,27 @@ led@1 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
index a9e44efad13f..ec65cd42c195 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
 
@@ -81,25 +80,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..477f31a4cf88 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -189,6 +189,27 @@ vddio1: vddio-regulator {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..d9ecbc3e9a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -75,25 +75,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 9344a0d99418..ed3e2e1b995c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -8,6 +8,7 @@
  *
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx95-var-dart.dtsi"
 
 / {
@@ -163,6 +164,27 @@ &enetc_port2 {
 	status = "okay";
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index b4c55bd33858..92ff09fe64a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
@@ -193,25 +192,6 @@ ethphy0: ethernet-phy@0 {
 		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10000>;
 		reset-deassert-us = <100000>;
-
-		leds {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_YELLOW>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_GREEN>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-		};
 	};
 };
 
-- 
2.47.3


