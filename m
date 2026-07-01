Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3340CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBbVY1P0BXOAj9WGBZV/qKqgm8Py9Z+vOsn3CnnEyFs=; b=A0Xhui02s62uxfUXDbY4CwJ3sJ
	0YiSgM7oG19N9efRs2XhVFEUalqxqPLhf46xuSXcMfrBcH/XozTIUGv94/6CS1MbhaQeOMNz9EvUO
	QeJsflymjnpNO4GhZYVeWzbCUyuSYeDf+ylVnzSv8bn5t8o13kHBZ8PT2sPbS30A5SkbpAb5RxhmY
	PnwIr8MEwCDLI8KqDi3LIrOX3S/bCp1CeDrgBFf7+V5ucVnPNXKN/2zE65nNbf1h0x/ZtnDzYMUxq
	1MkQc5zwGrPerFTbTqNVGCgWJ1p+rS8HjyJcOEvIvUvKinwseznwLNSGdcNJAa3SCLVwGntpkA7ki
	Li++LG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvs-00000001saW-2Gpz;
	Wed, 01 Jul 2026 12:20:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvj-00000001s3y-2Bwv;
	Wed, 01 Jul 2026 12:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VBbVY1P0BXOAj9WGBZV/qKqgm8Py9Z+vOsn3CnnEyFs=; b=PXhsT5E4+SVG5f4KkUplQLS1vZ
	EXQl1RR9ClFoTgFKZXMng6vgO+phavFzFkGupaHLxNwAcWl8rtng/dTOytMxVYNalKYcJs5otZynG
	WhFlGDh15CUs+MwkneG4qByrA1ohOeCfC61e6g5ifG9f/hSRlWF82zi7ddwW9S5Q1ooJNAwtq1/cB
	H5RVyipKgDvc+ZyVB4Jc2rHFlOgp83hyhXNfgUMW7CZ8jdCgQx+RXD85JNs+nFH8gjEwJ6eaVHCtm
	GLphUPHER71kPu+9+y6HioNfa2Ivii0i6VwjFcYFpehMNHoRfIdJnLB01/hERzEZRmxOLyF5DUyza
	fyuLu11g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetvg-00000002jMF-0n3p;
	Wed, 01 Jul 2026 12:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908434;
	bh=7zzcLEDLfA5nbvd3rmnarcTdTM/piIa7uIm8EO8nqq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K5KxoXgFvzANjiYNyNMvJI3NSE3Y+RSkW+plIJDrfp0MfAe4Sy0MnM+jZj4Wxg6uJ
	 rJOEdrs6WAmQxjwcEampm6zXYYF52L7P0Yw/uTpJ+KqVpnFbrJSH/kz0il2/E1WpvE
	 ou1iRK64NB3t8tgTGJaCMuZi9CsFEx2kO7l+SrsbCRJZ25+zWSqKaNv3OWmVFRcDF+
	 FRg8QqVn0YeLj7Nn7aMMwP7qf7QeE0KzIQzS/OsV+6Jfg03yCmWzv0XtrHPMTSYhVY
	 S+iSVjFErygQ09iaF2aDDkfDdyxAspUpIX+AYklsZtTXuUWgAs7FpWPsyRCTP4S7uv
	 djezl3xHLTFXw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C220C17E1583;
	Wed,  1 Jul 2026 14:20:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 06/11] drm/mediatek: mtk_dp: Use PHY API for PHY power sequences
Date: Wed,  1 Jul 2026 14:20:19 +0200
Message-ID: <20260701122024.19557-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132036_355900_0CC99C47 
X-CRM114-Status: GOOD (  10.84  )
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

The PHY driver has gained support for .power_on() and .power_off()
callbacks: use the API provided phy_power_on(), phy_power_off()
functions instead of writing into PHY registers from this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 32 ++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 97bce8966a1f..3b5348ab487d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1415,6 +1415,8 @@ static void mtk_dp_aux_panel_poweron(struct mtk_dp *mtk_dp, bool pwron)
 
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 {
+	int ret;
+
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
 			   0, SW_RST_B_PHYD);
 
@@ -1425,21 +1427,37 @@ static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 			   SW_RST_B_PHYD, SW_RST_B_PHYD);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 			   DP_PWR_STATE_BANDGAP_TPLL, DP_PWR_STATE_MASK);
-	mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL,
-		     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
-		     RG_DPAUX_RX_EN);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_0034, 0, DA_CKM_CKTX0_EN_FORCE_EN);
+
+	if (mtk_dp->phy_dev) {
+		mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL,
+			     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
+			     RG_DPAUX_RX_EN);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_0034, 0, DA_CKM_CKTX0_EN_FORCE_EN);
+	} else {
+		ret = phy_power_on(mtk_dp->phy);
+		if (ret)
+			dev_warn(mtk_dp->dev, "Could not power on PHY!\n");
+	}
 }
 
 static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
 {
+	int ret;
+
 	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
 
-	mtk_dp_update_bits(mtk_dp, MTK_DP_0034,
+	if (unlikely(mtk_dp->phy_dev)) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_0034,
 			   DA_CKM_CKTX0_EN_FORCE_EN, DA_CKM_CKTX0_EN_FORCE_EN);
 
-	/* Disable RX */
-	mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL, 0);
+		/* Disable RX */
+		mtk_dp_write(mtk_dp, DP_PHY_AUX_RX_CTL, 0);
+	} else {
+		ret = phy_power_off(mtk_dp->phy);
+		if (ret)
+			dev_warn(mtk_dp->dev, "Could not power off PHY!\n");
+	}
+
 	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
 		     0x550 | FUSE_SEL | MEM_ISO_EN);
 }
-- 
2.54.0


