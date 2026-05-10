Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA130CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNPaQCnAPaiK+mPtt3ofIMa62zudp1cWsYh8OqqpZUE=; b=tikMscqgrhygf39C12Vp4uWSYp
	uH+Oad1YtPycBahxUtnmMZnaiFQzA0NvVaii209TBT/ljYINBGpukDAaIz9VQ9nNuUqmfk9t7j1QU
	xFiJ7FUL7xl4t2mpIX1uGi7Ni7qqO3U6oJJ2oXMs7ou6cf6Tkcrw7HHpY926uDksowDa5ugf0kMft
	Bno3lkCpK315Bz5X0Lp0DVrNwFhhwG+YtXOTh/9tojPGEtptRhIi3HkRiKVprpHaBX4PksJg1ZM4o
	Whiidka/wXZfRC1up1KUfTiRo7bCwQhoiakhL+XvW2CB4OB1UIKAlFVGXNQrg6NWKhN+Wj3Z/ufE4
	WvaGvm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8xr-0000000BNSC-3Qs5;
	Sun, 10 May 2026 18:33:19 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8xp-0000000BNQV-1rrj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 18:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778437996; bh=dNPaQCnAPaiK+mPtt3ofIMa62zudp1cWsYh8OqqpZUE=;
 b=dvA4VqNRwVXy9/oTyNfquHsi3B8ZjRkor3ZyN/DcVnOdtpz8zNKkc27iiWUnhl5jN0yEjbUBo
 HJkI8crn2Mr89VPlrcys8GsiNJTV4s7wuVjbvq4SPYam5GOQnwIPevDDz+4zxgnZMWMTFcmdSJj
 pk3aGpGWXnwhq0zYJmAkYBTFj43pGiwtdWlgdch8cohg2pCjO5c0pwz7PSE6xNl4tcHFS+mAckF
 EnuY6CdqN0/H3U/49zW+dTbMwq3GAbvPI/CRdUuvnlRnwSbTJ443CzY45x15IB9scIoy8C3CS50
 TCfPsE5dNo0adwMjGIRoo3OMq+DM7+UODH3CJ5tDbyzA==
X-Forward-Email-ID: 6a00cf1361db3ab145b0f2c8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 07/10] drm/rockchip: dw_hdmi: Clean up whitespace
Date: Sun, 10 May 2026 18:31:08 +0000
Message-ID: <20260510183114.1248840-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510183114.1248840-1-jonas@kwiboo.se>
References: <20260510183114.1248840-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_113317_489359_BA3D8B7F 
X-CRM114-Status: UNSURE (   9.37  )
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

Move the blank line before the RK3328 definitions for readability and
make the phy_config table spacing consistent with other tables.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 6aefdba0f1f9..a55a89040590 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -31,8 +31,8 @@
 
 #define RK3288_GRF_SOC_CON6		0x025C
 #define RK3288_HDMI_LCDC_SEL		BIT(4)
-#define RK3328_GRF_SOC_CON2		0x0408
 
+#define RK3328_GRF_SOC_CON2		0x0408
 #define RK3328_HDMI_SDAIN_MSK		BIT(11)
 #define RK3328_HDMI_SCLIN_MSK		BIT(10)
 #define RK3328_HDMI_HPD_IOE		BIT(2)
@@ -190,11 +190,11 @@ static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 
 static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
 	/*pixelclk   symbol   term   vlev*/
-	{ 74250000,  0x8009, 0x0004, 0x0272},
-	{ 165000000, 0x802b, 0x0004, 0x0209},
-	{ 297000000, 0x8039, 0x0005, 0x028d},
-	{ 594000000, 0x8039, 0x0000, 0x019d},
-	{ ~0UL,	     0x0000, 0x0000, 0x0000}
+	{ 74250000,  0x8009, 0x0004, 0x0272 },
+	{ 165000000, 0x802b, 0x0004, 0x0209 },
+	{ 297000000, 0x8039, 0x0005, 0x028d },
+	{ 594000000, 0x8039, 0x0000, 0x019d },
+	{ ~0UL,	     0x0000, 0x0000, 0x0000 },
 };
 
 static enum drm_mode_status
-- 
2.54.0


