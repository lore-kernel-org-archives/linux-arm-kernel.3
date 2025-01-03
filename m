Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1018E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aGyyE4ZNasZE1YSK6osQK3Ake9zKnUpC4PIOmTm/Ls=; b=YwXGjfmqXNQ5aYw/3issg3A3WX
	WrtcdbuOkFp8fghQegfime2SW6/ohfgdVZnwGoZ7u4Al4w5mBuk+OHUBXLp17ENpC0bOFhIMwig6+
	+dv/DAlDMASaNoaXiEq+byZek4ctErw1CvbRtDdQehc+3wK9ZnBHST7/iQ9QofjJovS19zl/0CpIs
	gqmjSv5r2waZKOe3Q+QKK0KKUarm7Ne9xkPlvSn6MDbWRwRpPZFAqvy1pdA66tZxVi4dKRTq5TXXO
	DlNrOIzanDvdXkQ867sw3T+47SUzlusuKgnzhKGGnLVmBFEFIF9rWA2Uf77NMO5oDcMrTECDWfp5p
	uuQQse/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTapu-0000000CBFa-1A1M;
	Fri, 03 Jan 2025 06:07:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTajw-0000000CA0b-096d;
	Fri, 03 Jan 2025 06:00:57 +0000
X-UUID: 15300b7ac99811ef82ff63e91e7eb18c-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8aGyyE4ZNasZE1YSK6osQK3Ake9zKnUpC4PIOmTm/Ls=;
	b=hn8B+zkRIrdZoXeDwk94xnM08wf7g+Ys0Gcxn15nTdmCQBZqOSuGJltDOQwyIGYp6cnSbA5ihCTWRHkeFDHwwfVAaJy58vjPAUIMuh05UlDsT287J1/KNkQDdmfyFNu9p4DHdTc359X2mUqPOWt2/5bPaQLsQMeeXlEd34jXdaU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4ae86738-13f7-4687-8f6a-00cda4d75fed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ae3a9825-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 15300b7ac99811ef82ff63e91e7eb18c-20250102
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1341089430; Thu, 02 Jan 2025 23:00:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 14:00:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 14:00:46 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
Date: Fri, 3 Jan 2025 14:00:13 +0800
Message-ID: <20250103060035.30688-4-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250103060035.30688-1-jianjun.wang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_220056_093047_36F6514E 
X-CRM114-Status: GOOD (  10.62  )
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

Disable ASPM L0s support because it does not significantly save power
but impacts performance.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index ed3c0614486c..4bd3b39eebe2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -84,6 +84,9 @@
 #define PCIE_MSI_SET_ENABLE_REG		0x190
 #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
 
+#define PCIE_LOW_POWER_CTRL_REG		0x194
+#define PCIE_FORCE_DIS_L0S		BIT(8)
+
 #define PCIE_PIPE4_PIE8_REG		0x338
 #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
 #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
@@ -458,6 +461,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val &= ~PCIE_INTX_ENABLE;
 	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
 
+	/*
+	 * Disable L0s support because it does not significantly save power
+	 * but impacts performance.
+	 */
+	val = readl_relaxed(pcie->base + PCIE_LOW_POWER_CTRL_REG);
+	val |= PCIE_FORCE_DIS_L0S;
+	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
+
 	/* Disable DVFSRC voltage request */
 	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
-- 
2.46.0


