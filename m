Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AE6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J8gnlV72WZgKZtB2F8l1wKF5O8kipZ2VREg53WszLKc=; b=BPXNT6avJC92c0Vd/54kUU5+AY
	+vqfBjNNm2EszjLcm/PZ6VzhQd3MKV7JFCkawJ/3TMZr3rUNJhrKEHJyBiLiQHJSCOuS5fSssL/X/
	sq8LZY1H6Ug3nXNvFI+01/SnmoKTqXF+QmiFE7Ie9GO1oOlaK81tBb0UtEXKkwoRyIAl6ioZvvTkY
	Pqv3+qzYhsQHNa/QoO4ncd2nCKLzVUsCtJKpchE6GUCk4i2Oix2WavSkPBCdNbBrxIGfnVXW06BVQ
	k+elGOZ3Yc9ck565cOk25H7S8WDKwPRmzQArYwbyVTbHTrMzr6CDRWWG7ylipAH+kZ/Ztp3U8XBhk
	N6WxbdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQ3-0000000G0H0-1MH6;
	Wed, 27 Aug 2025 15:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEVy-0000000FJ3J-3kBn;
	Wed, 27 Aug 2025 11:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=J8gnlV72WZgKZtB2F8l1wKF5O8kipZ2VREg53WszLKc=; b=XmIyVVjruBflhhKdbHtt/e0LRJ
	87KC1DaL1QL6LnGlSueXn4Kyj35mPv+AgfIzO48URMuA9dTflv+hVETj5jRX7ThPv62mOuuc8wClZ
	4+zbadP/gVRWRsh2fiwIpeY7T1GXHMJgJe6f13krCnssFTN9J5ZO2mXR2IaNr7aCZrBufyA/S5NMM
	DA4elqWcBxrovfkwJwoH4jtzFItsEBuxXVlL2QXJdJ1K/rWDlPIPuPRMA/14+yiPOuWoC80PSlZOX
	X0p+LhBUFA9tTkiP+Oh5ujYyG2ylEayfudy/hyLWP6Q0mZ8sMvVhFIq38KeWBUhkOC8ck8lDWhrJ3
	XH9u57Ww==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEVv-00000002Qe7-0keS;
	Wed, 27 Aug 2025 11:40:29 +0000
X-UUID: 973e9116833a11f09eb0dd999d3936bf-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=J8gnlV72WZgKZtB2F8l1wKF5O8kipZ2VREg53WszLKc=;
	b=WYzz/VNkYHchOMW80pcuv9pNkdYTo716dEITFN2uC2B604ZJny5I8Qnfx/9k/TIh9cEjgUtb8cDZHF2Y2wxEw81gIDLanc6QPUV2X8aIOxdrgmjYolcbD386hnmoMctuoyem3YTkewY0hxHmoe9jtNEr3e+rCSnPfw5YVL6cYnw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:22596506-82af-4c9a-8015-a5d291ecaca2,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:f1326cf,CLOUDID:1f2fab6d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:2,IP:n
	il,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 973e9116833a11f09eb0dd999d3936bf-20250827
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 901802728; Wed, 27 Aug 2025 04:40:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:07 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v7 00/20] Add GCE support for MT8196
Date: Wed, 27 Aug 2025 19:37:32 +0800
Message-ID: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_124027_577245_235C2CFD 
X-CRM114-Status: GOOD (  19.23  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and iommus property, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ APIs to support non-subsys ID
hardware.

---

Change in v7:
1. Rename cmdq_reg_shift_addr() and cmdq_reg_revert_addr() to 
   cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
2. Change cmdq_vm_toggle to cmdq_vm_init().

Change in v6:
1. Move the removal patches to the end of series.
2. Fix build error for cmdq_pkt_jump_rel_temp patch.

Change in RESEND v5:
1. Separate the removal of cmdq_get_shift_pa() from [PATCH v5 03/19] to a
   single patch [PATCH RESEND v5 10/20].

Change in v5:
1. Rebase on tag: next-20250424 + patch [1].
2. Split adding driver data for MT8196 patch to 3 independent patch
   and add more detail commit message to each patch.
3. Refine passing shift_pa as the parameter in API to storing it into
   the cmdq_pkt.
4. Refine DMA address potential issue in cmdq mailbox driver.
5. Change the mminfra_offset related mbox API to passing it by cmdq_pkt.
6. Add new cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() APIs to
   replace the cmdq_pkt_write().

[1] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
- https://patchwork.kernel.org/project/linux-mediatek/patch/20250421035650.441383-1-jason-jh.lin@mediatek.com/

Change in v4:
1. Remove dt-binding header and add a gce header in dts folder.
2. Remove dot in sign-off name.
3. Change addr type from u32 to dma_addr_t for cmdq_reg_shift_addr() and
   cmdq_reg_revert_addr().

Change in v3:
1. Merge 2 dt-bindings pathes together and add more detail commit message.
2. Change type u32 to phys_addr_t for pa_base of struct cmdq_client_reg.
3. Remove cmdq_subsys_is_valid() and subsys_num in CMDQ driver.
4. Add CMDQ_SUBSYS_INVALID to check subsys instead of using
   cmdq_subsys_is_invalid().
5. Make use of CMDQ_THR_SPR0 define to the parameter of CMDQ APIs.
6. Rebase on the new MACRO in mtk-mdp3-comp.h.

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH Lin (20):
  arm64: dts: mediatek: Add GCE header for MT8196
  mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
  mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating
    instruction
  soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
    shift_pa
  mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
  mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM
    transaction
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without
    subsys ID support
  soc: mediatek: mtk-cmdq: Add new APIs to replace cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM
    addresses
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: platform: mtk-mdp3: Add programming flow for unsupported subsys
    ID hardware
  media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove shift_pa parameter from
    cmdq_pkt_jump()
  media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

 arch/arm64/boot/dts/mediatek/mt8196-gce.h     | 612 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  24 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 111 +++-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  16 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  70 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   2 -
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   1 -
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  68 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  12 +-
 drivers/soc/mediatek/mtk-mutex.c              |   8 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h      |  19 +-
 include/linux/soc/mediatek/mtk-cmdq.h         |  83 ++-
 12 files changed, 937 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

-- 
2.43.0


