Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hIXQeCT3;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I/rotX00
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gE0ScmYrFjCj2XqU/NIHxN+a7VmHwGx/vJD1+r3XhrQ=; b=hIXQeCT3POn2jBUHMsZFH6q+4d
	r1Lh4Pi4NcLTU//CEi44c4eYXgm1sf3niOYAHwLHQ6KRGVhv1HFdPlyy6Sz61o8rEu1rYhoizABSe
	/J/I/44HvFIn8ahcXeHW0KvGNBDxdTELevVNKBZrXsVaCosZ4XccfMWTwoNMgdSBdqWjKNFawJ406
	UaBSKA8XfoGnAwB7mMqFB709xPBIeLl5XTytLnnNqHuY/I0BqjEoVagXF9YBRYTlcBA7a1ekN5EnU
	BYCIm9cBkeohimQbCHfBTemIOd/q3JD6x75dTuy4ccdSZ/1R7yeVnLhzzXAbV9/hYeK5ZsoudcBhb
	rmNG/nIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhwK-0000000B6zL-2JCv;
	Fri, 30 Oct 2026 08:26:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhwH-0000000B6x7-39vr;
	Fri, 30 Oct 2026 08:26:19 +0000
X-UUID: 87f25d7ad43b11f1afed4741b24580c9-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gE0ScmYrFjCj2XqU/NIHxN+a7VmHwGx/vJD1+r3XhrQ=;
	b=I/rotX00GWSuUiJXTi+V0A/nAzeVoW2vVMEWP2rtmHuHM4ki0LtMEfgqCF7FKSzLn973n9gFPKZ7zq/+Yh9drc8enuxpaCwj8qZs4R5/NhLh416pTUSt2cUkrMisoDHyTJDihmnvLd19dyrZvVLzpcsHdXsUBmljP5gXisZa65Y=;
X-CID-CACHE: Type:Local,Time:202610300126-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:bbe50428-9079-4a35-8461-63457ef8dd33,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:f8805093-992d-41bc-b618-62c5d111cc67,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87f25d7ad43b11f1afed4741b24580c9-20261030
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1535866088; Fri, 30 Oct 2026 01:25:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:52 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup irq
Date: Fri, 30 Oct 2026 16:25:37 +0800
Message-ID: <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012617_802022_5E2A6726 
X-CRM114-Status: GOOD (  14.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is a dedicated wakeup irq on nvidia n1/n2 SoCs.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/plat.c  | 16 ++++++++++++++++
 include/linux/thunderbolt.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
index 85a00cd391d4..8d83b484d942 100644
--- a/drivers/thunderbolt/plat.c
+++ b/drivers/thunderbolt/plat.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/slab.h>
 
 #include "nhi.h"
@@ -46,6 +47,15 @@ static int nhi_plat_init_irq(struct tb_nhi *nhi)
 	if (ret)
 		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
 
+	if (nhi->wake_irq) {
+		ret = dev_pm_set_dedicated_wake_irq(nhi->dev, nhi->wake_irq);
+		if (ret) {
+			dev_err_probe(nhi->dev, ret, "set wake irq %d failed\n", nhi->wake_irq);
+			return ret;
+		}
+		dev_info(nhi->dev, "wake irq %d\n", nhi->wake_irq);
+	}
+
 	return 0;
 }
 
@@ -53,6 +63,7 @@ static void nhi_plat_exit(struct tb_nhi *nhi)
 {
 	devm_free_irq(nhi->dev, nhi->irq, nhi);
 	flush_work(&nhi->interrupt_work);
+	dev_pm_clear_wake_irq(nhi->dev);
 
 	pm_runtime_put_noidle(nhi->dev);
 	pm_runtime_disable(nhi->dev);
@@ -85,6 +96,11 @@ static int nhi_plat_probe(struct platform_device *pdev)
 	if (nhi->irq < 0)
 		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
 
+	/* ignore error */
+	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
+	if (nhi->wake_irq < 0)
+		nhi->wake_irq = 0;
+
 	return nhi_probe(nhi);
 }
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 212c8fea6571..06b90d452ee2 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -533,6 +533,7 @@ struct tb_nhi {
 	bool going_away;
 	bool iommu_dma_protection;
 	int irq;
+	int wake_irq;
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
-- 
2.43.0


