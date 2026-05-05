Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3245CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GLZzOd7tqsEfXhwUP6urB+0MZvi2wv2cou5CsaMxLQ=; b=xyvyJyr0Ktq6jFFwR2Fwg+cuov
	/oWm/ezz5NkALwIBaKNridDE66hw0zBmk7900oMMCgf+NcqXBLNUtdUfzhjaFQUaOHMTWxGaCqHC/
	z2WmXY7br5p425W7AcOmZVdYmE7E6TeKHfoSfRfx/DutXT1GfaOz1TWrSwkYTQCAKaMiIh58H2DXS
	13PHkAvIphTCto9LzzXCjqg/DqIDdedlmw+KEBTe5GaJmUZZCtUd/USyB+uivMrOm5658HFmmDArM
	JFkM5I24xG/iYku3o9pTWyezJI5Lr7/BnTETeTALYavGVksGZLxNKvIu2I4IM8C0F/upDFN0Ujsxc
	5bylwKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC7-0000000Gz7X-0qCh;
	Tue, 05 May 2026 17:04:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC5-0000000Gz3R-19tz;
	Tue, 05 May 2026 17:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4GLZzOd7tqsEfXhwUP6urB+0MZvi2wv2cou5CsaMxLQ=; b=PFPkBtQQQnQu0GIBF4/thkkNb2
	jtKCZf5CkKnEjgeQqG8mjH+rrvBvNI2l7C+iS+McNxiqbIu5c2+/0hgK57IsDuXCpmMX//O81UtOJ
	HB3mYAGTCZnUZBHkTLzSQm4Cr2g/X1TY8rEagkuUXxXOKqh7HHCmsOfptLNwbNz9PojzO+HL/Pkb+
	1yA02i53T7WR7YeeWency8TngNUXoG2XAYvSxSlfNKa4MgigK85cvDHvBCdYFqM7n31FOT9xqygrz
	IcNArgMiuVeEAlWRv6ZcNoAoANqE8aSBUW6rmLiU2x4ha4HAVrKR6GFMQ8c3xtl07uUM1mU069/IG
	FuyYitrg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC1-0000000E6jb-37UV;
	Tue, 05 May 2026 17:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=4GLZzOd7tqsEfXhwUP6urB+0MZvi2wv2cou5CsaMxLQ=; b=CB+mkdDpTsUjAeNWM9cf3NK3L6
	VjZ8PQgzcpAKpggawT3l12irv2Ab7Lqn5/XGkwgqkvWgeG8vE1LLambaIMGC4Ss9wlQEo/eNNWHsm
	G8OlZjIJdh0wN4awXTYvOsaOoIqhzU44sEDdjIoOeCbak6vBtzfwXzs3A4DtliNhqHRJyF23yHVmt
	MXrWsi6w/10t7xiRZbh9AjrU6J8ade3OF/nUZtwwxF6lnW5jFop5sObhkX5awz5v+W2xcl2N6a3lO
	LhtoZtNrTiwrvfyl33bVh78xRlc9q35ZDiglt+4qLyzZlFF2ARms7TXGi2c+b742N5I7GAXyBs2Y5
	OHkuqE7g==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se,
	Jianwei Zheng <jianwei.zheng@rock-chips.com>
Subject: [PATCH v2 5/5] phy: rockchip: inno-usb2: Add support for RK3528
Date: Tue,  5 May 2026 19:04:10 +0200
Message-ID: <20260505170410.3265305-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_180421_889347_C2BB12D4 
X-CRM114-Status: GOOD (  15.60  )
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

From: Jianwei Zheng <jianwei.zheng@rock-chips.com>

The RK3528 has a single USB2PHY with a otg and host port.

Add support for the RK3528 variant of USB2PHY.

PHY tuning for RK3528:

- Turn off differential receiver in suspend mode to save power
  consumption.

- Set HS eye-height to 400mV instead of default 450mV.

- Choose the Tx fs/ls data as linestate from TX driver for otg port
  which uses dwc3 controller to improve fs/ls devices compatibility with
  long cables.

Undocumented magic-values are based on the linux-stan-6.1-rkr5 tag of
the vendor-kernel.

