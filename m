Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k/dEYJoO4Qk0W2/aYoTFiGpV/VHj1MHfhfjKfCBVoWg=; b=v3G7BX0p6ZTn6e6jkTgUUCOzys
	dC3MVuOpfrEqRYYstIPYb1cb7+46ZmDzviele7QdsYJFBe/iFriZhKw/pedsApNnNqtvPSogbXNLY
	WF+0vgWlS0g5ZJmHfCmgWJddoY5lMHkGf9Fr4MY6kt1dNy2R/Tmjvggnodof9+eusnc1+TsxF2Bqs
	0a00tYbN7EEOzl0Hbn6bcS4A7s7uCJTJHa+VTJ3KLxOOc6lCj1Nuhc8UYsnhdS2fhLaSs81Lt86Jo
	531HQtrlet/UbnAZ8SU0lu5t4UAyTz0tYeDTRLbmEVhCMlbny2C7EtLsC3lIdCFPBIGU9GwtR1E3W
	lSn6hX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjftw-00000001xlc-2I1v;
	Sun, 16 Feb 2025 14:45:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjfsT-00000001xWf-2nOO;
	Sun, 16 Feb 2025 14:44:14 +0000
X-UUID: 7aaeb498ec7411efa1e849db4cc18d44-20250216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k/dEYJoO4Qk0W2/aYoTFiGpV/VHj1MHfhfjKfCBVoWg=;
	b=GHS+PHwDdBkVw5ixuvT5jV7YqGuYx+/Y6VBHs2HaZ6d6CMolbwLE9Fx7nNyIM9+cGTDSbklVU5y9z/wr5siYOBozK+7MwxcvXDYAwAAdVENzIt4e7d4V/3Qjz+dADfR1mGhF2Yt3aD2u56DQ6lUEDs8q6yHiGbsoMNKSSI6YYzA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:a823c4bf-f2d0-406b-8961-88d2c0dd76ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:44176dfc-7800-43c5-b97b-ddbe32561a5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7aaeb498ec7411efa1e849db4cc18d44-20250216
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 859932867; Sun, 16 Feb 2025 07:44:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 16 Feb 2025 22:44:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sun, 16 Feb 2025 22:44:06 +0800
From: <ed.tsai@mediatek.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, Ed Tsai <ed.tsai@mediatek.com>,
	<dm-devel@lists.linux.dev>
Subject: [PATCH 1/1] dm: Enable inline crypto passthrough for striped target
Date: Sun, 16 Feb 2025 22:42:21 +0800
Message-ID: <20250216144224.1702385-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_064413_739653_BED2CD2D 
X-CRM114-Status: GOOD (  12.15  )
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

Added DM_TARGET_PASSES_CRYPTO feature to the striped target to utilize
the hardware encryption of the underlying storage devices, preventing
fallback to the crypto API.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/md/dm-stripe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 3786ac67cefe..a1b7535c508a 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -467,7 +467,7 @@ static struct target_type stripe_target = {
 	.name   = "striped",
 	.version = {1, 7, 0},
 	.features = DM_TARGET_PASSES_INTEGRITY | DM_TARGET_NOWAIT |
-		    DM_TARGET_ATOMIC_WRITES,
+		    DM_TARGET_ATOMIC_WRITES | DM_TARGET_PASSES_CRYPTO,
 	.module = THIS_MODULE,
 	.ctr    = stripe_ctr,
 	.dtr    = stripe_dtr,
-- 
2.45.2


