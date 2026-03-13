Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE962105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=w4CzYtB+snjj/cu2ZOb/HKiimj
	TgOETjUeeonRGqRclLxEjZitEdkZdocgNlSNUn7EXvrYqb7QVBFMUOWDj805/FMNqpE7ttK7/sRAY
	wO+e6Jl9gKPDWtn4VW9CPccQPAQUCBG23IRV7VQH62DQeQe+MFbL2RGhFcF2ow0gE4OkjI5ar8wc7
	LCg7musTL4ASyrPawFShN5txypGr0p/prd5kwEP8ibM2EXdpU4Zd0ID69IT7X3nJ+EgmmuE2Wj9HP
	P2TXhiJKTjtbqW95LXciu1rpseUz66Gk+AhPhuqQVf2moI1JgzKAnRtH0seRIxi0PZH+3TBPcG6ma
	YXdAo3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBn-0000000HRJm-2eUa;
	Fri, 13 Mar 2026 09:52:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBj-0000000HRGj-34Ov
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=PeaO/3zvLCuNcCNe/SYrmYfEDy
	MpjwMNBbSZ4qZXpZmLHxfg5n56xWlHwJWJJM7akyMeM9ZkXxGcrx8FY8C0Hx+joIi2sbiIHLWJc67
	vCNQwkGH3T0JEhut5QZ9Cj805eaVfUMJnbt3OfbT2gQ1mfPGEus8TcX5lwdIgpu1Gey18dT+pY6Mp
	L3hb9P8uO5jGfZsF4N8LrJPYd/blbHwv7qrowWAXuKslLuOdtzfcCHbuKCLHbXd09jc6wPZizTEvA
	rtwGbT49MtLrMhEQap+16PE0E18N397N0PDi5yiYgWcYVW4qv2nJ4tbXZiCNz1Rh+hx4/XaTOO+hA
	9ry1stWw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBg-0000000CtNM-2gcK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=XGHzYzr9IJ3lRVA4uFgnlsjBS2
	fQNUwpGZFIr6tQ4WJDXwiJHafuOlV/XTvfylE2pmm3wr6Y70YeKBlsHI/IrgoE8j5hvkbK5d4MHZN
	D/p4TnTEoWzFsBDPk8hlgGKKIyMOEDzWEWm2A/FYrJZal8vzC0Os52uNKtJVE7Ad5SbuSv5sRHW8L
	coyXm4iW39v7U7gONyohbpcWZR3KBpJ6eFKx6xa3y5MAbFR3RfsXHd2Uslc7HfGBMyWnNHu3suGYu
	tcBk3Dbytl/C21hQn0J2nKydlUoelmkAPg/5GnnxJDRGfawlI5/UnLpxjPp2goTY2/AM7EH+tsW7f
	ka7Xf/IQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33540 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0zBP-000000000fN-0hgI;
	Fri, 13 Mar 2026 09:51:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0zBM-0000000D4Fs-3Pi1;
	Fri, 13 Mar 2026 09:51:48 +0000
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
Subject: [PATCH net-next v3 10/15] net: stmmac: simplify
 stmmac_set_queue_rx_buf_size()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0zBM-0000000D4Fs-3Pi1@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:51:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095208_717067_D2C0C540 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Clean up the new stmmac_set_queue_rx_buf_size() to simplify the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 47b536c15c0e..032ef9fba8b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -399,16 +399,12 @@ static void stmmac_set_queue_rx_buf_size(struct stmmac_priv *priv,
 {
 	u32 buf_size;
 
-	if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
+	if (rx_q->xsk_pool && rx_q->buf_alloc_num)
 		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-		stmmac_set_dma_bfsize(priv, priv->ioaddr,
-				      buf_size,
-				      rx_q->queue_index);
-	} else {
-		stmmac_set_dma_bfsize(priv, priv->ioaddr,
-				      priv->dma_conf.dma_buf_sz,
-				      rx_q->queue_index);
-	}
+	else
+		buf_size = priv->dma_conf.dma_buf_sz;
+
+	stmmac_set_dma_bfsize(priv, priv->ioaddr, buf_size, rx_q->queue_index);
 }
 
 /**
-- 
2.47.3