Signed-off-by: Jianwei Zheng <jianwei.zheng@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index d8879fcd4291..133cfd6624e8 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1511,6 +1511,38 @@ static int rk3128_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 				BIT(2) << BIT_WRITEABLE_SHIFT | 0);
 }
 
+static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
+{
+	int ret;
+
+	/* Turn off otg port differential receiver in suspend mode */
+	ret = regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
+	if (ret)
+		return ret;
+
+	/* Turn off host port differential receiver in suspend mode */
+	ret = regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
+	if (ret)
+		return ret;
+
+	/* Set otg port HS eye height to 400mv (default is 450mv) */
+	ret = regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
+	if (ret)
+		return ret;
+
+	/* Set host port HS eye height to 400mv (default is 450mv) */
+	ret = regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
+	if (ret)
+		return ret;
+
+	/* Choose the Tx fs/ls data as linestate from TX driver for otg port */
+	ret = regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
 	int ret;
@@ -1924,6 +1956,57 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_usb2phy_cfg rk3528_phy_cfgs[] = {
+	{
+		.reg = 0xffdf0000,
+		.num_ports	= 2,
+		.phy_tuning	= rk3528_usb2phy_tuning,
+		.clkout_ctl_phy	= { 0x041c, 7, 2, 0, 0x27 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x004c, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0074, 3, 2, 0, 3 },
+				.bvalid_det_st	= { 0x0078, 3, 2, 0, 3 },
+				.bvalid_det_clr	= { 0x007c, 3, 2, 0, 3 },
+				.idfall_det_en	= { 0x0074, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0078, 5, 5, 0, 1 },
+				.idfall_det_clr	= { 0x007c, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0074, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0078, 4, 4, 0, 1 },
+				.idrise_det_clr	= { 0x007c, 4, 4, 0, 1 },
+				.ls_det_en	= { 0x0074, 0, 0, 0, 1 },
+				.ls_det_st	= { 0x0078, 0, 0, 0, 1 },
+				.ls_det_clr	= { 0x007c, 0, 0, 0, 1 },
+				.utmi_avalid	= { 0x006c, 1, 1, 0, 1 },
+				.utmi_bvalid	= { 0x006c, 0, 0, 0, 1 },
+				.utmi_id	= { 0x006c, 6, 6, 0, 1 },
+				.utmi_ls	= { 0x006c, 5, 4, 0, 1 },
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x005c, 8, 0, 0x1d2, 0x1d1 },
+				.ls_det_en	= { 0x0090, 0, 0, 0, 1 },
+				.ls_det_st	= { 0x0094, 0, 0, 0, 1 },
+				.ls_det_clr	= { 0x0098, 0, 0, 0, 1 },
+				.utmi_ls	= { 0x006c, 13, 12, 0, 1 },
+				.utmi_hstdet	= { 0x006c, 15, 15, 0, 1 },
+			}
+		},
+		.chg_det = {
+			.opmode		= { 0x004c, 3, 0, 5, 1 },
+			.cp_det		= { 0x006c, 19, 19, 0, 1 },
+			.dcp_det	= { 0x006c, 18, 18, 0, 1 },
+			.dp_det		= { 0x006c, 20, 20, 0, 1 },
+			.idm_sink_en	= { 0x0058, 1, 1, 0, 1 },
+			.idp_sink_en	= { 0x0058, 0, 0, 0, 1 },
+			.idp_src_en	= { 0x0058, 2, 2, 0, 1 },
+			.rdm_pdwn_en	= { 0x0058, 3, 3, 0, 1 },
+			.vdm_src_en	= { 0x0058, 5, 5, 0, 1 },
+			.vdp_src_en	= { 0x0058, 4, 4, 0, 1 },
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rk3562_phy_cfgs[] = {
 	{
 		.reg = 0xff740000,
@@ -2291,6 +2374,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
+	{ .compatible = "rockchip,rk3528-usb2phy", .data = &rk3528_phy_cfgs },
 	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
 	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
 	{ .compatible = "rockchip,rk3576-usb2phy", .data = &rk3576_phy_cfgs },
-- 
2.47.3


