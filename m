Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lB+2ifpp;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TKm8sbpg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=; b=lB+2ifpp2tUTm27Jii9LzpYGcA
	rnLqYdZwNm3Mng3TOdA56HlrqN614MqdD50NG4A8i+xk5BerBt6GclxJGJsiGhpe6nwzX6Lc/JP3y
	IEvnlSHkX4g1AaNXxnzevjYENe8P8thHdiI8z/vy7sbhaR3Pr2415pc1kVyKIZLphw3xWupz5VcR+
	p3GCaRNGPLVqTmXtZBQk7pn0i0XOoqiVCzisgnoBlfTesQg3MXiengQK5+SsDxJ/k9dZASoN/1uMW
	cf5dViDeTh+uzYLM1AnZslmUBBHUKoFXiTV0U2VunFdNP7KXrgvtEkrxWtnNvQt7dUCcxUftJRk+d
	zz8R0Pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJYS-0000000CNUn-24UL;
	Fri, 06 Nov 2026 13:00:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJYO-0000000CNT8-00JJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:00:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-49376eb635fso144429f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793970022; x=1794574822; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
        b=TKm8sbpg3sHlNaxhklm2ivd+qwjFBJ7tfiI7OtTAcKZq3Q7dWIbDu3RqBbxB9jrE1U
         w/Fn1KKAH637LmhGEYISldex2BP3Jo4ozWmKGp+5Ox1rhI0x1zF9t9Wd86dgGRmZY44f
         ynyAnrPoG0UbUQo+jSF+LeUgyEa373gf9XeVcPU/6K7GkdYw7sggKAXgk7S0v4ba4fcH
         buGN2nK5MeQS4P4uVS7T/gEXPvQ1rzkthM5yad7J+1YbSU9zu8ah5cWC6lbvkLdQB0Ey
         CVJ3R4aLGMGvqmVC3n+EohTbAEMjNEzLaoPVltNItf9BAKpR9AuuuVaZOnx5KK2QSKW2
         Mftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970022; x=1794574822;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
        b=AqQo2S7O4MpeHLPIsZcXxKyxbgGvkP3F+UEv+bQc6HBHv5oKr1OyozJ5c8gTeiP9xV
         Utn2EWGvmH0wz7rZzamVZYOEj4WavJ++EiUqj+IKSSIahxgMu3GgD5AXeXuW7ZTX/1pI
         QNDMX1HyDZEHLvD7KZsaE9pF4abPsk+Ez4CQqo7lf6WyLbxjyPy7zktcya0Y0eCp21sX
         G9XDzvJK4LQm0cvcTEmwR46Q4WuBF7afRwRS1416UrjyX8ZAgKwh+8JXsGwLmQ+k2BtZ
         +VPwiJ9XhqgWyfliflRvNumTPmNBfc4vQwX81lTDTfksUOHmBlz3VyvMxGUV/U7dW4Pj
         xPBA==
X-Forwarded-Encrypted: i=1; AL+hErHGUkRecBLHRZc9kii6EnPcmfxVh+75ZfQVFK5hrZFG0cO3rm9uhyFLw/hph7jGT2o5+KgVrnBx9Bc7N8fbJ7HQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8TCkcgGhRZOSpr6Y2iObxlI7qPVKO88PqDclYuHF5qRrj7TiO1
	6A1uRuIQtzUHUBU796emE8QUtAAbL3H7/r3Yo/Ibm4bzBzt4DZfgPKdbNXHax6oZqmo=
X-Gm-Gg: AYBFou1txRRus01ilAYUp/2BKKuEc1FBaj5+GO/Z2t62cwJVowJrT5tB035tZw1EvRN
	H5LJz+/rfSojaZW6OIa5VjP+b7PNqM8yDKJIStjzrba/5pRUCNqHCzgbG1uziuOrCFcyMQsIN/v
	RMK+FRK/Av9swm51XIkGjAxeOnqAwtYYQ2DqAYkQBlr39Qi1k0YbWM6hCRjrwOOHRCOrR+cbUmZ
	6C3udI9Ry+8K8SNW6wemRvdQHM+7PVSQ23caSdAw+iJ7LQCri243pL2vOkkhSJEf9Wc2eGzuZk7
	iyIywJygBFNLHovK0Izo2rA/M5l4xTqndUOsi+rLkNJjA96VvO77QfoEulg10iPetSeB0PMMzm4
	gTWKoO03jdvuLhEaQ3rsVNJpXd2igndDAbEgr2bNbgXHKnjZ5spamAnCw/ptH/cyXE2ljo3GTs9
	JPbNZMCqHC7b12GhLh621L5IUsWYjaIypJbKrFSDDcU/y3HTSMt2LIbrST4kD2NURJCDfnpJrJE
	tsYOjQjdG4vECOhkzoJARztu4W5Qq7O0vVa3oZBxEaZk6hM6mrvfbDAuQgzUd8ZO5hFbzhmhian
	To/EumpLtkvN9uygtuaIDI0=
