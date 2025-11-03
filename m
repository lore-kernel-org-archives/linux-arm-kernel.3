Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F4FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zpUXsTaas0d04qVuUufLjAsxPeCu/19RhV4iRVm7B4=; b=sb9u4AjQJksvZQifojj/+o7PvW
	aWjwXCgkXSOxWERYmbTyb/1y9ulSiTEWu6l2rlBPlBO93pPDKseEmwRM57IAF3ij7qXOA7g8A1LaT
	4KXbd8IN5Q9YBKCPH4ZatndzRIZvMNJoJ2DGWDuQekl0XOfDKOFkbzpaFTAxsf/GHmZeN0F+KxN1h
	K42Zkw52NdlNe7Q2fFruiNzbtueXV1xMVUvQ0+7ifwmjVkc1pL+INhrxa7tBb754ICWihooC2RWom
	Iy2XzXbDfqYOvOm0l7689US4efwn7uY3cMRiuqIjpf7Oynz015lzet6gfNUz1oGX8eD/+7/Umsx8i
	6le4opkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFupj-00000009wCO-41SS;
	Mon, 03 Nov 2025 13:42:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFuph-00000009wBc-2E68;
	Mon, 03 Nov 2025 13:42:54 +0000
X-UUID: fb47f066b8ba11f09f706fa2197c6ceb-20251103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4zpUXsTaas0d04qVuUufLjAsxPeCu/19RhV4iRVm7B4=;
	b=mnDc2Mrxr42eL/djfy4FDMBzWDzRicKIC8Shx9UWUfDmmWufX0EzxSlQiTy7lNFXU7iioOXpR+5pwlClQ4aEvm5spTllvqegP5Kp1TvYni5xS3HHRhzAuIZjG9I82eqwXuQ4T9NhEtrGnpk+rq3sVARGg3fNsrj6SGodN+akT+Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1665e397-f86c-402d-b2a1-31af8ecddeae,IP:0,UR
	L:0,TC:0,Content:54,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:54
X-CID-META: VersionHash:a9d874c,CLOUDID:5b82dd18-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:-7|-6|
	3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fb47f066b8ba11f09f706fa2197c6ceb-20251103
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975779101; Mon, 03 Nov 2025 06:42:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 3 Nov 2025 21:42:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 3 Nov 2025 21:42:45 +0800
From: niklaus.liu <Niklaus.Liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<zhigang.qin@mediatek.com>, <sen.chu@mediatek.com>, Niklaus Liu
	<niklaus.liu@mediatek.com>, niklaus.liu <Niklaus.Liu@mediatek.com>
Subject: 
Date: Mon, 3 Nov 2025 21:42:25 +0800
Message-ID: <20251103134241.3773-1-Niklaus.Liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_054253_579012_009B083B 
X-CRM114-Status: UNSURE (   5.51  )
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

This series is based on linux-next, tag: next-20251103
Subject: [PATCH 0/1] soc: mediatek regulator: Add Support for mt8189

changes in V1:
 - mediatek-regulator-coupler mechanism for platform MT8189 

Niklaus Liu (1):
  soc: mediatek regulator: Add Support for mt8189

 drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.46.0


