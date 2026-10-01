Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D4CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cw5Md4vlQmmym/q3UHeWVb3S8Fi8h4WqY6aiv8+6FGI=; b=D+5a+JxQqws4DwMatOdcPcXYRd
	A9q5eDeHDggh9GD9+8WM5gWYHbTrwettYnWAoUGokVzyGZdzoGJAf5S2M9CQ9jctAKHuI3RwL5LWG
	YOo0oYO3XhiWrQhtuZtNu+YEzho7sElo33M7dFi5lVV/s9JG39e/+6RlZ281t0nRom4FNY0faGYuQ
	f8wh96IlQUjCq/1lQZSmOIfkX0bxVAk11MxtHA+y6KLmUYsPbJ7J99n4I7lXJJ4QqNGzaokjvfgel
	zaTX6kvbg17SIpzSOBzzBUZBnll9UIQaTazANx3LH/UNcwpyzE/bViErqftyf0MzXAUCNzE3atDwI
	GZHxUVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC42-000000088QF-1qKO;
	Thu, 01 Oct 2026 08:22:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3g-000000087bO-3CaP;
	Thu, 01 Oct 2026 08:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Cw5Md4vlQmmym/q3UHeWVb3S8Fi8h4WqY6aiv8+6FGI=; b=JCxQDXGPHAUQuYSe+HuE54nGcn
	3e52nLUgbG0HW2+UNma/0KtGCYJCGDN55ClqTsX1BBkuwGF5KA+kxY1DFvZ/2Z/cOOvq3LjcaslDk
	GCJpMWV62sZ+R/tyW1KBDJL491208Zgaswp7qIRcUNKPIygpKWJ8735bF+g9IO1K3GBeFZOddwIxk
	ywpS5J42z93tG4I7EzHnJYep8sYRlWVRNW+XH5Jtpc1A6Ot5x16ZeFfHqOmOrtYCiJ6l+Ld9mx1KV
	zXWFw2EYBgeYiiFxza1pOe64tIGARqylLf8lXBRGVZoB+LDRStW64/yzFWfof7n8EE4dTQOPi5qjG
	4bWYe1Eg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3d-00000004ivl-0jKp;
	Thu, 01 Oct 2026 08:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842944;
	bh=l2hO/KJEmWtszH5GEQpJ9ssJ+uFhum7Wp730pKmXQZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FbYY91ZzRC3wwCMrOXQfj24wxM99+qJcYnUjn5FFei/yamq6OKy5HiejzW7NLcTzO
	 BziPHhBa1DTWD1x3w7AK5Lp3W1Hmx1K2QGxO/P9HViBOEtbij1N3Zm1xtO5LD5UamP
	 PUxuT83ShpTn0CWxO2G6j6bLE6XTu+f4UUDqJ13H0RDGoWhGVULoBiCrc2V/r7USqb
	 z/ZH/p+ymex8dQ0fEmXefssqCmLX2vON8W/O3xrXZ25caxH0q8vJAwJWtJ7MqllS1a
	 kET8usk2EtuaSelOxWBifGIW9lWaLJaVBHAknwdMgtpc7WUy30P/kjjDiiSr7K+CGd
	 RhkGmz8dDuqMw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1ECDE17E0906;
	Thu, 01 Oct 2026 10:22:23 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:55 +0200
Subject: [PATCH v13 23/24] scsi: ufs: mediatek: Remove undocumented
 "clk-scale-up-vcore-min"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-23-60854adab6d9@collabora.com>
