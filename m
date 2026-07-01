Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB111C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUnx9PyoyYl2+83SGc5ulyDpcRZSKGw30N8sazgNnVg=; b=J/WwuAmtPP/USKJSQFzzbFoocn
	NX8mUK8/0/1/u4jpmTzpiLiQNuw06eheBzxTfBCiHKiGda+w9/nDK5n7JQUkrojtvMHPKNrLtiKdT
	vLzzacRfbsEuwxQ+KV3UAAzxo6AeIAVJqab67jL+rDg0NRgPoWbOqG+Xi0jBRzAz3FAyZkYtODvP+
	CO2GrleCjG3QBufyNjfgRndx0oT1btV/1VppXQe7v4d7Cjdqw7T8Gzr1QUWCDZ2glogCTFLbpvvc4
	l0p1GoYsNGoLFbPrFH9huxrlnsk+mXGBvxySD8r9RIMDlFt1AqSNoTWOhany+9ZlRoRH25naBsbSf
	1Ft1h6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwc-00000001ucR-3Hdd;
	Wed, 01 Jul 2026 12:21:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwH-00000001tm0-0Uy1;
	Wed, 01 Jul 2026 12:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DUnx9PyoyYl2+83SGc5ulyDpcRZSKGw30N8sazgNnVg=; b=onEBrE688qe2cn3IOcFRxujVlf
	QYvF8VfClJw4UTWGd6pjDXKCiTIiQY/prL9o9B3chnC2gckOPLudTrbdj9sTEWXImxMKKji7rKMaK
	nFzaXv+vYihaqH4uuRtslV6AOT5nw5XL8sl/siKGLHWTiK0OGHhvpRkoKPsRIrJ9TtItoYLEiO1OY
	WZEy3TCRM8rotvfehbKaDfKv4FzQQ3k4He5NIMxuF6RRhI+I+Yum9XzdQa1arpEPJ9FnQeHiGI89s
	jYSflJa6I2VV3AanbdnV8TFOunJ0I0E0hWUtiAMzKZSsGwPvD5adeOOOvF/ZLmlg7EOzooo2s6eKb
	xQHpagUA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwE-00000006aqA-0m35;
	Wed, 01 Jul 2026 12:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908469;
	bh=qGaUZZGDMdPi15E0uv7JzAyEsx2eZTqS7P8cmGb9ccw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FuI23H95iqLw/2dnWfP/lE2fIJhvK0fh+crKKYR/vqvmjMImyjsPiowe/ifuuY5mV
	 uMCMh/JXcZcCXrWwP9UlaZINhFkLpWDcYYEj8lMlP91cDlEf8KKlr+zM/gShxW0CEt
	 wrFvJGxZaqgGI9h+eDPu5KMvAm25kcDBTsbF6TJcDgLHCrgc7RjZ1ZcRjweT+vcLi6
	 adJKZniEmaE9atdrA6O5XeS1x1RtuJD/UYoVhjL6pz7Kv39M5W5nnHR/7BnKJf6YtX
	 w18eNSCeY06ZuBZf2DWZj+W+k67oVJhSwRRshLrafduAMiy5Su+yF3ftE2weYr2xra
	 Nx/z4j+nu25RQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39F0A17E35C9;
	Wed,  1 Jul 2026 14:21:08 +0200 (CEST)
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
Subject: [PATCH 07/42] drm/mediatek: ddp_comp: Move internal component register in function
Date: Wed,  1 Jul 2026 14:20:22 +0200
Message-ID: <20260701122057.19648-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132110_429538_9D51926C 
X-CRM114-Status: GOOD (  12.53  )
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

In preparation for adding an helper serving the purpose of finally
removing duplicated code to check for internal/simple components,
and for improving human readability in the up coming refactoring,
move the internal/simple component registration logic to its own
mtk_ddp_comp_init_internal_comp() function.

This brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 55 +++++++++++++++----------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index d716fd9f8a70..2ba2123238b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -629,6 +629,38 @@ static void mtk_ddp_comp_clk_put(void *_clk)
 	clk_put(clk);
 }
 
+static int mtk_ddp_comp_init_internal_comp(struct device *dev, struct device *comp_dev)
+{
+	struct device_node *comp_node = comp_dev->of_node;
+	struct mtk_ddp_comp_dev *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regs = devm_of_iomap(dev, comp_node, 0, NULL);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	priv->clk = of_clk_get(comp_node, 0);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	if (ret)
+		return ret;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp_dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(comp_dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+	dev_set_drvdata(comp_dev, priv);
+
+	return 0;
+};
+
 int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_drm_comp_list *hlist,
 		      unsigned int comp_id)
@@ -636,7 +668,6 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	struct platform_device *comp_pdev;
 	struct mtk_ddp_comp *comp;
 	enum mtk_ddp_comp_type type;
-	struct mtk_ddp_comp_dev *priv;
 	int ret;
 
 	if (comp_id >= DDP_COMPONENT_DRM_ID_MAX)
@@ -686,29 +717,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	    type == MTK_DISP_DSI)
 		goto end;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->regs = devm_of_iomap(dev, node, 0, NULL);
-	if (IS_ERR(priv->regs))
-		return PTR_ERR(priv->regs);
-
-	priv->clk = of_clk_get(node, 0);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	ret = mtk_ddp_comp_init_internal_comp(dev, comp->dev);
 	if (ret)
 		return ret;
-
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
-	if (ret)
-		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
-	platform_set_drvdata(comp_pdev, priv);
 end:
 	hash_add(hlist->ddp_list, &comp->lnode, comp->id);
 
-- 
2.54.0


