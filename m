Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93991CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoLhsaKF0XMnlzQT9UkysdX1D+uL4jIexeYAcszBsCk=; b=Bqy1+vNijIwJbCzHqI/sfR+Mno
	Ce7ElqX0Zyl6N0cRP3e5QBD2lI/bMdL0bVpwb1d4MlPfgnd4IhE/Juk6CKAjECqWJCBft6DczYO7j
	I0o2WwZOk2iYLOA4UVvYFKb+Vsl+gWsJM3ndwacxBlNp0hfr6fAGOAp85Ky/SqrM9WWiq5D8OwfuX
	hAiJ3AI2E7we/yAjN8MEt6mpQIVavKvEHlAaP5ZZZeHzMqHe2U0kwtfSCuCWM1y+oP0XUCf6EtpPg
	ApnuI+WUNeTeQYMl3vD8JJWA0vvRbKoxihcW7dz0pIMdM6+uVCyrSC86jQ9ZMJrcHvcCNDxmiSMNq
	HrQUCcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxky-0000000APVV-3VFZ;
	Fri, 26 Jun 2026 04:01:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxkp-0000000APHt-32Uf;
	Fri, 26 Jun 2026 04:01:25 +0000
X-UUID: aec1d768711311f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qoLhsaKF0XMnlzQT9UkysdX1D+uL4jIexeYAcszBsCk=;
	b=TYjmYrTpDs8Nh5H/Y5im7GNKjWngTfBry3mai29K7nO4+gWOR5OPNYRxHnN7uzK9VBaGQ4LwOUWVFPl7eCiMOg7L4AlPmm5zlcdbXye278000deY+QIPLpBiQ5y1YXMuF+XF6lBP4FeZcKu/2DRkjtkN/FRLcFYg/v/wpPw1NCk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:23a84540-7f94-4e04-880e-c14a088983cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:8d62ae57-8329-46f3-8be7-5acaf04e0995,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aec1d768711311f1acbe4559397dec65-20260625
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 681510861; Thu, 25 Jun 2026 21:01:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 00/32] pinctrl: mediatek: Enable module build support for all drivers
Date: Fri, 26 Jun 2026 12:00:29 +0800
Message-ID: <20260626040112.2436185-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_210123_772075_7A060388 
X-CRM114-Status: GOOD (  11.28  )
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

Sorry for the quick v4 - v3 was sent with an incomplete cover letter
(template placeholders) by mistake. This v4 also unifies MODULE_LICENSE
to consistently use "GPL v2" across all patches.

This series enables all MediaTek pinctrl drivers to be built as loadable
kernel modules. This is required for Android GKI (Generic Kernel Image) +
vendor_dlkm deployments where vendor-specific drivers must be kept separate
from the GKI vmlinux.

Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros where
missing, and changes the Kconfig option from bool to tristate. This allows
these drivers to be properly packaged as vendor kernel modules while
maintaining the existing built-in option.

Changes in v4:
  * Fix cover letter content (v3 accidentally sent with template placeholders)
  * Unify MODULE_LICENSE to use "GPL v2" consistently across all drivers
  * Update all commit messages to reflect "GPL v2" instead of "GPL"

Changes in v3:
  * Add MODULE_DESCRIPTION() for all drivers (even those that already had MODULE_LICENSE)
  * Update commit messages to reflect that we're adding MODULE_DESCRIPTION too

Changes in v2:
  * Squash MODULE_LICENSE and tristate changes into single patch per driver
  * Extend fix to all MediaTek pinctrl drivers (32 total), not just MT8189
  * Add Android GKI + vendor_dlkm context to cover letter
  * Add MODULE_DESCRIPTION() where it was missing
  * Add Fixes: tags referencing the original commits that added each driver

Justin Yeh (32):
  pinctrl: mediatek: mt8189: Enable module build support
  pinctrl: mediatek: mt6878: Enable module build support
  pinctrl: mediatek: mt6893: Enable module build support
  pinctrl: mediatek: mt7622: Enable module build support
  pinctrl: mediatek: mt7981: Enable module build support
  pinctrl: mediatek: mt7986: Enable module build support
  pinctrl: mediatek: mt7988: Enable module build support
  pinctrl: mediatek: mt8167: Enable module build support
  pinctrl: mediatek: mt8173: Enable module build support
  pinctrl: mediatek: mt8183: Enable module build support
  pinctrl: mediatek: mt8186: Enable module build support
  pinctrl: mediatek: mt8188: Enable module build support
  pinctrl: mediatek: mt8192: Enable module build support
  pinctrl: mediatek: mt8195: Enable module build support
  pinctrl: mediatek: mt8196: Enable module build support
  pinctrl: mediatek: mt8365: Enable module build support
  pinctrl: mediatek: mt8516: Enable module build support
  pinctrl: mediatek: mt2701: Enable module build support
  pinctrl: mediatek: mt7623: Enable module build support
  pinctrl: mediatek: mt7629: Enable module build support
  pinctrl: mediatek: mt8135: Enable module build support
  pinctrl: mediatek: mt8127: Enable module build support
  pinctrl: mediatek: mt7620: Enable module build support
  pinctrl: mediatek: mt7621: Enable module build support
  pinctrl: mediatek: mt76x8: Enable module build support
  pinctrl: mediatek: rt2880: Enable module build support
  pinctrl: mediatek: rt305x: Enable module build support
  pinctrl: mediatek: rt3883: Enable module build support
  pinctrl: mediatek: mt6397: Enable module build support
  pinctrl: mediatek: mt2712: Enable module build support
  pinctrl: mediatek: mt6795: Enable module build support
  pinctrl: mediatek: mt6797: Enable module build support

 drivers/pinctrl/mediatek/Kconfig          | 64 +++++++++++------------
 drivers/pinctrl/mediatek/pinctrl-mt2701.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt2712.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6795.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6797.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt6878.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7621.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7622.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7623.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7629.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7986.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt7988.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8183.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8186.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8188.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-mt8196.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-rt2880.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-rt305x.c |  3 ++
 drivers/pinctrl/mediatek/pinctrl-rt3883.c |  3 ++
 33 files changed, 114 insertions(+), 32 deletions(-)

-- 
2.45.2


