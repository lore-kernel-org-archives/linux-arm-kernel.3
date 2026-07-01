Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE8EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lw+X/12C/+fnQjcoUhRS7wFh1lpYx3UtxsJU4IkxeeM=; b=G3VbxSzGA2fTak6WL3hLBMjErY
	E+f9+mDE8gzpJA6/yqA8AG4W0mGsAr+bK3Zd77DHzp+keveMeQ3ex6xDX2RdCiVwuoqkib/lESGmY
	UoxjrGyZKX4NIxlFJI9Aj6y7M+/nfw/VNJBAdyoVWESvdQaiyQOqJPMQIA1xgG+orHHqXBS522xvo
	yUwCW6h9nBGOSbmL+4u31EnGJZjqGYy7hxNLIA7+5+wtItQXi9fdIWiLUIn1cGBuTN9qP0jM2pG9+
	yW96MGV4BCrw1bDCUtCtjBMPx/aUxYQf+ZNE9Pv28TOxJON6INIwUSOpnyydAkeqZTumVdMSfNWbk
	nqO+1/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvo-00000001sNd-38IS;
	Wed, 01 Jul 2026 12:20:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvf-00000001rqT-2WhF;
	Wed, 01 Jul 2026 12:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lw+X/12C/+fnQjcoUhRS7wFh1lpYx3UtxsJU4IkxeeM=; b=ER+yvu7yzcdw/KZYp9VSGLtsD/
	Lp+WxUwce9Y8hlMIU6ZCysKvWUxzk4gbXJaRURclDfqgAUKcDBlYlVmRBf5zpvncjTGqg9fHi0sgN
	wKAJuIbBkLIWYAWBsx2F61yQFFhA6BXsgjbs+wtmJF+2NozjC2ccqEs5/gTvpPCjW4F+7W0O4nmko
	Gyj3vRZSq7Sy6wcHA7K+bpLFOyxuZPK5BUgMaGjKrGLOacBqbOC8nnwpgdVyYTljX0G+1fHo+v8sw
	dszfOy7WMDhK7rlBbxz0Y63TVjzvCaoNRf48o/7SZc5bKgEDL5jjFAS13GL4einhea5nW+zuQVoQo
	93RZposA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetvb-00000002jJX-3o24;
	Wed, 01 Jul 2026 12:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908430;
	bh=1ituvx4NOXspaaiMu1RL1FikTCV/DEZyG6ZgJ0WQA3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqlnROMSQPSdPvOMDGGXkzg5jsP8ix9VdIkepYU0Z6Oqr3oIXXfnz1/3Okflr82o4
	 hXNDcLIBovRSlUDWFxmQxsk2r4NwRfXEb771RDGlUv7oV3z8YMwRxn4+fYgxHSqVwW
	 98Xv1+4NdCnRl/IoakD/Za7EzxvH4uBZ+Y/3MDNGyVYc8rR62rmGct3C95015VHM0n
	 A0d5cCfFOAcc+vozZFeta7W1CuXZgydbjUSuuWgcTlQXZCs74N26Fl1ht2+hzHD+iy
	 rCXPyjblGwR08bHOL0oN0o6Jqn6AFVeFGHIbDKpyVJ98zZ8MpJSNxCegd6WsZ9B1T6
	 oKc1W3KsCzjOg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9A1F17E0F44;
	Wed,  1 Jul 2026 14:20:29 +0200 (CEST)
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
Subject: [PATCH 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
Date: Wed,  1 Jul 2026 14:20:16 +0200
Message-ID: <20260701122024.19557-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132032_105564_025C9C8A 
X-CRM114-Status: GOOD (  16.54  )
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

During probe, this driver is registering two platform devices: one
for the HDMI Codec driver and one for the DisplayPort PHY driver.

In the probe function, none of the error cases are unregistering
any of the two platform devices and this may cause registration
of multiple instances of those in case this driver returns one or
more probe deferral(s) in the "wrong" spots.

In order to fix this, add devm actions to unregister those and
remove the manual calls to platform_device_unregister in the
mtk_dp_remove() function, as those would otherwise be redundant.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index eefbc7e0f9c8..2c738c16dafa 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2670,6 +2670,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
 	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
 };
 
+static void mtk_dp_unregister_pdevs(void *data)
+{
+	struct platform_device *ext_pdev = data;
+
+	platform_device_unregister(ext_pdev);
+}
+
 static int mtk_dp_register_audio_driver(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
@@ -2680,18 +2687,29 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 		.data = mtk_dp,
 		.no_capture_mute = 1,
 	};
+	int ret;
 
 	mtk_dp->audio_pdev = platform_device_register_data(dev,
 							   HDMI_CODEC_DRV_NAME,
 							   PLATFORM_DEVID_AUTO,
 							   &codec_data,
 							   sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
+	if (IS_ERR(mtk_dp->audio_pdev))
+		return PTR_ERR(mtk_dp->audio_pdev);
+
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret) {
+		platform_device_unregister(mtk_dp->audio_pdev);
+		return dev_err_probe(dev, ret,
+				     "Failed to add codec unregister devm action");
+	}
+	return 0;
 }
 
 static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 {
 	struct device *dev = mtk_dp->dev;
+	int ret;
 
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
@@ -2701,6 +2719,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
 				     "Failed to create device mediatek-dp-phy\n");
 
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret) {
+		platform_device_unregister(mtk_dp->phy_dev);
+		return dev_err_probe(dev, ret,
+				     "Failed to add phy unregister devm action");
+	}
+
 	mtk_dp_get_calibration_data(mtk_dp);
 
 	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
@@ -2870,9 +2895,6 @@ static void mtk_dp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
 		timer_delete_sync(&mtk_dp->debounce_timer);
-	platform_device_unregister(mtk_dp->phy_dev);
-	if (mtk_dp->audio_pdev)
-		platform_device_unregister(mtk_dp->audio_pdev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.54.0