References: <20261001-mt8196-ufs-v13-0-60854adab6d9@collabora.com>
In-Reply-To: <20261001-mt8196-ufs-v13-0-60854adab6d9@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=4256;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=+k1PcNjMZn/9p7ErJS/nfzOKBYihpmoa+aVg+KcZuzY=;
 b=I838HejL2+NaULLx0/FQ7CpMXTpT8/5/LSuQp+RqKKtncdxp/2ULV2pWi4rXudAAgWE1agIak
 9wvTNPuyspZBCrI3na9qr1n8R+pYHrFFAOH+G+4iW8gJQY1XjWZcG0b
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092225_851495_3CE4058B 
X-CRM114-Status: GOOD (  18.91  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The MediaTek UFS driver contains support for an undocumented,
non-vendor-prefixed u32 property named "clk-scale-up-vcore-min".

Since it is not part of any binding, and would not pass a bindings
review in its current form, remove it.

To return this functionality, it needs to be resubmitted in a series
that also introduces it to the binding, and justifies what it is used
for. Compatibility with downstream device trees is not a valid
justification for its existence.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 42 +----------------------------------------
 drivers/ufs/host/ufs-mediatek.h |  1 -
 2 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 2473aba8fbf8..1d9cb928de49 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -922,8 +922,6 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
 	struct ufs_clk_info *clki, *clki_tmp;
-	struct device *dev = hba->dev;
-	u32 volt;
 
 	/*
 	 * Find private clocks and store them in struct ufs_mtk_clk.
@@ -960,24 +958,7 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	if (!ufs_mtk_is_clk_scale_ready(hba)) {
 		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
 		dev_info(hba->dev, "%s: Clock scaling unavailable", __func__);
-		return;
-	}
-
-	if (!host->reg_vcore)
-		return;
-
-	if (of_property_read_u32(dev->of_node, "clk-scale-up-vcore-min",
-				 &volt)) {
-		dev_info(dev, "failed to get clk-scale-up-vcore-min");
-		return;
 	}
-
-	host->mclk.vcore_volt = volt;
-
-	/* If default boot is max gear, request vcore */
-	if (volt && host->clk_scale_up)
-		if (regulator_set_voltage(host->reg_vcore, volt, INT_MAX))
-			dev_err(hba->dev, "Failed to set vcore to %d\n", volt);
 }
 
 static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
@@ -1971,8 +1952,7 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	struct ufs_mtk_clk *mclk = &host->mclk;
 	struct ufs_clk_info *clki = mclk->ufs_sel_clki;
 	struct ufs_clk_info *fde_clki = mclk->ufs_fde_clki;
-	int volt, ret = 0;
-	bool clk_bind_vcore = false;
+	int ret = 0;
 	bool clk_fde_scale = false;
 
 	if (!hba->clk_scaling.is_initialized)
@@ -1981,10 +1961,6 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	if (!clki || !fde_clki)
 		return;
 
-	volt = host->mclk.vcore_volt;
-	if (host->reg_vcore && volt)
-		clk_bind_vcore = true;
-
 	if (mclk->ufs_fde_max_clki && mclk->ufs_fde_min_clki)
 		clk_fde_scale = true;
 
@@ -2005,14 +1981,6 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	}
 
 	if (scale_up) {
-		if (clk_bind_vcore) {
-			ret = regulator_set_voltage(host->reg_vcore, volt, INT_MAX);
-			if (ret) {
-				dev_err(hba->dev, "Failed to set vcore to %d\n", volt);
-				goto out;
-			}
-		}
-
 		ret = clk_set_parent(clki->clk, mclk->ufs_sel_max_clki->clk);
 		if (ret) {
 			dev_err(hba->dev, "%s: Failed to set clock mux: %pe\n",
@@ -2044,14 +2012,6 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 				__func__, ERR_PTR(ret));
 			goto out;
 		}
-
-		if (clk_bind_vcore) {
-			ret = regulator_set_voltage(host->reg_vcore, 0, INT_MAX);
-			if (ret) {
-				dev_err(hba->dev, "%s: Failed to set vcore to minimum: %pe\n",
-					__func__, ERR_PTR(ret));
-			}
-		}
 	}
 
 out:
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 1fa14a83e8cd..4966aae5bd34 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -154,7 +154,6 @@ struct ufs_mtk_clk {
 	struct ufs_clk_info *ufs_fde_clki; /* Mux */
 	struct ufs_clk_info *ufs_fde_max_clki; /* Max src */
 	struct ufs_clk_info *ufs_fde_min_clki; /* Min src */
-	int vcore_volt;
 };
 
 struct ufs_mtk_hw_ver {

-- 
2.55.0


