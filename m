Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91F4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=neaiS3v6Ee0wnOpS6Uq6OxdGxu6XYh+uZ3ykA7gR8Z4=; b=kkQqquhYpOcJ88n1mzraT9gA07
	D6ee91QTIH+bjVzF77PuevROl/oBKnf7O0P5wAtERWLd0oiY+IYkLKUNPFRAd4tuxh7RkIPtsrGfO
	eNzB6EnJgWDQ3wbv7uK3WnYnvtag/nkRQOu8Wf3KVDIu6MSpbFhRXMNNODVKsoEHHTHSKcVj7UB96
	ewVcbo+k7rYGY+7czf5DfJVikfl3DxDXLSXy8nG2lo9shxeWGNogBYUlk8+Krwg0d7cQbGEprJjct
	/Mz0tKOEfoo1dvEEvjoZpkTFjwmGjCvCJGdVa5Hb/6jKqh09KnkSGqPj4NaB2/mGPGFWvIJcdWg53
	EhldPPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf4Y-00000004RmG-44fZ;
	Wed, 20 May 2026 11:26:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf4W-00000004Rkv-0Juu;
	Wed, 20 May 2026 11:26:45 +0000
X-UUID: c2dd124a543e11f1acbe4559397dec65-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=neaiS3v6Ee0wnOpS6Uq6OxdGxu6XYh+uZ3ykA7gR8Z4=;
	b=EOJLNiP41QCWkOta+YNBWlQSohWA1ZQa1Rsd9VD8V+/nB3H6s8z1swEp1csAxZtwoLYeR/tAcHq1xZDKPtgIJLka2GOCZ4ZTaOesoa2rNNTEaK+r84+it8kjub+XfTQyFWUjUc6+AI/Vf4m67odIQkkugIne8d2PxbFsdnq809g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:9d2a6d9a-e69a-4e21-865e-dc2775b013bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:72bd2322-bef7-463f-902c-5f40f7404c33,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2dd124a543e11f1acbe4559397dec65-20260520
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 644099158; Wed, 20 May 2026 04:26:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 19:26:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 19:26:33 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v4 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Wed, 20 May 2026 19:26:28 +0800
Message-ID: <20260520112629.3420612-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_042644_129413_657DDC69 
X-CRM114-Status: UNSURE (   8.46  )
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

This patch updates the mtk,scp dt-binding schema to support MT8188's
requirement for 1-2 memory regions while maintaining strict backward
compatibility for other MediaTek SoCs.

The MT8188 SCP requires a main SRAM region and optionally supports an
L1TCM (Level 1 Tightly Coupled Memory) region for performance
optimization. L1TCM is optional because basic SCP functionality works
with only SRAM, but L1TCM provides faster memory access when the board
hardware configuration includes it.

The base schema uses minItems: 1, maxItems: 2 (permissive range),
following the pattern established in other MediaTek dt-bindings like
mediatek,vcodec-encoder.yaml where the base accommodates all variants.
Conditionals then narrow the constraints per device.

Changes in v4:
- Improved commit message clarity per kernel submission guidelines:
  * Added bullet-point explanation of the two memory regions
  * Explained WHY L1TCM is optional (performance optimization, not
    required for basic functionality)
  * Explicitly listed which SoCs remain single-region
  * Clarified the two-conditional approach
  * Explained how minItems: 1 allows board-specific configuration
- Cover letter updated to explain L1TCM optional reasoning

Changes in v3:
- Removed "Tested on..." line (bindings cannot be tested)
- Added minItems: 1 to MT8188 conditional to make L1TCM truly optional
- Referenced mediatek,vcodec-encoder.yaml iommus pattern explicitly
- Base schema: minItems: 1, maxItems: 2 (permissive range)
- Non-MT8188: explicitly restricted to maxItems: 1
- MT8188: documented with item descriptions for both regions

Changes in v2:
- Added conditional schema for MT8188 to allow 1-2 memory regions
- Added descriptions for each memory region
- Did not work: base maxItems: 1 conflicted with conditional

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

-- 
2.45.2

