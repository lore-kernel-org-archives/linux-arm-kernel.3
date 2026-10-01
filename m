Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F91CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWXYcb6M8eIa7SawGG9xrKQJY1GrC1wDI7Sb0kgvz0Y=; b=ytD/56h7PVTz5RwLGgpGBA/OKM
	Kyc3ntJ65qiWA6G37W/+Pi/jcwzUXOXVqcCKYO6LvpReN7vKxW33lqv0r8WlkS4ucP9hZR9F1simI
	ovGvRMLY2hpI6t/Ko1ix0jO8H6iHlac8IT1X7OFr+YuTLsLWzbbDkg8GWxCKKksFtR4tHm1akHutO
	h4aOOsRF3HJyEh9CVerpBVmNWfSaZtKESkLdeK8I8kj4EBXYbFn4YiipDiTxKVtiPwr490mVUve5F
	WgNPEdFNePYN7SR1QAI1OZWP8G3Keg/TL+HRUnHMDRXNDt3OXtzHcrhZrcyH1XAIPCFsB4hQjUlZP
	4uCiqCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3W-000000087K0-1QnV;
	Thu, 01 Oct 2026 08:22:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3S-0000000877p-026G;
	Thu, 01 Oct 2026 08:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AWXYcb6M8eIa7SawGG9xrKQJY1GrC1wDI7Sb0kgvz0Y=; b=YbdDyhHQHT+I7vKZgbm1iZ2p3J
	vwtvzXMkJGOe952J66ytbjrnCMCk8JyXcPckjuv9zet7Bezj0UOXRjI12UvWEcw4FnK6pslPqFeSk
	za6h3AVb1jGny3uq1p8ojreIX7Z5pQbX0T/CnVWT978Wnv7p+65Xp7NF/P95eZVoSgj1Rh3TAd0Zg
	n62EB9qJJYAxMWDCu+quhEBgIWBMJj9KLKnS2mupZJ+9lpjb88beNPVIn0sMA3/Wt4Ya+rE0Fwj7P
	/cTTrcGV7p4bG+y1YE4dVNYocWfm14p9W1MbNricOaFqlVQ4nIYrs5PuQECbmtAPCocXryU7tp1Av
	iGmMqUNQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3O-00000004iqG-3NzY;
	Thu, 01 Oct 2026 08:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842928;
	bh=0hXTN9PTK1qF1bHkdWlrfOmYipj2UNgaXWsktSXRif8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AyEULIsK7b4qKXbi9vE7cvwAV9FqnBVkLMoVnu/wm+BnoB4vd3LWtOp2JKpqBaWQU
	 YzgV3WksRM8Qkd7xg8UBEgagUEmpXhrrxld5md+nug1rj7nM9wVpYn77H/U6lYpnUg
	 iQC2x14EX3Totqrq7LOwRJtnPlgG7d4BiqgMJNjNAk4Rj2jI3SRUAbpR2EIAFMa3ic
	 R6stZoF1C5NnrpZXcqNd+lv7apdPXpcS+yL7sPox25ubsAQ5mVVjp59PGjMSSxOA+2
	 mDh3YYogaFOniphkS3IrJqILC1MATJP2PhHV2RgQOAIcvRqfKLzLUYSDIKsHGmhTCz
	 nbcmfILq94crA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18B1617E022A;
	Thu, 01 Oct 2026 10:22:07 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:40 +0200
Subject: [PATCH v13 08/24] scsi: ufs: mediatek: Add dual 0.9V supply
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-8-60854adab6d9@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=5105;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=0hXTN9PTK1qF1bHkdWlrfOmYipj2UNgaXWsktSXRif8=;
 b=CyzpWc9qZ2ETOIH/NmGHffbYMYyyK+2Qv4nzGd1xZLqzzdEGgwutvk5U85iQYfYV8+zPvUz8A
 xsMxlCzVMldAUDKSl5VDhsdFmZE+hnsb4c9b2TgvxLPFF7uviHcDVnu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092211_146297_6EA39005 
X-CRM114-Status: GOOD (  19.97  )
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

The MT8196 SoC has an additional pin in comparison of the MT8183 SoC,
that is used to feed the host controller with a 0.9V supply.

