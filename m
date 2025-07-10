Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF3EC83F23
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NTRR38hOC8flMBxXZniL4nR8wQHcBbVOtX4hKPcCmo=; b=Z6d4aIX+ultHJ9nu+Sq3laSdSb
	pMp4UgXv42+bUQZ0R5ROPPCg1+1NvxRgEpOa35osEcIdXjkRNca6aEEZvypWVd/T5qk584zh1nSTB
	Jig4DXWTTqQSb57+OCuQ/oEHyPo4BOrSTpI8/U6qjbr/Kx7O9e4Tehjyn91ONAgjcIWtkAaw+ZJWt
	TqGe+qAuwfRd6pRzrZTBq1gyk+geEMN27Gvrwu93BXELEWLT4r/2uxMmyCeAhNM5gtU1Ka0/liusd
	EBLyDsWDGvGIwoYPBTJmOQ/V+2ukskHvYHUXMqlVKFF7W+t+0D6GxAtJOxR10Y5zJrVRpTwFEiG1c
	Whzbq46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHr-0000000Cyro-2tBV;
	Thu, 10 Jul 2025 20:54:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvO3-0000000Cd2f-3y8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:48:49 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C3ADE1AD5;
	Thu, 10 Jul 2025 19:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169698;
	bh=9jtrYa6P00ldve90oHbofklqOSGiI8pmg56lHpBtkKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9M65P4K7iA3g7oy60nZGoYQepvDm/GbSp9hO9Ha3x1R/WVzriz2ItwmnnDdf2gL7
	 7JNDOaVq44c/T0ao6zqsH/3q/05wZUlqqiLPpzOxjcvGAi10oQ536EhsVGytEcVcd8
	 toeUtxXr4/RfBo15RjnWcGgt7f5lxWLbfNKeBG9Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/72] ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:01 +0300
Message-ID: <20250710174808.5361-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104848_118767_E07DC6B2 
X-CRM114-Status: UNSURE (   9.58  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1..7821404687f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -232,8 +232,11 @@ camera@3c {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
+
 		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		clock-frequency = <24000000>;
+		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
+		assigned-clock-rates = <24000000>;
+
 		vdddo-supply = <&reg_1p8v>;
 		vdda-supply = <&reg_2p8v>;
 		vddd-supply = <&reg_1p5v>;
-- 
Regards,

Laurent Pinchart


