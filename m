Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DED8606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ehpLxsm7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AYK0kRIC;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=H+SczLrH;
	dkim=neutral header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/gMOzZjG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yK7J/6qmxle1YHTrZ+2BZktTuRTzcLh1DKc2h/dLZvc=; b=ehpLxsm7g7Dfa7ePXirJbSpMQE
	q9QyiT3YSFiuaR2NNNSoNPv3wgJsIOErH4WC8/Ch8us7wasJj/JANjWG8KC1JpgMOLTa81HZbg/ju
	SJUclQJA5+jYIECJCcsJb9gTqYbFXPlxkTzSl+nsm3311AHeZA8KzmsQITt0KoK0fqVrEXoTFbQof
	qS3R9wkX0Gu5A41gRGJBi2E2Hho4DcESB6Ib2LnaRUK+H4cQpSNyI/weXQ8U8UZ+li5t3htNzHih7
	AMD/tKOZdZ9WoVGIkdwmacYvxytX7hqGlDnR6Xf0+G0l+SGRPa25mtPsJZqHZMwNB3KIuP9ve0i21
	u7KS0MmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmoJ-0000000DWnv-2Ipr;
	Thu, 22 Oct 2026 07:01:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmoD-0000000DWm4-3e8m
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 07:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yK7J/6qmxle1YHTrZ+2BZktTuRTzcLh1DKc2h/dLZvc=; b=AYK0kRIC+6o7FESzNatLp3Buug
	AWU9PIeI4sHKO/w+0lySRWxByuQImJQvlgeK0EYsbmz7Ii+G7msIxutw85Nav9WcOequCOYWrtG+5
	m/BvhMsQydrXJ2NP6pVsm/wGtftWNXJJKthZFfhSuvgQNtO9TlguXgt85dyoLJx6NLDTcfpfmIkBM
	f+3KG1iyH4Yv2UH58wx0sP5tnS31poak5Aub+1iO42iX2S558nSrCWbdWKrM/775vlOjccdhzs1Nh
	9GcjHBah1eQW4pc/dZiH9cfMtXLhg3kMAFW3XmoxIHSZebTpGKLI35XbpJxLmIrG/s1VLW5TbEPoq
	W+sqIcng==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmo6-00000006XFN-0UfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:01:52 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792652502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yK7J/6qmxle1YHTrZ+2BZktTuRTzcLh1DKc2h/dLZvc=;
	b=H+SczLrHVW7A+ifh+iTS9ZQDcKS3B2KzchEV5SmH/rQCEbeXB7fxjzjs78wmUXBp39ZFrz
	evf9wPF9sIwQXE0yOG8Kck+5qO4N1igWBRPqJQGuYyMaBiI5nlMG4HeYUSy9fK8JJnlVbO
	Fs5pDNjDRJyQLxWScJ8v4+dDW3WRnH9tWBWLHOjw0E31kjUmj6IH8IQ0OCgZFZDsJNBS0z
	aEg3MLNyXYFqzyUgJGdYdMpcXUH0DKzxY+bZf0c76CVj1dkmd4KB22xAAe6ZMh5UPtViuw
	3EtGthPrznt7LX67+L++vMCWjhUL21jmvcbqaE342SJEhpw0Nsc1MjYfn+SE6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792652502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yK7J/6qmxle1YHTrZ+2BZktTuRTzcLh1DKc2h/dLZvc=;
	b=/gMOzZjGqxlTUpKU91Hs78HSe8JFrl36TMeTNNV2naG1BDhEpL7iSEjWxCyWTjbXhd+p/H
	QjchMCWT2v65lMDA==
