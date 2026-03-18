Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D0710775FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSwFlWBNCnfkLPqu9SlfOdkms5iUPC43AY1hv4lA+8A=; b=swf+S/mimF2XvAepVqWi5qUcHn
	1lzXVeTBDmsqG5KOjHOSWBxmOQnwXS12WIjOycqJzOe0HhCtqG2lbwe0WfT7fp+QjHONsItVb2R+N
	d7DDXFWGhJN3vhdg6qW0sSFvo7MsurZhBRHTo2hOZAvMddQrlZouRaWfRdssviXdXvRzyloNQrNvI
	yzadUbSVowmLK1qyJwkQAsPxJIZOfeDPBHwRdulA6xA1qSODcUQfwsOeQdXZhmFD/K9YbIZqPsbLS
	Ji1ZfkintwZopJ57g7Y0kjicdPEEp8gYcIMLzFnlc0d/2xKB0pH6zHejd5lRbUdfnl2V9T8S8tQk5
	0EIrTSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbg-00000009AKl-483z;
	Wed, 18 Mar 2026 18:27:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbd-00000009AJd-2GkI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=PSwFlWBNCnfkLPqu9SlfOdkms5iUPC43AY1hv4lA+8A=; b=o16VkyajKcjHO7boZNZDRjnmIT
	UMA7zVLv3kWrPaMLF3+gTNynvEPL64A0qvPgWv7QtfCGoesOd3d0GfTyFy51HyI/nNwJkYH08mr7u
	xOgLSFr2zB4qhAcaPQtZt7QgPLh22A4aYBH6CQLrtGP8rDOr2+n/5QrsK/iEvXRLhRmdZI279bXtc
	UDfxe/AQTke+HMKK09WMoPfd9AZxjLXvsbSd4OLhQ3MVxWM/OKZgujbdzvghIflxz7SI5OCmlA+Ft
	RkXV8J5m/Zgluq+nLAyTb5F6pUNaAcGTMXuRF5ZL4h8juqqqIXhvgCXQVmcfVmcPGvCNnDqIf3+MZ
	m7hMgwlw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vba-0000000C1ZP-2KqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PSwFlWBNCnfkLPqu9SlfOdkms5iUPC43AY1hv4lA+8A=; b=l1osFTwwIDvtSDGyILlfVKlsgG
	a+HfDLMmIkcYX5iV6n4lWi9+vB7KYJvYW/Qljq3nOxbqjqJTfejBqVOtOEtytPdig8/0sFM2KNKlW
	u5RtMZ5zZTjkOwGzYkNSChdtYu6hACmrh4vr1nNETOgFBod1xsIU4q8dDLMQUT+fL64y3eKrOLWeR
	FBx9wDOjHpMlRmzQ8EUKdIs+jpl0U/1wVf1KOb1czFJYz6jN3/pfprWwF+KvJJ9UaYwctWcbXSXTN
	3+/9NIwXUCNDA5RqrocBrmjEkcOUXQPUVqj5fFNjkQDhG0T2BbezxMQtr/cb4ytigN4PFF6FAKD8N
	QmwGpR2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39140 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2vbW-000000003pl-0kSV;
	Wed, 18 Mar 2026 18:26:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2vbV-0000000DbWi-1O80;
	Wed, 18 Mar 2026 18:26:49 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/5] net: stmmac: use more descriptive names in
 stmmac_xmit()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2vbV-0000000DbWi-1O80@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_182654_675465_C318631E 
X-CRM114-Status: GOOD (  15.62  )
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

Use "frag_size" rather than "len", correcting its type to be
unsigned int. Rename "des" to "dma_addr" since that's what it is.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8a84fdd4577d..3c0206278081 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4684,12 +4684,12 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	unsigned int first_entry, tx_packets;
 	int gso = skb_shinfo(skb)->gso_type;
 	struct stmmac_txq_stats *txq_stats;
+	struct dma_desc *desc, *first_desc;
 	struct dma_edesc *tbs_desc = NULL;
-	struct dma_desc *desc, *first;
 	struct stmmac_tx_queue *tx_q;
 	int i, csum_insertion = 0;
 	int entry, first_tx;
