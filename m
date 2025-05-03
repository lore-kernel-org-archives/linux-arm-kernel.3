Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEC8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1bGcGDZkcMjtDsFXsTQIqCO4bWB1SufYWtStJKzTEs=; b=g7bOEDViulEidby03Bn0npsGLv
	UCM0ooX/NuVGfPvU0dJPfR9bHrdt1ZNZByXWB4Rxnja3va+gZEVcpi61TZ7JyjXza3g1xcmw9dz5t
	LYBDp45qgqwLIJVfYZNNU8WujABnWcbw3bKgDts/8A9LdfQMeOw0xDKBkJqxvGOF/SoiZPRbgafeT
	J7vHJbO+35oCr6F6HKcYcgmHr+CmkhkaIuL1qxcUBkXqLDatXMz0w5LVjZREoQ/zPMz93ex8MCTYx
	iXQ+/fozZTVx1WDCGdfkvxKrQpjsf4gGcL9lomcwtDLHPpUbAOEFPHvkgUV8jPPhmokskcPQFD62c
	WjLsmDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJNk-00000004SpY-0sDW;
	Sat, 03 May 2025 20:22:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJGj-00000004SAb-0sgX;
	Sat, 03 May 2025 20:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=f1bGcGDZkcMjtDsFXsTQIqCO4bWB1SufYWtStJKzTEs=; b=yVd335sGwdCJ6BrPo5XYqA2h8e
	6tI9gG1XjG3+rCKTVXK5hikaHjG5IYA27GiulLKRpI6qK8nhWNadW1c+KwIOff+T0gBuwPTW35bD2
	IE7K3sdlMXI0nyj6IMXKOTRdQWNvqXWG20y7ptgu7yHRcSoG6mhKRHExaYBn+4V1a0lhgumwEI8nT
	HvvoEzktKFwAZOmx56Zebw8H7fBeUzKTWlDrLl/OL6TIe7OdAJ4Nqkx/H5rY+zOLv++UCY8koGOdM
	9zM3dr0uBU1qwUP3O/o37I+0q4vwQxqv3hqFnFkFT8QwAGHTp/ObsfwjnqglW7BhC/0LNV24QG8w8
	Mg43eVcw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGh-0001hY-Um; Sat, 03 May 2025 22:15:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] phy: rockchip: inno-usb2: add phy definition for rk3036
Date: Sat,  3 May 2025 22:15:11 +0200
Message-ID: <20250503201512.991277-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_131529_243995_443ADFB0 
X-CRM114-Status: GOOD (  14.81  )
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

The usb2phy on rk3036 is very similar to rk3128 but not 100% identical.
While most registers and bits are the same, a small fraction did get moved
around.

So we can re-use the phy-tuning function, but need a new set a bits.
The biggest change might be that the phy on rk3036 does not support the
charger detection, that rk3128 (and newer phys) have.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b5e6a864deeb..32fdd64d7c2a 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1583,6 +1583,37 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	return ret;
 }
 
+static const struct rockchip_usb2phy_cfg rk3036_phy_cfgs[] = {
+	{
+		.reg = 0x17c,
+		.num_ports	= 2,
+		.phy_tuning	= rk3128_usb2phy_tuning,
+		.clkout_ctl	= { 0x017c, 11, 11, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x017c, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x017c, 14, 14, 0, 1 },
+				.bvalid_det_st	= { 0x017c, 15, 15, 0, 1 },
+				.bvalid_det_clr	= { 0x017c, 15, 15, 0, 1 },
+				.ls_det_en	= { 0x017c, 12, 12, 0, 1 },
+				.ls_det_st	= { 0x017c, 13, 13, 0, 1 },
+				.ls_det_clr	= { 0x017c, 13, 13, 0, 1 },
+				.utmi_bvalid	= { 0x014c, 8, 8, 0, 1 },
+				.utmi_id	= { 0x014c, 11, 11, 0, 1 },
+				.utmi_ls	= { 0x014c, 10, 9, 0, 1 },
+
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x0194, 8, 0, 0, 0x1d1 },
+				.ls_det_en	= { 0x0194, 14, 14, 0, 1 },
+				.ls_det_st	= { 0x0194, 15, 15, 0, 1 },
+				.ls_det_clr	= { 0x0194, 15, 15, 0, 1 }
+			}
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rk3128_phy_cfgs[] = {
 	{
 		.reg = 0x17c,
@@ -2204,6 +2235,7 @@ static const struct rockchip_usb2phy_cfg rv1108_phy_cfgs[] = {
 
 static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,px30-usb2phy", .data = &rk3328_phy_cfgs },
+	{ .compatible = "rockchip,rk3036-usb2phy", .data = &rk3036_phy_cfgs },
 	{ .compatible = "rockchip,rk3128-usb2phy", .data = &rk3128_phy_cfgs },
 	{ .compatible = "rockchip,rk3228-usb2phy", .data = &rk3228_phy_cfgs },
 	{ .compatible = "rockchip,rk3308-usb2phy", .data = &rk3308_phy_cfgs },
-- 
2.47.2


