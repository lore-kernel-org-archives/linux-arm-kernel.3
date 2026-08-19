Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666D2C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Qk/nPnOw6aepbRPixLa0uauS/wumrW6H2o503UEaho=; b=f1YeLR2iYKUbYMW0wKfKpXsBXM
	lMnC6sb2rULRZhnn2tDNlrQUUynwNdtjiGDpintLdVsP22F+3DiPKECfvRLTPUt8WRqyf5dXUPNZF
	1RQP5dL1R+F/HXJk2DVNtN8k7zHQAka7FtTUbbdSgWUzfgT6OJ5/I7QR++23DNF4Moq9mjX/J2u86
	eSCVOs6vXwrPyIQzXpBusRiNJQv3Cs1c/ukzkzNy2n/XAuZOIhrUrEzn0vMOLPY9BvSSDeW3B5ajt
	TVcyDlRAK2a419m7zd/bL783nYDCIU5XBpwNo2adjmHQuJXYb1jlKBG3nxY0BXXb6NY1/xeueQOl/
	CdgRY4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcfA-00000009Q9w-2rtL;
	Wed, 19 Aug 2026 09:32:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcf7-00000009Q9Q-463A;
	Wed, 19 Aug 2026 09:32:47 +0000
X-UUID: eb913d109bb011f1afed4741b24580c9-20260819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7Qk/nPnOw6aepbRPixLa0uauS/wumrW6H2o503UEaho=;
	b=bQOSuvGAAfNhxXtyCzrXX2ftp0Kn4jtrpGrWIPWZ3eXgCZv12Dj8YUZ/pEGS/EDNSWMope/jhmLIpY29qZ78SzYeTheI7s7q5sG9E51lCWzZ3p+bMTfyFYoDkF7Rs7mVMo3DElZpPgIhOsiIMbdlqx8Yo7yWX2Kxtw8wmXYH7/I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:066c51ec-b860-424d-b873-5efcf019fe38,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:84eb2ffe-f4cb-4ad2-b022-e3ac6648bf25,B
	ulkID:nil,BulkQuantity:0,SF:102|123|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eb913d109bb011f1afed4741b24580c9-20260819
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <zhaoping.shu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1111249570; Wed, 19 Aug 2026 02:32:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 19 Aug 2026 17:32:36 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 19 Aug 2026 17:32:35 +0800
From: <zhaoping.shu@mediatek.com>
To: <edumazet@google.com>, <ncardwell@google.com>, <kuniyu@google.com>,
	<davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<horms@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <dsahern@kernel.org>,
	<willemb@google.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <haijun.liu@mediatek.com>, <xiayu.zhang@mediatek.com>,
	<lambert.wang@mediatek.com>, <Iven.Yang@mediatek.com>, HW He
	<hw.he@mediatek.com>, Zhaoping Shu <zhaoping.shu@mediatek.com>
Subject: [PATCH net v4] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
Date: Wed, 19 Aug 2026 17:32:26 +0800
Message-ID: <20260819093226.193385-1-zhaoping.shu@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_023246_104648_71E0124E 
X-CRM114-Status: GOOD (  18.72  )
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

From: HW He <hw.he@mediatek.com>

A device supports GRO_HW, and the device driver enables the
NETIF_F_GRO_FRAGLIST feature. During a tethering test,
skb_gro_receive_list() reaggregates the GSO packet. However,
skb_segment_list() cannot segment this packet back into
the original packets, which leads to IP fragmentation or packet drop.

Scenario (Tethering/Forwarding):
1.Driver submits a single TCP packet, P1. P1 is kept in the
gro_list as the first packet.

2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
multiple TCP packets by HW_GRO, and its non-linear data is stored in
frags[].

3. P1 and P2 match the GRO rules, and since there is no local socket,
they are aggregated by skb_gro_receive_list(). The resulting skb,
P3, has a frag_list entry that still contains frags[]:
P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
                                    [ frag[1] ]
                                    [ frag[2] ]
                                    ...
