Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C37C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kx92eSz8R01PdV73y/bFunJL9N4KLtytD6payHfgzoQ=; b=hUxQjm2a1bCxMXfvylvIetR6RO
	K0hmvEYdpiWBQ6Xj+WWrQhYRqqGjjsy5vVi/8XusjTB8z52qZfUTpvWEX3iiaLFPI9bIZRrz6yi9m
	Pu70z/WjUtCwWTIDS37EVBIqoVTHD2e4Jgvp34VfDxxZ/CQ2ntGuvRFKfxD69aowC5r8Fl8mHDRrj
	KKUMK2Zujpt0+gvCV9IuO0Z5b4wQaGTC76ptlQeqNOiy9I3Uw5ZooXDxbElnh8jmzegU/LgXKbkeL
	GR0moBNPtej5LvgMYYstfMfcvDSnYC9AYfFvIvdRxxziG6MeCKWwhEEIsJo57sRu7/zgx4jLiSC3z
	yMmkN7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLk-00000001BQO-0nWd;
	Thu, 09 Jul 2026 06:35:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLh-00000001BO8-0VxW;
	Thu, 09 Jul 2026 06:35:07 +0000
X-UUID: 4f1258a47b6011f1acbe4559397dec65-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kx92eSz8R01PdV73y/bFunJL9N4KLtytD6payHfgzoQ=;
	b=uIUMQUWWN52ke61wtrOofHqgMy2oDaJP+wSBG/itsxvh3O+1tXH/A6IXWwMcynC/cyMA9pEvwM/7dfCPUOgp+sN2ed9kSQxJIAiD0tAKjE7luvVsk/vVkF54srJEFm7MBpPqER2j+qnzZLkqtVNeAnCq47K68NfTosfTeBD+pSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:4ca90390-a096-4ddf-bbd4-79d2ad4d5965,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:c822a303-430e-43d5-9a6c-19a994ddbd60,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4f1258a47b6011f1acbe4559397dec65-20260708
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1526666542; Wed, 08 Jul 2026 23:34:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 14:34:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 14:34:57 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v5 0/4] pinctrl: mediatek: Enable module build support
Date: Thu, 9 Jul 2026 14:33:45 +0800
Message-ID: <20260709063450.1615041-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_233505_179781_B0ABBD43 
X-CRM114-Status: GOOD (  19.92  )
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

This series lets the MediaTek pinctrl drivers be built as loadable
kernel modules. This is required for Android GKI + vendor_dlkm
deployments, where vendor-specific drivers must be kept separate from
the GKI vmlinux and loaded as modules from the vendor partition.

Enabling the individual SoC drivers as modules is a single logical step,
but it has a few prerequisites, so the series is:

  1. Fix a pre-existing GPIO chip lifecycle bug. The gpio_chip lives in
     device-managed memory but is registered with the non-managed
     gpiochip_add_data(). While the drivers were built-in only this was
     harmless, but once they can be unbound/rmmod'd, devm frees the
     backing memory while the chip is still registered (use-after-free).
     Switch to devm_gpiochip_add_data() in the shared probe/init paths.
     This affects the v1 common code (pinctrl-mtk-common.c) as well as
     the moore and paris common code, which is where the v2 SoCs
     register their gpio_chip (pinctrl-mtk-common-v2.c itself does not
     register one, so it is untouched).

  2. Make the shared common code modular. The SoC drivers link against
     pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c,
     whose Kconfig symbols were bool and which exported nothing. Without
     this, selecting a SoC driver as =m forces the common symbol to =y
     and the module fails to link against the unexported entry points
     (e.g. allmodconfig would break). Convert PINCTRL_MTK,
     PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to tristate, export the
     entry points, and add MODULE_LICENSE()/MODULE_DESCRIPTION(). The
     already-modular v2 common code additionally needs mtk_rmw()
     exported, since it is called directly by SoC drivers such as
     mt7623 and would otherwise be undefined once those are modular.

  3. Convert the MT7986 driver to a single initcall. It registers two
     platform drivers (mt7986a/mt7986b) and used to call arch_initcall()
     twice. That is fine when built-in, but a module has only one
     module_init(), so two arch_initcall()s break the module build with
     a redefinition of init_module()/__inittest(). Fold both drivers
     into one platform_register_drivers() call from a single initcall.
     No functional change when built-in.

  4. Flip every SoC driver's Kconfig from bool to tristate and add the
     module metadata.

The series builds cleanly under allmodconfig on arm64 (all SoC drivers
as =m).

Changes since v4:
 - Squashed the 32 per-driver "Enable module build support" patches into
   a single patch (4/4), as requested by Linus Walleij.
 - Added patch 1/4 fixing the gpio_chip lifecycle (devm) bug, as a
   prerequisite for making the drivers unloadable, per Linus Walleij's
   review.
 - Added patch 2/4 converting the shared common drivers to modules, so
   that the v1/moore/mtmips SoC drivers can actually link as modules
   (without it 21 of the SoC drivers would fail to build as =m). Also
   export mtk_rmw() from the v2 common code (fixes a modpost
   "mtk_rmw undefined" error on the mt7623 module).
 - Added patch 3/4 folding MT7986's two arch_initcall()s into a single
   initcall (fixes an init_module()/__inittest() redefinition when the
   driver is built as a module).
 - Dropped the (inappropriate) per-driver Fixes: tags from the module
   enablement patch; it is a feature change, not a fix.

The Reviewed-by on patch 4/4 is carried over from the per-driver patches
reviewed in v4; the reviewer agreed to preserve it across the squash.
Note that the MT7986 single-initcall change that was part of that patch
has been split out into patch 3/4, so patch 4/4 now only flips Kconfig
and adds module metadata. Patches 1/4, 2/4 and 3/4 have not been
reviewed yet.

Justin Yeh (4):
  pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
  pinctrl: mediatek: allow common drivers to be built as modules
  pinctrl: mediatek: mt7986: register both platform drivers from a
    single initcall
  pinctrl: mediatek: enable module build support for all SoC drivers

 drivers/pinctrl/mediatek/Kconfig              | 70 +++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 11 +--
 drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6795.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6797.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7621.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7623.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7629.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 18 ++---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  1 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  3 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 22 +++---
 drivers/pinctrl/mediatek/pinctrl-mtmips.c     |  4 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-rt305x.c     |  3 +
 drivers/pinctrl/mediatek/pinctrl-rt3883.c     |  3 +
 38 files changed, 149 insertions(+), 58 deletions(-)


base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
-- 
2.45.2


