Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA9BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3gzz88V+PVFAcVx3LUmrgWPA1KoSY0xuH0j0CRlcRw=; b=NOihZ+SxTyyD51JGWm/7ahGYx7
	8CZ4CLJh9oI/r+/gFcBLwtnd9VsSBx1X73HkKJ0bUCGsYAdGIdHonKHpi/pPHbxevP18d9I1M5iFp
	ihc+/9grXJxwmTpboeXirJNzk7ZNq/aSb7RDlYzu3x4pzIXJh5N4o/yrtIYKEkEMGlCvm7F5V4Dqb
	qxBTAcOtpd9MZ4d0gzFSW5OkMPCZUBG/HQ58/mgfwidWtqiQBbTHMNoX1ytAaPxyVA30ya2MFx+LR
	cpF5R8paUxYyraYKrWdhZtKW9yXB+CBnWaUsh47UInzhMY7dLDZfWDuD/XxUp+vVSAHJXFqU+xTCx
	sSIixJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjinp-0000000D5eU-3a0A;
	Tue, 14 Jul 2026 19:28:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimG-0000000D3VN-10Jd;
	Tue, 14 Jul 2026 19:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r3gzz88V+PVFAcVx3LUmrgWPA1KoSY0xuH0j0CRlcRw=; b=kd1p8iir41kGbQIyhp57aT6tg3
	VVaXWg8S93uu+FTQkV1R3rOxaQLv2libx0D/ehMOjylEua1/cAtTTtNL35RHIKioAqae1RWGo9+Cl
	OXMP+lrIJv+kwYxYiSV8bP1xBKHZPQpicv9iRZ1mauVAlCjj6vTTgU2ghki7lF/lCCDu65p54hZnQ
	4J3Q4YWoUQvBX7qkrf3nMg2cxVA7ZjwCTyN8KXYA5uh+PF712bkpJm/9yO9F+Hjo/wNaC6B4Bgtny
	dzP+GNyeMmjEoZ3bB5ufRLervPWvp168uxOIAUvE6frIVz0iHnc7VUp+tvhsx8Ryb7O/+LHkbxAkU
	78+4pjdw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim3-0000000Co9h-2zXz;
	Tue, 14 Jul 2026 19:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=TK4faDxwkcnBA71dMWWF4PBW4tkcH+k9ZDC6o7zxR7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c/EWKfwaVQPeTejuzFZAoC6JJXdBbotavJ2SIwpEoaxPSmnr0FZLzKPl3TBFk1Qys
	 PqqcCNDj9QTcEfiFoGiT1Pr4YQ42vXzi8yf+Cz0ZktVOK5G5n78YZ0FK6sxtEpocrs
	 4IKDvfRZKCpqdPTnaZNJ/pvbHs1seol+idddlx28MuGGuKTZoj/GqRuL3yt7pK0c3R
	 c1ATp9cOJTZqQEshFjJkrvNzyvTUaDL+P9a1FiscFvjvITVzifGmbt1SlsH5S+e/oS
	 vF+Qmgvie6MwKW61/LyrOFb/l/CYxHy9QzMbJdZgnUOHbDpxV6Bqwsd7fpAhRkXZod
	 QRrT/SCH950gw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DF8117E1164;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0197648006D; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:27 +0200
Subject: [PATCH v13 26/35] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-26-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TK4faDxwkcnBA71dMWWF4PBW4tkcH+k9ZDC6o7zxR7U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVBRgD7S9jDMOAa2xwuOAnODOp8FDT59i
 J0EaE1aJ7ViMIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaNC8P/2dpxchbZrGDF2pbvOpDcw9yglidzt0zaJyB9WkfjCpZwb6bf/Jly+TJL7kh1JnIrEi
 OnnDoa1OpLWPgqPMvLOi34VbV6Zv82jKPTnCCvkZc+UbN8X6K9OO1v5o61s+F/Hr63i7ipoUQ4e
 8kbbGXoFX5daltHQhk0PLsrAmeLxU6DK6KMRt/4lWuZqIpi9eLFVJ4uEKZfpOm97ZCsdKwrfXjU
 uv6t3hoCN7Y+gGUQY/YNA2yIPvnhsq8SURfFdIe1N5S2UxZJX0EIgeM9zcpjl/mxTFQ04snnnu6
 zEK0taXgwuhi0W5DfhoBE0goIT4vIhXuVAYwnhAD9HTNfnpnplpTlUW1NBBgf+XiGlByk43hBfp
 SDlVaSgjVY67uwNVQV8ZJwUTHakEFYwkwv+b4CrCFfhpb9MKfckfPWMQYsu05tjk/Lm0wuV5sSu
 ke4qRPLUXhW13RJ4tJoqzALokJq/372f2g5EpMrYmoEZJSy2M6V1hPyjknuc3BtJF3Qnvtz1pBQ
 cQo4MOgMO0JCzi8jrRs0qvfqsbsF+382oGolMiasSjaKFyCZLQr3bdHwfuyTx/9dpNQktoYWwzs
 HfkE46HS2FUAyWnSoXU6OorKV1oDq9G7vresLN5yblc2Sg8WX3rj9DkRNpZ7U4WlrQHzl9TkKJU
 gwUtxvotdHVmDoLRUYKQzNQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202641_927260_10D3FFEC 
X-CRM114-Status: GOOD (  11.71  )
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

Handle rk_udphy_reset_deassert returning errors to avoid theoretical
(Rockchip reset controller driver does not return errors) SError.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c7f09040185b..701c92ed6e2d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -803,8 +803,12 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	/* Step 1: power on pma and deassert apb rstn */
 	rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.low_pwrn, true);
 
-	rk_udphy_reset_deassert(udphy, "pma_apb");
-	rk_udphy_reset_deassert(udphy, "pcs_apb");
+	ret = rk_udphy_reset_deassert(udphy, "pma_apb");
+	if (ret)
+		goto assert_resets;
+	ret = rk_udphy_reset_deassert(udphy, "pcs_apb");
+	if (ret)
+		goto assert_resets;
 
 	/* Step 2: set init sequence and phy refclk */
 	ret = regmap_multi_reg_write(udphy->pma_regmap, rk_udphy_init_sequence,
@@ -830,8 +834,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB)
-		rk_udphy_reset_deassert(udphy, "init");
+	if (udphy->mode & UDPHY_MODE_USB) {
+		ret = rk_udphy_reset_deassert(udphy, "init");
+		if (ret)
+			goto assert_resets;
+	}
 
 	if (udphy->mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
@@ -843,8 +850,14 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 
 	/*  Step 5: deassert cmn/lane rstn */
 	if (udphy->mode & UDPHY_MODE_USB) {
-		rk_udphy_reset_deassert(udphy, "cmn");
-		rk_udphy_reset_deassert(udphy, "lane");
+		ret = rk_udphy_reset_deassert(udphy, "cmn");
+		if (ret)
+			goto assert_resets;
+
+		ret = rk_udphy_reset_deassert(udphy, "lane");
+		if (ret)
+			goto assert_resets;
+
 	}
 
 	/*  Step 6: wait for lock done of pll */

-- 
2.53.0