X-Received: by 2002:a05:6000:288c:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-492777dbf93mr5033387f8f.40.1793970021373;
        Fri, 06 Nov 2026 05:00:21 -0800 (PST)
Received: from [192.168.1.123] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm3434259f8f.23.2026.11.06.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:00:20 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Fri, 06 Nov 2026 12:59:59 +0000
Subject: [PATCH] arm64: dts: imx93-11x11-frdm: add HDMI support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AYjRirlK6CGZiZhFbEiiCe
 PeC7wDvQpem0hHoQpOfdv0cCGQHwlbisQtrQiCMZvTWGs9az9VxbqlySVV5cdlHt05RZouB8G2
 S9XzG1/u+/3DTfBdhAAAA
X-Change-ID: 20261106-imx93-frdm-hdmi-73f6a394ae51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_050024_072091_79991C42 
X-CRM114-Status: GOOD (  13.22  )
X-Spam-Score: -2.1 (--)
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

The FRDM i.MX93 board has HDMI output display path:

  LCDIF -> LDB (LVDS channel 0) -> IT6263 -> type-A HDMI connector

The product schematic shows that the reset line is on the PCAL6524 GPIO
expander port 2 pin 5 (which gpio-pca953x regards as offset 21), all of
the 3.3V supplies come from PMIC BUCK4, and all of the 1.8V supplies
from BUCK5.

Describe the bridge and the connector, link it to the LDB and enable
the LCDIF, LDB and media block control.

PLL and LCDIF clocks are initially set to support a fixed 74.25 MHz
pixel clock, which supports some common HDMI resolutions, similar to
the imx8mp.dtsi setup with its HDMI overlays. In future, we could allow
for dynamic PLL adjustment based on selected display mode, however this
first needs clock framework improvements to support coordination of
sibling clocks from different drivers.

Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 6e8351d12016..6dd0977b8305 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -9,6 +9,18 @@ / {
 	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
 	model = "NXP i.MX93 11X11 FRDM board";
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc3_vmmc: regulator-usdhc3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VPCIe_3V3";
@@ -38,6 +50,14 @@ &bluetooth {
 	vcc-supply = <&reg_usdhc3_vmmc>;
 };
 
+&lcdif {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&it6263_lvds_in>;
+};
+
 &lpi2c1 {
 	pcal6408: gpio@20 {
 		compatible = "nxp,pcal6408";
@@ -47,6 +67,67 @@ pcal6408: gpio@20 {
 		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&buck5>;
 	};
+
+	hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		reset-gpios = <&pcal6524 21 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&buck5>;
+		ovdd-supply = <&buck4>;
+		txavcc18-supply = <&buck5>;
+		txavcc33-supply = <&buck4>;
+		pvcc1-supply = <&buck5>;
+		pvcc2-supply = <&buck5>;
+		avcc-supply = <&buck4>;
+		anvdd-supply = <&buck5>;
+		apvdd-supply = <&buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				it6263_lvds_in: endpoint {
+					remote-endpoint = <&ldb_lvds_ch0>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_VIDEO_PLL>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <0>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	/*
+	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 74250000Hz to accommodate
+	 * IMX93_CLK_VIDEO_PLL rate at 519750000Hz in a rate table.
+	 * The resultant 74.25MHz pixel clock supports some common HDMI
+	 * resolutions including 1280x720@60 and 1920x1080@30.
+	 */
+	assigned-clock-rates = <400000000>, <133333333>,
+			       <519750000>, <74250000>;
+	status = "okay";
 };
 
 &mqs1 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-imx93-frdm-hdmi-73f6a394ae51

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>


