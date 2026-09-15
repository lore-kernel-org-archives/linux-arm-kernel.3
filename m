Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF6C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zsa/PVavygtSQ6TQR50LWFBJmHsYIzP5DTETWKXLtTg=; b=rDwSANGC79X00mOM7sYAyKD0AV
	CEUPyO5VKWvw4wgjGU2s120C9BvGh/P5/YIcLnyL4sXwss1Zqn9d6L72MlK2nSWU17cIfEQlDVWcF
	zVBMdkcOOdvL8icP2SDp3jS9E86WOzLEioji7OuQQbCxw/Wo1DgdW1y+OXezwFRexSCvcSG6prGqB
	sm7d20uUx7Z9fqHOoPDB6Q212KpUk4JW+xMHHTdUlkV9A2HyLFOoKUEsQ5wv0IYEMvpa9lSo05Gvp
	FL7eKgPycMWYbso0anOMzT+LRJ0UKoHDCMtJdyKJzY2VLQELmLKkpHtF/ObMGP+35psfvzkMrgs3E
	mVMGDwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TZB-00000006odE-0KSV;
	Tue, 15 Sep 2026 13:51:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TY0-00000006nXu-1dtL;
	Tue, 15 Sep 2026 13:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=4oCqXMxVsoIyOffGedtIRbbdIb/gE7Hwhb2soSG3s0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=okbQGXNcdKbvdFRXh6MisO4zRMxjQ+o9Hdd6EsP3T+WbqHtXfxBbD+1MOtVygwfz5
	 +bOD8t0cCxhkwHqeIJfXp0XtCax4Qbu51/Ge9vhglRUr9xYnbHXdZWR2cvBC7aa10g
	 jFuqIN3Gn3hXPppvTbC41d45e3dCo26xVQJFHvu8+HZX2jT2jNeN7J/d0vL06RaR+C
	 vUM2iRceLCbLWfTW+ltJqqCpzmV68lxqLevL77K8Z1jGquP+jmatOmZ5EL6tPy9Ote
	 /JJVmxjU82cxbjG+/SXFB1H0w6Ip8RSp2WD/H62IY138pMnQOtXVDTj5tHT4+JJ7No
	 9Pqd6/wJvlChg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F415017E0E6E;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3E30A480052; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:50:00 +0200
Subject: [PATCH v15 13/16] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-13-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4oCqXMxVsoIyOffGedtIRbbdIb/gE7Hwhb2soSG3s0k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQaY6fxS4bdODL0YA+d228P6N18rkZrJS
 +1o792WF0UHJIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0GAAoJENju1/PI
 O/qaookP/3aBDQDQAKSTVuEWLQwC5RLE/YY8exHHuAL2TwtpAh2DUB3OJcjSUMACS9Faepyx9v3
 0jVmK7xNFP7QP1k+pZvo+0l8adbumMey5OKUCc096dmhUvf6onqfDcukaflBLxJR+Oup7Bw0BTg
 SLmnHvfionGPA0tX7Pm2X0n+O9MHKyZJZz+9bYhGKUhFSn9NIbTzJwJ8VASdm2XUGZV0dpUyEWS
 WOsSvrqILnw+XW/PgDoWcRyi5bspeu9N+aG0GP7dW2dJL19mmFCz+MoIwFKlhQmPDqn1HTk9OwX
 hQVA7PE0LNlFOKUBxiHyF6jJlFJNgk7Et5Bo8ALYj3cxxE+Hh3SQXrIS/Gqync9/ycTBW8+stvw
 1FiPnPH4yTS0QJq7SiuADPyOJ5Eu96AD6wjokadEkGR2hxzi5bjtKvoOZWDWiHKmJ85HY8VQeYm
 fkJILPXPWOEzsUhNZvITQ2RHIN8QQPl8Au1gmGcr37GGJkKKLjdcH0Fm7HJmWigbfsazxXtvZoH
 qfAaP8xopnOPdHssCw3iyuY3rmDYKFKyrqz3/L+vhGdB+9x6V2FRWFCzFsk5T2MIUxv36z6pkPP
 rkHNC1UEpveg8m1k/rUl5y+t1yYIQC89EXfEOQHIo9Ec5RHqdTpWB1ImIwIWOQk2Z/shb32QZ0A
 ilulJEWc4fgvBGTSHLksoMA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065008_647954_7695D9F3 
X-CRM114-Status: GOOD (  11.67  )
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

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2af7c3878714..9dae41239e48 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -544,7 +544,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -573,7 +573,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1048,9 +1048,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1068,7 +1068,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


