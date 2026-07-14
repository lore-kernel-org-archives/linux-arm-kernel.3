Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95297C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cMG/Za3lwjM0vfcOFEoqLjnMwmjeuIJwgCFydcn7HM=; b=s4KwbXN0iHZztcdU76IEfjgx5P
	lV0TUTJ3Eg6GyNJFz4HeBxCaDyZqiG2Yj7GR0BW8OAR1NgtTWjBWZBJx/4Jg84cmCdIcxKuTkEZoN
	j7DTL6/ucFPSBKFMg5bESusMCXIReOA/hI1ZlcO1s9dRqGRBy66GT47blGQYrqzmwgSOlQCsFVyyR
	MrFm/7y2hF0xMtWFGlit3cAdv/Fx6PPkmJOum6AeqNmjIk/7lZhYQ/jz/aog0cV37sjl6FHR7fcxE
	OBMnF2UVlqLCONetMXlP5HK0OcsKcN1IGNNlYvF1jcKwjoO374y5iR1CVQJYRvkvH0wVt1qw25YGF
	pcH54Bqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiny-0000000D5sL-1o6L;
	Tue, 14 Jul 2026 19:28:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimF-0000000D3UN-3kxl;
	Tue, 14 Jul 2026 19:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2cMG/Za3lwjM0vfcOFEoqLjnMwmjeuIJwgCFydcn7HM=; b=W4Hzbbb/1QHG/RYAcpaoTBCZZs
	wA/wPJHmbkQDy5iOhEmNCIO4i+HPemSBlwHUQzpT2tX8YBmdqsWuJ4zWnVi124dlgt2jJufeWRr/g
	9iQYw9kj/Hs5PhjEpT6Q0+n4IWW4a5XYvAWH8ea2z40ZUnyKZT9+pveclEWGraOIzEiC6c9lZkuvV
	xguLrv+vt0eJgfsus+in8yhVYsyEyWO9UPcAYijKBuv70t5OOTzyi0WhBl1AQwyuhF87YiOjlkray
	icW6M46Sdf0B71XKHuzo4j5Yaa1bUU3Fl9giXZUov0yY00Knwb6/D8uzBjlYlDGxqr0cXgmuB50Lw
	qh6aVsBw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim3-0000000Co6w-354L;
	Tue, 14 Jul 2026 19:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFGgt2J5SohmbJ+w5BT9dbUSny6KnYsQt29Gd/Av4cOA730GfIo68n2BxUIL27/pH
	 YmuIZvMQFdNepjIpCsjOvq+2UzAUSZqWeDOT6fegQEQIuEZoEcTonHB5b3r6GDSttN
	 VZ6K0u5zWSRy4UtIoKyjrzF0tPM+JgAAJHwJfy8/hD6oYiAssgenSPvynAvu6k0xSg
	 FjmGgXv1tKZDygzcH9Ut/1J/kEJMCZFq+/s2n7S9Re5/1srpr5IM5W3o/s9rl62Omo
	 ROiJSFrKfP0X+4FrKQzZmbwrPMng1Qdp8MMdXvgg8rwC0SuLt49a8vyoa4htEv6yAY
	 12vooh8a3NkfA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFA9617E1011;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E42AB480055; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:16 +0200
Subject: [PATCH v13 15/35] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-15-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU+OG362uZYuD3Onxc6MOF/dJNcYX4B6+
 FYWrS6E8zQwiYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaecsQAIXdLNXpIqQ2BwwmHG2/KGRkgviDcR1/6iw+grzpz8LmHA/kQel0X+LVtc++Ll/LC6h
 NxRxlxa5pYVuVZaQ3zNPW5rxtvzdbsSJMA+7/AuLAl9UUcbsHepHP2dI4LbLMKoncw+B7fo2JAK
 v7fKRoyVLr8JCkj3HApl9bgdr8Lb099OaHGn5r36VYRk/IWJiaFhgCJciF8bEnX9pusB1MHJssZ
 XNE8R61LxLJBDaCJkELSCZKF88kbTPBWALBuOindpENq72OfH++kz2StY+h/MQV6EzDF3oGMfg7
 ZzMdDnBHA1NtvxMcx+cSY/SYOTVqSSNJL6FYdjWlRyumk22nWjayGAUQm3p34tkN08c6YbOoGYd
 ydWSGZkwwfb+YUum9U29bxWZSC/jR6PfE9xwXJc7GM+09s9KrIpWbnaOjX2KmNVwkxdfpNhFWO4
 xsRGmLSmmr/WPTMJkicGMBBMuHDFnVsNbXrHhTcL1fqQSfDc0EUQh9+6zKk0NIZw67ESeF/uLGb
 82xXfhIDHautC122V71E6oRKYEK4sFcrZ7PfD8b0wQY/IzK0swISNHAvNTZBPsGj807SmBLQn3K
 u1Xhas8PREuQfqgvPMeIA6ysibw/Cj6FcCiH8FTZFnrLJZGGCwUsYsF2o8iN/GLhhQESufnrLiB
 ouIaXDvZYUVdPxH6O2ccmZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202641_946607_E6B6B624 
X-CRM114-Status: UNSURE (   9.73  )
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

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 05593e98c16d..eda3f7a1e267 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -548,30 +548,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0


