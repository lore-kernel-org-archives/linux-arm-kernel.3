Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B149CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l1zMvEX5DRNOfBq8wZXAWH0EFZuVIv7jq4PHjQLkxbo=; b=2b9sdz+/NbQZ8CFdROFqYjU24q
	XWnAWn9jKv+XfRtD5HeoYSJrBBO2FtNlL1QdZOfUpd6somMcRSEmRxgKqREeeBuZPrpv46S6XXqcb
	MRtrV0H5U0stoXrgyE1jXlyNXH5oU537ox9dbS+EbxVqA5DLKrxggeNbJph97udB5i3lZZffpv6Mr
	jgw4IvJAuyPsGbiN3nb1mE9QMmewhTjfVu3lESKt7zsU5w+2FhC1DjatvlLgkeZU5sRnOM2Z9TWbW
	jo8FGBW+I5D/e9veymqVu9UuBIqZfwAr+xNCbCf3pkeKoNw9o0I4yB19EiHSiPl+XF3bPunycNynM
	JdZTG1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofpE-0000000D6UU-175K;
	Wed, 20 Aug 2025 10:13:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofHf-0000000Cy7I-1Bfx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 09:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=l1zMvEX5DRNOfBq8wZXAWH0EFZuVIv7jq4PHjQLkxbo=; b=Bcuj30ho/fM0VVkGDUEY4cm612
	djZXxFv3cVUM9HCX7HPIGIa2s+RmyMKSFcNQoLWb/mjAUJIHZ3xzODxL4WqASxNQVGh3cziu76bTp
	GT9/SGox5Z3K/hABC2Vy9LfXDII9zSy4r/cpSBTPEogrV1aHlBWELxBonhTAY7xBgblDvytUlmTgf
	PxVt0RHFLO3tIuu4eQNNdtqEHxchJo+UXlXEaqluosndE2xlY5zf0Hb4nypS4MSE6M7gomyT4dr9Z
	EymFPm8tcOWBbrcX1+ejywIBA6QLx3rQZvprDgP6erKzcnjcQZa7XfQCcAVLwyVtWrHhXYWP04pBi
	2pOE6+vg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofHb-00000000GlB-3dBl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 09:39:06 +0000
X-UUID: 729ff4127da911f09f706fa2197c6ceb-20250820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l1zMvEX5DRNOfBq8wZXAWH0EFZuVIv7jq4PHjQLkxbo=;
	b=t2eeBea0GsVvey88vYSGGq/fLapNffZACFo2ZDS5n/nI8hfEGBCBfnilbs1YPzYGDH+sdzy5w6v1OK06aFCS++B0VsNWUilumcSklqAZRydlONcfhWBUDubRQQ4vvjN16J98+JZgwYfRJz1itEIPplQHL4EwWO2oOQ6Djylchv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:fdb97ab1-e0dc-458c-80ac-088929435b41,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:6aa5547a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 729ff4127da911f09f706fa2197c6ceb-20250820
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 572247609; Wed, 20 Aug 2025 02:38:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 20 Aug 2025 17:38:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 20 Aug 2025 17:38:32 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v4 0/4] Add CMDQ driver support for 8189
Date: Wed, 20 Aug 2025 17:38:19 +0800
Message-ID: <20250820093831.23437-1-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_103904_271266_A3156CE3 
X-CRM114-Status: GOOD (  10.69  )
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

The patches are based on the series:
https://lore.kernel.org/all/20250601173355.1731140-3-jason-jh.lin@mediatek.com/
https://lore.kernel.org/all/20250601173355.1731140-4-jason-jh.lin@mediatek.com/
https://lore.kernel.org/all/20250601173355.1731140-7-jason-jh.lin@mediatek.com/
https://lore.kernel.org/all/20250601173355.1731140-8-jason-jh.lin@mediatek.com/

Changes in v4:
-Modify the order of driver data for 8189.
-All uppercase characters in the GCE header have been converted to lowercase characters.
-Link to v3: https://lore.kernel.org/all/20250819033746.16405-2-xiandong.wang@mediatek.com/

Changes in v3:
-Modify unused property of 8189 driver data
-Link to v3: https://lore.kernel.org/all/20250819033746.16405-4-xiandong.wang@mediatek.com/ 

Changes in v2:
-Modify the title for series.
-Link to v2: https://lore.kernel.org/all/20250819015948.15450-2-xiandong.wang@mediatek.com/

Changes in v1:
-Add GCE driver data for 8189.
-Modify the clk api for 8189 gce suspend/resume.
-Link to v1: https://lore.kernel.org/all/20250814070401.13432-1-xiandong.wang@mediatek.com/

Xiandong Wang (4):
[v4,01/04] dt-bindings: mailbox: add cmdq yaml for MT8189
[v4,02/04] arm64: dts: mediatek: Add GCE header for mt8189
[v4,03/04] mailbox: mtk-cmdq: Add CMDQ driver support for mt8189
[v4,04/04] mailbox: mtk-cmdq: Fix clock handling using clk_bulk_prepare_enable

 .../mailbox/mediatek,gce-mailbox.yaml         |   1 +
 arch/arm64/boot/dts/mediatek/mt8189-gce.h     | 870 ++++++++++++++++++
 drivers/mailbox/mtk-cmdq-mailbox.c            |  24 +-
 3 files changed, 885 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-gce.h

-- 
2.46.0


