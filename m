Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511E0CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=P2Iox2rofJpcnSEOqMnmUrNCFw
	/oResQ9Ry86b8FFQGPRtoAWd2Huho1txZPoIqegqV6Idt05QU11JmWEx1gmNXYmYhLb4VjHcSc+fY
	8LSw1FYt48d3cF2BspUBg5emxQaLspdcPY1rtFsAI4T4VoFWURSWMg0rYF3DXmaKbK7v45rop85nO
	M+JGxA2/qdAu9ICNM2584dZlMx0bFXQj6G0i4bsHZy/ldNz5ScDWqi4aamzbS1s4KUapotXjSU7fa
	IfoSf4i5g/x4HQ7uKDvPY68YpXa3zPouVgiFY2xlXgaJhkkfxjIz4xaGBHLp7QrgykClSwBBNm2SC
	V6U+LMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd7Y-0000000EhSl-0x6U;
	Sun, 16 Nov 2025 13:48:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd7W-0000000EhS0-3SVh;
	Sun, 16 Nov 2025 13:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=Dulir+goyisAneyex7+T4J/jzv
	DS0DkmliVkIUrnvTHxvJOngu+tOocegHYDpP9ALJtsD0D7CFs4AedasI2gaRO9F1a33aXj0rkPfDa
	0jM8HzMCzkqknm6f1M7IBOT0OTQRYTosN8MCUjIVg0fZvtVF+Tgny1cWbH0JrksoGbJn5ELLAISKB
	dLBJ3SZ+LH5YErITAxBLSAKHzwnJ4+hqJOMkxgI+gbr4RRvcV9ddx6iF/S8ofNzLBqE7W0jGkslP4
	iDYpY2TWHPZt0vwTbQOKiohpR/50z+I0bmgOM7JD6cgG8fLBp4q6Uq0ud7N0eKB2vVLs+ieBvlzTD
	TC61KwcA==;
Received: from s2.avantea.pl ([46.242.128.95])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcFp-00000005M64-0wuv;
	Sun, 16 Nov 2025 12:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=uM3oxU8f2UEcgSSoKB30Yri+pI
	qxJkxjqM8QzxIg/gUJTG7m+7XkqL0APmwByGqRbNF9Hc1inYgAa7y+cQrmniRs/8dA3g601Rzhinn
	ml3/LANfdSZDo//IUPNcf6FqRXoPCHrWeHBfB0tHuQJcNqFEYOnWjgSRrGCGayOTcqfejxXq7Hcz3
	kkcELdrGdtOEe0pTNcMUFNYHYyY5W2JuDgUYyytx+3IaShchEHfpdkX9GL4XzJe+vgIs5ED1PzUlT
	RTMJr87j/D0aLEFpZoL1x2yEd8xeS5/DbdFYSfzxtR0izAi1oqlyUK0gUT4M6kjA7UW345KUqgxRP
	1KHdbRyw==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd7P-0000000FXPf-0iOX;
	Sun, 16 Nov 2025 14:48:39 +0100
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
Subject: [PATCH v3 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Date: Sun, 16 Nov 2025 14:48:35 +0100
Message-Id: <20251116134835.447357-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_125318_172144_7A59DD43 
X-CRM114-Status: GOOD (  11.62  )
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


