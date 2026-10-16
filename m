Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9821BCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aJQSdtzaPAfS0rV8xhnENBqrFKJ+G/rVL1rbnZqVbY=; b=SHfx1P8Is/aJnSGRunpRNa3PTL
	pSp8qnnqr9P+ImhePs/PzYkXA+ygdETHNxIShqnmKNqLhvEcVB8VUWfRFecmtweUzaQAu9r8GwOXE
	kWmerrXMC/itu0aSNtPic0mjdeG5x1pJrkqqQuWxzPausebv5JNKi5YOrIKYdbNCMXabIKiYDEhXe
	1yZk6GTEV6qheNiUpJkphdy/rEflnHzNQwwjl3/b3YqvhugLyLPE6dUPciPoHUxHMvuXTxDNuDtb4
	pPUJYNLXYk0LHMIKwnDdOfsNDKE2IAQAYIfqPpsQwOIfGsrelFpKrRF8HDXZT3RUVm3oal7LPF3di
	GlH6zMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHh8I-00000002tfM-0kI4;
	Fri, 16 Oct 2026 12:33:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHh8A-00000002tFX-19DA;
	Fri, 16 Oct 2026 12:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2aJQSdtzaPAfS0rV8xhnENBqrFKJ+G/rVL1rbnZqVbY=; b=Eor2FV3EOQSVZOLa21P7bmgGOX
	yjt0V8WAL/7xR755DLBFFcgGr1Ihv6KkFgr6ZdUOZ2IwQ8yheAEod7dQ8dc7QHKHNugut9XcU8DF9
	HQ+CbPP9j/SHT2p3Jj4wJJZuxbrpJ0vt6OGkaqwanemW4/xfaJllGzKjVXWRbgZPwGzm9k8NogoRQ
	B8qmTlZtJlDJHLNb3uNHDkkIq9+qy/TMaXq0zf/obY4vIihrf4Z5PYuzHzM/as9/U7ojUYFMQOstM
	d0IJfcOQQ/zEeDp74r7eaYUV0u3+8m4teo5DzlVk+Fyhd4pyd3E7XwYrcv4+uwnH45I/1yF4X6ciM
	iklTSxBw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHh86-00000001UCQ-17Ee;
	Fri, 16 Oct 2026 12:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792154025;
	bh=R6T0dyOZgvgRGsI6cRdIWKiQj4JAgaKEYSQ+2ZlMjkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n/oRIWA/wwPkX4lacdv2u3zv2M0OFrHVOAD2eyGp+TB2Xd4w1hSmy7X819T4kEFEb
	 tG/LvKGFVYx6B7LlnBTMfodir80o7628IUZKu9/fYtvhE+NaFWqa5xfIf5hflcLP2A
	 5gem3JEP8NGSKdWNsLulpHq6VNhNyjz21EESBc8nIURkutSLiOVmWX0NoW8rzR5M13
	 qWrHWXGI9vl2uwTZ+VRNxJh9OgZPCMaxJXE9WA3xru2BqP6SJvy4klMx5X8YNlgGND
	 7FvtwzgF/+k61/oLi5XS9le0rRog4XhdeB6v+bYvOXNWZGOBpqr0aQ44xEaApYZVZw
	 ElFbol2YWo5YQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C86417E3750;
	Fri, 16 Oct 2026 14:33:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 14:33:05 +0200
Subject: [PATCH v14 13/23] scsi: ufs: mediatek: Remove vendor kernel quirks
 cruft
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mt8196-ufs-v14-13-e8d565e0cd45@collabora.com>
References: <20261016-mt8196-ufs-v14-0-e8d565e0cd45@collabora.com>
In-Reply-To: <20261016-mt8196-ufs-v14-0-e8d565e0cd45@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792154009; l=3056;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=T5XSeaMDTDiKfKhFKEvHLCb89KQhpHwUip0Xj1sBkSA=;
 b=66+Ju7CxXiOu9K+/urQ3RFBeaPxFg7Uq+ehFZx9HpRpAqI62BMa3+Yeialj32IQrepzr6xub8
 KESnM1J6CTQAuDqvOgS/W1DSBP+9Gr+XJLRO/y2T+yiFaEDTLPwEb4M
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_133347_694335_A1C683C2 
X-CRM114-Status: GOOD (  12.38  )
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
index 46c9153be6e2..41e2e9f86701 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1066,73 +1066,6 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
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
@@ -2063,8 +1996,6 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 	     host->ip_ver == IP_VER_MT6995_B0))
 		hba->quirks |= UFSHCD_QUIRK_VCC_ON_DELAY;
 
-	ufs_mtk_vreg_fix_vcc(hba);
-	ufs_mtk_vreg_fix_vccqx(hba);
 	ufs_mtk_fix_ahit(hba);
 	ufs_mtk_fix_clock_scaling(hba);
 }

-- 
2.56.0


