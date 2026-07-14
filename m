Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C86C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QXKS5MwQf6T0/WAFW5LMbVz+HKZ3oe7QplhumziNWM=; b=mYx8e8LAYaa2Yyrq9C9pcSWY6/
	BCA9UQS72Fz/6jNN95qXZAfCqMsc6wuS2ZzemGN3eTvvMaATmf9K+f0fEL0d7ElMFlZDGJJtxHL4w
	zRPNrq0iFMXZ8YljZGEeeDNsSkLuV+Jq1x4EnbteSY4G0mHA5cUwD2IDVAeZIOAQnchVZHG2UnXZu
	whk8IejIkpEX3nXhNNCkhCoytwUtnuBNFrw+aiOM1XF9uqjSmYF9ldhB/BGNfD7NOojSW418h9eNW
	ZTIAQsdBPtMfNgm5hATB02VZf2uVP0NZhfOKJkoV5Q8oUvHsFYc/hWENW+cUtTcZBhaIFcEkd3Je0
	/CL577+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjioF-0000000D6PE-2C7m;
	Tue, 14 Jul 2026 19:28:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimH-0000000D3Xw-1HnL;
	Tue, 14 Jul 2026 19:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6QXKS5MwQf6T0/WAFW5LMbVz+HKZ3oe7QplhumziNWM=; b=D6qSb0voNAiJb6HRyKwSQTA+pw
	gq/NvfMkH2jja35k/83BrMafmIurslznLcFmSTrMC0gVxAHisTjOYkzwa7ilTkz3lABWPinEUkbUY
	zTNucqS/2mytbcSyWUgOzsqh9tT8YUVFhhQ49yM6jHBJaKaaN/NxEoTBAGnBIKXNyHpXrpZdo1o1Y
	+yXUW1BwiGUHGQhG1HrVfQjaxa8mnLYVwpx0HaD6qMOxtqUI9R7OScVjqbvmSBD+U2CqQK0VV4v4R
	RH5Z2dd6/DGkcKn1T/8B9OzqnA2yfb5kNq+DTXwONqBFVuvPrn3hH4FXFftilVOKdGhQwlcj+govR
	vIdkjUyw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim2-0000000Co6t-37gP;
	Tue, 14 Jul 2026 19:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z29tfM2xg+kQMlc2zQWxeuLVrFtENE2g30YALZlVC0jyHScYn3wf+Ij+YghR8sWtu
	 D7qvTwSsR78etQYldGHFITuFZbOj2/4rpzYQmzIAPgZ09iL5kjE9YqG+p9VDDbHjA6
	 tOXtVqnjeVSzNGIZ1n+gqtllcLZiA4U1G9h9cNIVT9GtgmMV19Q1IbSYXUy+/wXTqB
	 lkXVye3/ZMrSZYCw6y365dk3fu7dRik3rSpZSseGJxtG8SluE1myeUdmrIfaiRMQnT
	 +2DPW6B80V4Mru7GS4R2q5MuPHH1kdP7kACB7Z3TF3+gPifds8HGgndYRlvcgzHqDI
	 WaOjnknBMT1FA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73B5017E0E6C;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D5082480035; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:07 +0200
Subject: [PATCH v13 06/35] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-6-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU/uwfL4STqXRuC3W8sLqwaDCIZzbW+AM
 /KRNr6UZC2tmYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qarFkP/i+RCxZzpzX6kQbSI4j+bC2QyAtqoNDadfV3xUoPjXTUVhIOg8qN0NaYnqyC/DS1VxL
 riVIevwwuCmETDrPZyR13YSjWZVKC+pog4BcSm/3NyajddwRskYjDlBTda6jTxKKKufRTYRrILj
 hi/vdDNxrgvWfN/L3iqx9OrZ6yNp2jPdSS4uY6VMJOILDUJCaO3QbGlCNpXatwT7Of00nVVZgO/
 UhXw1gHJRmN4rzq+U7liQzaU65B2vbyvsSwNWWq/BEQ+v4QGxeG9pWx99cvDlhd9Esz08GR0KTJ
 QPhy9ZIsNv4VZ4VBrDm+olfLWHV4QR4fXKFYpQShIQlaFP3tZDQTE62CgkAN1cHeIME4+2Unk1t
 WDeIhy3rfADdQTark5pxHHoDlU11oPqi6DUUqB6k/PppwoUPMTepiVoF3tcdvop3pACwGkcioto
 HLb6wsOd2jhB2COwePJAY+EI9frwLGlg5ERoOl7/ZyD4QzsEU0L7UPBp0ZiYKudDXXtdBHVcdAf
 k82D8xGFTtNspBs2twYOtY1OFTjkB5EjPxmmPBZniVXg/1s1fPLl7XaRbTTLXpshuuEAD7mbkhU
 wxgyWnPIomuiO5ijFQIrNfYCZ0c+UgE4MMA/01U9VjV+xAAXDUsJOFteKE94bH2LjRSnrfaO9Ps
 KhZqOLROINiphCWxQDh4i3w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202644_244487_37ACDB32 
X-CRM114-Status: GOOD (  12.53  )
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

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..6cb9f6b4dbf6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -452,11 +452,6 @@ static int rk_udphy_reset_assert_all(struct rk_udphy *udphy)
 	return reset_control_bulk_assert(udphy->num_rsts, udphy->rsts);
 }
 
-static int rk_udphy_reset_deassert_all(struct rk_udphy *udphy)
-{
-	return reset_control_bulk_deassert(udphy->num_rsts, udphy->rsts);
-}
-
 static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 {
 	struct reset_control_bulk_data *list = udphy->rsts;
@@ -924,28 +919,6 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	return 0;
 }
 
-static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
-{
-	int ret;
-	u32 value;
-
-	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
-	if (ret) {
-		dev_err(udphy->dev, "failed to enable clk\n");
-		return ret;
-	}
-
-	rk_udphy_reset_deassert_all(udphy);
-
-	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
-
-	return 0;
-}
-
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 {
 	struct device *dev = udphy->dev;
@@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rk_udphy_get_initial_status(udphy);
-	if (ret)
-		return ret;
-
 	mutex_init(&udphy->mutex);
 	platform_set_drvdata(pdev, udphy);
 

-- 
2.53.0


