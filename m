Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF3CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OirhvBRXtJjJhiIFIQFwhFrPyp5mubO46aafZFdokao=; b=4DSkYIY9WlFl1o1/IToTMAErIg
	T3+gtjH/3DMKB43jW/SFeLCFJQ5XMrADEmF64HcHZh4WZlpbMrJKBu83NCO8LaM+yfx9F9vUS+3pw
	ajbdL6vbV/Bp8X6bbMc1wZW5K6PKllOeibj0enrqc//8bGawpBT6pGQiN7YDfvfCH22YvQHlS7yVF
	w54sFWhRPyq5nhiWzGg7ZNfPV3/RGoQyJ6tfDo1CsBdkbE1pTUaXufsgZxjRfdvldqMHseXj0iqA/
	ZTnO0E4XkuPFLTABLOE9L8yDhx6k5xyZfXqjgG5D9r4/8bB4gkktdERqdqoeDMBIzLCHIQkyH5fcC
	Wuw7ZuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3z-000000088GD-1TbE;
	Thu, 01 Oct 2026 08:22:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3e-000000087ZG-2toc;
	Thu, 01 Oct 2026 08:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OirhvBRXtJjJhiIFIQFwhFrPyp5mubO46aafZFdokao=; b=SVswwk2rxOZTuZaXR9+OP0nsRL
	TRcnS97LpJi2VTkOi/ZHx7/qEdSjEhfik60P+iAKPakCtqhpzSRr8T6liS7M87NKKCkz6kOOUpaFy
	iNxrV582jw2oGoNEv4b7Dj9GL028fCc/int/XuMTMI/nNtwtyx9fI1Hg5f6vptFdGuBiINPtVvira
	bUGXtOGNxP6Zuh9JjT+mnXiTidWvlo2ii4Yk+peoZQqzJg8mJiU0t1VAEn7jCfxr+JLGOkU4mo5vq
	qcP4xFmORmyiLzJD8W4mPxdij5METKuDcvSZdBIGM7B711GtDOK02/AoGv4lfDElW8hl2EMWRBblj
	+DhyVuDA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3b-00000004iuO-0jrT;
	Thu, 01 Oct 2026 08:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842941;
	bh=C6WU5muT4CSMp4ocJ0duZlA1BaH7TSQUNA7vUIHznNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GBZ18O/XugUFmqBfvtJCfJY9cglpmYvAfzqcrJ51HMwt0ilFpNAvQ2pVdywPCg8TY
	 xO5Rrl0W5b7JPdRRRR5tCymBKwRzZIy0JNrSyl35Q+zYpGcWswivMYfoFmO2nq56gh
	 lzbM3nh2RleXAjnvknP0al3axziNc1viqGOWybRnmgct89mSNCs0TqFV+2mSiugeu/
	 VtRXw4TbuO4CShjJMegF0nOIec6Cn9avlRVWAD319IkeUYiu6Dk3yWcc/DSNQSulWm
	 IJ5/CDLFtrthC9vy8RRRPjVRanm4lokhWrurI2oXlFvM5/mcFRSzC0cDsOkFJaW/fA
	 4OM5FhszBjb8g==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F180817E089A;
	Thu, 01 Oct 2026 10:22:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:53 +0200
Subject: [PATCH v13 21/24] scsi: ufs: mediatek: Back up idle timer in
 per-instance struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-21-60854adab6d9@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=2715;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=LlUuqdMlsNSEAOOJ4/R3q2PAm+kuC3zJ+NW1oJaqskg=;
 b=83kswAUplS5vDKZDeo9N/mk0Kumq/zqqD0IET02wxfXVVIXki+oqbeiQl2GQYR5aGN566Bvcj
 HbBWZJauSePCB2hKvVjvnbZFD0jVdMucKCm+H/uOrYInq0wo2eHC7c0
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092223_758496_6094B62E 
X-CRM114-Status: GOOD (  17.72  )
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

The MediaTek UFS driver uses a function-scope static variable to back up
a hardware register across a power change in the
ufs_mtk_pwr_change_notify function. This is dangerous, as it's only
correct if only ever one instance of the driver is loaded, which isn't
true if there's more than one device on a SoC that needs it, or it
otherwise gets loaded a second time.

Back it up into a member of the host struct instead, as this struct is
per-instance. Rework the function to not use a pointless "ret" local as
well.

Fixes: f5ca8d0c7a63 ("scsi: ufs: host: mediatek: Disable auto-hibern8 during power mode changes")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 19 ++++++++-----------
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 1b5f8c2596f3..de3e0b5b50f7 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1456,27 +1456,24 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status stage,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
-	int ret = 0;
-	static u32 reg;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	switch (stage) {
 	case PRE_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba)) {
-			reg = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+			host->ahit = ufshcd_readl(
+				hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
 			ufs_mtk_auto_hibern8_disable(hba);
 		}
-		ret = ufs_mtk_pre_pwr_change(hba, dev_req_params);
-		break;
+		return ufs_mtk_pre_pwr_change(hba, dev_req_params);
 	case POST_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba))
-			ufshcd_writel(hba, reg, REG_AUTO_HIBERNATE_IDLE_TIMER);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+			ufshcd_writel(hba, host->ahit,
+				      REG_AUTO_HIBERNATE_IDLE_TIMER);
+		return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int ufs_mtk_unipro_set_lpm(struct ufs_hba *hba, bool lpm)
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 6b81c8f76201..1fa14a83e8cd 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -188,6 +188,7 @@ struct ufs_mtk_host {
 	u16 ref_clk_gating_wait_us;
 	u32 ip_ver;
 	bool legacy_ip_ver;
+	u32 ahit;
 
 	bool mcq_set_intr;
 	bool is_mcq_intr_enabled;

-- 
2.55.0


