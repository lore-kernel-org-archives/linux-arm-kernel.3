Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD33CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xlpclAVoCmfT5lZSLvIB9vZUgcTRTB2ypx+GfBtqB4=; b=zdQ8jp+WIKr1erkfuUsPs0Ak3Z
	LNa1PKZv2hZZjoHR+zPwqhOXutOA7cvvCVtFbQFEGsRGGCkSwsSTcCpcEK27nAOSlvJcGZjNkwg+Q
	Zj8uSnAc80i6pfVns2zONoBTk297NTe7g5Q0ujvEGVL2NwsOc7+gBp+BZvMe/eKQsQr8JntLLv/Hw
	L01XzEDGeEDwPwhz9U83vpc+R6qh93+dloSpAOquYB/6sRLXrTAH86KiC1cj9TizFe+ayU2w5DDOW
	tjiBxkYzNlAyrh9ZZnYTKAPFmyNxQTrO/e24tafnIbo2oR9tFfMZioqwY6hgJfTmnWqNb/QUdWgTA
	pfesaXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3k-000000087km-0Zva;
	Thu, 01 Oct 2026 08:22:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3Z-000000087QH-2tI6;
	Thu, 01 Oct 2026 08:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1xlpclAVoCmfT5lZSLvIB9vZUgcTRTB2ypx+GfBtqB4=; b=mozchYNogyfeB/zc0wTbynFfEy
	bgEGkTBtJJGmNyqfe5XZ7XF8x1aoAfV4B601rG30F1g6pXlTxU69XqqO940N3w660hUJCEk/muC8F
	TSNJv5ta0YpMbR/YBU2Ecyd58hqs79zfD/s8THcrI4+aqmdVLhV9oYDwfu14k2Rag8/Ivve2u9k3o
	OYLHcI2KvWDk3o1aSK/O0D7A83feU58kwu7D4fXuBxL3ePQzh3CXUiKUielPG3bl0geRPaxB+oOMw
	/C1yyq+Vg/ECWn9HRP0W2+JgXuCCPlzXdtZOgEe3S4yo7ekq17SxremTHYls2Qznmf/7oPHwHNNlA
	CgzcFhMA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3S-00000004is6-2I6X;
	Thu, 01 Oct 2026 08:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842933;
	bh=vpahzLGutbS5jVntCHw5zsppQisUfPeevCwaTpaCC6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T1Y0yN+ZSMnoqzg3F5SmC6ewe9Dzg1ayKIZbtj/FPrB2MBgzwIIJL338gMlMTmbv+
	 nqn05RhUzLflpwbmmlacy2zAOyP0wP5NzJ6HxmIyEmI81dtLjAp0uO7TWz/4q9j7TX
	 7frNtVku4UxyoYKwA9gkTUAejsy/WyZ4AzUD8qNumSzkY0P4h0y39UKQz2gBw0n/vR
	 7zh0RDUz6CumW3sMVUForUV3GaRweQgM8fLmhG8H3FqRXe9X5B1djM78cH0wavNMOl
	 9tGoBpyqrTDYcdUKWvGpQaHOVQuXEvDLjKuXK6uU0V0F1gz0QIeOakXth7hbpuqN2B
	 7Y4HjN7x950Yw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FFDA17E0D3B;
	Thu, 01 Oct 2026 10:22:12 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:45 +0200
Subject: [PATCH v13 13/24] scsi: ufs: mediatek: Remove vendor kernel quirks
 cruft
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-13-60854adab6d9@collabora.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=3056;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=31DowZdIwFWsWAz3RZT8z/mQOxldgZEWq09XHeDcE2E=;
 b=Aw0t58lGBrDSkUXPJQZyZLDuExSz2lcR6i8b2kg0pW97Ht53P5B24E+W1+cIT4QICr0j8grLZ
 GhdW7JIKqeoBO2j2VqOKhMtmiOEz//UIQDwoAOXIOvkAxcPJD34hABH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092215_085625_51D0E10C 
X-CRM114-Status: GOOD (  13.29  )
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

Both ufs_mtk_vreg_fix_vcc and ufs_mtk_vreg_fix_vccqx look like they are
vendor kernel hacks to work around existing downstream device trees.
Mainline does not need or want them, so remove them.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 69 -----------------------------------------
 1 file changed, 69 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 1dbf056e1d7a..e4b41de4de3a 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1058,73 +1058,6 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	}
 }
 
-#define MAX_VCC_NAME 30
-static int ufs_mtk_vreg_fix_vcc(struct ufs_hba *hba)
-{
-	struct ufs_vreg_info *info = &hba->vreg_info;
-	struct device_node *np = hba->dev->of_node;
-	struct device *dev = hba->dev;
-	char vcc_name[MAX_VCC_NAME];
-	struct arm_smccc_res res;
-	int err, ver;
-
-	if (info->vcc)
-		return 0;
-
-	if (of_property_read_bool(np, "mediatek,ufs-vcc-by-num")) {
-		ufs_mtk_get_vcc_num(res);
-		if (res.a1 > UFS_VCC_NONE && res.a1 < UFS_VCC_MAX)
-			snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%lu", res.a1);
-		else
-			return -ENODEV;
-	} else if (of_property_read_bool(np, "mediatek,ufs-vcc-by-ver")) {
-		ver = (hba->dev_info.wspecversion & 0xF00) >> 8;
-		snprintf(vcc_name, MAX_VCC_NAME, "vcc-ufs%u", ver);
-	} else {
-		return 0;
-	}
-
-	err = ufshcd_populate_vreg(dev, vcc_name, &info->vcc, false);
-	if (err)
-		return err;
-
-	err = ufshcd_get_vreg(dev, info->vcc);
-	if (err)
-		return err;
-
-	err = regulator_enable(info->vcc->reg);
-	if (!err) {
-		info->vcc->enabled = true;
-		dev_info(dev, "%s: %s enabled\n", __func__, vcc_name);
-	}
-
-	return err;
-}
-
-static void ufs_mtk_vreg_fix_vccqx(struct ufs_hba *hba)
-{
-	struct ufs_vreg_info *info = &hba->vreg_info;
-	struct ufs_vreg **vreg_on, **vreg_off;
-
-	if (hba->dev_info.wspecversion >= 0x0300) {
-		vreg_on = &info->vccq;
-		vreg_off = &info->vccq2;
-	} else {
-		vreg_on = &info->vccq2;
-		vreg_off = &info->vccq;
-	}
-
-	if (*vreg_on)
-		(*vreg_on)->always_on = true;
-
-	if (*vreg_off) {
-		regulator_disable((*vreg_off)->reg);
-		devm_kfree(hba->dev, (*vreg_off)->name);
-		devm_kfree(hba->dev, *vreg_off);
-		*vreg_off = NULL;
-	}
-}
-
 static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 {
 	unsigned long flags;
@@ -2045,8 +1978,6 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 	     host->ip_ver == IP_VER_MT6995_B0))
 		hba->quirks |= UFSHCD_QUIRK_VCC_ON_DELAY;
 
-	ufs_mtk_vreg_fix_vcc(hba);
-	ufs_mtk_vreg_fix_vccqx(hba);
 	ufs_mtk_fix_ahit(hba);
 	ufs_mtk_fix_clock_scaling(hba);
 }

-- 
2.55.0


