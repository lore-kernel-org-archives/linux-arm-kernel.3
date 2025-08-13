Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D2C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/N6L/iDMXiJ0jIm1ilu4+o+zlu1qgBDAbPtzXAqMRnY=; b=0crQWhcSy6Js/So6Nv76VA/tS7
	MCRsSk3BIvmkeuyK0Twi7Ft5FxnfUFI71BYEhEtezi0nFis35WBsCUtbfH2giE4hJTp7dO2sjGhIf
	pG+sf3U4tRuwaUuD0Q6NQJ02y/YWtzTqpV9HIzd7pLobyeVYLGeaL0dzXcfN0y244VeWfPqcGwUPM
	ahdDftBQcHZzLAoyJGdvID4WgoqKdSetD8u1anIYpLYdn1o/K8B7bfeIDHH2mDR2Pe9VE1xWidG81
	DuPyeQNiH5x5RlQxUxcUNQTz9DNk1WnCpJcjrlswpBdtWD9/niuMWUJfilv1EfmVfMDurG9xBLLZs
	a0UAaC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJiE-0000000F7uO-0IK2;
	Wed, 13 Aug 2025 22:12:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJLq-0000000F4yk-2oJQ;
	Wed, 13 Aug 2025 21:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/N6L/iDMXiJ0jIm1ilu4+o+zlu1qgBDAbPtzXAqMRnY=; b=CIa7W7fBONzTi+vXy+reqg8QMG
	G3xXEPcub07wo36mxCaWyUg0UchSszm5WmlhzFwoLFRsSK4y/YLhpYzFnIQyY3mLsVvPaeo5syGH8
	yxql9CKct0UEKxXOKz1o7QkGiW82MRNpOxUJLkuBMDu3NoIEwF71MImQQRbk2xCMbZqI88VYMVLHH
	E29xgMdI7kvbSW/YVbC3lvY+GF9sWUj1Q9WTjnXnvpLsKQs5JPAiEFq8oMfMWHuEe6hltXD/8+Yrl
	EaVyYqACL3bdiUHkJJnPXyE6KeCJ6cdXHFLTS6EL9HX38iNXGzKvTdkyPr0aLlQElfTwmIK7F8mPP
	vxZz15HQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJLZ-0000000GD9R-19DV;
	Wed, 13 Aug 2025 21:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58E2044F65;
	Wed, 13 Aug 2025 21:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E86C4CEEB;
	Wed, 13 Aug 2025 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755121762;
	bh=NAKVChDx7eHSjPyS9MwFrZDTgCpBq7ZuI5Zr92sTTO8=;
	h=From:To:Cc:Subject:Date:From;
	b=aGc/QnujCD9uIgZSKrwSkf0iKw/C5GI82Lb9ZYTkZ4gg/Mz/ZX5vikZEsa5CHp/PG
	 +vBXy2DI+CGC3CzFRDroBbXu+II/zZ9rxO6b1jwkMc6e4VPv2afCKNNqd8zVJLiDO+
	 TjepeY7kzSwFUZCy2iJuae2kjYiaNGMCD++xvsRgeG9QBj+knuPMyh9SZAuxTMsMtS
	 mUodmlszGUa+1ABTY1KOrl5nC5azPGNTX4kt+U3mKpdpYv1WcRN/w6FAhVM+wTjtBC
	 FL8CHRpXAtQNVR8qhYPTXo0XVh1DKJBBt/Efz85XyLbNRB9j+63O8pc/VINmeiL5gO
	 LCOkMcU9Tuo9Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] wifi: mt76: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Wed, 13 Aug 2025 16:49:16 -0500
Message-ID: <20250813214917.897113-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224939_012897_7D33A8C3 
X-CRM114-Status: GOOD (  11.14  )
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Rebase on v6.17-rc1

v2:
  - Split to separate patch
---
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index c823a7554a3a..5f19b506cc50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -284,20 +284,15 @@ static int mt798x_wmac_coninfra_check(struct mt7915_dev *dev)
 static int mt798x_wmac_coninfra_setup(struct mt7915_dev *dev)
 {
 	struct device *pdev = dev->mt76.dev;
-	struct reserved_mem *rmem;
-	struct device_node *np;
+	struct resource res;
 	u32 val;
+	int ret;
 
-	np = of_parse_phandle(pdev->of_node, "memory-region", 0);
-	if (!np)
-		return -EINVAL;
-
-	rmem = of_reserved_mem_lookup(np);
-	of_node_put(np);
-	if (!rmem)
-		return -EINVAL;
+	ret = of_reserved_mem_region_to_resource(pdev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	val = (rmem->base >> 16) & MT_TOP_MCU_EMI_BASE_MASK;
+	val = (res.start >> 16) & MT_TOP_MCU_EMI_BASE_MASK;
 
 	if (is_mt7986(&dev->mt76)) {
 		/* Set conninfra subsys PLL check */
@@ -318,8 +313,8 @@ static int mt798x_wmac_coninfra_setup(struct mt7915_dev *dev)
 			       MT_TOP_EFUSE_BASE_MASK, 0x11f20000 >> 16);
 	}
 
-	mt76_wr(dev, MT_INFRA_BUS_EMI_START, rmem->base);
-	mt76_wr(dev, MT_INFRA_BUS_EMI_END, rmem->size);
+	mt76_wr(dev, MT_INFRA_BUS_EMI_START, res.start);
+	mt76_wr(dev, MT_INFRA_BUS_EMI_END, resource_size(&res));
 
 	mt76_rr(dev, MT_CONN_INFRA_EFUSE);
 
-- 
2.47.2


