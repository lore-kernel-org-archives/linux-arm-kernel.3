Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECCFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+W22emnQ50J++N2UYuSbG3ycpM3q/i/7or1izNIW5Q=; b=Gzz5OKwgkVNSgiu1gsQ34OhRlI
	PL69ZmtrL9motiFv0Om+JwY/bwLIHi/6C5FObvbmYkQ4FNlIdDfrTEfQDK7aU09gVpVVyC85LoNv6
	4c+iKjICcZTqFyFXY5WDiS+8FTAAg4dHFftlJl0UBNrFomBb59j5huaELNqHYl2OS/PJV3qwAhVsO
	6Wt21tkxEo9bsX/zy6qkiH1PzIAgLf0z2tuMhw1oVkY1P+LaIRAmhfRrDp80sz7VD/fThpyFc8kk5
	dIa8d8NS9qQZzD0Q/WPQRZM80Ns9WSNSIwPii5n7RkUwwNr+ylFJUZua7liXSoxtQZ6QsIamxb3SB
	BNSwiupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRvv-0000000CfRk-1DIn;
	Thu, 03 Jul 2025 21:57:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOkE-0000000CF4p-0kIn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33A81465DA;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AAAC4AF09;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=lnATMb/XmCNNMy1igSdCLxsZP2Vd/a/i5coedasJ6Ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qwwzqZjcKtOl8/553fhUXtGV5cSS+O56najS82u0rLCWI5zFaQwv7KxGgmdECxS3U
	 s2dkH5ydHtL1Xrb/O4ydhNxlIcwhLzhYLJEK75Yudxr95MZRHdFMyT/FH9aUq9OYtZ
	 Lj4Gc4ESm9tQ1RCKRSeY1bmk/iF/oZbLqowhr0TVgrcBPr3mO3xtn/yXtcB6Yhy3nX
	 y4mbGrRkH7p8JaNBQ/TAhSYiX5iVSecnD78N1MfwLRCfWx/CTGTRCiZG3+d05TPVlk
	 OhIMHdeNtrbFiHQBTfgXD3J1C3AYtEEohNsePKJiThhvWfLsAZoJn7yGtefFj2E0sR
	 /35+V/uFd7Edg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF646C83F0A;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 03 Jul 2025 14:33:08 -0400
Subject: [PATCH v2 3/4] arm64: dts: imx8: add parallel CSI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx8qxp_pcam-v2-3-188be85f06f1@nxp.com>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
In-Reply-To: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=2229;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=egvyIYm9Ny7RwG4VqCUmjTBkLSU8NimkbRJ5GJUfMCg=;
 b=0DiK8tKXGe724gjHRzMZk45Ar6ghYBLBifnXK2kF2u5SRCj3q649yBEdL/Rg9kJnjnsrMYMyP
 KvscQ92k649AaIVhdfok6kql5Di1O3TLWV46TiUjkLyRHXO0YE1oDIc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113314_273239_4596E8E2 
X-CRM114-Status: UNSURE (   9.47  )
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

Add parallel CSI nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a416d77b11140279d2f66f41498f..1f7bf9efdbca266fbda82d2bc84acd9a27ed0bd1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_csi: csi@58261000 {
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
index 50015f8dd4e43b507c879479e7320cb58ec8bf74..60aa43c45d15c8b0c2c425be52ed79458d8c96b9 100644
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
+				remote-endpoint = <&parallel_csi_out>;
+			};
+		};
 	};
 };
 
@@ -94,3 +102,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_csi {
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
+			parallel_csi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.34.1



