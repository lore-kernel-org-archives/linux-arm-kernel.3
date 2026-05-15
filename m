Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FC1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKLH02VpYaAQI2kUbxTBz4X/+ENk8NfBTH51VaD1qP0=; b=21VdUcmfw2LG/SXH1hAZARDmCg
	awiOnKZon66xr7PFgaoPaRuoPVue4a6va3x6iq+1cePSEjN/ypCLJqWfpCF9jiJhaKbUEceVkopgh
	AVLOsP0AFrtoOPHVZ/9PWlA8bUStjNA3QTg4IbxD9MMQ3fKpkNLM4+0UP1VQjpwZlr2Ypsq4ZGJTi
	cZAeqHE/nojkNBJRJpN7W1t9FN1eWGX6g8o+6WwRrdAuFUWeOpd5Okhm+Vhh79j9xIgPILwlbxwDm
	TuxD56E9vGnmBw6yhDHfYhi83HWcTfLNepPrPIep3eVtvg/geMTB/mmuOwYDjImJfliG/00sqbPeE
	DHILsBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Gt-00000009Xkf-1MFx;
	Fri, 15 May 2026 21:40:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Gr-00000009Xip-2Edh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3516601E6;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75D2BC2BCB0;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=rX6r/+0B06uXvQR5Rend/nvCLxZh6GVTshJGCcYbsLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VccQFmxyQ0Y7N4jXYWXR9uq3K3pLblpJQiNEWWRyzI0cuiAZopwzXsmnd7h/Lp6yj
	 wGYZu+y2C0I+lGDmqhGRx2IXSBVCb1JAWYNIvFhjRHNK/LBeR2KIw9+mBekA7VOXK2
	 y5MRXW9MFwDWGaHDwIOj/xXwABpQCWBwwmSEiuazyhHpECDuj33tEE0msku6rbFxjP
	 42gAUPeiN/Wmut6G7xNpq//oT8UVICUPosCwrLQbMdyLLLZby/0fLiQpgNfhAGk6Z8
	 PNm3ZcsYQGNcZBbtXq6xn27ejrjmkLJjlMNyAkSgaWf76VoNC1ZmhmWzdAnsUYWjUb
	 6EUoJAesXX6xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE27CD4F46;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 15 May 2026 17:40:37 -0400
Subject: [PATCH 6/6] ARM: dts: imx6-display5: replace marvell,88E1510 with
 ethernet-phy-ieee802.3-c22
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-6-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=1530;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pOOTdBIy4O5VkcyQTkfiAAoOW2MNieyUh8U6TN+0VYE=;
 b=A2KlQ7H7PfGwYPV+Uj5xHeMPOwdRYv6ImnK7llmb68mG9ga9y0abIlg3GhkfwjAVWWnVuaufZ
 0IY7PFmRaaHCEtwGR86hp42oWznfdMNFRFjwbnv1Ilrts9EACVrZoEr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
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

Replace the vendor-specific PHY compatible string with the generic
ethernet-phy-ieee802.3-c22 compatible.

The marvell,88E1510 compatible is listed in whitelist_phys[] and is
never matched against a PHY driver. PHY devices are expected to use
the generic ethernet-phy-ieee802.3-c22 compatible unless a specific
MDIO driver match is required.

The 88E1510 is compatible with Clause 22 PHY devices, so use the
generic compatible string instead.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dtb: /soc/bus@2100000/ethernet@2188000/mdio/ethernet-phy@0: failed to match any schema with compatible: ['marvell,88E1510']

Known other user (uboot) did not use marvell,88E1510.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
index 4e448b4810f27ba67332811519a199a7ff0ee004..21e8bbdab4e695c0da169f1a8714398c6964ca35 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
@@ -208,7 +208,7 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		ethernet_phy0: ethernet-phy@0 {
-			compatible = "marvell,88E1510";
+			compatible = "ethernet-phy-ieee802.3-c22";
 			device_type = "ethernet-phy";
 			/* Set LED0 control: */
 			/* On - Link, Blink - Activity, Off - No Link */

-- 
2.43.0



