Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA06C44523
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z140eWKa2HwjV3Nbd4LpFHKrosh3VChx7ErRvNeIOIc=; b=290+F2k1LIzHEStkFecJQn3Xj+
	zhjuGqa3QnebrQtE/6ewxY163QK+QPQL9Pg/cgIxwqoyIhj2rN62LLTs9Iw4oq3NZQBXG/MCJ+RqW
	w26dcJaG+WvGWGCNbEsOtSl5D2emr8dTrB/wfnbbfMfFezl2bcdgVNtt0GNON8XhE14YEVdq/xibU
	ADLxRWeMmlgKQeJ65CN0/VK4pI+vgTErHFRBJSldQqGwmXkeG9650V2aVmMIzkD8/k9HYajsSzz5f
	lFM6sppto6FK6X+1Q06FLPKeYYCCGSh92wm3sLUZBXOFt+IYjrSTnPGtminIj83YjIS2JrEdUrOB3
	otNh5laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlchA-00000005akc-0DVP;
	Mon, 20 Jul 2026 01:21:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcgy-00000005ad3-1zN7;
	Mon, 20 Jul 2026 01:21:14 +0000
X-UUID: 45eab48e83d911f1acbe4559397dec65-20260719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=z140eWKa2HwjV3Nbd4LpFHKrosh3VChx7ErRvNeIOIc=;
	b=pKi/fEP5m7eMsXreeQXlY3NfdJZJxtA6rW41J76ryfwtMwEPpOoS5+DaMjLLYk9DA+cq3xEz3B1vt9B6LxpuXY7/1cHGEmDs2HSQowicfcSh4XjAy4hK2lvtlETVm981xFBGyjrPwnys0H/sqsJnd9Utq9U7g794F7MDfo4x8EA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:84f2a463-9f5b-497b-b919-e541d4a01c88,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:8ce8f99b-75c7-410a-a98f-13895d3131d4,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 45eab48e83d911f1acbe4559397dec65-20260719
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712716410; Sun, 19 Jul 2026 18:21:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 09:21:00 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 09:20:58 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
	Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v6 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Mon, 20 Jul 2026 09:20:42 +0800
Message-ID: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_182112_522768_B7E0A338 
X-CRM114-Status: GOOD (  19.80  )
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

This patch set adds support for the video decoder on the MediaTek MT8196
platform, leveraging the VCP microprocessor for enhanced performance. It
introduces new firmware interfaces for kernel-side communication with VCP,
adds MT8196 compatible, codec levels/profiles, and private data. Rewrites
the AV1 driver to support extended VSI structures, then change irq table
and cdf table size.

This patch set depends on "Add MediaTek VCP remoteproc driver support"[1]

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20260427111446.22955-1-xiangzhi.tang@mediatek.com/

Compliance Test Result:
- v4l2-compliance: 48/49 tests passed, 1 failed (known issue)
- fail: v4l2-test-controls.cpp(981): ret (got 13)
-        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Fluster Test Result:
- H264:
- Ran 95/135 tests successfully   in 73.540 secs
- H265:
- Ran 142/147 tests successfully  in 100.168 secs
- VP9:
- Ran 276/305 tests successfully  in 106.804 secs
- AV1:
- Ran 240/242 tests successfully  in 23.991 secs

Changed in v6:
- Rebase to latest codebase
- Change patch authors and Signed-off-by trailers to Kyrie Wu
- Use safer firmware selection flow for decoder and encoder initialization
- Add VCP IPI id validation and keep invalid messages from stopping the
  message processing thread
- Fix VCP ACK state handling, stale ACK handling, and interruptible ACK wait
  retry handling
- Stop the VCP message thread, unregister callbacks, and release the VCP
  remoteproc reference during cleanup
- Replace VCP readiness busy-wait polling with sleepable polling
- Add VCP encoder capability callback
- Fix MT2110R debug output string
- Update the MT8196 decoder binding commit message according to review
- Keep MT8196 compatible definition before patches that use it
- Fill AV1 reference C plane buffer size

Changed in v5:
- Rebase to latest codebase
- Move vcp init method to driver pdata structures
- change decoder dt-bindings patch's commit message
- MT8189 base on MT8196 patch set

Changed in v4:
- Rebase to latest codebase
- Move dt-bindings and compatible to the after of vcp driver ready
- MT8189 base on MT8196 patch set

Changed in v3:
- Depends on change no update
- Add Compliance and Fluster test result
- Re-write the commit message for patch 12
- Change the patches according to review suggestion for patch: 3/4/5/6/14

Changed in v2:
- re-write the commit message for patch 1

Kyrie Wu (14):
  media: mediatek: vcodec: support vcp architecture
  media: mediatek: vcodec: add driver to support vcp
  media: mediatek: vcodec: add driver to support vcp encoder
  media: mediatek: vcodec: get different firmware ipi id
  media: mediatek: vcodec: get share memory address
  media: mediatek: vcodec: add debug information
  media: mediatek: vcodec: send share memory address to vcp
  dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
    mt8196
  media: mediatek: vcodec: add decoder compatible to support mt8196
  media: mediatek: vcodec: define MT8196 vcodec levels.
  media: mediatek: vcodec: support 36bit iova address
  media: mediatek: vcodec: clean xpc status
  media: mediatek: decoder: fill av1 buffer size with picinfo
  media: mediatek: decoder: support av1 extend vsi

 .../media/mediatek,vcodec-subdev-decoder.yaml |   1 +
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  21 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  33 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   8 +-
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_scp.c         |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 631 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 166 +++++
 .../vcodec/common/mtk_vcodec_fw_vpu.c         |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  21 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   3 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  31 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 114 +++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  11 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  12 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   5 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  27 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |   4 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   2 +
 27 files changed, 1093 insertions(+), 55 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

-- 
2.51.0.windows.2

