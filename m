Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD0AD172CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QiUAvSJJw6dro6/o+A9Z+bQes8F+Viy8+ik7qmJJS6E=; b=a5RwVUF711Y8oPSfXboiAQ7b1m
	T1JhaOuIM4xM34vYI7PMBC4I4L9s6ndVm4tmiLmyfIyQf5ZUdH9+oz5SbN/ucmiB71D/lso4dXmxQ
	6kdDn72L6W90pYUDixL6djan9o5jh7w/mCZVGVo+RuMEIQcxM4dW62Shv/ohann4ifgnb/9LJcJ17
	psNqWuLprPnpc7PPtsEBKis5tWz+0tThhhlo6sjtcmHR6l6Oz7WBNJ4+pWHjjrGwpYASeQUv6POk5
	Locv0puSkznjTup5Oba03K/gRJ2JtIYYFixDVWV9UIaI4q7UJB+HOm23zgVIb8puIf+aUSSA6niin
	+tCdTXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQh-00000004Vpc-2Zjy;
	Mon, 02 Feb 2026 06:28:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQb-00000004Vh5-1zgW;
	Mon, 02 Feb 2026 06:28:56 +0000
X-UUID: 6d28e686000011f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QiUAvSJJw6dro6/o+A9Z+bQes8F+Viy8+ik7qmJJS6E=;
	b=F/uttqOAi2xVb/ffAlLHqkyEWklAABUktNBGlSkvuj1gcjR7jXvGeW1Z8D8SV/WqmqvuNB/cDgPE3Z3ceat5mk1CfgrLhgm+bi/JveK/3VxFYXfhhcKOR4ggo+oL2TixFZbf1STKo5PUUVXvs5kDQXBbYOqdclOlJgEo9ox4LFs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c1c91269-c90d-4d48-9d1f-64b925a6bf56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:35c838f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6d28e686000011f1ad39f32c34db0b1c-20260201
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1701776474; Sun, 01 Feb 2026 23:28:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:28:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:28:42 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH v5 00/18] Add support for MT8189 clock controller
Date: Mon, 2 Feb 2026 14:28:07 +0800
Message-ID: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222853_635985_D3161E6E 
X-CRM114-Status: GOOD (  14.90  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Changes since v5:
- Remove redundant 'binding', 'definition' in commit message.
- Remove MT8189 dt-schema, merged into common (apmixed, topckgen, syscon ...).
- Separates power domain patches to another series.

Changes since v4:
- Fix dt_binding_check warning.
- Check prepare_enable before set_parent to ensure our reference clock is ready.
- Enable fhctl in apmixed driver.
- Refine clock drivers: 
  - Change subsys name, regs base/size (clock related part, instead of whole subsys).
  - Simply code with GATE_MTK macro.
  - Add MODULE_DEVICE_TABLE, MODULE_DESCRIPTION
  - Register remove callback mtk_clk_simple_remove.
  - Remove most of CLK_OPS_PARENT_ENABLE and CLK_IGNORE_UNUSED which may block bringup,
      but some subsys will power off before we disable unused clocks, so still need here.  

changes since v3:
- Add power-controller dt-schema to mediatek,power-controller.yaml.
- Separates clock commit to small parts (by sub-system).
- Change to mtk-pm-domains for new MTK pm framework.

changes since v2:
- Fix dt-schema checking fails
- Merge dt-binding files and dt-schema files into one patch.
- Add vendor information to dt-binding file name.
- Remove NR define in dt-binding header.
- Add struct member description.

  This series add support for the clock controllers
of MediaTek's new SoC, MT8189. With these changes,
other modules can easily manage clock resources
using standard Linux APIs, such as the Common Clock Framework (CCF).

Irving-CH Lin (18):
  dt-bindings: clock: Add MediaTek MT8189 clock
  clk: mediatek: clk-mux: Make sure bypass clk enabled while setting MFG
    rate
  clk: mediatek: Add MT8189 apmixedsys clock support
  clk: mediatek: Add MT8189 topckgen clock support
  clk: mediatek: Add MT8189 vlpckgen clock support
  clk: mediatek: Add MT8189 vlpcfg clock support
  clk: mediatek: Add MT8189 bus clock support
  clk: mediatek: Add MT8189 cam clock support
  clk: mediatek: Add MT8189 dbgao clock support
  clk: mediatek: Add MT8189 dvfsrc clock support
  clk: mediatek: Add MT8189 i2c clock support
  clk: mediatek: Add MT8189 img clock support
  clk: mediatek: Add MT8189 mdp clock support
  clk: mediatek: Add MT8189 mfg clock support
  clk: mediatek: Add MT8189 dispsys clock support
  clk: mediatek: Add MT8189 scp clock support
  clk: mediatek: Add MT8189 ufs clock support
  clk: mediatek: Add MT8189 vcodec clock support

 .../bindings/clock/mediatek,apmixedsys.yaml   |    1 +
 .../bindings/clock/mediatek,infracfg.yaml     |    1 +
 .../bindings/clock/mediatek,pericfg.yaml      |    1 +
 .../bindings/clock/mediatek,syscon.yaml       |   27 +
 .../bindings/clock/mediatek,topckgen.yaml     |    2 +
 drivers/clk/mediatek/Kconfig                  |  146 +++
 drivers/clk/mediatek/Makefile                 |   14 +
 drivers/clk/mediatek/clk-mt8189-apmixedsys.c  |  192 ++++
 drivers/clk/mediatek/clk-mt8189-bus.c         |  196 ++++
 drivers/clk/mediatek/clk-mt8189-cam.c         |  108 ++
 drivers/clk/mediatek/clk-mt8189-dbgao.c       |   94 ++
 drivers/clk/mediatek/clk-mt8189-dispsys.c     |  172 +++
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c      |   54 +
 drivers/clk/mediatek/clk-mt8189-iic.c         |  118 ++
 drivers/clk/mediatek/clk-mt8189-img.c         |  107 ++
 drivers/clk/mediatek/clk-mt8189-mdpsys.c      |   91 ++
 drivers/clk/mediatek/clk-mt8189-mfg.c         |   53 +
 drivers/clk/mediatek/clk-mt8189-scp.c         |   73 ++
 drivers/clk/mediatek/clk-mt8189-topckgen.c    | 1020 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8189-ufs.c         |   89 ++
 drivers/clk/mediatek/clk-mt8189-vcodec.c      |   93 ++
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c      |  111 ++
 drivers/clk/mediatek/clk-mt8189-vlpckgen.c    |  280 +++++
 drivers/clk/mediatek/clk-mux.c                |    9 +-
 .../dt-bindings/clock/mediatek,mt8189-clk.h   |  580 ++++++++++
 25 files changed, 3630 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-bus.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dbgao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dispsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dvfsrc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-iic.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mdpsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-scp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-ufs.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vcodec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpcfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8189-clk.h

-- 
2.45.2


