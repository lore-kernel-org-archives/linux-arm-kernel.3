Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F15C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qw3W+KwFYdfCK9rOm2VvyF6S/Jc4aivlCkeIo46AHDg=; b=aEoaJ6IFGCfpjYAQHQs1jB7TUf
	Fxuj5hZoqba4w8uEH7ccSBel+E3rLjE5FQizvSypK6a2q7b+QoVYYUmGR7E4hzdmVXy41YjaHJCNR
	K7c743qpk85XNU/SJcBwCJF7roFPx3qmrVtw4kW7BGnMK5ACTBsDVGXTMWobvJ+WOmme/Ms+IgKt9
	wELzokwLvEZgPWeVvm0dL+tsKbVTzkSebCrlcvYSoI7YW2r8Y2letJjAa74Z75CSUXv8hmsUkIEym
	skjI4VD/0mcaQf+rlRjz1XjH/2v36xSvrzWsa/vPj/EXWbW7ShSYi9hPkVI+rdFyVZUjb/shVri4u
	6asJ6JzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20p3-0000000GTPo-1vdI;
	Thu, 03 Sep 2026 06:21:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20p0-0000000GTNu-3exS;
	Thu, 03 Sep 2026 06:21:16 +0000
X-UUID: a5e81e36a75f11f1afed4741b24580c9-20260902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qw3W+KwFYdfCK9rOm2VvyF6S/Jc4aivlCkeIo46AHDg=;
	b=bKRxhGa7hvi7D+4wta55OEb9Ls8iZ/GO1+eXdtE4NZwK0rKDJ8z4pUCq9oFFXCctAAT9t1Jg8tjMERtU6DG+mTOYGFbL3YAbKUN8MLNyossc3CsqUHvSg80FVq37rQSkToabAV/VUOUxkKi55CygnvYNu9Q17LgNy+Z5jFV1pzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a6135f0c-5451-4cdb-bd89-d1530968e761,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ce6e6cf2-6b5d-4016-ba8d-9f799a78b7e4,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a5e81e36a75f11f1afed4741b24580c9-20260902
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1799789669; Wed, 02 Sep 2026 23:21:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:04 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Date: Thu, 3 Sep 2026 14:20:45 +0800
Message-ID: <20260903062056.1024263-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_232114_941219_5B762E20 
X-CRM114-Status: GOOD (  10.96  )
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

MTK_REGULATOR_COUPLER can currently only be built into the kernel: it is
a bool, and its prompt is hidden unless COMPILE_TEST is set, so on real
MediaTek configurations the symbol has no prompt and is forced to its
"default ARCH_MEDIATEK" value.

Kernels that ship nearly everything as a module (Android GKI style
kernels, but distro kernels have the same shape) cannot use it that way.
Two things are in the way:

  - the four helpers the coupler calls are declared in
    include/linux/regulator/coupler.h for coupler implementations to
    use, but none of them is exported (patch 1);

  - the Kconfig symbol is a bool without a usable prompt (patch 2).

With both patches applied, CONFIG_MTK_REGULATOR_COUPLER=m builds and
mtk_regulator_coupler.ko loads and registers the coupler. Existing
configurations are unaffected: "default ARCH_MEDIATEK" is kept, so they
keep building the coupler in.

Justin Yeh (2):
  regulator: core: Export helpers used by regulator couplers
  soc: mediatek: mtk-regulator-coupler: Allow building as a module

 drivers/regulator/core.c     | 4 ++++
 drivers/soc/mediatek/Kconfig | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.45.2


