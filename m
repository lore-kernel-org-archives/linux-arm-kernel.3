Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00D6C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fhTkCpm/BAX2elS9i7PT6HIx0ee+TW6oevUpwCI+6is=; b=Ub+6eWU+oEs+lNu8a18JhxRqrZ
	56NPrq2N4GIbqrkyU7BG0zCRSG6Z4dRFmPiQtX2a20E5YJe2jIIf3C1sEeWZ1+zSSvwtrSTEUEtwn
	UQcySd9k8Wrax2Yaq1248cXzDMOvu5130x+NV2N4miAEM5BEc6FYNfzzfdFOaqUCxZQLvC+IJDkMh
	ywXB523V3xUkHhD20ekQQ7BePvavgqL3n3CXhmtESIDYgkaXkGmRg5XvQFgfxIbxFlJKfWqbxkrT6
	LlQO0FZTcxEBa++hgLbEI+6ILP4cvl2Hgj+DEaE/y2JZ/9HM/gAqKwBOudcX53VLPehLPbcs3k3JE
	+8HNVKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlDS-0000000GFkk-11q8;
	Wed, 21 May 2025 15:18:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlBF-0000000GFR4-3rXF;
	Wed, 21 May 2025 15:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747840585;
	bh=rcecCSZgxXYbmeK45/Qv2JiTu7qRTSgAZkm1G2Upf04=;
	h=From:To:Cc:Subject:Date:From;
	b=i6l38Y+D8kDPWlbyUwquPW1SyH14xcmf0O23Ucu9qhRxkQRbFGZrdhiVmQpNE3vZE
	 eGWl1jUD2+dKK3WWpexvl9YrZuPMOTBn/35BaHGSfL3obFsPmi+kNwLkEtzokD03NA
	 7iXhWRinAHXlg1QID6KVdVFYL7qrSZp3lVm4CR9mijsPSZNU6uWB7fKmFLrMaJ6sHW
	 YY9euo++/N+MPN8+HUj76Dw3teuE5EgWLVye494KBSBe060/AIheIvfOarbmv+PTSu
	 GJu70haZPT3ja7RE5uMSFWNMciJUnifA7/j6papGU4ghSK2QjodvprHbj4ZEVhXHJI
	 TtG3LzKLoGO5w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C19217E0FD4;
	Wed, 21 May 2025 17:16:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	robh@kernel.org
Subject: [PATCH] iommu/mediatek: Fix compatible typo for mediatek,mt6893-iommu-mm
Date: Wed, 21 May 2025 17:15:48 +0200
Message-ID: <20250521151548.185910-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_081630_113407_E02836C4 
X-CRM114-Status: GOOD (  10.96  )
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

Fix the "mediatek.mt6893-iommu-mm" compatible string typo, as the
dot was actually meant to be a comma: "mediatek,mt6893-iommu-mm".

Fixes: f6a1e89ab6e3 ("iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0a54c6521bf5..cb95fecf6016 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1791,7 +1791,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
 	{ .compatible = "mediatek,mt6795-m4u", .data = &mt6795_data},
-	{ .compatible = "mediatek.mt6893-iommu-mm", .data = &mt6893_data},
+	{ .compatible = "mediatek,mt6893-iommu-mm", .data = &mt6893_data},
 	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
-- 
2.49.0


