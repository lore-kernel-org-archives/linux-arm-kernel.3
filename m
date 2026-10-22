Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D07606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wdv01hS5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RswmPdQg;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tFVIKvpR;
	dkim=neutral header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KoNL7y/D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCvs1/SP9Or5kUcquJYMmgtgDpHHNPbARp5a+KoBLQA=; b=Wdv01hS5enXL+jJyGlndrP64Sg
	L3SvUpR4BMhMyZQ9oNdx4ahsHQIIsCvLk8AtzQ2XrnD3kmdRJHdhQCBPskB7scdKb0dcopBQH7dXT
	JmtsWgXPjHx2wVOuGeUsA+NtHgGM0L6s/QNTr+Fv+uF9GA13y0tSHhKMHIK9yDeveJbO21ZL2rBrF
	ge1eh/InuDYaVaPsFRWX9C/Attgy+eLO42VgAhg/fbqxuhtZgQxVXwg4JvPZjijGDS9a//+ZbNjAm
	ViIEvz4LS3vhwKUmxA9EEZaQLlS9h3gdKU6Kml8Ekt7jSG8BLTo+NdswQYHqWwmDznRaYVw/xuKd2
	2EdvGQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmoJ-0000000DWnh-1ub5;
	Thu, 22 Oct 2026 07:01:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmoD-0000000DWm2-3ExJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 07:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sCvs1/SP9Or5kUcquJYMmgtgDpHHNPbARp5a+KoBLQA=; b=RswmPdQgP+H9De6fI7mM6b3kqH
	xoeJbyTwcKQlFN27MdEo+de6a9T7dfxHCZq6vpZSKVjEMv4Q6+TxK6qKALfO6MVzvjRRUXQK54TtM
	89iPmpZWdgU8aG72ozu3eTP/lbTTDXEmpxAobuYo6SGrAHH/5WZr5wp5fqmBjtJosbVS3vvMRAkP2
	2Bpgn1IDjWnn0UT+q23O+NY38fWYi364JZUtA2iD0tMsdenRDX9ShnZgOmCLg+T2qUsL/aVuVHqLg
	cI9TJ63xwSZ3kQRb6woq6/EPSflrDEY1JAVFIyS5Z7n66QwOGRhqxG/U0Z6Cy3naYsL69xJtM7poi
	93dhoyag==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmo6-00000006XFL-0VA1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:01:52 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792652502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCvs1/SP9Or5kUcquJYMmgtgDpHHNPbARp5a+KoBLQA=;
	b=tFVIKvpRFJp3wOUXQX6Kwgc0ZrJ6vaf9TqGEBeqjAOVQAZ2i1GmhX4SUabMswbvsFre4Ld
	MR0/mdKLFXZGl5Xn4wRTkbeDAzgg+RRlQy965PrTQn7ni/eBcWtwHYoC6CDxgj6PrPidpY
	MZdwWd9/uHQA3Rgb9jMxpq+pODUriiUfQVVUiVtj+LK8CcESBTRxTM33nBBNgWx/7PSuQS
	qyLhnlTXR7dtwBzBlCh2nzo3dQy8b+KfVeDOZ/6M/li/e3Mfpc+fa/6ULIyQI4Dpxof0Kq
	0qaDOJ52BB8n1433jKEvkeS7WhAmO89zPZ+CQTz2URVY0l70aSbhlHKyr+xv9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792652502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCvs1/SP9Or5kUcquJYMmgtgDpHHNPbARp5a+KoBLQA=;
	b=KoNL7y/Dmw5u0J6gOeG2fEpDl+lZoFl8ySlSm1oTMlfWTfOAZ/7RJiQsSRxp+LuPvc42oJ
	SPEpRzuebnfEabBA==
