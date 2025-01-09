Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/Sor/kLQSb3dLK3caIMXvkBUCStb7nd7IdU6n7mgto=; b=xNg+eQVaiXBh4U/Qi+gC8RdnFL
	nSW6BnSwyGTAM2u23DZ1FJXJgzAAvkuyTzSUJe2zpLZPT17DXIGys1PN6XDltWSnf/x5sirpkq19H
	EWl1ivQnJOQ9d20vjk61q3sdAEvEEjxyMj1vMy/mdLlA0/kVaIXIwdkmTvixPh/4c6kTemzf4qUz4
	fVgFmzy03eCG9VoVxz2VG0rLDcEl61zGIGJsaDvq942dE8ED8IpmUbhX7HoOramnrVN2hEj4Reqee
	9SLNWdlUNFacM+vNxokT5WI9KyPmIKyVQZf1ZfzdsqtIWK7OYHc6AfrGTcfGpYen4mgGXpStxGCRn
	5RTlLUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjO4-0000000Ac7W-3Xrb;
	Thu, 09 Jan 2025 03:39:12 +0000
Received: from mail-m19731114.qiye.163.com ([220.197.31.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjDj-0000000AZoR-4AdN;
	Thu, 09 Jan 2025 03:28:33 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 82c01ac2;
	Thu, 9 Jan 2025 11:28:27 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 16/20] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
Date: Thu,  9 Jan 2025 11:27:21 +0800
Message-Id: <20250109032725.1102465-17-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JMGVZNGh9NT09DGklDShhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491b35d203a3kunm82c01ac2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjI6FRw4PTIRCxQfFlZIQykC
	FS5PCgJVSlVKTEhNSEJISEtCSU1CVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTElMNwY+
DKIM-Signature: a=rsa-sha256;
	b=CO00IuK7yMiOHHNDr/maexYbn5q+l81UIJljQTFro7IhdCuWdrZeJu7nrVG7rDJqMp9NCg1tUscTnpnqK8SbyvmqVKXKR3rqimaB2v+6KgVYcVmjDKlZp8HG9b3bgF9CUtWKX7dQl+1knm3A/ATEnd8NPZcOsITyh6RN26d3Wo4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9/Sor/kLQSb3dLK3caIMXvkBUCStb7nd7IdU6n7mgto=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_192832_227659_66ED1140 
X-CRM114-Status: UNSURE (   7.28  )
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

The raw edid for LP079QX1-SP0V panel model is:

00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 94a46241dece..8274118d2a8c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1802,6 +1802,12 @@ static const struct panel_delay delay_200_500_e50_po2e200 = {
 	.powered_on_to_enable = 200,
 };
 
+static const struct panel_delay delay_50_500_e200 = {
+	.hpd_absent = 50,
+	.unprepare = 500,
+	.enable = 200,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -1948,6 +1954,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 
+	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079QX1-SP0V"),
+
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
-- 
2.34.1


