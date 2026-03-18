Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CC710854D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNAxvMlpKbnk3xa//SsNLWzTbu90yHBu0yVq6XBO01c=; b=aH6hLZsZm/uJFi3u7AwYErW+SZ
	PtS/jQWnyINhoLMBAbEQo/Kn9MzNMV7eI1DKIKqpiZo4RMfu5OwMNT1GiQ293nv8HY0eiG5qjA7oV
	ub1Y2RRKtu3oRUhNO9IbP099IGDqMQysrCDqmr8rHaNN+jKFC1R4Hxyn/QW9y9xUhrB0XGmoPfQ0J
	7LeDO0ZKc7jPOKtjX9gKYxgf5GHjDXZjHmaZwoIWlY5L76FQOnTnv/MMwzgbsWHQlGxB6y04jdO1o
	vtWlyi82Mn+Ifd4EqMGxf7ClewhKOzlSk2aIZtmN6hh3E3Ec21Ni/IQ2e+GZ7vaRkfFaqRf5pqegz
	6Th1qgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mY2-000000084ZH-2m3g;
	Wed, 18 Mar 2026 08:46:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mXv-000000084Wn-3YJf;
	Wed, 18 Mar 2026 08:46:32 +0000
X-UUID: f3a0c80a22a611f1a6de359d7043e138-20260318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jNAxvMlpKbnk3xa//SsNLWzTbu90yHBu0yVq6XBO01c=;
	b=toI8xKgU2WD1t7OZU/WLbYxyU9Urz1RDYoaA9HO1DNvwkhLlP771UG/nPjdG5zJAZZZIwpHh4g0/KcxD4utzAW4rplZlgLY3+e5AqYD9lULknxZYNfsemt9KWKtoJwaXksWJ5MTWsTXp28461lEcoapikLOToe9D19f4ByWl8fE=;
X-CID-CACHE: Type:Local,Time:202603180111-07,HitQuantity:5
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:beaefeb9-a3e9-45d3-90b4-ca5b60ec99f8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:7179a24c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f3a0c80a22a611f1a6de359d7043e138-20260318
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <adlavinitha.reddy@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2041248436; Wed, 18 Mar 2026 01:46:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 18 Mar 2026 16:46:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 18 Mar 2026 16:46:24 +0800
From: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, adlavinitha reddy
	<adlavinitha.reddy@mediatek.com>
Subject: [v1,PATCH 1/1] i2c: mediatek: add bus regulator control for power saving
Date: Wed, 18 Mar 2026 16:46:16 +0800
Message-ID: <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260318084621.4127757-1-adlavinitha.reddy@mediatek.com>
References: <20260318084621.4127757-1-adlavinitha.reddy@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_014631_882649_C8EA5B13 
X-CRM114-Status: GOOD (  15.08  )
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

Add conditional bus regulator enable/disable in mtk_i2c_transfer()
to support I2C bus power gating for platforms that require it.

This implementation:
- Enables bus_regulator before clk_bulk_enable() if vbus-supply is defined
- Disables bus_regulator after clk_bulk_disable()
- Only activates when vbus-supply is provided in device tree
- Has no impact on platforms without vbus-supply defined

This approach provides power savinggs for platforms with an extra I2C bus
regulator, while avoiding runtime PM complexity.

TEST= Build and boot on MT8188

Signed-off-by: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index cb4d3aa709d0..126040ca05f1 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/scatterlist.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -1244,9 +1245,15 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	bool write_then_read_en = false;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);

+	if (i2c->adap.bus_regulator) {
+		ret = regulator_enable(i2c->adap.bus_regulator);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret)
-		return ret;
+		goto err_regulator;

 	i2c->auto_restart = i2c->dev_comp->auto_restart;

@@ -1301,6 +1308,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,

 err_exit:
 	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+err_regulator:
+	if (i2c->adap.bus_regulator)
+		regulator_disable(i2c->adap.bus_regulator);
+
 	return ret;
 }

--
2.45.2

