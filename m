Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C7AF5141C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRLx3w7DdmIIviZN17jgEZ3ypM6cFQn5Fi6e2rWnxGg=; b=PVqIVUdXd3m6Q5wSVBhh9hCqCh
	64gUCmwtAV7g3LnzfBlHuws3Whk81vTR+4QksFk2xLQdOlKEXVnv1FoNMrS00pmnppoL1khXcq55J
	kVCBYVH6SXzM5TQv9PHCv8Xmq6dzLJeRHvpH8TPAUaTlsro1AVB25ykZD8IdpvPXAq0liM7Uqja5+
	zFrIYNWERfjLukguc3/fZuYP5FOFHMY/v8JBQ97FDapGPgSr7v+/to/rb8yAiJLRUi8b81y+c8D7t
	GXz/WEwoel2fwWLHGPaXqTBFNfmwGDa/W+NWpth6JDnC5nuEEysBtc6IoRv3sridpSbCBvbSWU37R
	KXFSRr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzr-00000005Jzz-2O1U;
	Sat, 07 Mar 2026 15:55:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzm-00000005JxN-0pk9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso10533755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898912; x=1773503712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRLx3w7DdmIIviZN17jgEZ3ypM6cFQn5Fi6e2rWnxGg=;
        b=bZGA0V3FIp3Q6IECi2JBBSmRli0c60iVUbo6K7wRvWqowMJLbfBUY3I1JuaBfkAZt9
         Xu5Eq+6finQNkOgOXTcA4zb6IBJngRV8ijkZayovmCNaylIbklIpf2+nOn3Au3hZ4cim
         yCyYVe7Iwb5U7VEb/IFX2xrTbj1xQiSXMnng3Cw8sMYSm4rzqmw3qd+JSPr8j0ah+P8k
         DfmVhfb2fr04rHia7SUV5vNUKySltkfXsfu/qEIyejEq1JrogaqpJDppMuBjGRhXRx9K
         5yc5IBVEnDCZzi3ytnnCsHQ4n5nb2fq9phX2sAtiLSrYEfR8Vo+w1PabsDimvj4bXJ0z
         s+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898912; x=1773503712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRLx3w7DdmIIviZN17jgEZ3ypM6cFQn5Fi6e2rWnxGg=;
        b=DYCl1aUzTQGdab4EaG3CQvTpiUp+uUwMo2XF6QB4EkgnaNGApTSY7YEDfZFkoYyC6l
         s9Qc8Tp6MFCr5TI6Ss0Gpw/8AubMWott9FWkhVcjdKUEetNMHJvX42lcH+mzmaqW3PSk
         ekP8g6cTpEd0BWFOlZ3Psygf/uhqucp0GKY9mUWkaeH2LqKQzB2GURnwB1Wlfk8m9Qky
         bnliPd8Xy0JjRIPeKfj8gO3IQhZOFT3beHgMNg6Ll3JhSHZchtx4l2Cn8WB2FyVsP8AZ
         ykWyvdBQjF6fNOI5kILWuDmBL6TZt44Sfnew970HJdr+r+nDsvjkBxSz5cE3li7yZ0Bn
         Lb4w==
X-Forwarded-Encrypted: i=1; AJvYcCUy5D8p07uUkIfZcMkaof3qjM77MkcK1N/4feVwqtN054BAOkqlytRg/4HJzrt66F2xb9rtWiyeg8Tx4ptEZ5U2@lists.infradead.org
X-Gm-Message-State: AOJu0YxcrY2t8TgPbOWKrZ3xM5TFXhB1C2BzO9yTH6oI8QmAkvhoXnkF
	BqkS3ZxWkfjc2P39vr3Y2OozOMV1A0gdDVYaRlGCvkrSuWs5Z26DtPLZ
X-Gm-Gg: ATEYQzxNsgh5GOluzZS0INSazothbYIdXBxBPAZfQJT1HvAt5JpvwuGNwRTy7yUddfB
	xWHaR3sXP53kXlUARJPpdgWKrpL3U2+pFBVymo8+1NcEOqDfI2puK9EkBO/BqWgsvHGAKYCby3i
	KwYXfseoj2et4NBq9Mt1Ntn+lSrP/RI5rtQuMy9u3HeoxpcT3bPG/jPPhqPfK7mcDdDPBQK5k48
	vxdBY2+OqKn/SJVNX1SXloJboapbNoEJvO5MyJ2xWxav04UOuHWHuTjQ4B/eW3nghOT31aEcBG9
	FmlW/cXlG80utve9X2+alC8zwLUmPx+sQgSTa9Ln234q4qtpeQBreUKuuzhefO87mKvyfU7y2SL
	4A3THr7GI5QHTwTK3WZrHVUqMphhTcLydfinYEti2EOmCJeOeRViXNr9N4KvoE10+S9tbP3S+ls
	EEbOfp2oYd4h4O67A2xbYC/tMV7aY4Sr0u2nmWjcj5/SGzIOrvkeVBqnsknLzjvXSIWUMAWIygL
	kfwcNpSIya4Cen2BtkrL0I/iA==
X-Received: by 2002:a05:600c:3593:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-4852695881dmr99969015e9.22.1772898912232;
        Sat, 07 Mar 2026 07:55:12 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:11 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
Date: Sat,  7 Mar 2026 16:54:37 +0100
Message-ID: <b2ac5175ec9ddb308261746b967d13557958ba0a.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075514_255547_0B605988 
X-CRM114-Status: GOOD (  12.95  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mm-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index affbc67c2ef6..819707e6f3bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,6 +11,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -156,6 +160,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	disable-over-current;
 	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
@@ -251,4 +262,11 @@ MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 190bde4edcd7..b6560c03639e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -9,10 +9,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -418,13 +407,6 @@ MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3


