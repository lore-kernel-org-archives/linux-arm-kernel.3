Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43347C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB1AgcSaGm6xIGd1SzCXsKr01w/8YieE6ZKIcR7OfBs=; b=wv1Rw4erf8q+aBrO+LjLLBAMNM
	GPpanh3KcY0iaSek7lL+8T850tzJDTzezWalhrImseSLMRczXDjWYsDW0zJnlY/TPhdOJMymg26PU
	wuIhYloH1NRYtUJZtj2bLhPwFxoFGTUfrTyLAVlCc1X1wY73PDyAOyoxJ+ZVuYvy7MG3ttDoY4KGX
	5D17ZtBnKCgSCemf6SSqa2Bb8c35sdYJdLoAn4fXetkl4HAzH07D8GFFL5BmXmaA3T4mbxcjMk29/
	/pyBAgkXCMcNtXcKzZvu7Z70OffGQOwCmGfUEBGJcXW/Sj0y3/Ug0FYCU/eOPPrboaUkrdjgd2HA6
	TiDJWW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjina-0000000D5Kv-406s;
	Tue, 14 Jul 2026 19:28:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimE-0000000D3QR-0uUj;
	Tue, 14 Jul 2026 19:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cB1AgcSaGm6xIGd1SzCXsKr01w/8YieE6ZKIcR7OfBs=; b=QtkaQHAKLqNyo9HpER4Tmw32C4
	Yy4uBx8IorFotD48hN2qrX8wdXma3UFMGmxf4KY3Fa9+eYocxu0NtRq1AyC3V4MKfoZlpDGBXafz6
	ORPG+cDyKKC0Cwy5l3B/I6dmrRTOVuBhYYdtz17kRkWq4vLMQEySSmHxWBpsDlb1BpVobm5/yVfMH
	kCEqUAsSu8VOIeC6e1HjULd0RSp6syNNey5NlnhR2LcCCkEK9XI8gFt3kYDaeKeUe4Rq3pCnEibos
	+dFiZlQe9mlzaAM1N1jKuUfm4suAz7WzCDwyuByqSxLKDS2X2ZRWMMUVBkHCgGUMnAODiPPAKxOiH
	K9nONvMQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim3-0000000Co6y-3507;
	Tue, 14 Jul 2026 19:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VTzqebIDv1ZSojFoIqdnWt25OaJUQQ5tvYIr8goZFxoEZKLsYstzzH18kyGKS617/
	 AnHMJO00PLjh0W/MnvkVG3q6Cz6faVwdCNcaFpaAIcpJ41OrsxEqgfSsHyxAbnAge4
	 T/g/m5vrtlrqCRMTGsIn56b9J9Gy9SPgd+Ew6t+a6V0li55yMmsPAbKYCwtPESRknM
	 cyIXrA5EfpTt0Tsl+AHThMC4SbwOwd1UpbJW1A+ahr1vyr28N+iGfWkFObIW/p+gVL
	 vrtRqegpEXTRiQhwYclMD46x5oBj2ACe6vZGc7PCkgYRm0bLdlpoAYLNmr7jojxaRf
	 HRsfZWH0kT2Qw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93C0B17E1006;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DF60148004C; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:13 +0200
Subject: [PATCH v13 12/35] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-12-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU8sL+GNNtHpLXEM4MzDJ5cFXYELB/2m7
 Q0EcBtXP1Ghs4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaw7UP/iznD1gZyLHaL62P9kRPOgBf4ekeNuwGvU0+4NOqIYl9Kxt1AQJm4y0aV0TA9SoPywI
 m1yqN2dd8Unk2G0HMmCOAZ+7Im9zU0kWg2aUtFADBA9HwW5tpQ29ou6p7LYKnLOR5qkOQCoyVHt
 wcKv/0wzGy+VdUC5EqysyyfYNgXxboOzl8IkVkAVOkBoqMsKvLoTZXdf4/jCaU8w/d8JBb1NiXY
 hhpwLEwZAGWfdr78JKmq+g1xAFwugfs7mjr6PJEvS8mJ9EQqJCpSRujQHUaNtEc0RVNe4bfK8ES
 YBFx9wwKR23rjLUwxk9kqyEJGcOZOTWfG7e1HwHMdPymqwitd4ZYUqyj8ysMDeac/DZOPZ4Kt1m
 ZCC4/IKNer1RiXRpigWy8RWblsw7+M0d/6TpnRAmnotCiPlQK1gx8GqFSYGMOhZdDzlKsTyO0Zd
 BkdYdwa+mD7xKOX/FPSYhOL49YbgDuDmgXGJr2hK0DIX7ocZnPdJydqneLdEr7YIZAR3zExOSlu
 zekKZn25ZlAzyJxsByortwCf+/ghTsFuiNkdDOQpxI7UvS14gK1DgR3cusArPR8eIPHFqlgmh4d
 KtozIIHZa2TpioAC2919EF9vaTwSlOOwDzErKvlJsc4ydFXnL4sIELgYdhAzCDUbUj8LaXrXucD
 ebs9kJBFTRxKUT6q7wL8a+A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202640_657425_082A4435 
X-CRM114-Status: GOOD (  11.97  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c4d62b234ea8..b172ce6a722e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


