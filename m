Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8DDFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgZF9PG+qlhNhS4BcqXzAn8OVQFj8tiueiEMABYM/9o=; b=yhIE2MZ3ymQ5JpTgzhhpRIiBcT
	lIpO/sf8WB422QGcNeMAcpdAVKOJTqgKieTCSsu1Cd1JUv30o5bmOk5PS4OGi1lSeBQEgjM09/ZiK
	Wvb4e0CXRWDKJOTAlMJbLYZBMlrptcrVPeWSa5hoJN6TNmEVH0RvDX1IlISHOv0/OSPFNBUErCVfD
	Y7sCva5u4tBFSiTVavnAsUC0v8EagaFQwOXd6YXJfZGNwTtLUPA1pQ8btzYnFr7Lx9WXHZe8wudo3
	wgPvtKqoqK0+4CvRChJ0/rybqXOwVSCQXrn0dVQRh2XLRCmHv8150Eut0SX37MJwYFYMsjZ8EGiqt
	wPeShbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4v-00000001tL7-2vEc;
	Tue, 28 Apr 2026 16:14:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4i-00000001st8-0xmk;
	Tue, 28 Apr 2026 16:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QgZF9PG+qlhNhS4BcqXzAn8OVQFj8tiueiEMABYM/9o=; b=V1yfQk4hiMlJ4ucDUIzs0u+FlP
	XpYWrOsP3Srz/ZA2+49bNnq8lFOQyzGth8zsY2/5V8aovfxAy22BlDf4GFNkNB/8WSKSOrNCwRhC2
	RGFlTlm4yFTP7jJc73WBn9B8G34n+5zoeacgHzGHx8dv1Q52FK2qnsYvgV849nNmpdqwCtqn7PQM4
	Dhr+kv6yCqspaoufyRoVAOlKIlpfsA3ZLYMOHOTmI4UjOzZZBfn9Lkb4vgmq9BzZquFsUEowAO1XW
	z+gFlUv9PDO8/gK8U07M8aXhT+0RGaS7vScjdzyfTt37nfaSbtQ5KzEoeQ97VR3Jn8orPpmz4sT8A
	L83fPirA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4d-00000003ZLw-4AL5;
	Tue, 28 Apr 2026 16:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=+pleStZDe9MkxPKCrTUKOzh1pFK+HK0JKxesNBRI1vY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnhLaPet0sS0Y2E3U8iS27k2fMzcjOxKAIXK4BYMgNhHW63YEtr4YbXqE5hUYzOz9
	 JTlvIG+PjIMbL5BLRGNku4+WvNJK2Dvy22vMAVmJCjbVaMjpZAkyyVgZdEJV88alBM
	 U/MsAa4EePZJjQNmNbMe5ivTf0vcMyeiMXHmpGiJxCuJTa9oJ6hbFSAlubsrQG0Txx
	 h+Nj9QFVNHKxkfmH698fwQi6jasMJi15Uez/Ad9XUkSt+mHpBWgrxMqWcMf/2EcGRj
	 sObhkMDGGFwigVLHCuartcun9DMuIV+qU5Eaf4UvGViFok2WdjeR4yvFwoLQ1cFsGc
	 1MkgOQwGqWJIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EEE717E15A5;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 91BB6480055; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:51 +0200
