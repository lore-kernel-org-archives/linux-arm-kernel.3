Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1DCCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=; b=wf/hxF8Y1JMwoV9FH0k0VP2wTq
	96VZ5pprQxH49z3zbQwzDN6K8eLPo549x15E/y20Xw/sXHnkXM7x1bD6+l1lCcg16OCZhKUbMWURF
	DFgRFTNETs6KbsOEMiuro5LozEv4gZNcpcTpOs3MFf0ti8WNJu1krjxi+o4N5tBbGbRnHSTUQswcw
	8LTFp2YwzDDMCd2RZxKwYbsFFDvNXN9F5BwIyozflzsaO9bRu3eha8OlC0UimC4dzT1GMRCwKSCVe
	OSIKBzUmlaGIPSIGJb8gJjKEAEz87/N1PvlB+Zw+2fk8tHZ0infNP/O+c7vkgZ0U3FT/60+R2/riW
	DfBFZJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP8-0000000F8kF-0JEn;
	Wed, 03 Jun 2026 13:13:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP4-0000000F8d1-3UAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45ef4223be7so3236188f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492381; x=1781097181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=;
        b=N6GpPegVa21MrAjgbAXC/HzsAtWOpjM2kvBzSDyKnyjFt4StXfeQMCjO+itX0yjnIu
         PfedtSsY8CqG+xasBK4stAYCliLPbwWOXl3/QiHavW6sgUfUTZdJ5Ko4hrgNzY/1SKpq
         DuvI1gAJZA78HVPg7x146bOEsFBQExZSTuEzIY2opc9+r+Tcy/v3hmT2JCGJ/exlVKGk
         I45YwNs5gGmXRRLJOGuOLqOAiSOHP4cyVkefy6IPAuPJIBjQRNQAhl0m0+6vwU6+DWMK
         2b4cqhwjjsH37SJaoE0WJ3gwcoLbVsN6pS+QQqj6p5hAyEoyYhpQoBHMfpOOsod6Em9I
         CFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492381; x=1781097181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=;
        b=lnZU3T+678oD2UCsYOuJnqYrPkrnwaQkdw9Nb6wDfLrLgiYAZIpcm9V1VFCEwLxe4w
         s1AMv70SsPHh9g0Tgwr6BiCSCes6Jg9g/831lE9Jj4ywUeeDV/dZ+TNTFRTtQi9BssNR
         41Lu0wbKxQ+Bz6PXRU1XyUQLOba65BjGZeWl1YdHelcl/FeYZ/no+usBNSVN1CDmb9LD
         OEzRiPw8U6jC3TMHO/sPqaT/brwwYNHaitqrJLSIZIB3qhV09YfzofrBNweV0mRSe0r7
         Hp9IFg7V0JeL7v7VzolwVckpP5NVugxf7R72iDlwsXlNNYmdEIfa4RoYnYz3cVMWA2ot
         RwDA==
X-Forwarded-Encrypted: i=1; AFNElJ/isKbz0Wab2lgWdhEbgbL8zWGIc1xj0kbk/7bY0PvpwRFdzjB05ccMHB+FB8jQwIf31+rzLLvHTV7SpsP3ieDw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx+oO4EfPg0TvdaCxIxAvEjakFJ21ZNb7H8DCfGUFJdE9bmyHN
	WGDZ/euwsLxa3YBLraO7n06G8VTo3fFHLr4Bz4gLKoWZAdNBoSczl3Gd
X-Gm-Gg: Acq92OGccLBktQSK27l3co0YpgLuGR0QnVLgt+qj+b8QjnNVBPMm0SmPWYUJgca4UD5
	buCg9k5KEFI27V6qpWNQY2T87rZFQTbnPKtMmxCbIBSqKW2g0LqEyk1fbqYUURNne73cT59qHn9
	w94bVlmgVh8ByUmP2lRymTwf7T3Kp4melT8ahJC5yOCgbQU2+hdh9oibIap/k8Vay5c7KfegbCa
	8QNZ5ksBOMIj+NMSPbFLiAzhT3RdauLv35l0bcXa/bLjYUBJmbhD8BMftaVHdIXqgeG3F5QwpKx
	j5bYJbauxSipU13IQ7nVct9dg6NymXYC1ftXbLbDINxh7qol+o+vl8w38WnAI66aNH0tYOfRWF9
	+3SbtDovaHsRcxGoMWwbspZevcJ/gBpqnd7gHTS0BdfnJ4k072BmttsSTswsuN2j0dsCK6Gacga
	vxj9RdZUnvM9c6yOP2ew7Oh0ckbBXIG4WdLko/NxA2H069GeP+3MRTpq1+GnXue0FMW7FkNdAcF
	LE8zlNE86mrmbrp1j3ySujp8EbB6XQ0mm6IoQRgigyZpXtO
X-Received: by 2002:a5d:5702:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-460217a6ff6mr3663164f8f.10.1780492380895;
        Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 07/12] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 15:12:45 +0200
Message-ID: <44c0b8b81ee16d0a47f4745428bca54497f993ac.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061302_965544_6A9C322C 
X-CRM114-Status: GOOD (  12.10  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index a928dc2d9adc..4d8791886a78 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	status = "okay";
 };
@@ -252,6 +305,14 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3


