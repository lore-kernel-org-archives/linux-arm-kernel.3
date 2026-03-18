Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9737FF6E8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZSzv/o3IHhli9mGR2+OsPwYiHpuhmCGiETm1UfYWuuI=; b=p1qNFMrCUJuFPoMHAcwd0b+4BM
	MuB3vQ0H2W4cY6syp9ymYq1dta2Y5kxFvNChmRR3Cv5jaFTHZcvLCm0FGER5DOoO0nfcKcODzrHEV
	1ZW+Z6NqsLA7PsY9kh8BOY0U2HNjtOO76md0YEnGVeNhw+UPExehoBHZJDPvxwZ654DvSalVdRM51
	L0/nh6XFCO64mBHcBPyPjcK82LMy5AgTQn2PpJDJnfMbHleIzfXutfHYjIXjIaKzYaeBumocEozh8
	kMqhfA59bEZYwcwfBuDgC4wP6y6IKB3BEF13orRJyVhQm5PS5cax1NQZYNxjd64jfiC6hNvYOzfi6
	h1U/wLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mU1-00000008485-2xUX;
	Wed, 18 Mar 2026 08:42:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mTz-00000008477-0fwg;
	Wed, 18 Mar 2026 08:42:28 +0000
X-UUID: 60d2a4c622a611f1a6de359d7043e138-20260318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZSzv/o3IHhli9mGR2+OsPwYiHpuhmCGiETm1UfYWuuI=;
	b=tBywKN3u1G/ya7u7NhO0JzqS+GRymu1zzTEShI2kVKvj7v82Qr2tKRc9zaP6KFSSlPmNR9koSS/A0QSQOxvR14i4RpZ5nByq0xoqUPDmvU8ian5rBZasxI4LHUC3t9y08P4pJFjbS6h+D8FMWNNfCkh1g0vMbnEHQCmGZGTIlDo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cf02f02d-a32c-437f-a839-47e65944ff80,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c4d7a24c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 60d2a4c622a611f1a6de359d7043e138-20260318
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <adlavinitha.reddy@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 327203729; Wed, 18 Mar 2026 01:42:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 18 Mar 2026 16:42:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 18 Mar 2026 16:42:18 +0800
From: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, adlavinitha reddy
	<adlavinitha.reddy@mediatek.com>
Subject: [v1,PATCH 0/1] i2c: mediatek: add bus regulator control for power saving
Date: Wed, 18 Mar 2026 16:42:05 +0800
Message-ID: <20260318084216.4124272-1-adlavinitha.reddy@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_014227_211029_6ABC61C6 
X-CRM114-Status: UNSURE (   9.74  )
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

This patch adds conditional bus regulator enable/disable support in
mtk_i2c_transfer() to allow I2C bus power gating on platforms that
provide a vbus-supply in the device tree.

The implementation:
- Enables bus_regulator before clk_bulk_enable() if vbus-supply is defined
- Disables bus_regulator after clk_bulk_disable()
- Only activates when vbus-supply is provided in device tree
- Has no impact on platforms without vbus-supply defined

This approach provides power savings for platforms with an extra I2C bus
regulator, while avoiding runtime PM complexity.

Based on linux-next, tag: next-20260305

adlavinitha reddy (1):
  i2c: mediatek: add bus regulator control for power saving

 drivers/i2c/busses/i2c-mt65xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

--
2.45.2

