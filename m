Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259CCCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C55m3tz9/55Z3CMJeuKrTz0rJ6sblVSuXiZBkmg/dsQ=; b=grRUwIxjVI7Efl8JE/6HGJjCzh
	GJkBHF7BHI+fsCVnlQimkY1NVute5LQh9bSip7P+Ohm4lY2OzxRWKERUt1LmLlrd3N1VhTzRLamsy
	ZQGRbedirgSOo8z2RRYuRyB6hkyeWqRx1+DX6i/6SDpOhyvektmVe4L7HQFVXTLwDv2dKk6MzE9te
	mEHzpRzWYYk/ZSuFASrSPar7NKlLFLEBQFyUQrUnDRHYylRvMyQEjDhzN0ez0MUzjV5e1YCD1rLcq
	HxX6XbXqVal8pHojMtdrdZrCWMYPXt6EGYZsiORQ2gV6DL9/SXNBmRmF6am71t/lo+sy9PyfAepsW
	F97X06uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx25-0000000C6sz-3aBI;
	Tue, 12 Aug 2025 21:59:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwrD-0000000C5MH-0FDa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 21:48:36 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E025D4A4;
	Tue, 12 Aug 2025 23:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035261;
	bh=0OlaEea1lG0aXrKFQ1HpJxMDx/BmsqbsHAOsGw3c/AA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQkn29WrJRVhFueRdwJrlUMGpo84xHYfqGjWPf5HQWai0GSk8WNcs8jWEnTtDb2+4
	 kufuS1BI6b2UljF7cpTkswIX87D9oNLqSzLTu5hvHyMcRDHO/eSTla7coK8Kl0HnP1
	 4lq3tHYsmhb46wK1VPXxg52HovzrERCXPR0+Mi5c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 69/72] ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:17 +0300
Message-ID: <20250812214620.30425-70-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_144835_235904_08FD3428 
X-CRM114-Status: GOOD (  10.38  )
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
This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
helper", which we tentatively plan to merge for v6.18. It should
therefore be postponed to v6.19.

Changes since v1:

- Drop added blank line
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 26489eccd5fb..f3aaca039953 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -137,7 +137,9 @@ camera@3c {
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
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


