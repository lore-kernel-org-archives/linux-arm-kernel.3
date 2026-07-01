Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADB5C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4R1630Gal63jUEhnaU4LUIwmWe0Vm3CCz5qJP0jL7A=; b=Dx7gVEXt817i8iKOPIhGrTwLnr
	78rN3H5JbApNy934yV1it+2LW231AjOIw+SlDkXqSc7aTFZhE6hCy1dOQJG1e3gvEjlGz1UMvSAvC
	xRQEY51KHAJ5E4oPxe1o/R3oE6W4LO5RcUoPx8nK6OaJADi2ZSQAc8gFyr7+GczeiZP6tNqV/NEkk
	He5myz5KAsbrUkzjrt0oOXEePyUyby01yqHUmJwXz683g2HglWurxhAIA4QvfUX3l6BpTwLqAOcRn
	vgs6SY2pqmXe0wjhqQbkD1tOA5l5SrxvRrq/TAw7fnJtvad4jz1GBHvmJqAF429xgZ7hKEkA6BPzi
	B21RuhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxf-00000001xrn-3ZEE;
	Wed, 01 Jul 2026 12:22:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetx7-00000001w1c-0K4z;
	Wed, 01 Jul 2026 12:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l4R1630Gal63jUEhnaU4LUIwmWe0Vm3CCz5qJP0jL7A=; b=kPr389LcS7I7otcSsnAYvbZAMY
	hxnhDzS2fG87/hXz8SJFY2Fc0pKMwQxmMIQHcC0fkMfc4uizupPQwOthlRkRw/LmZuew8oNjoTtA7
	oHvzeDTsXGynjejBpzQ9mmV9Iq75TweLZgJCYKd8z9M/7V7h1CJd85gZhCTaedGGrKc1YOn9GhDY1
	KgkkxY0St9BqgHDoBXa0NDzxL45TfPByVlLf8cdQLVDaZTmKEvYvA4tWaBEhK55GNc/fHSBW+lPDa
	8vcgKrEzPuj5G90MPdMFv8Klooz0xeACzpK1XpIBKQedfv0aPgUPYBovNFj/5aNOYkELP93itl1fA
	fyCwhrzw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetx1-00000002k6s-0cjV;
	Wed, 01 Jul 2026 12:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908517;
	bh=uu8wJ1s5TWs2lno7lmR5awOKX1/OE5RoeHGMPhn0IuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pqz3I5hFJsi0cdI86xdAiBVhN0NtAe+ilBgw6glokfvpo8r7iwqBuW3vR8fX1OWpL
	 nKgo6k8GfGHLODhfYp52nwQS8edL5pslfMJI1Zj0ec+n5BnAKiK8Lb9A4beidPz92u
	 lUIE/Zwk8HIBwHVNBT1yRp1CO9Ts1qJzHbfUadwEsXxaCZwaN8dsadgHLpcZ96BeG2
	 YDDtTiW0oK9W60Oho25EYrWSz0fvYPgiSGKM7uKiLhn8H9Hye8NA/qos859qJy00ii
	 y1/lUimaZOiRcoybVfAtnR5izy8ISH+ItGXISVbcfyklQUZT0S5SeyvaAsdBLIFHco
	 OZuR6w99I0CNg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21C8717E0F44;
	Wed,  1 Jul 2026 14:21:57 +0200 (CEST)
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
Subject: [PATCH 42/42] drm/mediatek: mtk_drm_drv: Fail init only if all paths are invalid
Date: Wed,  1 Jul 2026 14:20:57 +0200
Message-ID: <20260701122057.19648-43-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132159_292262_D62BDA99 
X-CRM114-Status: GOOD (  17.86  )
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
index f5c9fe1588d0..65a891815408 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -379,6 +379,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	struct mtk_drm_private *priv_n;
 	struct device *dma_dev = NULL;
 	struct drm_crtc *crtc;
+	int num_failed = 0;
+	int num_paths = 0;
 	int ret, i, j;
 
 	if (drm_firmware_drivers_only())
@@ -445,15 +447,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
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


