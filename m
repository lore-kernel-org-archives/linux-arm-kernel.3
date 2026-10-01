Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F13BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYvUdbcxoqQgTG/Ap0FYa1LeFOd/Rqrh+SQiyojvnMI=; b=X4q4mbVXMM1Kq55sOR1HdmoZPX
	7plSz5AdJZ9aTSuP4cFH7UeAFD+rhFisUQl76aSQ7BQ4MzjpY5caltXb2tAaeBtC46vZiIriHD8LP
	PfuseBPROuss5hxQeWyNqnndpsLTxE4UJ5TK/Kpf0C7OYO56cOJd3C3y4A0isrJX+Hz8obY7HGVyo
	pU1sG46b/VXp/uy/yISfmYhkipeCIU5DH0kL/OjHw2zUlRKe1r6CNfy0t4dnEcEz4aK4h+SEGZzgW
	3rWfy1ptVVFIN1GwqkcbXw3ntngKHp6iP6DUlaAm8PxghYOMFKqjyQek1d+58Qk9bKO/YC6Ad9zbf
	35v2DRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3W-000000087LH-3Ux9;
	Thu, 01 Oct 2026 08:22:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3S-0000000877r-0fiE;
	Thu, 01 Oct 2026 08:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PYvUdbcxoqQgTG/Ap0FYa1LeFOd/Rqrh+SQiyojvnMI=; b=Zfuj4Jh7ghZ068ukm003jznTys
	uEQDJ1hV6KBmyoIDRZQBCtY6OS3LtdGh6X3lcX1SZ7FgGtgCYmSfbCkpW0vlzp8MwzMuuhvWp0oP6
	84Qd8ey/6YB2mueALm73ENGsJRPN7ElJ+DLE3jxl0li/nbROVx/sE3d2agoR+0uf1ialIDSmtY9+F
	Gv99VuqIm/whG4tIz9qCNB+BbSMNj+QehehQ/cYaqJqHR0nYkbL5xo4kiOe7vTJ7hRS0bKnoGEzW4
	kS4jaVvfyij+oItzRiTzvybkaPi0LqI0pqeSZpN0fe534DXVl6QsZNp9eZodTRVcJhXjr3AeuvkXC
	joVe8oGA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3O-00000004iqI-3yxz;
	Thu, 01 Oct 2026 08:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842929;
	bh=sVYy1lvcQDUBZamXHv0+rAHaonVcdGcrPUYbdTT+5nQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mrJl0S9/0ngvQtvFL8lFaw222tbW7kV4Z0oVwO9vM+JLQRSy3v3BBBIsOBrqBRdny
	 t0oZvK2lIiA86VPTz3dPWZSZdiBIlN+XmMiAnbL4Ko/ryGR58g1WeUNq5pO8hyS7ro
	 sEI764rAqmvuY1dbOh4DjfDXqhrq4/lkAG8IVjyO2oiX+R0SZQI7MVJNieQY1emS+W
	 SsRPoHlRCthUnrTNO7IyFXJN5X+6tX5GOJcBJ8dPMHTK5Y2B19nopHivew65lD2Ie1
	 8dEoidAGNaB2xhJN3wz64QMfIGZCmhluZy0FSvejgc32A1Dj9IdlyPQofpy7+Ubet+
	 wSDVfrjIPUNIA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BBB017E0371;
	Thu, 01 Oct 2026 10:22:08 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:41 +0200
Subject: [PATCH v13 09/24] scsi: ufs: mediatek: Rework init function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-9-60854adab6d9@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=3160;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=WCX8t21Q33dMe2d3mKBeu0PLt53GTI4ejo7xFiru0Vk=;
 b=d4zBGSH1/5yt0mkliva7pMKXmSIi7Vr7aBEO2E04ftTrP9ouo3PepUPABPPrKh7qntV3epfvx
 L+fSN5eQQFmDKE5vS6LVtaLnRG8NZSVJ1HpsfF+EdBBHEzgON40Sz7u
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092211_342247_040CF3A0 
X-CRM114-Status: GOOD (  18.45  )
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

Printing an error message on ENOMEM is pointless. The print will not
work because there is no memory.

Adding an of_match_device to the init function is pointless. Why would a
different device with a different probe function ever use the same init
function? Get rid of it.

zero-initialising an error variable just so you can then goto a bare
return statement with that error variable to signal success is also
pointless, just return directly, there's no unwind being done.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 43 +++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5721aa24d0b9..3251f6e7dfe9 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -54,18 +54,6 @@ static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
 	{}
 };
 
-static const struct ufs_mtk_soc_data mt8183_data = {
-	.has_avdd09 = true,
-};
-
-static const struct of_device_id ufs_mtk_of_match[] = {
-	{ .compatible = "mediatek,mt8183-ufshci", .data = &mt8183_data },
-	{ .compatible = "mediatek,mt8192-ufshci" },
-	{ .compatible = "mediatek,mt8195-ufshci" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
-
 /*
  * Details of UIC Errors
  */
@@ -1313,29 +1301,19 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
  */
 static int ufs_mtk_init(struct ufs_hba *hba)
 {
-	const struct of_device_id *id;
 	struct device *dev = hba->dev;
 	struct ufs_mtk_host *host;
 	struct Scsi_Host *shost = hba->host;
-	int err = 0;
+	int err;
 	struct arm_smccc_res res;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		err = -ENOMEM;
-		dev_info(dev, "%s: no memory for mtk ufs host\n", __func__);
-		goto out;
-	}
+	if (!host)
+		return -ENOMEM;
 
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
-	id = of_match_device(ufs_mtk_of_match, dev);
-	if (!id) {
-		err = -EINVAL;
-		goto out;
-	}
-
 	/* Initialize host capability */
 	ufs_mtk_init_host_caps(hba);
 
@@ -1409,11 +1387,10 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_get_hw_ip_version(hba);
 
-	goto out;
+	return 0;
 
 out_variant_clear:
 	ufshcd_set_variant(hba, NULL);
-out:
 	return err;
 }
 
@@ -2455,6 +2432,18 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.config_scsi_dev     = ufs_mtk_config_scsi_dev,
 };
 
+static const struct ufs_mtk_soc_data mt8183_data = {
+	.has_avdd09 = true,
+};
+
+static const struct of_device_id ufs_mtk_of_match[] = {
+	{ .compatible = "mediatek,mt8183-ufshci", .data = &mt8183_data },
+	{ .compatible = "mediatek,mt8192-ufshci" },
+	{ .compatible = "mediatek,mt8195-ufshci" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
+
 /**
  * ufs_mtk_probe - probe routine of the driver
  * @pdev: pointer to Platform device handle

-- 
2.55.0


