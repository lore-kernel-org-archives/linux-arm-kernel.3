Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037C4CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuqNLnHQ7AjY34gb9tcmUNHMK6k8UlScLgrQcuj0G9I=; b=2sxaHCMc9/jm1lpuGIUIQr0kzZ
	5hO3jvkHW8eKXt6IpUQtMp/62QMIa07+TBrb0OOgphDao1pO3wCJ1aa89dBrrVPWW8t8U2oXKYT4i
	z80JuRNneoFNzht/4Ci4RnugMzBRvLKp0cykhX/dcmEKfc36KBAQconI8xpq2GT+EUx9nqX7+f3bC
	+DurmhqsDaurqHmKDx5n4P/o7YufUd/brUk3U8TEsDYZiBkg9ogZemI/uL246zfwu1E/x+SYeHP/n
	9Do/H9SLWvbuWwFo99oiDXAYKKyHpDnEueDlntF6H+kWhHhSDHnQSpAFxD9jQycO4krRio4Sajp5l
	2spVbFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUVj-00000005NIr-0CXc;
	Thu, 14 May 2026 11:45:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUVf-00000005NHf-33M9;
	Thu, 14 May 2026 11:45:48 +0000
X-UUID: 6d863e4c4f8a11f1afed4741b24580c9-20260514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MuqNLnHQ7AjY34gb9tcmUNHMK6k8UlScLgrQcuj0G9I=;
	b=YwuNilMcvqbwn3NM8KYsuArtMfCGidrF44Vz1rotVL+drQrTJ57Ppkx/+ke64IUkqshilkIN6G0IRsag5X/4/W0Jl5u+xnwEPeyLzkXRqYohB+4Tr9n2xOYaSgdQDY2r/2LvsM5Gluc5eaSle+Omf7tkRGNN31nfjnMNyPKRX1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:5deb838e-415b-4769-995d-fe58bcdf67d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:76bd41c8-ea23-4b4b-9221-06b52a563801,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6d863e4c4f8a11f1afed4741b24580c9-20260514
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1672894135; Thu, 14 May 2026 04:45:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 14 May 2026 19:45:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 14 May 2026 19:45:36 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <arnab.layek@mediatek.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Thu, 14 May 2026 19:45:32 +0800
Message-ID: <20260514114533.174008-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260506133157.3283204-1-arnab.layek@mediatek.com>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_044547_781347_F34B8FE7 
X-CRM114-Status: UNSURE (   7.59  )
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

This series updates the mtk,scp dt-binding schema to support MT8188's
requirement for two memory regions while maintaining backward
compatibility for other MediaTek SoCs.

The schema uses a permissive base with restrictive conditionals:
1) Base schema allows all devices minItems: 1, maxItems: 2
2) Non-MT8188 devices (mt8183, mt8186, mt8192, mt8195, mt8195-dual) are
   restricted to maxItems: 1, overriding the base
3) MT8188 devices (mt8188, mt8188-dual) set minItems: 1 with item
   descriptions, inheriting maxItems: 2 from base, making the second
   L1TCM region optional

Changes in v3:
- Removed "Tested on..." line per Krzysztof's feedback (bindings cannot be tested)
- Added minItems: 1 to MT8188 conditional to make L1TCM region truly optional
- Clarified commit message to specifically reference mediatek,jpeg-encoder.yaml pattern
- Restructured schema per Conor's feedback: base allows maxItems: 2, conditionals restrict
- Added explicit restrictions for non-MT8188 devices (maxItems: 1)
- Added technical explanation of the permissive base + restrictive conditionals pattern

Changes in v2:
- Added conditional schema for MT8188 to allow 1-2 memory regions
- Added descriptions for each memory region
- Did not work: base maxItems: 1 conflicted with conditional trying to allow 2

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

-- 
2.45.2



