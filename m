Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467E6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmILWo+eEIkmHVcVGp6xMZK5IrqqEHUjUiVUwra1nnU=; b=OQopX5jkPjd7q2Q+4W2d5RpNYe
	GVjCAg75nojVLM9ELplYg5dMsKFCBQRJivNhavYlcKx+x9qcQqFzKG8gt+A1SAylkaVAG7Q/Dk17k
	74joLHx2JwdNe2XeYWvxVV3Zs0/o6S3K2vJ2rhAxUE9EizDiyRHoKtMoOcWR0Cd5H+G3Eox6pTXy6
	6ZuvyoBuGACtri+V0zCeCqFBGiKn/UvztaBSCl8O3RKPZ3LVV62RE8O+WBAWrTNFYONksnHFJ9cYe
	JoOLaR/rZVpU97REUMcL082sTbaXu2YrVC4W0Jx2q15OOQSBQXqrmpUgGq8YdhqVxthVky3TK8pWg
	S5TXF1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7Mv-00000006NXI-0OHX;
	Tue, 24 Jun 2025 17:23:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iU-00000005vZE-3SN1;
	Tue, 24 Jun 2025 14:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gmILWo+eEIkmHVcVGp6xMZK5IrqqEHUjUiVUwra1nnU=; b=EmIaFhgfPI6ZHVjAdusdSWMhP9
	JnwrcejIrfY2B8n1y9/U6k3b1P6av91bSwkGNPquel2J/LqwZTrOPlkbDlkIT6bNcKu06bWYMh7Rb
	4uEwaGak/V3A92zVW7UxszIzo8/JcExeMFcxhMiwuKY9CTjAvSvd8/kUTnzj89L4kaqkqiKuXXiET
	PVhK5NTAxX73+HBchzK7C1OCC5mpAJCCQvoAFQaqkSqszTurZN1RMX51fX8FRYgLKQ+pyWwS5hoXE
	vHOZ8mw/jdQVvYILu8+3X2LerKkZ52udkW4jl1hMvdzOboKF/UeIs3Vv5nciInmezyziBbJilT6ZE
	PG+8u9dw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iR-00000005SqX-2g9M;
	Tue, 24 Jun 2025 14:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775616;
	bh=faHO25SJcLx7uWcBG03RC4bdFwL6hwZ41XnrLiIbm38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DpDkwfgQiAlPZSgb2WCzsDEe8Quim2x2xVX/ImoglqQfcJuXVUx5I08p/6YYgtdVa
	 ZxIL9jYBOMPbjfNIKeTlH9+W1x/wOdKzzs/39iJdRD2+pZfzehg8IbH3O7jwO/mbTH
	 3mlMXvYlb0SRYqU1TC3GFFerPS6ZkvisiTxNcgJq21YTQAKCOotmM1SwQqqSDhK5Ph
	 BcaGSiXXR0+9MeB/oZBH7Q0It5wBUd1xK1fzVuYQP5RP7tgqA8KxjtXCeGYIwqH+w9
	 pg9M5FTLd0dTXbCdIyjt9MOye3MOPTdo3xYynT7u/w+QZFx5i8oY+P+DDqZkxRn8h+
	 89e5zks+/yTJA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73E5E17E159C;
	Tue, 24 Jun 2025 16:33:35 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 04/29] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
Date: Tue, 24 Jun 2025 16:31:55 +0200
Message-Id: <20250624143220.244549-5-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153339_775919_46976D5E 
X-CRM114-Status: GOOD (  11.54  )
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

On MT8196, some clock controllers use a separate regmap for hardware
voting via set/clear/status registers. Add mtk_clk_get_hwv_regmap() to
retrieve this optional regmap, avoiding duplicated lookup code in 
mtk_clk_register_muxes() and mtk_clk_register_gate().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index ba1d1c495bc2..19cd27941747 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -685,4 +685,20 @@ void mtk_clk_simple_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
+struct regmap *mtk_clk_get_hwv_regmap(struct device_node *node)
+{
+	struct device_node *hwv_node;
+	struct regmap *regmap_hwv;
+
+	hwv_node = of_parse_phandle(node, "mediatek,hardware-voter", 0);
+	if (!hwv_node)
+		return NULL;
+
+	regmap_hwv = device_node_to_regmap(hwv_node);
+	of_node_put(hwv_node);
+
+	return regmap_hwv;
+}
+EXPORT_SYMBOL_GPL(mtk_clk_get_hwv_regmap);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 136a4bc6dbe6..8ed2c9208b1f 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -247,5 +247,6 @@ int mtk_clk_pdev_probe(struct platform_device *pdev);
 void mtk_clk_pdev_remove(struct platform_device *pdev);
 int mtk_clk_simple_probe(struct platform_device *pdev);
 void mtk_clk_simple_remove(struct platform_device *pdev);
+struct regmap *mtk_clk_get_hwv_regmap(struct device_node *node);
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.39.5