Date: Thu, 22 Oct 2026 09:01:34 +0200
Subject: [PATCH net-next v4 1/2] net: stmmac: Disable NAPI before stopping
 Tx queues in stmmac_xdp_release()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-stmmac_xsk_crashes-v4-1-15c0c750bb96@linutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=OCa+em1H5J5wWafzD28gkNIjAwMCgeaJcWpy7TC3QkE=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBq2bTUeVH21Hx1P3muZy32DL2GnrrXQTEnZuAeP
 tE6dL3oiI6JAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCatm01AAKCRDBk9HyqkZz
 gl+uD/9ixxcXpdcbbYW2t/aWk7A+IHI8onqg8MPMTrA9oTTxrevRAhmOj8+4oXQfSSw+EIQBWLe
 foEtvIE1toLsFo0ZPOAW5UfG6lF/GFvEVuFsUoV4zjpL8insByxC+At62DANpTXKXYjikd2Rjqz
 fyzfv075quf56G86L6LoPWxhrHyt5rjXbrzPiFqsC7H8qCNNQ6djxqc7EIflqhItXytUOpTHNRe
 IRlE3AC21F5CmWXxmHO2lkgKkxJ6TfT64IYEjL7E7TpgjZ4ibUmgUwXOnhGM6eWMZiDbLbn+F5a
 1xDFO3v+BN+/KiUkafhCNW8E56M8LX7EMNemwXidHHjYJEJBALCQXKjqj7s20x5b8HAwN2EP4ov
 euW+8ikPGlWQRzCZPc3G3ZTgLHVdkmpVTZcXz5CzfugTTY5H/vdiNf6ZuMEYrtiQWYdAfzqiBC0
 AIoBp6zmWgSDCu6AMKZnG704E+2vXNftEaAsQvtmgXvg5FL7Y1IRNlmIW8YEU/M4vIffOFMPlBY
 IuJ6qOTp1l9QLhrKHMgitsNyIpDkuLmMKEX5W3jCO7sWK4EzoVzBQrRkgwae/dLYFrzSaX8mY8k
 gRPX5RdwJq5EFqO/DtA+CqIsdf/g1nUMzAeHv7sgeVZ6MZLyWW5SyiiWgqaZOBK2lwD2mR/aK13
 Fn+9N7EklnmkQdA==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_080150_333159_3932A7E9 
X-CRM114-Status: GOOD (  13.50  )
X-Spam-Score: -0.9 (/)
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

Attaching an XDP program while Tx traffic is running results in kernel
crashes in stmmac_xmit() -> dwmac4_set_addr().

Loading an XDP program tears down and reallocates all DMA resources via
stmmac_xdp_release() and stmmac_xdp_open(). stmmac_xdp_release() stops
the Tx queues before disabling NAPI:

 stmmac_xdp_release:
   netif_tx_disable
   stmmac_disable_all_queues
   ...
   free_dma_desc_resources

A Tx NAPI poll may still be in flight at that point. stmmac_tx_clean()
takes the Tx queue lock, reaps completed descriptors and wakes the queue
again when it observes it stopped with enough descriptors available.
Nothing stops the queue afterwards, so the Tx path resumes while
free_dma_desc_resources() releases the descriptor rings underneath it.

On non-coherent platforms dma_free_coherent() tears down the vmalloc
mapping of the descriptors, so the subsequent stmmac_xmit() faults on an
unmapped address instead of corrupting memory silently.

Disable NAPI first and stop the Tx queues afterwards, which is the order
already used by __stmmac_release().

The issue can be easily reproduced by:

 1. Run iperf
 2. Run application which opens an AF_XDP/ZC socket

Assisted-by: LLM
Fixes: 77711683a504 ("net: stmmac: ensure tx function is not running in stmmac_xdp_release()")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # stm32mp215
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fb53b1f17714..27c4a249e560 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7222,15 +7222,15 @@ void stmmac_xdp_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
-	/* Ensure tx function is not running */
-	netif_tx_disable(dev);
-
 	/* Disable NAPI process */
 	stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+	/* Ensure tx function is not running */
+	netif_tx_disable(dev);
+
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 

-- 
2.47.3


