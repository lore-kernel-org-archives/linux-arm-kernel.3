Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ED3109316E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mP0wrA9XEI65mNtyVEuwgccgjZcyoSlyRxpMG9DjBwA=; b=oJrS7lvXsL3bfbJYNt8k+Eftvh
	v8z3mcO7WtXmBxl3lGNit8N0eOnTRxZexydxR8j6Uf/IS4bUORrT4G8fccbLYdq1v4icvoijQQ0qg
	91och8uA6WgaqMMJCbgCI498mTW+VKitePnid2pS3fZRwYrW9Yc+mxpUMH49hme005DlKJwadqWTP
	tVDevYySSnYrAeZa6XHRh/uSEtIEmDvuAZ+BTnH4jsUEiYMFItlW7VwQjB95tfeMcqqHYXCA0ZKJe
	Y2GPgVet1Wt9ZTxYEfx1DdYcfN+HmNfcMLq5FsEmNaNYGCCF0BIpYDGPMy7MPtnby3CF5C0glVeig
	0AwG28Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Qec-0000000C1oU-2O3g;
	Fri, 20 Mar 2026 03:36:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QeW-0000000C1nV-37ob;
	Fri, 20 Mar 2026 03:36:03 +0000
X-UUID: c567fa10240b11f1a6de359d7043e138-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mP0wrA9XEI65mNtyVEuwgccgjZcyoSlyRxpMG9DjBwA=;
	b=S5xekfv/eXne+h150pLhqYZy0uXUjbHxidFis+tY+f9jnsv10TQ9ezTf8AeJSePDW8hWF9zaTAm/aCRsOG2YF/QDPajh6jRlG7BzTXHC79uNPcbpTilhUn9Ypncp7qHpIzTJmXzQBnjGRJ/44R+xYIvo99FFmYAVv06nifugvT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9031e045-f697-4581-b84c-75a0ffa5822b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:155aeed4-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102|836|888|898,TC:-5,Content:0|1
	5|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c567fa10240b11f1a6de359d7043e138-20260319
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 286987353; Thu, 19 Mar 2026 20:20:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 11:20:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 11:20:36 +0800
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
	<Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>, Xiangzhi
 Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v3 0/6] ASoC: mediatek: Add VCP driver on Mediatek MT8196 SoC
Date: Fri, 20 Mar 2026 11:18:02 +0800
Message-ID: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_203602_121072_FBAB56A5 
X-CRM114-Status: GOOD (  13.22  )
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

Add support MediaTek's Video Companion Processor(VCP) host driver to
control the MediaTek VCP Risc-V coprocessor.

> This series is based on linux-next, tag: next-20260319.
>
> Changes in v3:
> - Fix probe path driver to using dev_err_probe error printf
> - Eliminate the use of global variables
> - Using readl_poll_timeout instead of "For" poll and "while" poll
> - Add VCP IPC layer driver   
> - Fix reviewer's comments
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250623120154.109429-2-angelogioacchino.delregno@collabora.com/
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250822021217.1598-3-jjian.zhou@mediatek.com/

Xiangzhi Tang (6):
  dt-bindings: remoteproc: Add VCP support for mt8196
  remoteproc: Mediatek: Add VCP remoteproc driver
  firmware: mediatek: Add VCP IPC protocol interfaces driver
  remoteproc: mediatek: Add VCP ipi-mbox init driver
  remoteproc: mediatek: Add VCP ipi communication sync mechanism
  remoterpoc: mediatek: vcp: Add vcp suspned and resume feature

 .../remoteproc/mediatek,mt8196-vcp.yaml       | 161 ++++
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   3 +
 drivers/remoteproc/mtk_vcp_common.c           | 854 ++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h           | 279 ++++++
 drivers/remoteproc/mtk_vcp_rproc.c            | 540 +++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h            |  95 ++
 include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++
 include/linux/remoteproc/mtk_vcp_public.h     | 146 +++
 include/linux/soc/mediatek/mtk_sip_svc.h      |   2 +
 13 files changed, 2734 insertions(+)
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