-	dma_addr_t des;
+	dma_addr_t dma_addr;
 	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
@@ -4756,10 +4756,10 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	desc = stmmac_get_tx_desc(priv, tx_q, entry);
-	first = desc;
+	first_desc = desc;
 
 	if (has_vlan)
-		stmmac_set_desc_vlan(priv, first, STMMAC_VLAN_INSERT);
+		stmmac_set_desc_vlan(priv, first_desc, STMMAC_VLAN_INSERT);
 
 	enh_desc = priv->plat->enh_desc;
 	/* To program the descriptors according to the size of the frame */
@@ -4774,7 +4774,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	for (i = 0; i < nfrags; i++) {
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
-		int len = skb_frag_size(frag);
+		unsigned int frag_size = skb_frag_size(frag);
 		bool last_segment = (i == (nfrags - 1));
 
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
@@ -4782,16 +4782,17 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 
-		des = skb_frag_dma_map(priv->device, frag, 0, len,
-				       DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		dma_addr = skb_frag_dma_map(priv->device, frag, 0, frag_size,
+					    DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->device, dma_addr))
 			goto dma_map_err; /* should reuse desc w/o issues */
 
-		stmmac_set_tx_skb_dma_entry(tx_q, entry, des, len, true);
-		stmmac_set_desc_addr(priv, desc, des);
+		stmmac_set_tx_skb_dma_entry(tx_q, entry, dma_addr, frag_size,
+					    true);
+		stmmac_set_desc_addr(priv, desc, dma_addr);
 
 		/* Prepare the descriptor and set the own bit too */
-		stmmac_prepare_tx_desc(priv, desc, 0, len, csum_insertion,
+		stmmac_prepare_tx_desc(priv, desc, 0, frag_size, csum_insertion,
 				       priv->descriptor_mode, 1, last_segment,
 				       skb->len);
 	}
@@ -4839,7 +4840,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		netdev_dbg(priv->dev,
 			   "%s: curr=%d dirty=%d f=%d, e=%d, first=%p, nfrags=%d",
 			   __func__, tx_q->cur_tx, tx_q->dirty_tx, first_entry,
-			   entry, first, nfrags);
+			   entry, first_desc, nfrags);
 
 		netdev_dbg(priv->dev, ">>> frame to be transmitted: ");
 		print_pkt(skb->data, skb->len);
@@ -4858,7 +4859,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	u64_stats_update_end(&txq_stats->q_syncp);
 
 	if (priv->sarc_type)
-		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
+		stmmac_set_desc_sarc(priv, first_desc, priv->sarc_type);
 
 	/* Ready to fill the first descriptor and set the OWN bit w/o any
 	 * problems because all the descriptors are actually ready to be
@@ -4867,15 +4868,15 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (likely(!is_jumbo)) {
 		bool last_segment = (nfrags == 0);
 
-		des = dma_map_single(priv->device, skb->data,
-				     nopaged_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		dma_addr = dma_map_single(priv->device, skb->data,
+					  nopaged_len, DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->device, dma_addr))
 			goto dma_map_err;
 
-		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, des, nopaged_len,
-					    false);
+		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
+					    nopaged_len, false);
 
-		stmmac_set_desc_addr(priv, first, des);
+		stmmac_set_desc_addr(priv, first_desc, dma_addr);
 
 		if (last_segment)
 			stmmac_set_tx_dma_last_segment(tx_q, first_entry);
@@ -4884,11 +4885,11 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 			     priv->hwts_tx_en)) {
 			/* declare that device is doing timestamping */
 			skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-			stmmac_enable_tx_timestamp(priv, first);
+			stmmac_enable_tx_timestamp(priv, first_desc);
 		}
 
 		/* Prepare the first descriptor setting the OWN bit too */
-		stmmac_prepare_tx_desc(priv, first, 1, nopaged_len,
+		stmmac_prepare_tx_desc(priv, first_desc, 1, nopaged_len,
 				       csum_insertion, priv->descriptor_mode,
 				       0, last_segment, skb->len);
 	}
@@ -4900,7 +4901,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
 	}
 
-	stmmac_set_tx_owner(priv, first);
+	stmmac_set_tx_owner(priv, first_desc);
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
 
-- 
2.47.3


