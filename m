Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C37CD8CBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OxZg1HbkTQJaG3rBGBiIsByihp2SXJ3mxZea50kB+9Q=; b=S9sE6FtE1pv9HX5Nme3j8hfguy
	+heRpGxsFQiaCQIwQZsjfmCZOh4SMfBWJMJwu5LpYmUXoZniJRtp5O5PN2mXhwMXY3EXlqdVUBTpz
	cMVXh53S9bohEDykHW7daX9QEw4JRf2x5CNV+pzRqHzP28j8ciNWMCnU7TmuTDeT74KXH1bs05bji
	XSxa8SITvkQAPno9hFlKwpvh7aLa4vdtRGEfX2xSmYvoMYyR1dMsfXjl7TAYR5RrNWDOd/p/9/3FM
	5HY/LRCgHijb5L7KZ+fxbZvKPoN2XR+9Aza19HPb0jMCRXPHYMKyq44NRUYd4bniCY+pWJ+fjExVp
	egJl2boQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtrX-00000005N7X-0mY2;
	Tue, 09 Jun 2026 10:39:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtrS-00000005N46-2jDI;
	Tue, 09 Jun 2026 10:39:11 +0000
X-UUID: 6dea0d5e63ef11f1afed4741b24580c9-20260609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OxZg1HbkTQJaG3rBGBiIsByihp2SXJ3mxZea50kB+9Q=;
	b=qvcKeHdqX271kaSyJCj65IKVqkbEq/5wQQh2AMnAp3yxGmmGOYOWpVRK/T15w3Kc9v8+ULOLkm3anifefZ/KqGnQGXQ7vT4bmt/5MDmw130p2SDHsW6rpazFeTWZa9bwMM//OVAQdmKM9LJaUl7XfrFgdKTCp83uUl3P8vCSQyY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:a005354c-c52d-43a7-b578-694c56c515cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:c3947c2a-13d2-4d29-83ea-b8014339a000,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6dea0d5e63ef11f1afed4741b24580c9-20260609
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 697795049; Tue, 09 Jun 2026 03:39:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Jun 2026 18:38:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Jun 2026 18:38:59 +0800
From: <ed.tsai@mediatek.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: [PATCH 0/2] ufs: Add callback for vendor-specific RTT capability
Date: Tue, 9 Jun 2026 18:38:54 +0800
Message-ID: <20260609103856.676222-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_033910_692393_F5FB83FE 
X-CRM114-Status: UNSURE (   8.17  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

The first patch adds the get_hba_nortt() callback to the UFS core layer
and removes the static max_num_rtt field from ufs_hba_variant_ops. This
allows platform vendors to provide dynamic, platform-specific RTT capability
handling.

The second patch implements this callback in the MediaTek UFS driver,
distinguishing between legacy and newer platforms.

Ed Tsai (2):
  ufs: core: Add get_hba_nortt callback for vendor-specific RTT
    capability
  ufs: mediatek: Implement get_hba_nortt callback for RTT capability

 drivers/ufs/core/ufshcd.c       |  9 +++++----
 drivers/ufs/host/ufs-mediatek.c | 12 +++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  4 ++--
 include/ufs/ufshcd.h            |  5 +++--
 4 files changed, 21 insertions(+), 9 deletions(-)

--
2.45.2

