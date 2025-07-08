Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+MDfo4QVDXHFs7ZuN9++t5IxxKZnqS4UTqHPRM6pVs=; b=mI890TWxEXqa9y0okRlf9P7gwT
	V8ZCKDUeZxDmAiqUzZehqWRYqBFug027WKUos5jSUv+UAM+K+ufeXreQ2mUpB5sfon4Jj0qsSWc2u
	NaYkaKNx6VtLUY1zMr88yd75+9xALWeh/fbETCgy4DvfGI7S0//Wv/uQ1ZOmYWiNY+5MvRv2GoCmI
	TbCXoOn2yEEcSFvetovvGrkvY6uNv8sJHrLuhnZr2WSU2dliWwhcB74YAcilKBNKwSdTCMBY+vu5z
	9IE9TDdyXCnacuemBzHKOm0LXOlneZpQ+/ZWjYF+exYxfG0GYpHrO9etLaNFanLGFYzdhoRvr//1z
	wEnpQYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAU-00000006NID-2cd9;
	Tue, 08 Jul 2025 19:39:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCRc-000000069t6-3D3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C969A4691D;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A7C0C4CEFA;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996967;
	bh=HRR4zvG5SHpZnZ0aVbAilDa59MY8R7C1UOVkNz94BOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KHhCoH00jG0jbUPxmCWtC4svk9czMKVcwm3Mfol4HYlmQmZu6dQkb2497xREnbQyt
	 UR24qg/BEdYo7RExAbQoJf0q2ECTztFU6X4cYQJGL7lqoQBYMyip0CyCawpYNrX5tr
	 4JphmH96bMGlMykciTfy1bHQdw1QBaNQiZPWjqQb9QXnzIORTFJnrcZQE5Ugl76RSh
	 Ing+orOxJEidEpru1E/qODQCP7ZMjSqdMyUhqnPPUErIwVdvIKGLjfqUcH2+XbENQ0
	 CnezZSTG3NDN/397nre/By95aVOi2YhhQLSNPBfliG6kVOKO2vjzE8w/o5+55IIQtl
	 Dqcb5b47ko6uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB2AC83F09;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Tue, 08 Jul 2025 13:48:44 -0400
Subject: [PATCH v3 3/4] arm64: dts: imx8: add camera parallel interface
 (CPI) node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imx8qxp_pcam-v3-3-c8533e405df1@nxp.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
In-Reply-To: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751996966; l=2289;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=aH/tc3d4PpbdiPiq2EGQoCOvk2OgXV2HvNEasyEGlz0=;
 b=BI2lpu1ZlrcW1DUr2FJk1YuXoevdo4ljXtckwpQTo7KWeIAdlKo4I3+Q37917t3rbOzdSEONX
 xBUBZtbGbefBNaVAFAJC+nAv8gSOkazIEuw8/mvOmHOb+apVhSTno1P
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_104928_885459_683E9755 
X-CRM114-Status: UNSURE (   9.96  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add camera parallel interface (CPI) node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4
- replace csi with cpi.

changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a416d77b11140279d2f66f41498f..e321b0d62cce13ef999085fce7aff9ea2fd7fc21 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_cpi: cpi@58261000 {
+		compatible = "fsl,imx8qxp-pcif";
+		reg = <0x58261000 0x1000>;
+		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
+			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "pixel", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-rates = <160000000>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		status = "disabled";
+	};
+
 	pi0_ipg_lpcg: clock-controller@58263004 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x58263004 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 50015f8dd4e43b507c879479e7320cb58ec8bf74..5b5efaedd403c040f1231ead02834bb3d16a9dd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -62,6 +62,14 @@ isi_in_2: endpoint {
 				remote-endpoint = <&mipi_csi0_out>;
 			};
 		};
+
+		port@4 {
+			reg = <4>;
+
+			isi_in_4: endpoint {
+				remote-endpoint = <&parallel_cpi_out>;
+			};
+		};
 	};
 };
 
@@ -94,3 +102,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_cpi {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_cpi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.34.1



