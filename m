Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06563FF8877
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcDc3CQYo8FDImzdkieyFqjphie9W9jafxj953EdoBo=; b=lRvbx/pFjHV+is9tnxNpw1gxJF
	MF5KbRAntvPQtM8PoQFL9Cy6oCrgFgFvupa5lyVlLQ1WiTRTMpjblGXNlaco7+lFZmzb2IC4nZnQ7
	mKEH7GawbS++/jDS7lCiXs2U7tG2Gsa1ih/vPVODHAUXG8BEoy9w+UnSsNCY+ANa58My/RehkX6ug
	GH7xDE3yzQMm0QydvUwFaxJbGI39Qvv10kVUak1gYjdoOtILa9lVQjJDtTeKoxshIrMjuio4gll3r
	qFsrhttCyh/sl1h8mSCrqBdN+TE85vInOu34NqYRoRpmj8Me9Z30/Y5DjDu8EiKlFOVhuf7FLPjmL
	7hck3oQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4n-00000001t3L-2fVW;
	Tue, 28 Apr 2026 16:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4f-00000001snk-02oc;
	Tue, 28 Apr 2026 16:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BcDc3CQYo8FDImzdkieyFqjphie9W9jafxj953EdoBo=; b=rO00/bRil9s7tVNw954MZHpaU3
	/y6DB++llBAxnE1h421B+qWcvr6rignhdznio/LN7pQDANmMXZJ2g42zraGkjHfjfIDejUkKpcPXR
	C9nBwV06T2fsIl1aW2sP8l+/XelmOI2M+zdTCGAXWA+wfFnAgV6lXkQZGiUtl4ISyaP1wrofQiPZL
	doEqK/XarpXsxSQOulbMwExWThNIpW8soIJw4Bl5xPVXR5Z1zPN3SqL2zRqZE8ZP+klq4czZ9j3r+
	GTL40ca6A8Wlj1iyA2nfeVQz7LY0tUCNngOfTfWnJqqL20vvAdt2i4p8WHIn3rh+3LMD2+KvbJTPa
	SQaXcF6A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4a-00000003ZKo-35FT;
	Tue, 28 Apr 2026 16:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=vJfW11wiGelpe9cQawuDCFj8JmgWHyXe7dAI8G8ccBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eXlbmZtSCCZhfVcc+NE7e4yEjQUSOJk/hlAqPPoe/DQxlOwpe9tJvAlz2HPE0UR6S
	 Ib4SaqeHkOLn7JfGiAaY1HgdpZlpgQHVfo9S65ppy8l60G2eCPipf1jTolDT779h1o
	 K+0q5SXOl516a8SOnSMzzE5YvaD3uILRrYy90KGRW8tk732sMoVA+3XGkkS7XS6cYc
	 fQFQ0hlvZk1Rja5vRRiRoz8Lpe9Ak1CQf0CTcLBsm3zTSDZ2c7AfhORGTx6tOVTXVV
	 no1gBt2lJBcgi17gmu7jEl0iiZxXRXGY7oRsvlaYUAtmLN69CsOhYHUCy950xksG0b
	 mhI/KAwt1XaPQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F95B17E1580;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8B5F6480048; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:47 +0200
Subject: [PATCH v4 08/16] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-8-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vJfW11wiGelpe9cQawuDCFj8JmgWHyXe7dAI8G8ccBI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkQUfVzVlT8HbCMYVEmPFLAMy9yuKxPs
 lfZnsfO5HO35YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qamZgP/03xZbJ6F8WnQI1p+ecPTzidZcRNHamtGeyIgiMW7DXJYuX3FL0uF4sInrunciJbalB
 anRf1gIco6rbFBdOypA7gXvPbB8HrTcQX2hGfmLWic+/Hq9dj8Di1LQ5KWnXtjbJPDiExqptKYZ
 d5Dw7pnd9Y7lkbSAJwp1Bu5u9FMCnPc9eAR2IJsXBhBdqLGSQIYhQWFs9tj5Du4YtVZDXBDVd+W
 GODdkpZzncoOGCKwocP33OykGdADmCqHIxJjdQn6LjJftKgSd+75FGnzVb4nnBAJJUW+Xa8nzVR
 zWbWX9ppKPhFS4oOqEMrKgF3CxILCqz4HavxwhAW7dTUG+luxVxiTp1t/3zJKn6RXH1rsmMoVQL
 aDbLBXw8gUt184OcPzSoCtZlwFGb8kMJqaRNmBnNmSAWukotV+CTqXBFgp7QASUTfRAuVVgbfwu
 5p2oOWyG0w2cfU/ZGhHw70gEncfrzRfBzp7QeHReKV6EG2f3shVe7PD9kbHiSHODRO5vQVcYD7w
 smsKdW4QJPyabSZkms2BqjlDmEuS1IytgorUiSE+StUJxD9t6GM8t41dzl/WzKwrqecA5b8lRP/
 HnWkQV6WUuYu0EhkMgt62Ebn2SqSUV11R3xzB8/t2TApkn7Z7cXY5B2kdnr4rDJ9CzwvbggcWKG
 dib4th/rd5jZCUDHw+Scp/w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_171408_900491_6EB75C17 
X-CRM114-Status: GOOD (  11.41  )
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index bf8394174294..6d7ca11b308e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


