Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2A2105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=LW7MxHGhp1el8ATAcJpfwIkDN0
	yvQO4t5vOTJyxsHYfcemu98+ccHpirGEYmnZB5YbqGqa2dH+pIimltZesN6ZnS/4VA2N/j5+Ii3NZ
	bCSjO3R0h0Qv8rLv8JQlsrfGvzqucWm8nPv84IxVQrejv14C2mxq2e6wwM60zqYcnfE6mOJ5x9JaL
	yjQW6RmmYIY37M1NcPMc1w5VIiFW4u2Oij7yxGCUMoPQFV9mlndGJA0UPzl18QxjAdftrXqdQhf9n
	N/IpNhHYkqtxXJk5pkeRHXxjqBnQJILaz3ZJzFzss0WuZPluLFgVxKXD+d9wov1aMsHIAPjmV2x2p
	KKs/0BXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zC6-0000000HRXe-2a2r;
	Fri, 13 Mar 2026 09:52:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zC1-0000000HRTi-46qd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=uZnFFSTKXzFHGtYq5a33h/EQiA
	lh69E2aUdCQ1LRzIEvTBNhzZZEpvoH7iXA1ZoRZNnCcrnbHu097aeiwtq5fq1NknCFBj4lcbS4Bj7
	ciDAzvQj2QiMcKm0ySYIhh5wiv43lCaKwmIO7nYKC3iZsU2Iw7jCDe6vWuAUsJeBmp/yKuNFatPFI
	1yKzqcDK4s7oPb+lb8ESdpY/QfStAkOWMsEp1Nj4Ax3/6282PNVaGyolsY7gFcw4BuBNSeUP2Hkmk
	0N3ZhR67YIV0K3IIW3KS0ZJlAKljWqkCyX6PgZaXwOUdA/7xCfyznYq2aQUhl73YliewwwZ94QE+Z
	q74XyGfQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBy-0000000CtPW-3zcG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=jTLWOTTI8LEj7AJDmgTwO9G6E+
	nWRoBrPaIWgygbDf3lt7woHoW07/aqpuNb14l4NF5vN006T+dNAHeZyD1c/vLFi21n5E53Q0/KPmU
	RMGLM4rR7YN2bGOmDhc9agAVw5sOhWw41WkpxXAuvkm49R5CDWlFAve4LGEEJ6rifEWNQfPz2fmgq
	L5HYQG5GSK4Hd9pp0enxRAmOyjGGzzuKXixx+4/XObrty+NbfV0IQzktGkHASzF+sUOY90/U6KsA/
	AfLdkcqsy+fRG+ZkqSmH+kyeUocPY7TPsP82WTuazL9xJQyGYxHyYpPcxTdpn5dcBVraqNJlNKZDk
	CbQJHq/g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47230 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0zBl-000000000go-03Td;
	Fri, 13 Mar 2026 09:52:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0zBh-0000000D4GG-1EMb;
	Fri, 13 Mar 2026 09:52:09 +0000
In-Reply-To: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
References: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v3 14/15] net: stmmac: remove tx_tail_addr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0zBh-0000000D4GG-1EMb@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:52:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095227_026109_B4BF4BD5 
X-CRM114-Status: GOOD (  11.21  )
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

There is only one place where tx_q->tx_tail_addr is used - the new
stmmac_set_queue_tx_tail_ptr(). Make this a local variable and remove
it from struct stmmac_tx_queue.

This commit does not change the semantics - the hardware relies upon
the descriptor ring not crossing a 4GiB boundary as the high address
bits are programmed into a separate register via stmmac_init_tx_chan().
Hence, truncating the DMA address to 32-bit is fine as the register it
will be programmed into is 32-bit, and the high bits are handled
elsewhere.

Also change the type of desc_size to size_t, as this variable is
initialised from sizeof().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d1f8383d1c04..7cc5967aecd7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -79,7 +79,6 @@ struct stmmac_tx_queue {
 	unsigned int cur_tx;
 	unsigned int dirty_tx;
 	dma_addr_t dma_tx_phy;
-	dma_addr_t tx_tail_addr;
 	u32 mss;
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4521469c5e1d..55b79e9e637f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -389,12 +389,13 @@ static void stmmac_set_queue_tx_tail_ptr(struct stmmac_priv *priv,
 					 struct stmmac_tx_queue *tx_q,
 					 unsigned int chan, unsigned int index)
 {
-	int desc_size;
+	size_t desc_size;
+	u32 tx_tail_addr;
 
 	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, chan);
+	tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
+	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_tail_addr, chan);
 }
 
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
-- 
2.47.3


