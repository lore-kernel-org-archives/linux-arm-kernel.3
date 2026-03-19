Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E1B108E1F4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IzcuIzOArL4y2VL0kbKQCqGt0FBXgMPx56ttmuyG3tY=; b=EIvmP95sLT9krZzabZ6LYNt2oC
	tFQXUb96wTaT/j67X8ABVutRVQj8yRiu2X0nzHh8WROCr9os/XShZDUtOTvEC9WFj/mko+DjEUMwz
	vMGJo201nr7LzrhBmyr4BwqLrB0Wu1u78H7EeRdSWztSTdWnJwWU1zeiYPHKKLhS0OK19E26onqru
	31RzJ7GotJbGj4XuARxot/D1gh3eJkU3I91+l4Jg+KWAdEDNA7/L23ZUgFEIiRFrM5e78DUpbnEW1
	Nz6y8IV8o46TUsAtpSyNsHuQ1BAroi3gr3LAejNARGnnaCFsShIOEUQcJ041GjJZgpP2kr2UR6/eS
	zchgEegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BhJ-0000000AY91-3Weh;
	Thu, 19 Mar 2026 11:37:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bh7-0000000AY5a-2Wrd;
	Thu, 19 Mar 2026 11:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D3D160134;
	Thu, 19 Mar 2026 11:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C84DC2BCB0;
	Thu, 19 Mar 2026 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773920260;
	bh=MIzWb14uWVOfRWgpIeFl+RNd8KZIR7SHWTeh3IGagsQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=f6M0tH+13gjROVN0algEs0UAtPylRxcskt4+z7oJDiU3nJhwJGAidWq9MkVnkLlvT
	 ohRviyYe6tqUqH8OMUjod6d9DnK8a70ESAtKetQOLR0sNknlqAIW44j8NLRDhHHiwy
	 Ir06iBY+53c4LOGLUWeEXZaPsDRl4a+qvhL6vitM=
Subject: Patch "net: gso: fix tcp fraglist segmentation after pull from frag_list" has been added to the 6.6-stable tree
To: 1468888505@139.com,angelogioacchino.delregno@collabora.com,davem@davemloft.net,dsahern@kernel.org,edumazet@google.com,gregkh@linuxfoundation.org,kuba@kernel.org,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,nbd@nbd.name,pabeni@redhat.com,patches@lists.linux.dev,willemb@google.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 12:37:12 +0100
In-Reply-To: <20260302065522.2695626-1-1468888505@139.com>
Message-ID: <2026031912-cacti-mumbo-b576@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    net: gso: fix tcp fraglist segmentation after pull from frag_list

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     net-gso-fix-tcp-fraglist-segmentation-after-pull-from-frag_list.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-222524-greg=kroah.com@vger.kernel.org Mon Mar  2 07:56:08 2026
From: Li hongliang <1468888505@139.com>
Date: Mon,  2 Mar 2026 14:55:22 +0800
Subject: net: gso: fix tcp fraglist segmentation after pull from frag_list
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, nbd@nbd.name
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, edumazet@google.com, davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, willemb@google.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Message-ID: <20260302065522.2695626-1-1468888505@139.com>

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 17bd3bd82f9f79f3feba15476c2b2c95a9b11ff8 ]

Detect tcp gso fraglist skbs with corrupted geometry (see below) and
pass these to skb_segment instead of skb_segment_list, as the first
can segment them correctly.

Valid SKB_GSO_FRAGLIST skbs
- consist of two or more segments
- the head_skb holds the protocol headers plus first gso_size
- one or more frag_list skbs hold exactly one segment
- all but the last must be gso_size

Optional datapath hooks such as NAT and BPF (bpf_skb_pull_data) can
modify these skbs, breaking these invariants.

In extreme cases they pull all data into skb linear. For TCP, this
causes a NULL ptr deref in __tcpv4_gso_segment_list_csum at
tcp_hdr(seg->next).

Detect invalid geometry due to pull, by checking head_skb size.
Don't just drop, as this may blackhole a destination. Convert to be
able to pass to regular skb_segment.

Approach and description based on a patch by Willem de Bruijn.

Link: https://lore.kernel.org/netdev/20240428142913.18666-1-shiming.cheng@mediatek.com/
Link: https://lore.kernel.org/netdev/20240922150450.3873767-1-willemdebruijn.kernel@gmail.com/
Fixes: bee88cd5bd83 ("net: add support for segmenting TCP fraglist GSO packets")
Cc: stable@vger.kernel.org
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Link: https://patch.msgid.link/20240926085315.51524-1-nbd@nbd.name
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Li hongliang <1468888505@139.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/ipv4/tcp_offload.c   |   10 ++++++++--
 net/ipv6/tcpv6_offload.c |   10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -104,8 +104,14 @@ static struct sk_buff *tcp4_gso_segment(
 	if (!pskb_may_pull(skb, sizeof(struct tcphdr)))
 		return ERR_PTR(-EINVAL);
 
-	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST)
-		return __tcp4_gso_segment_list(skb, features);
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
+		struct tcphdr *th = tcp_hdr(skb);
+
+		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
+			return __tcp4_gso_segment_list(skb, features);
+
+		skb->ip_summed = CHECKSUM_NONE;
+	}
 
 	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL)) {
 		const struct iphdr *iph = ip_hdr(skb);
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -106,8 +106,14 @@ static struct sk_buff *tcp6_gso_segment(
 	if (!pskb_may_pull(skb, sizeof(*th)))
 		return ERR_PTR(-EINVAL);
 
-	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST)
-		return __tcp6_gso_segment_list(skb, features);
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
+		struct tcphdr *th = tcp_hdr(skb);
+
+		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
+			return __tcp6_gso_segment_list(skb, features);
+
+		skb->ip_summed = CHECKSUM_NONE;
+	}
 
 	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL)) {
 		const struct ipv6hdr *ipv6h = ipv6_hdr(skb);


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.6/pnfs-fix-a-deadlock-when-returning-a-delegation-during-open.patch
queue-6.6/net-add-support-for-segmenting-tcp-fraglist-gso-packets.patch
queue-6.6/net-fix-segmentation-of-forwarding-fraglist-gro.patch
queue-6.6/nfs-pass-explicit-offset-count-to-trace-events.patch
queue-6.6/net-gso-fix-tcp-fraglist-segmentation-after-pull-from-frag_list.patch
queue-6.6/nfs-fix-a-deadlock-involving-nfs_release_folio.patch

