Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19071CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 04:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXwuIZ+wZT43D3G1Ar0ZYG3fYDkQ58vgdh7aRb5f7OY=; b=2CF77ZP/0b+CR+DX+BLSrL7ADA
	SuPqve2S+zKT0SK6N9cCklA4Krc6ONFabGvXIcPVRLRiZVVNIucJwxomsHALeHYjISBjn71QvHYhT
	38hahdsHDxJqtOTgD/3eFmqxROh/lOMmoX/DMXAQWHySt4x9kzPhCJeuVm8bv2ghtFYW4ZA9JVaiJ
	fkUzSLiQnNQoDM/EpuY6bN8pN8WRTSCtIoWJqhTPpSFjVBFLeHbqxP1+DExX0gXHCr4IrUgkg54dk
	g7lJ0BASUqpda7VkUp4o5KUj1TRZ+y5qk6u3HHAtmxoRoBwaVn894IEckmdMMTelKZ9p8i3hwt5xf
	rC6U5CYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxlA-0000000AQ6B-1oMs;
	Fri, 26 Jun 2026 04:01:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxkv-0000000APJv-3Dgg;
	Fri, 26 Jun 2026 04:01:31 +0000
X-UUID: b10b5ee0711311f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZXwuIZ+wZT43D3G1Ar0ZYG3fYDkQ58vgdh7aRb5f7OY=;
	b=H7N3tYQUDHpWm2mJ1URAy3p5HofqXrPEqVQukussG8orhVc8eLa6/pWAcmONbUD5OOK99xcGOT+CP3wxOpIk4+iEWsruCh9v59o2I4NN/v1B6XH0TWnstrhej7abfOwiiK1mf+IoQ+pZ/YE+G2PSyWeMgSwedI18kdYdltPowVE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c3bc9f24-162d-4927-9d22-9984c4fe4995,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:abd8f866-eeb4-4f3b-8eb9-dd434ebf4301,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b10b5ee0711311f1acbe4559397dec65-20260625
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1626671803; Thu, 25 Jun 2026 21:01:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:17 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 22/32] pinctrl: mediatek: mt8127: Enable module build support
Date: Fri, 26 Jun 2026 12:00:51 +0800
Message-ID: <20260626040112.2436185-23-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_210129_840460_ABFA06B0 
X-CRM114-Status: GOOD (  11.60  )
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

Add MODULE_LICENSE("GPL v2") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: 6acdee8c1325 ("pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8127.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index d1fcd06593b4..4a6bcea05dbb 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -119,7 +119,7 @@ config PINCTRL_MT8135
 	select PINCTRL_MTK
 
 config PINCTRL_MT8127
-	bool "MediaTek MT8127 pin control"
+	tristate "MediaTek MT8127 pin control"
 	depends on MACH_MT8127 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8127
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index f5030a9ea40b..35f4951e50d0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -307,3 +307,6 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8127 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