In preparation of this SoC support, add in platform data and
driver the management a second optional 0.9V regulator named
"avdd09-1".

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 96 +++++++++++++++++++++++++++++++----------
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index f43bee50adb2..5721aa24d0b9 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -41,6 +41,7 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up);
 
 struct ufs_mtk_soc_data {
 	bool has_avdd09;
+	bool has_avdd09_1;
 };
 
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
@@ -513,18 +514,40 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 static int ufs_mtk_09v_off(struct ufs_mtk_host *host)
 {
 	struct arm_smccc_res res;
-	int ret;
+	int ret, ret2;
 
-	if (!host->reg_avdd09)
+	if (!host->reg_avdd09 && !host->reg_avdd09_1)
 		return 0;
 
 	ufs_mtk_va09_pwr_ctrl(res, 0);
-	ret = regulator_disable(host->reg_avdd09);
-	if (ret) {
-		dev_err(host->hba->dev, "Failed to disable avdd09-supply: %pe\n",
-			ERR_PTR(ret));
-		ufs_mtk_va09_pwr_ctrl(res, 1);
-		return ret;
+
+	if (host->reg_avdd09) {
+		ret = regulator_disable(host->reg_avdd09);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to disable avdd09-supply: %pe\n",
+				ERR_PTR(ret));
+			ufs_mtk_va09_pwr_ctrl(res, 1);
+			return ret;
+		}
+	}
+
+	if (host->reg_avdd09_1) {
+		ret = regulator_disable(host->reg_avdd09_1);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to disable avdd09-1-supply: %pe\n",
+				ERR_PTR(ret));
+
+			if (host->reg_avdd09) {
+				ret2 = regulator_enable(host->reg_avdd09);
+				if (ret2)
+					dev_err(host->hba->dev,
+						"Failed to re-enable avdd09-supply: %pe\n",
+						ERR_PTR(ret2));
+			}
+
+			ufs_mtk_va09_pwr_ctrl(res, 1);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -535,14 +558,28 @@ static int ufs_mtk_09v_on(struct ufs_mtk_host *host)
 	struct arm_smccc_res res;
 	int ret;
 
-	if (!host->reg_avdd09)
+	if (!host->reg_avdd09 && !host->reg_avdd09_1)
 		return 0;
 
-	ret = regulator_enable(host->reg_avdd09);
-	if (ret) {
-		dev_err(host->hba->dev, "Failed to enable avdd09-supply: %pe\n",
-			ERR_PTR(ret));
-		return ret;
+	if (host->reg_avdd09) {
+		ret = regulator_enable(host->reg_avdd09);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to enable avdd09-supply: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	if (host->reg_avdd09_1) {
+		ret = regulator_enable(host->reg_avdd09_1);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to enable avdd09-1-supply: %pe\n",
+				ERR_PTR(ret));
+			if (host->reg_avdd09)
+				regulator_disable(host->reg_avdd09);
+
+			return ret;
+		}
 	}
 
 	ufs_mtk_va09_pwr_ctrl(res, 1);
@@ -1232,20 +1269,33 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
 	struct device *dev = host->hba->dev;
 	const struct ufs_mtk_soc_data *data = of_device_get_match_data(dev);
 
-	if (!data || !data->has_avdd09)
+	if (!data)
 		return 0;
 
-	host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
-	if (IS_ERR(host->reg_avdd09)) {
-		if (PTR_ERR(host->reg_avdd09) == -ENODEV) {
+	if (data->has_avdd09) {
+		host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
+		if (IS_ERR(host->reg_avdd09)) {
+			if (PTR_ERR(host->reg_avdd09) != -ENODEV) {
+				return dev_err_probe(dev,
+						     PTR_ERR(host->reg_avdd09),
+						     "Failed to get avdd09 regulator: %pe\n",
+						     host->reg_avdd09);
+			}
 			host->reg_avdd09 = NULL;
-			return 0;
 		}
+	}
 
-		return dev_err_probe(dev,
-				     PTR_ERR(host->reg_avdd09),
-				     "Failed to get avdd09 regulator: %pe\n",
-				     host->reg_avdd09);
+	if (data->has_avdd09_1) {
+		host->reg_avdd09_1 = devm_regulator_get_optional(dev, "avdd09-1");
+		if (IS_ERR(host->reg_avdd09_1)) {
+			if (PTR_ERR(host->reg_avdd09_1) != -ENODEV) {
+				return dev_err_probe(dev,
+						     PTR_ERR(host->reg_avdd09_1),
+						     "Failed to get avdd09-1 regulator: %pe\n",
+						     host->reg_avdd09_1);
+			}
+			host->reg_avdd09_1 = NULL;
+		}
 	}
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index c63740b98e85..477fb9e36555 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -176,6 +176,7 @@ struct ufs_mtk_mcq_intr_info {
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_avdd09;
+	struct regulator *reg_avdd09_1;
 	struct reset_control_bulk_data resets[MTK_UFS_NUM_RESETS];
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;

-- 
2.55.0


