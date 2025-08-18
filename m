Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D50CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+5IwQloeZ4s/pt6Wt3+HR6KU8l3WuAdZGn+MbTJhZ8=; b=Jofid35hZc2BEgn4UEA5Mmu4dA
	dp27XeXqYj0JcB5bD37u+j3Lc5l88dzWAfFAwT+kS6cRfr7C2bTMd8U/fDciz7jaN3rxueCC5udiz
	pj90G+31JDDYZqwUdgLE+rfFuUbQgmWDrQjiJC494pvi8DBUjGOUkSpOHISuHDfM5RyFcUDkacr8/
	NmadaKJjInYsMVFIVNM0X+Uu0HL4C7GXKtLZW8tp1XLOUQ+9VaXG4oVmJTRsgRTI9roCwscp4SmkI
	e4OTv3a0gn6XpXYRL+NmzP9FrfXyY/FfQgaFnIPJgIZnw8f97jYSxOVqsF9xBqXATX2yg5gVhbz1g
	A5nSCfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5q5-00000008YfE-0Mgu;
	Mon, 18 Aug 2025 19:48:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo54o-00000008R1w-1Zh1;
	Mon, 18 Aug 2025 18:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755543564;
	bh=JwETUuZ6nd0L9eT+cj/5Z+pxEMYfhNw4fY5mH3b9o6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XNFBZbYo19YuDPFc02mkBTNbDZvTO9O0TkOmZIVJkxDSBW1E0qeJFQsBPzDVXS/8b
	 5YYXdByGpXc3n+1brMal4r72HJU0x/gK8IWlDLWgG99Xv9uFME9NxQA73afH/E9ko/
	 koA60EJV7yZb6V44CrF/CIXNtAbV5+zS3oBQdlczN+GLfjIqeo5fPK3x1rWfMLXWDF
	 qy7LNen9isd/0Nd8inocHxCRsrA4d2a20yGguZBU1x9Xh6y7jb7gGSrjJ1fTXQ8y6b
	 1mUVNSxoQIy4cTrgmrGTbN1jg60p7Hpz8srBQO847BSbUeQNqUgByH5yQ8kF0tT7vu
	 csz7m0ZEl4i9A==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9DF6C17E0154;
	Mon, 18 Aug 2025 20:59:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 18 Aug 2025 21:59:06 +0300
Subject: [PATCH v3 06/14] phy: rockchip: samsung-hdptx: Fix coding style
 alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-phy-hdptx-frl-v3-6-c79997d8bb2b@collabora.com>
References: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
In-Reply-To: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115926_604747_E301206D 
X-CRM114-Status: UNSURE (   8.02  )
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

Handle a bunch of reported checkpatch.pl complaints:

  CHECK: Alignment should match open parenthesis

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 83ec892bd6760865fc9e361f4003c5bfbef55608..495427fc44b385e23da02cd21eefdb137d8b5fdb 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1657,11 +1657,11 @@ static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
 		regmap_update_bits(hdptx->regmap, LANE_REG(030a) + offset,
 				   LN_TX_JEQ_EVEN_CTRL_RBR_MASK,
 				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_RBR_MASK,
-				   ctrl->tx_jeq_even_ctrl));
+					      ctrl->tx_jeq_even_ctrl));
 		regmap_update_bits(hdptx->regmap, LANE_REG(030c) + offset,
 				   LN_TX_JEQ_ODD_CTRL_RBR_MASK,
 				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_RBR_MASK,
-				   ctrl->tx_jeq_odd_ctrl));
+					      ctrl->tx_jeq_odd_ctrl));
 		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
 				   LN_TX_SER_40BIT_EN_RBR_MASK,
 				   FIELD_PREP(LN_TX_SER_40BIT_EN_RBR_MASK, 0x1));
@@ -1671,11 +1671,11 @@ static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
 		regmap_update_bits(hdptx->regmap, LANE_REG(030b) + offset,
 				   LN_TX_JEQ_EVEN_CTRL_HBR_MASK,
 				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_HBR_MASK,
-				   ctrl->tx_jeq_even_ctrl));
+					      ctrl->tx_jeq_even_ctrl));
 		regmap_update_bits(hdptx->regmap, LANE_REG(030d) + offset,
 				   LN_TX_JEQ_ODD_CTRL_HBR_MASK,
 				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_HBR_MASK,
-				   ctrl->tx_jeq_odd_ctrl));
+					      ctrl->tx_jeq_odd_ctrl));
 		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
 				   LN_TX_SER_40BIT_EN_HBR_MASK,
 				   FIELD_PREP(LN_TX_SER_40BIT_EN_HBR_MASK, 0x1));
@@ -1686,11 +1686,11 @@ static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
 		regmap_update_bits(hdptx->regmap, LANE_REG(030b) + offset,
 				   LN_TX_JEQ_EVEN_CTRL_HBR2_MASK,
 				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_HBR2_MASK,
-				   ctrl->tx_jeq_even_ctrl));
+					      ctrl->tx_jeq_even_ctrl));
 		regmap_update_bits(hdptx->regmap, LANE_REG(030d) + offset,
 				   LN_TX_JEQ_ODD_CTRL_HBR2_MASK,
 				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_HBR2_MASK,
-				   ctrl->tx_jeq_odd_ctrl));
+					      ctrl->tx_jeq_odd_ctrl));
 		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
 				   LN_TX_SER_40BIT_EN_HBR2_MASK,
 				   FIELD_PREP(LN_TX_SER_40BIT_EN_HBR2_MASK, 0x1));

-- 
2.50.1


