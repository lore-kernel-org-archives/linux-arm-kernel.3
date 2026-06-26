Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9351CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2yaqWJSUamMur9Iw1LMAQS7biN7NFXBQBZwgm0O59g=; b=osp9J8pcdgzskwn2B0gy9NV7Ts
	cAsqWtlXCwFGclVigh234fjnvfzXzXIbdrd7s5hojFAVRBsUP95DcmISNDoAe7iBCUKlbLhRa+3sK
	w8Qhb6dP6M09NX3E/Nl0KRLH5JHntsda7UjZjFmlhj+GurO6mzV6OXpmJBJzgcTrSmzU8f/KR6h0b
	EO///LEjh5s6XHx7Xg6DUT8Vllorvwv7Mfm4ipHFfB6xSwOntasXfx38aXs6825xVWtcrS8iAfY7c
	VgIsdxmTMjPd+Cnf2hDm0uDpjJ0G/T9Acoid4l2vfC7WSkerK7Grpa1pTKM/HO+G4NQQY2CyWgGp3
	d1pW6xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvRI-0000000A67I-1T16;
	Fri, 26 Jun 2026 01:33:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvR4-0000000A5g6-4730;
	Fri, 26 Jun 2026 01:32:52 +0000
X-UUID: ed09f9d470fe11f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w2yaqWJSUamMur9Iw1LMAQS7biN7NFXBQBZwgm0O59g=;
	b=D2D7Til8ZLlKimcLWN9qqCvrqolDWzvy2qiCa1AjiGxfw0cPK7IcG2n29jl2ugb8Fv5hBQ5rtBvSEgzNp/oljwmVYHuI9PUGijY7tlFxClWyvdsIq9b7V9BPHx6f5VBIWHgeXjpBuczKmZKjjionjGRXbhvckVQV5fPqQPDcvxM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:71d242a0-9a18-4e9e-9ff2-f4711bf64355,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:bf7cdcfc-4e5b-4880-a751-e09c9abb260d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed09f9d470fe11f1acbe4559397dec65-20260625
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 370560179; Thu, 25 Jun 2026 18:32:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:32:39 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v2 06/32] pinctrl: mediatek: mt7986: Enable module build support
Date: Fri, 26 Jun 2026 09:31:32 +0800
Message-ID: <20260626013217.2373808-7-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626013217.2373808-1-justin.yeh@mediatek.com>
References: <20260626013217.2373808-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_183251_036379_D9393885 
X-CRM114-Status: GOOD (  11.85  )
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

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: 360de6728064 ("pinctrl: mediatek: add support for MT7986 SoC")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index a2bc1bfb1035..f0bc125cfb2a 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -216,7 +216,7 @@ config PINCTRL_MT7981
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7986
-	bool "MediaTek MT7986 pin control"
+	tristate "MediaTek MT7986 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5dda4b7467fd..1ed2528cd51f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -1009,3 +1009,6 @@ static int __init mt7986b_pinctrl_init(void)
 
 arch_initcall(mt7986a_pinctrl_init);
 arch_initcall(mt7986b_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT7986 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


