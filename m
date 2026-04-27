Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041BAFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mg7lEChG1H8JgoCNU3SfoHstuh0JYTH/us3/NdSVBPI=; b=T3qWvYPjxqvgEXpfTiVLr/bfcB
	fGRhOjLJY/as+g0ajiPAC1mJHiQbQtCgWkURyjTFaT8JGvBTYT59+/XXHXBNfo73xF43DiJ3UDhmf
	TfXnY+aqpjfEwAeORPkNlwPWTVOR5Jye5LtJNNL+X+qBUowBi/J9zS7g64FuPnXx2AAEnYw0IQ1pi
	4q6JtOlbqrjtq0NXZRp2Fsk8M8oPKjJUoJ/tIz5DJt+Z4yaTgJ3ru8o+/OrUeIx/02x0JL1+Ie8oa
	88JKaB7t1LkvaDPNNSv0FFvqUz7WLwOzfaXsKHIH4o12vh/oDd9O9xAaoPP38E3WpvXKEItQA5lwa
	9hoYo74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJvn-0000000Gl88-2tnF;
	Mon, 27 Apr 2026 11:15:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJvl-0000000Gl6Y-0nwg;
	Mon, 27 Apr 2026 11:15:14 +0000
X-UUID: 5779e422422a11f1a6de359d7043e138-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Mg7lEChG1H8JgoCNU3SfoHstuh0JYTH/us3/NdSVBPI=;
	b=hNtFmJFSoRg54CK2w3eCtad4PEeOo1kRqnn3XaFNREgE53pWh+5kpati1WyaHGxms1rPxp3DqqsAxhDhaObJuOodZskRhiNVICv+hk7xv2UXd7v/HgAAkb/7ltPFfAq501shaVhV/yoNySbFYbI1P6DQd0R5Y0vXrTv2dDZSP/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:77669ad7-dc29-4675-b0ce-9b1dc5e833b7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:e07c82be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5779e422422a11f1a6de359d7043e138-20260427
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 495437771; Mon, 27 Apr 2026 04:15:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:01 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, Vince-WL
 Liu <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH 0/7] Add MediaTek VCP remoteproc driver support
Date: Mon, 27 Apr 2026 19:04:39 +0800
Message-ID: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_041513_291798_05064D5C 
X-CRM114-Status: GOOD (  14.46  )
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

This patch series adds support for the MediaTek Video Companion
Processor (VCP), a RISC-V based coprocessor found on MediaTek SoCs
starting from mt8196. The VCP handles video processing and multimedia
tasks, offloading work from the main CPU cores.

Architecture Overview
=====================

The VCP subsystem consists of several components:

1. Hardware Architecture
   - RISC-V coprocessor with 1-2 harts per core
   - Multi-core capable (mt8196 has 2 VCP cores)
   - Shared SRAM (up to 384KB) partitioned among cores
   - Dedicated power domain for power management
   - Integrated with SoC IOMMU for memory protection

2. Communication Infrastructure
   - 5 hardware mailbox channels for IPI (Inter-Processor Interrupt)
   - Shared memory regions for bulk data transfer
   - IPI routing tables mapping message types to mailboxes
   - Support for both blocking and non-blocking IPI operations

3. Boot and Runtime Management
   - Firmware loaded via remoteproc framework from filesystem
   - Boot sequence coordinated with ARM Trusted Firmware (ATF) via SMC
   - Runtime power management with suspend/resume support
   - Feature registration mechanism for cross-subsystem coordination

Patch Series Structure
======================

[PATCH 1/7] dt-bindings: Device tree binding for mt8196 VCP
[PATCH 2/7] remoteproc: Core VCP remoteproc driver with ATF integration
[PATCH 3/7] firmware: IPC protocol layer for VCP communication
[PATCH 4/7] remoteproc: IPI mailbox initialization and routing
[PATCH 5/7] remoteproc: IPI synchronization mechanism
[PATCH 6/7] remoteproc: Suspend/resume power management
[PATCH 7/7] MAINTAINERS: Add maintainer entry

Differences from MediaTek SCP
==============================

MediaTek SoCs have two types of companion processors:
- SCP (System Companion Processor): Cortex-M based, for system tasks
- VCP (Video Companion Processor): RISC-V based, for multimedia

While both use the remoteproc framework, VCP has distinct characteristics:
- Different ISA (RISC-V vs ARM Cortex-M)
- Different firmware and memory layout
- Different IPC protocol (5 mailboxes vs 1)
- ATF-coordinated boot sequence
- Multi-core capable architecture

Testing
=======

This patch series has been tested on mt8196 development boards with:
- Firmware loading and boot sequence verification
- IPI communication with video encoder/decoder subsystems
- Suspend/resume cycles with multimedia workloads active
- Multi-core VCP configuration
- IOMMU integration with multimedia memory management

Dependencies
============

- Mediatek Power management driver
- MediaTek VCP mailbox driver (MTK_VCP_MBOX)
- ARM SMCCC support for ATF communication
- IOMMU support for memory protection

Checkpatch Status
=================

All patches pass checkpatch.pl with no errors. Warnings about MAINTAINERS
are addressed in the final patch of the series.

Future Work
===========

- Support for additional SoC variants (mt8197, mt8198)
- Enhanced debugging infrastructure (trace, core dump)
- Performance optimizations for IPI latency
- Documentation under Documentation/remoteproc/

Xiangzhi Tang (7):
  dt-bindings: remoteproc: Add MediaTek mt8196 VCP binding
  remoteproc: mediatek: Add VCP remoteproc driver
  firmware: mediatek: Add VCP IPC protocol driver
  remoteproc: mediatek: Add VCP IPI mailbox initialization
  remoteproc: mediatek: Add VCP ipi communication sync mechanism
  remoteproc: mediatek: vcp: Add vcp suspend and resume feature
  MAINTAINERS: Add entry for MediaTek VCP remoteproc driver

 .../bindings/remoteproc/mediatek,mt8196-vcp.yaml   | 166 ++++
 MAINTAINERS                                        |  14 +
 drivers/firmware/Kconfig                           |   9 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/mtk-vcp-ipc.c                     | 481 +++++++++++
 drivers/remoteproc/Kconfig                         |  12 +
 drivers/remoteproc/Makefile                        |   3 +
 drivers/remoteproc/mtk_vcp_common.c                | 881 +++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h                | 281 +++++++
 drivers/remoteproc/mtk_vcp_rproc.c                 | 581 ++++++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h                 |  95 +++
 include/linux/firmware/mediatek/mtk-vcp-ipc.h      | 151 ++++
 include/linux/remoteproc/mtk_vcp_public.h          | 146 ++++
 include/linux/soc/mediatek/mtk_sip_svc.h           |   2 +
 14 files changed, 2823 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
 create mode 100644 drivers/firmware/mtk-vcp-ipc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

-- 
2.46.0


