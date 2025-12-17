Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C609D64062
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 06:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rtCOBMOAcLhzdU56zPzHYieYlK5X0cs0WzXrXcU35tM=; b=VWy8aHar3SuNiwzpblPlsENofb
	FcEv/A4c4/NsgWlCUvqj0Rd8WCzo6Rw9YJWTAz7ZsDFraCpXTu+bZsHYyGnTjVyAZqnt9ixQ92jyb
	n1mSaMnvVUH7WeqtfxyVMLzL88BkXpWqpB1SJABFUp/4FtpVQ386uf+zmvSorJFu+GoKyOAGzm/Zh
	2Rnihln3o3uLa5dJXjoejTxsLPj58NmzYC8HDG7CmBftoYqMf7cFnIGzcgfxqfRcnaE2uFSJWY4Gh
	0kucodRJqiuDjdQMXFL4sKHicvSWFVetf0V1nw1eHWzEfRiaEL8LFWmD1AeGBDWOaxG22HDNgemDC
	m6aiaOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7V-00000006F4q-063O;
	Wed, 17 Dec 2025 06:34:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7T-00000006F3o-05Tc;
	Wed, 17 Dec 2025 06:34:44 +0000
X-UUID: 74433600db1211f0a52f393f94899d25-20251216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rtCOBMOAcLhzdU56zPzHYieYlK5X0cs0WzXrXcU35tM=;
	b=nmO+CsoAOXSwNLro6QRc+xaSCeT3HTfFwMP7GqoFYcDwzpduLOhp1yr0Cp/pxSrFowRxG1ppuBTxAmgnK45q1q71QvPOFoPiYfrvPXDMwKZYtU4+WuUgQdN5TP0DFOzit1PAL8dDrlur2Pl3AzCOusLVN0NM5TrREsMtm4EvrDg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2bef9e69-3f11-4141-9131-1b4be342a543,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:0295dc02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|888|898,TC:-5,Content:0|15|50,ED
	M:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 74433600db1211f0a52f393f94899d25-20251216
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1978771181; Tue, 16 Dec 2025 23:34:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 17 Dec 2025 14:34:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 14:34:32 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/4] soc: mediatek: Add devapc support for MT8189
Date: Wed, 17 Dec 2025 14:34:09 +0800
Message-ID: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_223443_072514_4972DE3A 
X-CRM114-Status: UNSURE (   8.63  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>

Based on tag: next-20251216, linux-next/master

This series of patches add support for Mediatek devapc of MT8189 soc.

Changes in v2:
  - Updated cover letter subject
  - Updated yaml for dt-bindings
  - Add support for MT8189 devapc
  - Refine devapc clock control flow
  - Refine devapc interrupt handler

Changes in v1:
Xiaoshun Xu (4):
  dt-bindings: soc: mediatek: devapc: Add bindings for MT8189
  soc: mediatek: mtk-devapc: Add support for MT8189 devapc
  soc: mediatek: mtk-devapc: refine devapc clock control
  soc: mediatek: mtk-devapc: refine devapc interrupt handler

 .../bindings/soc/mediatek/devapc.yaml         |  10 +-
 drivers/soc/mediatek/mtk-devapc.c             | 189 ++++++++++++++----
 2 files changed, 159 insertions(+), 40 deletions(-)

--
2.45.2


