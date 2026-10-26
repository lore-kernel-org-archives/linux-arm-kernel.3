Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JtsNXG5M;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DLkv8KU1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=; b=JtsNXG5MFkvA84a+DnEhP9tH+i
	b2rWTTwSU+/VLfGHSiXTsr7u1VLGKwSmZRG7bW0bS2niNWDnYtzbvE2gvpZOJHQHVCVvm4w+ZQ5rt
	R26i94439zJdFKmTUMuTrZBUx/8Ah4rUM9jfyfx3/akXJ4LHT4uOiSjpQW3YT3oaR3gVieDP3CYn+
	idVb9P+KxbDCK+IEVB3RrT3ShN7ZmLB4ZocmYkzmM5hj9V0vd0iUF0oWKHb1EEKv698MbJ5PLD26L
	OaSV9G7dCK0W+QDxBSW/xkc1qN/X+CW7sWwqcbeii9+Qni1WCfhRzxuvg/Ouar+NbvaBAWSmbKlm+
	bonwGuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPTG-000000035FH-1BlS;
	Mon, 26 Oct 2026 18:30:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPTE-000000035Eb-1akJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:30:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso25776875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039454; x=1793644254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=DLkv8KU1o1o9OLVqeRBKq7GNHEzHruhtmjWi96ETdmD+HQ96ryDcDtQxCrsLPiQVZu
         9WwEym60Wu/wHHtM5A/YbQjTwZ+6FnuzBdI7WZCHynxeXi0EBRzs1OEN3mwrQbJ1SyUz
         w+ZgSSJVmyS4ymbmrWyjo4jke1VbiZAYWz8pe/FUtSIrUhgpoqDY5Cgm1jII8uj0hRgZ
         jYlWxJJ/2NbGe/vzEG2O3WNCH6PYrTosLG6H8uKTTZramKXOUUVw30n6OvlhYNlHqC9w
         TXqBaiJOgSQZ+WE7Z0HbXgFbG3/6Vh7gAyKLYStAZwAWWq09zAxmqY6u8+/c98Usycji
         kpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039454; x=1793644254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=vHyi5V3rgbb4cczoHVlKEoQrRq7+6hDeOc3ULNcQL7vZhUMaL9+vN3q1LBOPUezAd7
         mI5AgWTJFsHfEu9GvUp7fckI2CjiQeBMILgNYFczXgD65wGUsAew/QAwDhe9izbmSpD/
         LAgrDMGf7tu7adq50iU68Yynl5JrHWWPCp2cFsWCBMKJGVVBzadWreI4re4SB3/VQRYg
         AyQPSvru5JWCUqJ8KvdtHRU22HmFgB9Wni//mgFpWKmImBwyKQySKES6BjWXkrCC/r/p
         zy+ZmkndNnN74y6u0gFbdubl9f3Ko3UXEyHJ7j+o6mDUT6g9ibl2z8fiQoZdC3yOT82j
         y5zw==
X-Forwarded-Encrypted: i=1; AKwUvBxJrD3lRkuaD6jfGZlPLRX3E4MNICAor1tqHZi0vaU2hbRyUiQ0ZlzD3S1nfLq68oV+Zi+ql4azyJdgAyux5zq6@lists.infradead.org
X-Gm-Message-State: AFq9FYKADGew1KOxi9WthPT7l/UYBn5H1GFn2D2YREqUh7w6k779MyZA
	CFsaG8y7DrffacR2QkQ5+njl2jX88DmcKiE4M3hVYJfQHrvC6f5EnOns
X-Gm-Gg: AYBFou0KW6tFCfJvMmagB4tEjv0aYq1ELW5BIvzpyMlkQPcttSsnWNL+ZXPBVcv5X7Y
	0afEX2E+JAUE8JmpK6b8OVuCfj8RcRepjrxW0qOU3+iTZVPocEWaj7rh4nep/fsDYS7srmjNr7G
	G0rAyJ6awgALixOWGSM+DCrudy9xJxIT0fIdC1LugbsS3o1FNA2VlGZncI4b0hzIPw72p/Gohu4
	7SRMNreAFzdMianMwkuORq7cZPassNgsBHp4msMgwQ2T7zJgi5ZyP9HO+odWy0+hqP2SvzxyyUG
	g5stwwgPfJtEsSKrRJt4YBW0kMsqJiImSZyy6xkKauUxvniZAhJNrNto+RmpwmyMt39o40PQGlL
	kTJ61NgoQKJrgJ6aPKletJfdxfTi89dBBu8qQaE9x8KbW8BeO8CLgFnBgFNfc2/ytdLAknI/Z0N
	j0R9fDi5zGk0BKT4p0JcFKRGU+QMgzAcNedvh6K/wFw8KjcYrSLTLCkMJXY94lmYLPoFaz0eMkG
	vyORr5iKT72bNrYe5Z5KugRFlhWFVPmeawozQZiQgyywlfGHfRwPNxjYGFw3b6SEkeWaLqwEL3c
	3Uqhmg==
X-Received: by 2002:a05:600c:3486:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a35ac95955mr122964795e9.15.1793039453713;
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.15.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm250727985e9.1.2026.10.26.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Mon, 26 Oct 2026 20:21:50 +0200
Message-ID: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_113056_466819_8F50A79D 
X-CRM114-Status: GOOD (  10.82  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add and enable the DT nodes for USB1 and USB2.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..5fe245b62306 100644
--- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
+
 #include "imx95.dtsi"
 
 / {
@@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {
 		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
 		pinctrl-names = "default";
 	};
+
+	ptn5110_usb3: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio4>;
+		/* USB_PTN5110_ALERT_B - shared IRQ line with tcpc@51 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP32) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB1 3.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec1_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_usb2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP30) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB2 2.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			port {
+				typec2_con_hs: endpoint {
+					remote-endpoint = <&usb2_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -145,6 +213,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD1__GPIO4_IO_BIT25				0x31e>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		bootph-pre-ram;
 		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
@@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
 	};
 };
 
+&usb2 {
+	disable-over-current;
+	dr_mode = "host";
+	usb-role-switch;
+
+	status = "okay";
+
+	port {
+		usb2_data_hs: endpoint {
+			remote-endpoint = <&typec2_con_hs>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec1_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec1_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	bootph-pre-ram;
 	bus-width = <8>;
-- 
2.53.0


