Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F27DCA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gVqzy0ZFZMpxYCkrvZ5zhFgzqFeltm3jZ15hOSwBToE=; b=EHoJOTWJae6bBcWm5sxSLzVwNd
	+NuBwuYjpXmfX1kwLZLIRa0pN98m1nkIuYGAIw1eMf0/CpBVFyNYNdhRAmZ2eVKFc1vXctWrBgq/e
	0EdRTNb0Qd26um3HULeqN7lmJ9cMhe/EkZZSvXWKV2vFgzzDoOaCPPVBAWEFYBWqUHn5dqs7OyLWA
	SaaZiCXtvdQv6/cw6ji5pOeS6EcvgQq24N49D/p1mFJg+kWjdqzBgv6V+or4xXZhtREEdLl9ebByj
	Fxw11nCbJo9p2GI0387RWzwDkR9oW76GPEuoPqib3c4OtqiRsp01XPMfYdR5KTLHDp6jnauRsGTW2
	P8sPyDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3hp-00000005a2Q-3v94;
	Fri, 09 Oct 2026 06:03:45 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3hn-00000005a19-3orI;
	Fri, 09 Oct 2026 06:03:44 +0000
X-UUID: 2ad83140c3a711f1afed4741b24580c9-20261008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gVqzy0ZFZMpxYCkrvZ5zhFgzqFeltm3jZ15hOSwBToE=;
	b=nR7oTQFgP1Ab1KKus82NORSF5h+YcNgSOg+S7UdVg8TDFx71CiLHoHR7Y5w6bqwjvMF9og8TVpE1KD3C2YJNaQzA01m7Frszw3jayyKtUuz/O+jeqrG9R+it2lZ053JsAyCK5aupW06F2s4qLcbt/FWfGcQl0Ewn4y+0Yc9ztQw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:a0c7c69e-c91f-4499-80bf-626e110577d5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:ed2f2595-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ad83140c3a711f1afed4741b24580c9-20261008
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shiming.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1732007963; Thu, 08 Oct 2026 23:03:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Oct 2026 14:03:34 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 9 Oct 2026 14:03:31 +0800
From: Shiming Cheng <shiming.cheng@mediatek.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <willemb@google.com>,
	<daniel.zahka@gmail.com>, <alice@isovalent.com>, <sd@queasysnail.net>,
	<eilaimemedsnaimel@gmail.com>, <imv4bel@gmail.com>, <nbd@nbd.name>,
	<dsahern@kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <stable@vger.kernel.org>, <steffen.klassert@secunet.com>,
	<shiming.cheng@mediatek.com>
Subject: [PATCH] net: tcp: fix fraglist GRO flushing on alternating TCP PSH flag
Date: Fri, 9 Oct 2026 14:03:08 +0800
Message-ID: <20261009060319.6229-1-shiming.cheng@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_230343_961740_32A08717 
X-CRM114-Status: GOOD (  10.22  )
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

In forwarding and tethering scenarios where fraglist GRO (is_flist) is
enabled, TCP packet aggregation frequently fails when packets arrive
with alternating PSH flags.

Specifically, when a sender alternates between [ACK] and [PSH, ACK]
segments, tcpdump reveals that no aggregation occurs:

  Before this patch:
  ... [ACK] Seq=10835225 Len=1348
  ... [PSH, ACK] Seq=10836573 Len=1348  <-- Triggers premature flush
  ... [ACK] Seq=10837921 Len=1348
  ... [PSH, ACK] Seq=10839269 Len=1348  <-- Triggers premature flush

The general GRO path allows the aggregation of packets with different
PSH/FIN flags by masking them out at the beginning of `tcp_gro_receive`.
However, the fraglist GRO path (is_flist) still enforces an unmasked
flags comparison: `flush |= (__force int)(flags ^ tcp_flag_word(th2))`.
This redundant check causes premature flushing on any incoming PSH packet,
shattering aggregation and increasing softirq overhead.

After this patch, the redundant flags check is removed from the `is_flist`
branch. The [ACK] and [PSH, ACK] packets are successfully aggregated into
a single fraglist, and are safely flushed together upon encountering the
PSH flag at `out_check_final`, preserving the required TCP push semantics.

Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
---
 net/ipv4/tcp_offload.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index e74d99ca9fac..54b40ec95a08 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -328,7 +328,6 @@ struct sk_buff *tcp_gro_receive(struct list_head *head, struct sk_buff *skb,
 	flush |= skb_cmp_decrypted(p, skb);
 
 	if (unlikely(NAPI_GRO_CB(p)->is_flist)) {
-		flush |= (__force int)(flags ^ tcp_flag_word(th2));
 		flush |= skb->ip_summed != p->ip_summed;
 		flush |= skb->csum_level != p->csum_level;
 		flush |= NAPI_GRO_CB(p)->count >= 64;
-- 
2.45.2