Date: Thu, 22 Oct 2026 09:01:35 +0200
Subject: [PATCH net-next v4 2/2] net: stmmac: Stop Tx queue when
 (en|dis)abling XSK pools
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-stmmac_xsk_crashes-v4-2-15c0c750bb96@linutronix.de>
References: <20261022-stmmac_xsk_crashes-v4-0-15c0c750bb96@linutronix.de>
In-Reply-To: <20261022-stmmac_xsk_crashes-v4-0-15c0c750bb96@linutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=fFSY37mPDU/GlZQKPoyghtlJF6WpDyO4lh8uLnchPc4=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBq2bTUNyeRpAjBWLfDb4H6A6kAZo8GA17mGicpq
 jIyPYEOS8qJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCatm01AAKCRDBk9HyqkZz
 gqxnD/9hrLtYGCfghdgwNScqdSL/KGMf8gOMV0f5jONMxruUrDBXoYdMSGGyjsFtTFkqcXWTGn2
 161NT2tWKeuhRXuTPlYU5XNMlwuaPEl3T+o4pFWgpflRK+Q2kiWpaVHNmkIzM+DlOjm0AgQsM97
 2IbAUVzmP5Y/05aAxIlXWLsJDTLoyVp8FnoHAuSvV53bQeEblS6TG8AMDKhCDve7NupLQ4Mi1i/
 mWsjVscIX0dAkfFCjfbR92OTYiR2J56D7jcxUqgERx3m9JQ1cxKsOMwZ5CT4RjEt9dYlhxw83QD
 h1u2Yax8thFXdGT1opHUm7rT0wpoS0iknzDJKKYdI15wZ7LL/cFpyYB2CFjXSG4ekRt0R77/h1R
 XUJwitPWAJaR6TiW/6u0zSEcz3YQdX5H77doYvWDLV5/j3Tocuxw1NoHw9uPWM8ZksOdLPPIhCZ
 SFpmkHwLU8FBJ91IjpitcEClvbO49ipAEoTwY3gkSn9YosSOoa126GJAoBXwb8Q1hJNB6bCS4XB
 Q1ldeOjdYZs+ZMkPM5DUVRy67+vW6osmSrENBL9ctRllJGHefRQYkdnVyNdToISKulqKxBH/0Kf
 IsZW/TcYCSZDJA5hUfJk1nkH52Hgu5jEHujC6VSPD9v6gpZQcUl2bWtm4hTTCtvhSpcMl6040Cc
 BJbqeSnzSluw77g==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_080151_023058_8C2DEAFB 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When enabling or disabling XSK pools in parallel to Tx traffic, kernel
crashes occur. For VLAN tagged frames that happens in stmmac_xmit() ->
dwmac4_set_vlan_tag() and for normal frames in stmmac_xmit() ->
dwmac4_set_addr(). Both of these functions access the Tx DMA descriptors.

The XDP pool (en|dis)ablement frees and reallocates the Tx DMA resources:

 stmmac_disable_tx_queue:
   __free_dma_tx_desc_resources

 stmmac_enable_tx_queue:
   __alloc_dma_tx_desc_resources
   __init_dma_tx_desc_rings

NAPI is disabled during that allocation window, but the Tx queue is not
stopped. Therefore, add the stopping of the Tx queue during the enabling
and disabling of XSK pools.

The issue can be easily reproduced by:

 1. Run iperf
 2. Run application which opens an AF_XDP/ZC socket

Also add a dedicated queue check for the XDP Tx paths.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Suggested-by: Nicolai Buchwitz <nb@tipi-net.de> # XDP Tx checks
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # stm32mp215
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 27c4a249e560..2083520179a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5270,6 +5270,10 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	if (unlikely(xdp_frame_has_frags(xdpf)))
 		num_frames += sinfo->nr_frags;
 
+	/* Ring may be torn down for an XSK pool switch */
+	if (netif_tx_queue_stopped(netdev_get_tx_queue(priv->dev, queue)))
+		return STMMAC_XDP_CONSUMED;
+
 	if (stmmac_tx_avail(priv, queue) < max(num_frames, txq_thr))
 		return STMMAC_XDP_CONSUMED;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 9af9e0cb366c..14445683a5c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -6,6 +6,15 @@
 #include "stmmac.h"
 #include "stmmac_xdp.h"
 
+static void stmmac_xdp_stop_tx_queue(struct stmmac_priv *priv, u16 queue)
+{
+	struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
+
+	__netif_tx_lock_bh(nq);
+	netif_tx_stop_queue(nq);
+	__netif_tx_unlock_bh(nq);
+}
+
 static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 				  struct xsk_buff_pool *pool, u16 queue)
 {
@@ -36,6 +45,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	if (need_update) {
 		napi_disable(&ch->rx_napi);
 		napi_disable(&ch->tx_napi);
+		stmmac_xdp_stop_tx_queue(priv, queue);
 		stmmac_disable_rx_queue(priv, queue);
 		stmmac_disable_tx_queue(priv, queue);
 	}
@@ -46,6 +56,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 		stmmac_enable_rx_queue(priv, queue);
 		stmmac_enable_tx_queue(priv, queue);
 		napi_enable(&ch->rxtx_napi);
+		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
 
 		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
 		if (err)
@@ -73,6 +84,7 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 
 	if (need_update) {
 		napi_disable(&ch->rxtx_napi);
+		stmmac_xdp_stop_tx_queue(priv, queue);
 		stmmac_disable_rx_queue(priv, queue);
 		stmmac_disable_tx_queue(priv, queue);
 		synchronize_rcu();
@@ -87,6 +99,7 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 		stmmac_enable_tx_queue(priv, queue);
 		napi_enable(&ch->rx_napi);
 		napi_enable(&ch->tx_napi);
+		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
 	}
 
 	return 0;

-- 
2.47.3


