Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281B7CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ontK0DsJG1v6pRqJehDXCYuropllwX/zFr8RftS9MBo=; b=Gd3UVVol43T9S6DoTPSPMcgI1P
	3Ud5JGLNFVyP+tBNUp/Tey8NH53fVztEIYyVf2jzHNVGiLaB4uc7gd1ScDfw2dQ+lxF2jnOs1YCoX
	rdmzeBWaPCaEAS1Z6jVbDJjrZYvLc6pBpdzci/XiJogmh3E50zO5lEMMYhSqcoPbkLBUHFpUz0xGX
	0D8xYCN+qu6UUuQCwLhVDfqbWkS4N3E58WdDJVzGNmBReqiLlaHSzHr12qM2eOZldliFSeir+SVSQ
	gtPtMhnUMGiTY08yYMb0Mx181T23iKJOp+Tf0NFLMLifIETtgWXXPWb2/iREYC6UWv9WbX1KNWYkC
	TlJmk/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGS-000000079mS-19pA;
	Fri, 29 May 2026 10:16:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGK-000000079it-2r4c;
	Fri, 29 May 2026 10:16:21 +0000
X-UUID: 6e77bb505b4711f1afed4741b24580c9-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ontK0DsJG1v6pRqJehDXCYuropllwX/zFr8RftS9MBo=;
	b=ku6eNT2nXX/uE66Hza9aGIS9548CpccupXrc25qLofZ14lrwdSBIcvytBWlMq9aOPWZEcq9aTQpnIpzZVQMPXYTPEqZ8iyLa6WhIHg4zpr6HS5yOlEJPyuHTs/XHUHMDDURQBAbT2gIpazWla1o+jQK8bOpowrlKzjbepMfJk7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:82db8bc0-af80-4890-a50e-a1325115c3b4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:0aaad0f6-ddd5-40e6-821c-e08002aeddf5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6e77bb505b4711f1afed4741b24580c9-20260529
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770541369; Fri, 29 May 2026 03:16:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:16:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:16:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 1/2] soc: mediatek: Allow MTK_INFRACFG to be built as module
Date: Fri, 29 May 2026 18:16:02 +0800
Message-ID: <20260529101613.55697-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529101613.55697-1-justin.yeh@mediatek.com>
References: <20260529101613.55697-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031620_740814_0C3915E6 
X-CRM114-Status: GOOD (  11.89  )
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

Change MTK_INFRACFG from bool to tristate to support building it as
a loadable kernel module (.ko) instead of being built into the kernel.
This is required for DDK (Driver Development Kit) module build, where
mtk-infracfg needs to be loaded dynamically along with other SoC
infrastructure modules.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..d28b0817ce51 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -38,7 +38,7 @@ config MTK_DVFSRC
 	  best achievable performance-per-watt.
 
 config MTK_INFRACFG
-	bool "MediaTek INFRACFG Support"
+	tristate "MediaTek INFRACFG Support"
 	select REGMAP
 	help
 	  Say yes here to add support for the MediaTek INFRACFG controller. The
-- 
2.45.2


