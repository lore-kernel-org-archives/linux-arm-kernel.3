Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F40C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYIiwWGIKoPuKSFob4g15bxKNl60UEjmO24khtCJJDk=; b=cSJMTGKRBzdK+y1SS7ClrdWQ76
	0wm+YJD39Wk9de6PPkZe+A6i5hOpidr3zA4OdnlufEFqbUNusi/Tgj6izDk+kcuPymSXWQ5zrPVvU
	lIQHwvvBHGIowz5yb3NWlxqr3gHRd83YfKG/Jyd4agzI3FptIec2hVK23qSOHJYI3WR2hpQMocnJ/
	fx4so//IhDxEh6D6blXTG4GjgjMX5TWKG78Cc8SPn5AKVUQRd+XZcrrHBeYEGh90y3sJmcBMCXRN6
	Vc6h9wACWItA6+xo8uSB42uItv5mX/QS6+YErWtWivsJdsJsf92HQq+0UeyU0jdVnRiWBkBdCUppp
	v1ayVoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQnM-00000003jVv-00Vm;
	Fri, 23 May 2025 11:42:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQhx-00000003ivF-0CVs;
	Fri, 23 May 2025 11:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tYIiwWGIKoPuKSFob4g15bxKNl60UEjmO24khtCJJDk=; b=RzjYoLyceoIteyWGSg+JURfmcj
	OHhmj8GBCSpCxSqfKBzroALm3P59iZn2uoBJXWOPX3A9CxW9vWBUZQOKhhOV4NPyEvvrrvLTY3amj
	S5jwKMKjpPNN+AwwA+kNPm2N3SUrgigadgdZ6sq4In1+ztBeVSOFWhYdIfVNnyxp0QM8uvOeycBbe
	oNCuuRV4DTSpAwro4edLtjTC5rFq8V1L11nk8bjoHHzkc0/z4h6htknDhxeGqhGCIIQs8Lye7lb0n
	PJjLd0ycsnUOgEzAQ8vrjp7cJ639j3dYDM16KQY/TYjTdfgLkSU4ErgIF/HZnpUJUA8TpAAaW7ALx
	64fRVb1A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIQhs-00000001IPb-1oqM;
	Fri, 23 May 2025 11:36:59 +0000
X-UUID: 38235ed437ca11f08d385d50fb11b32d-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tYIiwWGIKoPuKSFob4g15bxKNl60UEjmO24khtCJJDk=;
	b=aymo7bCQCXfMiJzaZbMrMoftOU10W9ETAUbRAW0iPqwRz7czD75BkIDRSMvQe+EI8AW8BmsTb4XLNuykHINppjG2rSpZJh74aq93uRf9f6m1h38j+Ddglf9rppIuw25Ge2k56tTE0J0FSxMqmAIaqhhPeI1tr8RFAFXSARvowB4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e526a5e5-ca1f-4f07-b98d-e130ba9efd24,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:075b0a59-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 38235ed437ca11f08d385d50fb11b32d-20250523
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 189676576; Fri, 23 May 2025 04:36:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 19:36:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 19:36:46 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Sky Huang <skylake.huang@mediatek.com>
Subject: [PATCH net-next 2/2] net: phy: mtk-ge-soc: Fix LED behavior if blinking is not set.
Date: Fri, 23 May 2025 19:36:01 +0800
Message-ID: <20250523113601.3627781-3-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
References: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_123657_020295_8BE854E5 
X-CRM114-Status: GOOD (  11.82  )
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

From: Sky Huang <skylake.huang@mediatek.com>

If delay_on==0 and delay_off==0 are passed to
mt798x_2p5ge_phy_led_blink_set() and mtk_phy_led_num_dly_cfg(),
blinking is actually not set. So don't clean "LED on" status under
this circumstance.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index cd0968478..15dcf2046 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1228,8 +1228,11 @@ static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
 	if (err)
 		return err;
 
-	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
-				     false);
+	if (blinking)
+		mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
+				      false);
+
+	return 0;
 }
 
 static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
-- 
2.45.2


