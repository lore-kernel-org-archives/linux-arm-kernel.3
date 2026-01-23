Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBBFD72376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8czuza3xmthp6U3hli5hlELh4H/otvtKA85I3qLvmlU=; b=xWlx2ISSAPvLMGNk+cBBKVEZLg
	AXhCzdI6JsnPqxXxCGtTzKi5l3x2ohZoAGeYW/0f2ADuyNq4IxCUTYHBhegLftswKtTwp10doCtjp
	qNPU6ktmUxRj2pt2o/l/4WIwgzkDI3g7c8gRNe2SUFbfNj1KLbSWlhxooyI81IBak948RtTjVqcHP
	Wqcc2pOpBQ2NIdGaduKOc1/wAIejw6+9wi1VTMGEKOW1mpo1ekwF0krW0da9S4iS+GfdYTH1lCNyV
	Hxo0WT3+tGFPf5I4gK3hgjY55BlZ/LDiJWroWLV62H4UNHJDyU1BVODoMdxRKIU0qODilb/+bvdh0
	nGsGTfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFAe-00000008p45-0yJ2;
	Fri, 23 Jan 2026 11:17:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFAR-00000008owI-2WJV;
	Fri, 23 Jan 2026 11:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769167047;
	bh=ENlMl1bSYsG6/Pc0nHKNqHh4izRF0rIkuDpxCOw7iCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KJmt4ZkfuZZ+ROiqdfXOXk0cxTl1nSDtbS8QuZGIwfeWQ5M8jaig8D0x6Zgh2C1rD
	 gMfhgQBHcHDTd+6R/GA3HatW92WUp21bkXXI2M2SRpo5FSn8x3IK5THdfONVUdM1ls
	 KA9eEOFuKgKhjYde9zTDdOncFEpkx/KswQlJm7vMkN0gJ7dr2ryK5NucHXWNWQh/4/
	 XuRYXP1QsawbCvUdvH9QwxnbaB/Q319jWNtHwqwI8ZGijbTWCoMxo6YUmtb+FcXMHR
	 y5ju6m+2s52BF7jqoF4QswuQdDAvJOdY3uqWtJuUXyFSthoh32IgGqAku1VvPtMOL/
	 qkkOIT88RNRxw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99C8B17E0CB0;
	Fri, 23 Jan 2026 12:17:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek driver updates for v6.20
Date: Fri, 23 Jan 2026 12:17:21 +0100
Message-ID: <20260123111724.28631-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
References: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_031731_821376_A42420D9 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ mtk-soc-for-v6.20

for you to fetch changes up to 22ce09ce1af574747fce072c3f62c29c440538d7:

  soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses (2026-01-19 12:57:46 +0100)

----------------------------------------------------------------
MediaTek soc driver updates

This adds:
 - A socinfo entry for the MT8371 Genio 520 SoC
 - Support for the Dynamic Voltage and Frequency Scaling
   Resource Controller (DVFSRC) version 4, found in the
   new MediaTek Kompanio Ultra (MT8196) SoC
 - Initial support for the CMDQ mailbox found in the MT8196.
 - A memory leak fix in the MediaTek SVS driver's debug ops.

----------------------------------------------------------------
AngeloGioacchino Del Regno (5):
      soc: mediatek: mtk-dvfsrc: Change error check for DVFSRCv4 START cmd
      soc: mediatek: mtk-dvfsrc: Add and propagate DVFSRC bandwidth type
      soc: mediatek: mtk-dvfsrc: Add a new callback for calc_dram_bw
      soc: mediatek: mtk-dvfsrc: Write bandwidth to EMI DDR if present
      soc: mediatek: mtk-dvfsrc: Add support for DVFSRCv4 and MT8196

Jason-JH Lin (8):
      mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
      mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      mailbox: mtk-cmdq: Add driver data to support for MT8196
      soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
      soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
      soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without subsys ID
      soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses

Louis-Alexis Eyraud (1):
      soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA Genio 520

Nicolas Frattaroli (3):
      dt-bindings: soc: mediatek: dvfsrc: Document clock
      soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC clock
      soc: mediatek: mtk-dvfsrc: Rework bandwidth calculations

Zilin Guan (1):
      soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()

 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml |   6 ++
 drivers/mailbox/mtk-cmdq-mailbox.c                                         |  74 +++++++++++++-
 drivers/soc/mediatek/mtk-cmdq-helper.c                                     |  77 +++++++++++++-
 drivers/soc/mediatek/mtk-dvfsrc.c                                          | 364 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 drivers/soc/mediatek/mtk-socinfo.c                                         |   1 +
 drivers/soc/mediatek/mtk-svs.c                                             |   5 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h                                   |  19 ++++
 include/linux/soc/mediatek/mtk-cmdq.h                                      |  93 +++++++++++++++++
 8 files changed, 598 insertions(+), 41 deletions(-)


