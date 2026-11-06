Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TbRe5Mzf;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=G3EOz9Ac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u0/1yZqyMqZgrqdKxjA/v+I1p+wWzkCYmQc60+OXlpY=; b=TbRe5MzfXmw9rz
	/G2Zhd7GfaSf0TZQxtILIBEPsdBAYgEFZj6/NmAwluJkasdB1wWd8EcwjtqoegFJ8VVyv7aV6knH8
	uV+kToFn1glfLHcxZYUvtC8RafLXoDIXdOEMDblr99IML3K9zY5H1E0gfECkpl59XUPs3j8fudqKS
	Q6GdTeoIKCyu6HlEu6UdojfaJTdp+QyMdSNGvBuK20aVFwg6Z2gWFQMqd/Db4EnGQHLrjXZszSFit
	n498fCSq0+hklrSZaSvJWmqFwwHDBXwKgjAii2apfujCNNa1Uirp0uylKle9gmtzjjpHEvlKiZAMI
	AyZvNxVA30zdOJG+tJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTl-0000000C0YI-0N4i;
	Fri, 06 Nov 2026 10:47:29 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTb-0000000C0C2-1uJh;
	Fri, 06 Nov 2026 10:47:22 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07N1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:12 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07N1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962033;
	bh=u0/1yZqyMqZgrqdKxjA/v+I1p+wWzkCYmQc60+OXlpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G3EOz9Ac458kVeD1Ou6QJVwzbATectXcOTrc3xZpBpbWUV3PIiiqDARCf3SCm87TE
	 59x2hBYH0F0rv4VGZOf+p5xA+byFm34VZRBiwLsb5fhr09uwqeHEcTPf0s49JfWfI+
	 jHOZRWO9Apek3y8+MOG4eoW9X37WHACPZ+xp4jnk=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
Date: Fri,  6 Nov 2026 11:46:57 +0100
Message-ID: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024719_910653_8238D872 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the two USB2 PHYs and the USB glue with its xHCI host controller.
The S4 has no USB3 PHY, so the host runs USB2 only.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 8bbd70e52a29..155997649dc3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -770,6 +770,26 @@ cpu_temp: temperature-sensor@20000 {
 				amlogic,secure-monitor = <&sm 1>;
 			};
 
+			usb2_phy0: phy@3c000 {
+				compatible = "amlogic,s4-usb2-phy";
+				reg = <0x0 0x3c000 0x0 0x2000>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				resets = <&reset RESET_USBPHY20>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+			};
+
+			usb2_phy1: phy@3e000 {
+				compatible = "amlogic,s4-usb2-phy";
+				reg = <0x0 0x3e000 0x0 0x2000>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				resets = <&reset RESET_USBPHY21>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+			};
+
 			eth_phy: mdio-multiplexer@28000 {
 				compatible = "amlogic,g12a-mdio-mux";
 				reg = <0x0 0x28000 0x0 0xa4>;
@@ -988,6 +1008,31 @@ mdio0: mdio {
 			};
 		};
 
+		usb: usb@fe03a000 {
+			compatible = "amlogic,meson-s4-usb-ctrl",
+				     "amlogic,meson-g12a-usb-ctrl";
+			reg = <0x0 0xfe03a000 0x0 0xa0>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&clkc_periphs CLKID_USB>;
+			resets = <&reset RESET_USBCTRL>;
+			power-domains = <&pwrc PWRC_S4_USB_COMB_ID>;
+			dr_mode = "host";
+			phys = <&usb2_phy0>, <&usb2_phy1>;
+			phy-names = "usb2-phy0", "usb2-phy1";
+			status = "disabled";
+
+			crg_xhci: usb@fde00000 {
+				compatible = "generic-xhci";
+				reg = <0x0 0xfde00000 0x0 0x100000>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_USB1_TO_DDR>;
+				status = "okay";
+			};
+		};
+
 		uart_a: serial@fe078000 {
 			compatible = "amlogic,meson-s4-uart",
 				     "amlogic,meson-ao-uart";
-- 
2.56.0


