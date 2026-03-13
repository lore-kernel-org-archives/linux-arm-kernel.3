Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E9105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWguanKzx4dLZRgBponms/+CBeTYJZLbKyDkuByIfqc=; b=eie3MXiyW/f5LouB6umOmxaZfP
	69W/CrXxY8aicf67cf/8q1zx+AAvU7J1KO47PC2v5gdx49qBhNBYa3HJCx25HzU/alxftOggwhNny
	LgXTYZMAarO+L8XKKRdpqU/d0v41s+liuZ/kTo3pC/by+A53+KfkRF1cjTs1ni8qxAycnNeQzM9F3
	QwPQHej3mXqjON1avqYKrDQaAnuK5K295YU9ViRnpq6Jy8MdF4p9lHoq8vpru9kh1C5+K+7x/GmOy
	WC5zkF8q4AIO/KZhM80J0mWjA8WxncjKDEuBKCguWTMXyvEM7cpoav+o/DMntEHp7UWIKGk9xGvtr
	hQ7/cyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBR-0000000HR4k-2QWE;
	Fri, 13 Mar 2026 09:51:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBQ-0000000HR2n-08AS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=WWguanKzx4dLZRgBponms/+CBeTYJZLbKyDkuByIfqc=; b=IWjacmkAiQr37MQAqvAaSeQ2fJ
	MmmlTJx19Um3X/GZppWqxo/eJTQakugZV7hf/P21Pe/H4jajSi4X5b46uwtZS1wtPtBbXmBRUDYk0
	pYYbhzQuMnnxaWTP9ES3eEN38sXPz6jXjULyQHUyvWj1zRqC+2azjmreI4VFhzjqYG/cyMisFyBku
	zvs41ybkOoeERLbM8YXau1EiOMi/C+5H7/IN0zwzIKmua8Vp8MhCWXjecK7Pw/tpx85INyXb5cP62
	Y6khRNueJAyWRaDmUoz3hXbTUv0SrS5GfzWmeaRHI0sSI9qfn1mhHCxGPeXi9+OWncJ8U/LR36tpZ
	watVirjg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBN-0000000316D-0Jhj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WWguanKzx4dLZRgBponms/+CBeTYJZLbKyDkuByIfqc=; b=a1tm84FU6t+3Fz8FLHBGkit27I
	cCpDxng7tyK5ZHF0wCzW5FkTYJ19ubo1tI8q69HeJq1Robr41vCb+czEepZSMX2z01ajjzyKlqurp
	27OLV9UKjg6EzRfckIMqqkjngfv/YD0U5C8PA/gdLc+1e8LrqN1uXK/C5gGHpsLBWPTko5Kp/NMDi
	zl+Ul+2fwKNfY/EYCBPomzlhr/237fd0YdxEJC7d2hqi59eVDIEYMhfX8o/5FjtPxerFCDjn6zTkY
	pBW3L11BzHbuAEivjCSCaEfx/i5g5hVXBm8WX+yiWVso20YMP1TRxhvR+F0uZFWuVdSec/IcZBy4W
	qRN3/wzg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37492 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0zB8-000000000eG-3xYz;
	Fri, 13 Mar 2026 09:51:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0zB7-0000000D4Fa-1uyx;
	Fri, 13 Mar 2026 09:51:33 +0000
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
Subject: [PATCH net-next v3 07/15] net: stmmac: remove rx_tail_addr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0zB7-0000000D4Fa-1uyx@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:51:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095149_135111_17EF318B 
X-CRM114-Status: GOOD (  12.69  )
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

There is only one place where rx_q->rx_tail_addr is used - the new
stmmac_set_queue_rx_tail_ptr(). Make this a local variable and remove
it from struct stmmac_rx_queue.

This commit does not change the semantics - the hardware relies upon
the descriptor ring not crossing a 4GiB boundary as the high address
bits are programmed into a separate register via stmmac_init_rx_chan().
Hence, truncating the DMA address to 32-bit is fine as the register it
will be programmed into is 32-bit, and the high bits are handled
elsewhere.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b096a9e090e3..d1f8383d1c04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -131,7 +131,6 @@ struct stmmac_rx_queue {
 	unsigned int buf_alloc_num;
 	unsigned int napi_skb_frag_size;
 	dma_addr_t dma_rx_phy;
-	u32 rx_tail_addr;
 	unsigned int state_saved;
 	struct {
 		struct sk_buff *skb;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8823f8f5b053..1d40168ec68d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -388,8 +388,9 @@ static void stmmac_set_queue_rx_tail_ptr(struct stmmac_priv *priv,
 	 * descriptiors are only supported with dwmac1000 (<v4.0) which
 	 * does not implement .set_rx_tail_ptr
 	 */
-	rx_q->rx_tail_addr = rx_q->dma_rx_phy + index * sizeof(struct dma_desc);
-	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, chan);
+	u32 rx_tail_addr = rx_q->dma_rx_phy + index * sizeof(struct dma_desc);
+
+	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_tail_addr, chan);
 }
 
 /**
-- 
2.47.3


