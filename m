Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFA7C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0tlhegHwtG81HOM4sAZpzpRB9FsAngyGewnV2k7YM8=; b=PcCe4NYjdIEt64UVqgdaf7SVnK
	urlLrazsO1HazYBGGrZr+0pdEI5+xxkkfYWjlfjZjh+m5sVWH3nKIwco/yFbI67V9HpD8MMvH4RWc
	Ds+ls+ndtknfNxeGiNcwWuMxhs6SG93Yf/cSn3ZJtlkXKLMlhORB4JVNbVUeBGokPXGsxi3D0DBfM
	nYOlvvhhDSUUJ17vuk0APrFZFld4kBuFGgnZ2/V9wTCJAcwDaQccswSldOwoY4KSRRSNULIhzh353
	lp+faWyr4SdwQBIm03aTxaRFz2DUjyL+gReRRIWTrpxTbsZGEazsY+cikFtAWXIaRXD3W7u4yQcuw
	6JZmLjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbbH-0000000Bm4N-41sg;
	Tue, 14 Jul 2026 11:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZu-0000000BjZt-0n1p;
	Tue, 14 Jul 2026 11:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=g0tlhegHwtG81HOM4sAZpzpRB9FsAngyGewnV2k7YM8=; b=FuBI0HuRw4aGbRWcHkJmQyr8Iz
	V3bj5pQCumH3p3OL9oN23brS0gKHgsI6D6Wo/LciIbUS38ZA2hdKaqqQNdujnDsD9i8Z4tVwHdmOo
	H633kmSjfPhuOsrMV71LxrUPnTDf8tCKehKThjP8txve4j8GU4zt0erq19LWCUvvNmyRIi5PiuuAV
	/Rpdj7Rq4Iub8wLwNzZKNs6dZC3mEC0N/jvbiYgOizuJt5zMjQ8UU+WZJ8A6vywCSeOb/gOQl5EGp
	fENOPQsH+nrBGDdZl4UW++OvJ8jmp7B5bT/4be6/NwFwCq8CetP5/ExKXydPIFJO/S/fC8D92dxjy
	kV/zPETg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjbZr-0000000CQve-1aaK;
	Tue, 14 Jul 2026 11:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029530;
	bh=xVf5evvB8FvUTkLLMIdH5J561qbfcKhWFLWfJ3S1bPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kpxd7Lxfm1d+n3Zqc5Cp5QDwyzhBw2qRRrDJHAx38FDPIN2Kpt5QP1I4/zoWo3FEU
	 5d6cXAlXo0JBWf8KJwRDC93xyRliRrLZoR3o5Q1ccjTfP9Ncn7UPhykRozQsbrWO74
	 C09PmdgjlidhA5D1IVCf9b2hhKpgXPm1j8T9QwZUhIJ6BEHQ9jKSQAmLjYXilvf/0U
	 oy0pFYYLCRdU1U3wPmbxHBiIkdV/C/ICSXafaVpTHBf/E9/tky8eUpICuqGzusnmxr
	 QO5RPjSWltpQ48LjwziKr8/KDzH3Z1y95IHu1KqQx+lt94dO3aAwpBwyS6lLT9NRf8
	 CJz0fixDM5y9g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80E2B17E0956;
	Tue, 14 Jul 2026 13:45:29 +0200 (CEST)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 46/46] drm/mediatek: mtk_drm_drv: Fail init only if all paths are invalid
Date: Tue, 14 Jul 2026 13:44:14 +0200
Message-ID: <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_124531_526011_8E5B10FB 
X-CRM114-Status: GOOD (  17.54  )
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

Up until now, if not all display controller paths were valid, the
driver would fail probing and refuse to bind components: while
that was a good idea before, now that mediatek-drm gained much
more flexibility, it is finally possible to gracefully handle
this situation and register only the valid paths while leaving
the invalid ones unregistered, without any crash.

Count how many output paths are found, and then count how many
have failed probing: if there is at least one valid path, avoid
erroring out, so that at least some outputs will just work.

Of course, any path failing is not a clean situation and must be
resolved: in this case, function mtk_crtc_create() still prints
error messages so, even though some output works, that will not
go unnoticed, as a quick check in kmsg will show the errors that
made a certain path not to register.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 82d844b6abf7..7c9cb50909c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -394,6 +394,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	struct mtk_drm_private *priv_n;
 	struct device *dma_dev = NULL;
 	struct drm_crtc *crtc;
+	int num_failed = 0;
+	int num_paths = 0;
 	int ret, i, j;
 
 	if (drm_firmware_drivers_only())
@@ -460,15 +462,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 			if (!priv_n->data->output_paths[i].len)
 				continue;
 
+			num_paths++;
+
+			dev_vdbg(drm->dev,
+				 "[CTRL%d-CRTC%d] Path Len:%d, Controller Order:%u\n",
+				 j, i, priv_n->data->output_paths[i].len,
+				 priv_n->data->output_paths[i].order);
+
 			ret = mtk_crtc_create(drm, i, j,
 					      priv_n->data->conn_routes,
 					      priv_n->data->num_conn_routes);
+			if (ret == 0)
+				break;
 
-			if (ret)
-				goto err_component_unbind;
+			num_failed++;
 		}
 	}
 
+	if (num_failed == num_paths) {
+		dev_err(drm->dev, "No valid Display Controller path! Going out.\n");
+		ret = -ENODEV;
+		goto err_component_unbind;
+	}
+
 	/* IGT will check if the cursor size is configured */
 	drm->mode_config.cursor_width = 512;
 	drm->mode_config.cursor_height = 512;
-- 
2.54.0


