Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF0ECDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMCUbddzgSQ+r/gXtbgiONL0V77+msO4IvvUIthlLvw=; b=aJx0cQteYQniibNi9yXBCki8qA
	fHMdEJ6FskH/lOQ9dCqYwd05KYNJ4OakFkNzNO42Hcgx+UJdtcZQlqpSnersTYZ7IBy2UiqgLWjSQ
	rkT7D6V70C+LRAQxeNfBZhBEUf7HaSe6SEhJrZzs6uFWxpdi8QwXNsbHzv64F4ul8yDCtxkQHay7W
	IC0hsfARvF99ngZCad6bx6Svpho54LW/NJcqmvVEH8frTAReokZYDEcN619sOarCTvAtkMD5ftD+A
	JeewH+oBBNCW8DbcmGtcFUJm6xMsr3Z66doVxEQpNxL+Iz+MQf+u7g/lHVJ0IpW7FXmS/DWb8rOr8
	3dshpvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvck-0000000AA14-3UgY;
	Fri, 26 Jun 2026 01:44:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvci-0000000A9z8-1yDX;
	Fri, 26 Jun 2026 01:44:53 +0000
X-UUID: 9e07aeb0710011f1afed4741b24580c9-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nMCUbddzgSQ+r/gXtbgiONL0V77+msO4IvvUIthlLvw=;
	b=Aw99rVgy5el2wPNnMo05zRWUr38I3nJiVIOHMxTgvkmWP1FS/9SCBmX3dCm46BD+Kui9RPnsJwcM5x4WZDbcUuxpZr3B+xSh1pgtEZ6RVNDuH6mWmLxSGcxN14p8XgMH7fEiVfyfJhiKO/CfHvcws2dZjamO38iFTXMUZa7sS6g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:5f42391d-0a59-4743-81ae-3e4ac10c62cb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:b5e6a8a3-9384-4ef7-91b2-7b787d9b8841,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9e07aeb0710011f1afed4741b24580c9-20260625
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1466070297; Thu, 25 Jun 2026 18:44:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:46 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 03/32] pinctrl: mediatek: mt6893: Enable module build support
Date: Fri, 26 Jun 2026 09:44:02 +0800
Message-ID: <20260626014442.2378513-4-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_184452_518099_D65427F9 
X-CRM114-Status: GOOD (  11.62  )
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

Fixes: 8004507179c8 ("pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200")

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6893.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 5985fa69a278..dd189dd5f955 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -177,7 +177,7 @@ config PINCTRL_MT6878
 	  on the MediaTek MT6878 SoC.
 
 config PINCTRL_MT6893
-	bool "MediaTek Dimensity MT6893 pin control"
+	tristate "MediaTek Dimensity MT6893 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6893.c b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
index 468ce0109b07..80fc4e933c5a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6893.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
@@ -877,3 +877,4 @@ static int __init mt6893_pinctrl_init(void)
 arch_initcall(mt6893_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT6893 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


