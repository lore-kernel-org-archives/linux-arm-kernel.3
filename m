Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C631DCEBF96
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=gDV0cPrPj4FvNkKcFVCD3FdOsR
	ktl0i4PASEo8l3zB3FXUpTcfKFDg8i1ZVfeaMIj6QuRs5yB/VtDNgnaPCOc8iSX9iRUMaeQvCe2zA
	vb0XNWcHBvlX5OxOkfMWvUqFLz5CkcSnXdCRpP1rfO3zsTcWSE3+rHp+JxAy5XNCi5DfLihxE6h2P
	+bDF0opTHWj/LGeYjDRAvMRg1GWZMdX573ZIgrOoNxA2FW04UvAuJKIwre0Hk1DSxI/KGbI8UIq6z
	SWeWUhpmU35tqzTfLF+LUPvtiRsWhqD6QIzQViWhtHXalT+dwRT8qDCQCK836YmyRUMCxlRFFlME8
	vFEha4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcgi-0000000EfBY-3rYz;
	Sun, 16 Nov 2025 13:21:05 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcgf-0000000Ef7U-16L2;
	Sun, 16 Nov 2025 13:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=6UChbVw/2lffs3K5mwy8WYcLGi
	wNl/qURRl8EbLMAI/i5XS1UDgfWHXCUZ7Nz1BP64h33job7MvPEMxBJWywI6M75zO1XIGP6tn1Baf
	gJGBaihergzZC6S36FtLnHtMfO4kL05mPnMDLIFMrk43xqOciQvvzpmLP4IU6w3Rdx+bt82iG+6e8
	hRHiBZ+tG+Cj17f8hujzG75TaqDRnwDFEv2qcjrhzVUFmbfMuBzhGfRR54oW5cVlKEYN9Y+9IgkWl
	Ry37Ztct/zRFsc9LgBEwkM4RNhwXlKB1MLL9TRjxEi4tAim5STcMY5mIIlej1GYHW/vCtW+elUXJv
	OSnHWg1g==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKcga-0000000FW4E-0cRY;
	Sun, 16 Nov 2025 14:20:56 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v2 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Date: Sun, 16 Nov 2025 14:18:50 +0100
Message-Id: <20251116131853.440863-4-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116131853.440863-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116131853.440863-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052101_465063_3A8F30B3 
X-CRM114-Status: GOOD (  11.56  )
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

The Allwinner D1s/T113 needs to use the combo D-PHY to enable LVDS
output.

Enable LVDS support in the TCON and configure it using the PHY.

Abort PHY setup/teardown early if it fails.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 247400785..e072ecc6d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -171,6 +171,40 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 }
 
+static void sun20i_tcon_setup_lvds_dphy(struct sun4i_tcon *tcon,
+					const struct drm_encoder *encoder)
+{
+	union phy_configure_opts opts = { };
+
+	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
+		return;
+
+	if (phy_init(tcon->dphy))
+		return;
+
+	if (phy_set_mode(tcon->dphy, PHY_MODE_LVDS))
+		return;
+
+	if (phy_configure(tcon->dphy, &opts))
+		return;
+
+	if (phy_power_on(tcon->dphy))
+		return;
+}
+
+static void sun20i_tcon_teardown_lvds_dphy(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder)
+{
+	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
+		return;
+
+	if (phy_power_off(tcon->dphy))
+		return;
+
+	if (phy_exit(tcon->dphy))
+		return;
+}
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
@@ -1550,8 +1584,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tcon_tv_quirks = {
 
 static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
 	.has_channel_0		= true,
+	.has_combo_dphy		= true,
+	.supports_lvds		= true,
 	.dclk_min_div		= 1,
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.setup_lvds_phy		= sun20i_tcon_setup_lvds_dphy,
+	.teardown_lvds_phy	= sun20i_tcon_teardown_lvds_dphy,
 };
 
 /* sun4i_drv uses this list to check if a device node is a TCON */
-- 
2.25.1