Subject: [PATCH v4 12/16] phy: rockchip: usbdp: Drop DP HPD handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-12-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3585;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+pleStZDe9MkxPKCrTUKOzh1pFK+HK0JKxesNBRI1vY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkcEEmJWVj/HJ6gFmDHXCdp3xH0Fq/nt
 1m9ttBgIc4FE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaFUoP/is9eYWtBs37ZIECMcAQbCv0VCBuQR+En53eonuQcYpzczNhPZwM6BOVW/oQXmldkll
 EA+820mLllRzx6fXaQmLMG2Epmgxj70q2dUGvmCMymncbJxpdfPHu1N+TplDjAAsM2Gh/Mzv1rL
 xR7RJimwYyNX1ftS79nUwWkwLxycveAOMaVhAIqBT4f8g+5tBrN0kHiHjGR6RsRARVdyz3sewUQ
 0+AoqZp2iintmS1l1J9MkHDm+rm2jftpSr6/dm34z91jCRZ4CzgjJ55qQVg8dETYOLdG6jDgjVJ
 zHJFGtfY/MZUftluxz7CLLNQbMv2OgcUM/nEijTywiXgN0NDgrpcFTPEjXyYCR3tJRpootqMale
 PIgiQqItA/g81QJE2GRrnjTJzRcbidjT2MRXAGOV8X5fMehdZCMxCI2+k4IFyyeV42nLdXXYExS
 KmWuxzodBCeMqXWtqEZq17O690+KttKgnW0Pm6DJVGBxM1fBtH8AYFbP43Srz4wIFcxR3M5zhOp
 rE6a3wKZmHCodyjsVJpcw17KBMHyinAEWRLokajbFgpuxNv9OJqQf27LMhgQeR1P0WHzmhvi6fc
 6LAxXNjYm3JZfwqw2RrgpLY5hvgkIQvfT0nM93y6ZJrJSKlxN24lh2V9/u8san1BSfPIrWwV+LY
 SUg1sOiTJVpOmX5hRPJUn+g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_171412_099132_AD6291C5 
X-CRM114-Status: GOOD (  16.42  )
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

Drop the HPD handling logic from the USBDP PHY. The registers involved
require the display controller power domain being enabled and thus the
HPD signal should be handled by the displayport controller itself.
Apart from that the HPD handling as it is done here is incorrect and
misses hotplug events happening after the USB-C connector (e.g. when
a USB-C to HDMI adapter is involved and the HDMI cable is replugged).

Proper USB-C DP HPD support requires some restructuring of the DP
controller driver, which will happen independent of this patch. The
mainline kernel does not yet support USB-C DP AltMode on RK3588 and
RK3576, so it is fine to drop this code without adding the counterpart
in the DRM in an atomic change.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 47 +------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 77ad2a89d4f2..3f1233f50686 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -186,8 +186,6 @@ struct rk_udphy {
 	u32 dp_lane_sel[4];
 	u32 dp_aux_dout_sel;
 	u32 dp_aux_din_sel;
-	bool dp_sink_hpd_sel;
-	bool dp_sink_hpd_cfg;
 	unsigned int link_rate;
 	unsigned int lanes;
 	u8 bw;
@@ -579,19 +577,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
-{
-	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-
-	udphy->dp_sink_hpd_sel = true;
-	udphy->dp_sink_hpd_cfg = hpd;
-
-	if (!udphy->dp_in_use)
-		return;
-
-	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
-}
-
 static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 {
 	if (udphy->mode == mode)
@@ -1360,22 +1345,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		break;
 	}
 
-	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
-		struct typec_displayport_data *data = state->data;
-
-		if (!data) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		} else if (data->status & DP_STATUS_IRQ_HPD) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-			usleep_range(750, 800);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else if (data->status & DP_STATUS_HPD_STATE) {
-			rk_udphy_mode_set(udphy, mode);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		}
-	}
+	rk_udphy_mode_set(udphy, mode);
 
 	mutex_unlock(&udphy->mutex);
 	return 0;
@@ -1531,20 +1501,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused rk_udphy_resume(struct device *dev)
-{
-	struct rk_udphy *udphy = dev_get_drvdata(dev);
-
-	if (udphy->dp_sink_hpd_sel)
-		rk_udphy_dp_hpd_event_trigger(udphy, udphy->dp_sink_hpd_cfg);
-
-	return 0;
-}
-
-static const struct dev_pm_ops rk_udphy_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, rk_udphy_resume)
-};
-
 static const char * const rk_udphy_rst_list[] = {
 	"init", "cmn", "lane", "pcs_apb", "pma_apb"
 };
@@ -1649,7 +1605,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0


