Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC457C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ7HgUs7/vySNSb2uPcrZkXj0ZWbSiFjRGFESlydo6E=; b=3/H4+tKOBiXd14lE4FCiRKB8Cn
	k6jsLte9s9ZnGRnWIhbIPtFjGZL7q5Uw7KUpZ4EHDcc3FuNrRQw5OIVPDtmTPxGVdAQI6gpQyJKS5
	cD+exvqKaY3iVIzFYsFyk+lZWgxWUkiQfkZrx6lzXvLS+QjUf3aR32ujm5a/oPTELQIcwxQga6CAZ
	LV8X9GSjZooEf6n0C4TXUltMLrnq0Pt/YJjWTQYI7uNm9Iy5coDWBhS0krzI3ZyVA9oPr54WZ/5/d
	TB1DXSPxaO1R4/Gvtfnqx8OnG/PYa7RjIVlAVyQi73BMdfVEwGWU7s5UUon057llZ3Svx1e9zLMZC
	TM3dMSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0P2-00000003EwI-0iAB;
	Mon, 16 Jun 2025 03:20:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR02C-00000003CtW-08Cy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 02:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EZ7HgUs7/vySNSb2uPcrZkXj0ZWbSiFjRGFESlydo6E=; b=qMkAEU7jowdXE63w+eecTKRaue
	rlNMOp7zc0ihZiy/4Ha6Gqb2yBf5NuqwgQuvYYbDUvouRIK20RDxOXAyF4+GMYeH0su0tYP0TnUuR
	r+uhMPzmB12u8Dptd7pjAf6458WvmPctgzc+cG0yJn6MZWzdO9jJcgIVasnb+3EvRsM+dBJdJG2qs
	AdpT6s4us3swDdbDcKsYtMKagnHl891VNjRy9NrfH9Ol5ynHp8PGakwZXa8xDmtCqsDKkyb7WYkKm
	7Kyi6/0nwn3Er5AE1QP9gWAjJdI+4JtxDMsxWnnmZ6e5ilv4FNV/coeslgdjrFVq3nHwizMYFNG8H
	nCmN4AhA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR023-00000003TVs-2rmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 02:57:18 +0000
X-UUID: 8910f6c64a5d11f09f706fa2197c6ceb-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EZ7HgUs7/vySNSb2uPcrZkXj0ZWbSiFjRGFESlydo6E=;
	b=rN0Ac8S7+Xi4XeFZYg36Vx0Oa2TZpKAkUreZVXT9tWhviGKG5I9CDdSL+Cyh7PRtjfCXzZnjlMDGhOR6BLEkKW54LwErK173pFiTiNe5/r9OJmP2FJNVvv0RkHdHdyLW0LYLHes1TNz4WXoqXtGmtIFzgitPdwfqoU2Q1tfAuD0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:0fbf2e07-0b1d-4466-8ad7-3c717c282dd3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:853d7d28-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8910f6c64a5d11f09f706fa2197c6ceb-20250615
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 703803202; Sun, 15 Jun 2025 19:56:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:39 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 4/8] iommu/arm-smmu-v3: Add implementation for MT8196 APU SMMU
Date: Mon, 16 Jun 2025 10:56:10 +0800
Message-ID: <20250616025628.25454-5-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_035715_280936_1A544501 
X-CRM114-Status: GOOD (  14.25  )
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

Add a special implementation for mediatek APU SMMU. APU SMMU need to
wait APU SMMU's power which depends on APU driver. Therefore, add the
label mediatek,smmu-parent to point to the power device that the
smmu depends on. If the device has not finished probing, return
-EPROBE_DEFER.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-mediatek.c    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
index c00ee687d839..48290366e596 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
@@ -15,10 +15,12 @@
 #include "arm-smmu-v3.h"
 
 #define MTK_SMMU_COMP_STR_LEN		64
+#define SMMU_REQUIRE_PARENT		BIT(5)
 #define MTK_SMMU_HAS_FLAG(pdata, _x)    (!!(((pdata)->flags) & (_x)))
 
 enum mtk_smmu_type {
 	MTK_SMMU_MM,
+	MTK_SMMU_APU,
 	MTK_SMMU_TYPE_NUM,
 };
 
@@ -36,12 +38,18 @@ static const struct mtk_smmu_v3_plat mt8196_data_mm = {
 	.smmu_type		= MTK_SMMU_MM,
 };
 
+static const struct mtk_smmu_v3_plat mt8196_data_apu = {
+	.smmu_type		= MTK_SMMU_APU,
+	.flags			= SMMU_REQUIRE_PARENT,
+};
+
 struct mtk_smmu_v3_of_device_data {
 	char			compatible[MTK_SMMU_COMP_STR_LEN];
 	const void		*data;
 };
 
 static const struct mtk_smmu_v3_of_device_data mtk_smmu_v3_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-apu-smmu", .data = &mt8196_data_apu},
 	{ .compatible = "mediatek,mt8196-mm-smmu", .data = &mt8196_data_mm},
 };
 
@@ -79,5 +87,29 @@ struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu)
 		return ERR_PTR(-EINVAL);
 	}
 
+	if (MTK_SMMU_HAS_FLAG(mtk_smmu_v3->plat_data, SMMU_REQUIRE_PARENT)) {
+		parent_node = of_parse_phandle(dev->of_node, "mediatek,smmu-parent", 0);
+		if (!parent_node) {
+			dev_err(dev, "Lack its parent node.\n");
+			return ERR_PTR(-EINVAL);
+		}
+		if (!of_device_is_available(parent_node)) {
+			of_node_put(parent_node);
+			return ERR_PTR(-EINVAL);
+		}
+
+		parent_pdev = of_find_device_by_node(parent_node);
+		of_node_put(parent_node);
+		if (!parent_pdev) {
+			dev_err(dev, "Lack its parent devices.\n");
+			return ERR_PTR(-ENODEV);
+		}
+
+		if (!platform_get_drvdata(parent_pdev)) {
+			dev_err(dev, "Delay since its parent driver is not ready.\n");
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+	}
+
 	return &mtk_smmu_v3->smmu;
 }
-- 
2.46.0


