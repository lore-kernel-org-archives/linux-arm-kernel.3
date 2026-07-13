Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79593C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/oALa+s42LWwLDIJ0bjpmdNshONmC9kcc4OdaS5OFYs=; b=uFjkoAWefz8VpcLMBNAsaTmEfq
	YTgnmMh8QD+4vb4pvdBwug9/YwwWjMK4V++ivbuz2n1eB2MoZeKpFgE4OKOWw0NWcKucA4wzTF1EY
	CMXF5Y4rbTgLQBfSO2bXX0Ibm6egqWoFdDsm12DblVQgkhwSu0w/Mm/yBtg7cE35bRjlBm3Ohy6tq
	w5+QQ0BN+666X52T/CgVANfwv++xJTocVpUp84Gpzaj4KaongsDg+/fOhCHwgrIkSViRGANgceVbW
	nQdbmfZb9B3e0F8cwkQg++ci6BGRu3VIcl1wtLdlU6m9+PY0U0b0QkffCk9dKDEBdueVUTUdfIxvx
	pfo8pLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHdi-00000009adJ-0aEU;
	Mon, 13 Jul 2026 14:28:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHda-00000009aUd-1ogt;
	Mon, 13 Jul 2026 14:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/oALa+s42LWwLDIJ0bjpmdNshONmC9kcc4OdaS5OFYs=; b=aoi3k8b2qWfgGx6ik3uj5zkv4O
	5pbMCl+DaxuqpknKlEgQ8Uo5FJ3s29qt8qr3VyJ7ZhxBbvJ4D3cikojw9oB6fEQgCtdm29uIp9T/c
	xlZ92ie1fl+S3QmFndbwtH45jvyRw340FAsmVyFS5kebiGeqot3rfkPdVK1ur9n1mfc7Ek/t52TIi
	H4DGb/8rrP/O+qoMGYtj4Rmu8GpUpzI79VEuZBFvC0FMzEEwioe0e6clWljDaMRE02qOYraiKs7Bt
	dtCrV870CShlTI0Qr4vXsUgMqhkUj765DwiPVHd5B5n/gRkHVriIP5Op7qH8w5IAbbwIWEkO7HDht
	iAyR5Ybg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHdW-0000000BiB6-1aL4;
	Mon, 13 Jul 2026 14:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783952872;
	bh=Npx/orxONC+U2Qw/Hg1SfG0cpM+DWzLfcxEEfKhRItg=;
	h=From:To:Cc:Subject:Date:From;
	b=P4Z0zQDwSXxmOZsF+TNClXAbZ0zdXsLSsdMGMf/PkCt/szRXD303nMZ7xJGH7KHJi
	 6yRyHTH0FuU28D+GSP6DtQXpICYcxhpsAkSru4DWkx+MUetfi0IkJFNB/f1zNWd0jF
	 EEcNDGT+6us8jOdSJG8LlESPQdLcyfHveLfUjn6auTfscebtcEwIItSpxdLqAvSwE/
	 g95TrxpAYVd/30dIvg/cibHDgf8maMeP2nW5IhpuAs8eK/ghuJcOKmE9Keq0K2EBQl
	 pMbUyWR/CDa8XT2ZFfATKU68ZV4oCpjlxCp9mDvass8ljwpy7bz8FBbaASvddpGlZx
	 A+FIdRQdmqzXg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E03E217E0720;
	Mon, 13 Jul 2026 16:27:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v4 00/10] drm/mediatek: Add DSC, WDMA, MT8189/96 DSI support
Date: Mon, 13 Jul 2026 16:27:36 +0200
Message-ID: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_152758_593628_D241E0C6 
X-CRM114-Status: GOOD (  15.47  )
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

Changes in v4:
 - WDMA: Delete the .remove() callback from WDMA as not needed anymore
 - WDMA: Add comments explaining no bus errors will happen if writing
   to INT_ENABLE, INT_STATUS registers while unpowered or unclocked
 - Return error in mtk_wdma_wb_atomic_check() error conditions, oops!
 - DSC: Fix dsc_pad_num calculation (missing parenthesis...)
 - DSI: Change dsc slice check error to dev_dbg instead to avoid spam
 - DSI: Correctly cleanup dsi->dsc upon component_add failure
 - DSI: Make sure the CKTX_CKL_WC register is correctly programmed in
   DSI w/DSC case

Changes in v3:
 - Changed mtk_dsi DSC implementation to use a different DSI_PS
   setting function for compressed or uncompressed, as the dsc one
   is way simpler than the regular one and becomes way shorter
 - DSC: Fixed missing PPS 19 register write
 - DSI: Anticipated call to devm_pm_runtime_enable() to before
   registering the DSI Host interface
 - DSI: Anticipated installing IRQ handler before registering the
   dsi host interface, which wasn't a problem before, but now it
   would be one because the interrupt is being enabled when binding!
 - DSI: Fixed some possible calculation overflows that may happen in
   MT8189 and MT8196 because of the higher supported resolutions
 - WDMA: Use devm variant of pm_runtime_enable()
 - Change WDMA interrupt handler to allow signaling WB complete even
   if there is no specific vblank callback installed to avoid very
   long timeouts (in any case, WB is complete for real even if there
   is no vblank_cb, just a bit useless without, but still complete)
 - Fixed WDMA register writes as register id was in function signature
   for mtk_wdma_ddp_write_dst_addr() but the function itself never
   used it in DISP_REG_WDMA_DST_ADDRX() macro

Changes in v2:
 - Rebased on next-20260706

This series adds support for:
 - Display Stream Compression (DSC) for DSI and DisplayPort for both
   legacy (8188/92/95 and others) and for Kompanio Ultra MT8196 SoCs
 - Write DMA (WDMA) Engine (for legacy only at this time) as a step
   to enable Writeback support (coming later with a restructuring of
   the entire mediatek-drm driver)
 - Newer MIPI DSI IP revisions, found in MT8189 and MT8196 SoCs

AngeloGioacchino Del Regno (10):
  dt-bindings: display: mediatek: dsc: Add MT8196 compatible
  drm/mediatek: Implement Display Stream Compression support
  dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
  drm/mediatek: mtk_dsi: Enable interrupt at component bind time
  drm/mediatek: mtk_dsi: Transfer register offsets to per-SoC const
  drm/mediatek: mtk_dsi: Add support for MT8189
  drm/mediatek: mtk_dsi: Add support for MT8196
  drm/mediatek: mtk_dsi: Enable PM Runtime on probe
  dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
  drm/mediatek: Add Write DMA (WDMA) Engine for Writeback support

 .../display/mediatek/mediatek,dsc.yaml        |   4 +-
 .../display/mediatek/mediatek,dsi.yaml        |   2 +
 .../display/mediatek/mediatek,wdma.yaml       |   5 +
 drivers/gpu/drm/mediatek/Makefile             |   2 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  21 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  64 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 455 ++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_wdma.c      | 622 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   8 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 799 ++++++++++++++----
 13 files changed, 1832 insertions(+), 190 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_wdma.c

-- 
2.54.0


