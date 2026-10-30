Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C809606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4tB7QK/L;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=tEhn0zt2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=allCNmaFVJOkun0guf6atPUY8ZdWYZb9ohX7ldq5iAo=; b=4tB7QK/LMCDoqcV5MFNTJ40Vg/
	l8tv+vay8n86R9MFw6hW90ph9vYp8wKLrXmS6661mvS0Pl78fyLy5D8HWdd99CQSQnp5lBnAJ7Xj8
	YgIFm5ERkPq17PRAvZiVGGSpg6G55HurrG4HiPdFReFfxXEGF/Nw8O7kHd0SzJwYQKE3tmFihXhws
	2ZiEHKjvuQ8BDV33cRCYXQU7L3QzO9FLiUn7id0wQVb+ubnKLQbEnHBQYVMLLCq90t3i1tvk3Gqqk
	m5hdZKslL3POdfQFfpdWTUxKKflOhM1QKT6IRBF1GvkieYJx3YJ4P8RSF1UVHxLl18gB/ARCJETKB
	hziv61qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiZ9-0000000BCQV-2jcA;
	Fri, 30 Oct 2026 09:06:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiZ6-0000000BCQ0-47oj;
	Fri, 30 Oct 2026 09:06:26 +0000
X-UUID: 28bf7666d44111f1acbe4559397dec65-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=allCNmaFVJOkun0guf6atPUY8ZdWYZb9ohX7ldq5iAo=;
	b=tEhn0zt2/G3cJZkY1eLS5WMNbOazQPG+oWaaLJWAkADRUfgV9FLud2+nj5SHFv8nOkEiXdZ+9l/SNeS3s4hepaltnATvvq8NMpoN8hq9iQXMhXz6nUOpNgF1RLewl4aszQILUQs/FGBm/gMkNF/r1jV6taxgPPtuHa/8qAEdvLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:3655a00c-e3a1-4137-b48c-d88281fc91a8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:b7c032bb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 28bf7666d44111f1acbe4559397dec65-20261030
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 329558009; Fri, 30 Oct 2026 02:06:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 17:06:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 17:06:12 +0800
From: Anthony Liu <anthony.liu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.lee@mediatek.com>,
	<litien.chang@mediatek.com>, <kun.wu@mediatek.com>, <jb.tsai@mediatek.com>,
	<emery.hsin@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<ingyujang25@korea.ac.kr>, <shayne.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <lucid_duck@justthetip.ca>,
	<matthias.bgg@gmail.com>, <eason.lai@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Anthony Liu <anthony.liu@mediatek.com>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] mt76: fix buffer overrun in pkt buffer
Date: Fri, 30 Oct 2026 17:05:54 +0800
Message-ID: <bb9c40516e7379bf763b1ba7cec228c354494223.1793351111.git.anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <auQjsDPP1PeJg5sV@stanley.mountain>
References: <auQjsDPP1PeJg5sV@stanley.mountain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_020625_031600_31A643AF 
X-CRM114-Status: GOOD (  12.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The last patch (d4e5ca3483a0) addresses mt7928 F/W 4 byte-aligment
requirement by reducing pkt buffer by 2 bytes, causing the chance
of buffer overrun.

This patch reduces incoming skb length limit accordingly.

Fixes: d4e5ca3483a0 ("wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.")
Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202610172141.mmRmGqow-lkp@intel.com/
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 50f5f57b740e..37aeccb28efb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2537,7 +2537,7 @@ mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
 		return -EINVAL;
 	}
 
-	if (skb->len > 512) {
+	if (skb->len > sizeof(req.beacon_tlv.pkt)) {
 		dev_err(dev->mt76.dev, "beacon size limit exceed\n");
 		dev_kfree_skb(skb);
 		return -EINVAL;
-- 
2.45.2


