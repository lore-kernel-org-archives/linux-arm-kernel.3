Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A45AC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=52i9YgRCQY4eUwPR3J3wZm0YqbOp1UvkxsEq1SBCJrw=; b=cz9d41FeZ9Tf3W1Ahh0lFJ9SRL
	+1bc0OGGQ/Oa+Irar5opNtQwlrkpT+xW9Z7zUypPrIa+DPgp9yZBYks6zv6zW7Z3XFMauHz9k+UKg
	G/32Ku3ObxdWQ6LQhAh+NA86cCGEIzrsy4/RTH8UsEs9X3gJjk6lRYbXO48VzeaK52hC0pGCncgJm
	9fuSplxUAom3mJmghswizYdTLS6d/+yD5HU3FJTYolo77gm8RxyU3PvZxnxW6wYbmBI49VRLMDeU3
	UkSru1CZoCwlzLtXXLu98w9JTHhxX/2A5D/yM0iFdgjOYt2aAGznKCdO4qMdZfVzEDgjt4FQ/Sn5b
	mQrFgEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EsE-0000000GRaB-0k0y;
	Fri, 25 Apr 2025 08:57:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EoY-0000000GQOp-0eRu;
	Fri, 25 Apr 2025 08:53:43 +0000
X-UUID: c5895dba21b211f0a2405d5ef59ce188-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=52i9YgRCQY4eUwPR3J3wZm0YqbOp1UvkxsEq1SBCJrw=;
	b=LZwL0PM9CtBynymMwxEZHB7D70AxCGW6rf4raoKWhTaehXlBI0pYnLC6Swu1Z8rUsU0uPJYlirOVJdBQt+yb9ZZN/u2o7OFPjKxqjlfSoV3Qle9TMNuBudjTtComEPEpAW2HZAYaeVCfCRcwiHCr4nOdKTIFX/q8pFkOoeMZvL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9266fb1c-0a8f-46e6-acc7-2c6a4534735c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5ead9cf0-ff26-40e8-a637-f0e9524b171a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c5895dba21b211f0a2405d5ef59ce188-20250425
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1535264352; Fri, 25 Apr 2025 01:53:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 16:53:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 16:53:31 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Fri, 25 Apr 2025 16:53:16 +0800
Message-ID: <20250425085328.16929-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015342_194678_352BF7BF 
X-CRM114-Status: UNSURE (   9.93  )
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

This series adds support for mt8196 multi-hardwares jpeg enc & dec,
by first adding mt8196 jpegdec and jpegenc compatible to install
kernel driver. Add smmu setting to support smmu and iommu at the
same time.
Secondly refactor buffer and clock setting to support multi-hw jpeg
working.
Lastly, fix some bugs, including resolution change handleing, stop
streaming sw flow and others.

This series has been tested with MT8196 tast test.
Encoding and decoding worked for this chip.

Patches 1-3 Adds jpeg encoder and decoder compatible.
Patches 4 add jpeg smmu sid setting.
Patches 5 fix jpeg hw count setting to support different chips.
Patches 6 refactor jpeg buffer payload setting to handle buffer
size bug while resolution changed.
Patches 7 reconstruct jpeg dst buffer layout.
Patches 8 fix multi-core stop streaming flow
Patches 9 refactor multi-core clk suspend/resume setting
Patches 10 fix decoding buffer number setting timing issue
Patches 11 refactor decoding resolution change operation
Patches 12 fix remove buffer operation

---
This series patches dependent on:
[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/

Changes compared with v2:
--refactor smmu sid setting function interface
--Some modifications for patch v2's review comments.

Changes compared with v1:
--refine jpeg dt-bindings for MT8196
--optimize software code to manage jpeg HW count
--refactor smmu sid setting function interface
--Some modifications for patch v1's review comments.

Kyrie Wu (9):
  media: mediatek: jpeg: add jpeg smmu sid setting
  media: mediatek: jpeg: fix jpeg hw count setting
  media: mediatek: jpeg: refactor jpeg buffer payload setting
  media: mediatek: jpeg: refactor jpeg dst buffer layout
  media: mediatek: jpeg: fix stop streaming flow for multi-core
  media: mediatek: jpeg: refactor multi-core clk suspend and resume
    setting
  media: mediatek: jpeg: fix decoding buffer number setting timing issue
  media: mediatek: jpeg: refactor decoding resolution change operation
  media: mediatek: jpeg: fix remove buffer operation for multi-core

kyrie.wu (3):
  dt-bindings: media: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  dt-bindings: media: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  media: mediatek: jpeg: add jpeg compatible

 .../media/mediatek,mt8195-jpegdec.yaml        |   8 +-
 .../media/mediatek,mt8195-jpegenc.yaml        |   8 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 169 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  21 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 112 +++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 112 +++++++++++-
 6 files changed, 377 insertions(+), 53 deletions(-)

-- 
2.46.0