4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
skb_segment_list() to segment P3. However, skb_segment_list() only
segments the entries in frag_list. It does not segment the frags[]
inside P2, so P3 is not restored to the original packets, which leads
to IP fragmentation or packet drop in the following path.

Check skb_is_gso(skb) and current GRO method, make sure fraglist GRO
applies to consecutive non-GSO skb, others adopt regular GRO path.

Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
Signed-off-by: HW He <hw.he@mediatek.com>

---
[3]: https://patchwork.kernel.org/patch/14747095
[2]: https://patchwork.kernel.org/patch/14706032
[1]: https://patchwork.kernel.org/patch/14702209
---
 net/ipv4/tcp_offload.c   | 22 ++++++++++++++++------
 net/ipv6/tcpv6_offload.c | 15 +++++++++++++--
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index 3b1fdcd3cb29..e74d99ca9fac 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -332,6 +332,7 @@ struct sk_buff *tcp_gro_receive(struct list_head *head, struct sk_buff *skb,
 		flush |= skb->ip_summed != p->ip_summed;
 		flush |= skb->csum_level != p->csum_level;
 		flush |= NAPI_GRO_CB(p)->count >= 64;
+		flush |= NAPI_GRO_CB(p)->is_flist != NAPI_GRO_CB(skb)->is_flist;
 		skb_set_network_header(skb, skb_gro_receive_network_offset(skb));
 
 		if (flush || skb_gro_receive_list(p, skb))
@@ -395,12 +396,20 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 	struct net *net;
 	int iif, sdif;
 
-	if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
-		return;
-
 	p = tcp_gro_lookup(head, th);
 	if (p) {
-		NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
+		/* flist GRO applies to consecutive non-GSO skbs */
+		if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
+			NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
+			return;
+		}
+
+		/* Fall back to the regular GRO path */
+		if (NAPI_GRO_CB(p)->count == 1)
+			NAPI_GRO_CB(p)->is_flist = 0;
+
+		NAPI_GRO_CB(skb)->is_flist = 0;
+
 		return;
 	}
 
@@ -410,7 +419,7 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 	sk = __inet_lookup_established(net, iph->saddr, th->source,
 				       iph->daddr, ntohs(th->dest),
 				       iif, sdif);
-	NAPI_GRO_CB(skb)->is_flist = !sk;
+	NAPI_GRO_CB(skb)->is_flist = !sk && !skb_is_gso(skb);
 	if (sk)
 		sock_gen_put(sk);
 }
@@ -430,7 +439,8 @@ struct sk_buff *tcp4_gro_receive(struct list_head *head, struct sk_buff *skb)
 	if (!th)
 		goto flush;
 
-	tcp4_check_fraglist_gro(head, skb, th);
+	if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
+		tcp4_check_fraglist_gro(head, skb, th);
 
 	return tcp_gro_receive(head, skb, th);
 
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index f2a659cd6183..eec3778855eb 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -26,7 +26,18 @@ static void tcp6_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 
 	p = tcp_gro_lookup(head, th);
 	if (p) {
-		NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
+		/* flist GRO applies to consecutive non-GSO skbs */
+		if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
+			NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
+			return;
+		}
+
+		/* Fall back to the regular GRO path */
+		if (NAPI_GRO_CB(p)->count == 1)
+			NAPI_GRO_CB(p)->is_flist = 0;
+
+		NAPI_GRO_CB(skb)->is_flist = 0;
+
 		return;
 	}
 
@@ -36,7 +47,7 @@ static void tcp6_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 	sk = __inet6_lookup_established(net, &hdr->saddr, th->source,
 					&hdr->daddr, ntohs(th->dest),
 					iif, sdif);
-	NAPI_GRO_CB(skb)->is_flist = !sk;
+	NAPI_GRO_CB(skb)->is_flist = !sk && !skb_is_gso(skb);
 	if (sk)
 		sock_gen_put(sk);
 #endif /* IS_ENABLED(CONFIG_IPV6) */
-- 
2.17.0


