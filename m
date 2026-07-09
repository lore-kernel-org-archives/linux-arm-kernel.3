Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8330FC44509
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QXKS5MwQf6T0/WAFW5LMbVz+HKZ3oe7QplhumziNWM=; b=L5D9zOPe+qxZkgpl5cCL3hCtlK
	WuiefHwenogquGr5O87y9JjPtc2e2SLH+oJSFPimTXoKXRGpbXjPy85p+GfA8TD9VP3JTTjpsQUW7
	uYbWPndxdT+cT+aoVN7F9WW67l1qtXWyKKB/lpdPpFlcNQ54+DiFSL0BHFFehNC3YrbVSpEYlqh2V
	kEJHNa7S2CO0AL224a86WPg+l6RZFtFax51lyhjQkmUlB1eKf14rk4Ie7YKbSqdtkuw5FPADcPNIQ
	qWItdLcskx/hS0y4Muo/dgQOrVp8qm/jpMvPADdUAIwPrrWys/T4vi9de4MP/TUNqhkqWdqwL2bgJ
	YvPPs+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1m-00000003MxN-1XNr;
	Thu, 09 Jul 2026 19:03:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1K-00000003Lj2-0wqF;
	Thu, 09 Jul 2026 19:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6QXKS5MwQf6T0/WAFW5LMbVz+HKZ3oe7QplhumziNWM=; b=gE2IL7Pc5OqW3W7w71s7KUs1N9
	vss4OoasjbkGHmHmdbnm9Z7gu6AK244NUFIDP3CgjPvTNIkGW4sQaSA6oSdhGD4if6Z8i/KWFAYxf
	Dmh4ExnROPrfy6rrRBGmQ6s0Pgkm1GTbBR59K91X3NxGesdseV2SU8GVJF4kwn8D9TZZRlLaZZIFd
	QVUefTkkqcmSd6b8JfKXhuca8XpUJAuQn9/FyBW1aRmnhEVRhav+nlfqoRcDPErgCNBfNxJKKeBHh
	2z9hl1Ep5r2VGkwLxMO9KDvEuh0Zr0SQyY9AQsIi69CvfPlVqSqmeWFJ7aiMDP0HJpzCr6OcfPQQY
	r6L+uIRA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu18-00000009TL5-2ePA;
	Thu, 09 Jul 2026 19:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JNdMU5Ri7J8xHNaiqFu1/rJcvtchCZj5pPmc8NemZ3Dd7LbdospUyc6jtBne1uhin
	 bQUeCJ3Vlpgpaa7pvX2wFDwG17w6frd3PE7r7I3ht/e5ubqfpo1wn054MrHuSf5kTf
	 Ks41U532u1AuNNG2EMUqOMpG8JvFCJo8LGxndekDmOOS3VDPpAaDOsMvmV3us2dmEU
	 En7/pldIC8WxWV14oOoL2IMk8IQBRZDV4N6Jtn1TQs3VNiOy6nvQ+B6SH2C5RniH6l
	 GcxNcQ9nFvs+dXo9G0woMA2dihra/qfMvCgfgsAKcMFDT8NZodp9BxeUhc7ubtsoYe
	 m1++ihSoU6MQw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A72617E0EE1;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AA142480035; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:29 +0200
Subject: [PATCH v11 06/36] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-6-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ETmf7g0atZJdQHHhezDeQ+YMN2H11XwL
 SFRv5ymuC6wm4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qa2FwQAI3EUOp7iOK/foy7cS2fIu6WTTCNGEOoo9I/PFOt+BhZpPgfGII1EbkSRwjfBpVzOuj
 Yn+faX6U2Cd+X79C+ONJcPesbGK3NaG05K9YHeoS1rz+UJFkzMTl07a96bx+gr0G7v0/dO9Wkad
 F63xrNLS4T0nhT3r54xoOch3HuydfRSQAi9T0oro+NbChD1RTHzn0xKy/Me4TRZlIlp56jAgiej
 SUc3mqte2Zlxq6kRJo+Odm31VvHP9TNLn5thX7+bNuHqV22Ap3LD7KVZY2Q4gCjZ7Qf2XKzpH+L
 TwXeLIjAXVhVbBdc9SZHBqitA0Eq6B1Y10Xwe3b7hjOMSu75mi/rJeLR9w9Zd5+ozvYwIM8g4U3
 CTuv4adHqfrQYroXkK+TmSSFfNkUJA3zRhEsQIK7R+tglN0ZsSX360KAMO/KuffyPZD7BxPHUCn
 dNAkSZGhlkhh4uFeua73z5+tSPhiilU9EfLo5uT/pt2ZN+6v816rWEbUiDs0JIqfpn8bWub2PVb
 HRY1IpYVoJYZiMSqtOKy/S8a3mRBFxomAy2gexKwWtA2GnEIWM1C0IhgSkMw0uLj0PWpF2r99xx
 yCpnvicchF7/drRtMWEvrAg6a9ejem3MK+6P5Y5SKk6e3FrqcITrM/SRHaWnYIltZCLKAEedsyD
 VwJtZ06jrpFRXGHVdyeowwg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200241_741513_18CAAECF 
X-CRM114-Status: GOOD (  12.54  )
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


