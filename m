Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D742CC624DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCTA6O5xlylFQi8U1fv32AzVbh+DMDz/icuaWqG2JYg=; b=oUhoZ9yD0x2n7vCZ8NB3XHKksR
	weTwU/ncwtn+hT6RpkMj4gMcEF1TgH7Ef1bSdsDv6jz8ORJE2eLQxF3ofIRsWO/iQy6dR87opftwB
	1G9kszgCebpc7oAZ9q1JMYMdlRc5HesJ4r5urMQlX3gH4sNDmUm7E71Inn26YaBQAutCrkPO2+MJ0
	qVG1HN6u/9ZH9VABIoEavWoXiEsxEDVJGzp7IniHgm/fo2sLVf0QynNTzEJzM8c0L08/ddqt9e4Dv
	MIlG5HYh1ekZBmpiDieq/Z75BObMp26iPQX+haZcPi07/PNSZTenu5m0/8TOwSs43dLva7t36OZ0+
	ytxIDoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20p8-0000000GTSq-2WHC;
	Thu, 03 Sep 2026 06:21:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20p2-0000000GTPN-2cEO;
	Thu, 03 Sep 2026 06:21:17 +0000
X-UUID: a61c9f26a75f11f1acbe4559397dec65-20260902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BCTA6O5xlylFQi8U1fv32AzVbh+DMDz/icuaWqG2JYg=;
	b=m6Zxpnoo+WvOJ6ILePXOMEW+XPqSOnVemsYddt8AgGtuBd8Ov9dhJwZkRuxLpo2g1Dz+ahPkDF2YbmV3J0tPMeUSybiZhPQRL/kZpxD1V7epfyAc0A0iEVzHTZabrB6QDeBRUrL9JABLZ9cE2TKR+Iie37oBXLJ3o/ip6zAl4m4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7cd076d3-3e15-43c4-8776-1cebe25d4c89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:8ebd6296-8382-4d0c-b42c-b0965a0d23b4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a61c9f26a75f11f1acbe4559397dec65-20260902
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1823613426; Wed, 02 Sep 2026 23:21:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:05 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 2/2] soc: mediatek: mtk-regulator-coupler: Allow building as a module
Date: Thu, 3 Sep 2026 14:20:47 +0800
Message-ID: <20260903062056.1024263-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_232116_670594_09726637 
X-CRM114-Status: GOOD (  14.22  )
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

MTK_REGULATOR_COUPLER is a bool whose prompt is only visible when
COMPILE_TEST is set, so on real MediaTek configurations the symbol has
no prompt at all and is forced to its default: it can only ever be
built in.

Turn it into a visible tristate so that the coupler can also be built
as a loadable module, which is what kernels shipping most of their
drivers as modules need. The "default ARCH_MEDIATEK" is kept, so
existing configurations keep building it in.

While at it, add the help text that the now user-visible prompt was
missing.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/soc/mediatek/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..4a2f2bccc213 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -56,9 +56,13 @@ config MTK_PMIC_WRAP
 	  hardware to connect the PMIC.
 
 config MTK_REGULATOR_COUPLER
-	bool "MediaTek SoC Regulator Coupler" if COMPILE_TEST
+	tristate "MediaTek SoC Regulator Coupler"
 	default ARCH_MEDIATEK
 	depends on REGULATOR
+	help
+	  Say yes here to add support for the MediaTek regulator coupler,
+	  which keeps the GPU supply and its coupled GPU SRAM supply
+	  voltage-balanced on the MediaTek SoCs that need it.
 
 config MTK_MMSYS
 	tristate "MediaTek MMSYS Support"
-- 
2.45.2


