Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8174FED2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=Aua+ooUJKmF4owLf08ZFfOglPo
	tnC9189Hqzo0A+soIo/lRDPB4lv3U8svsJuIVLPSv7KOi7FQENOUcKD5JJBVrG54OXNOsEJKGbJgG
	0fmF2t+dOO+o7xoZDdWZB2fYAPNqhsA30j6RYaMczilO1poiwVvNgEbXPvHN15WHQPcBwwXkEwrG1
	JT6zxkud4VUmrmxfJIZ2cxH2scr53ETzp1ctechIKs7hpVoA/xGNPKRco7Q2bZgDLjKo7MPOMnufV
	AFdq+pCdYRikZnjvQ94KPDJJO70UYiKZtD5bL+eZYA7nvDzIEQAeyQLqW5+OIm2dUy+xOKRMFbnS7
	WoccFZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czl-0000000Dpne-0VmA;
	Thu, 12 Mar 2026 10:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czi-0000000Dpkd-3yq5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 10:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=nRd5+BVfBrCEe8mBoy1S92DcOH
	ETG0rRIwMbUgQWonYR9XfwEcnADA3UeYsu5nBf01Vz879ffvgRzl7mdgsCrl0qgEPCm82KbRmROll
	COSNNUMJGPbXOaWMwLv36LYRs8nQkzaAz1xLwlVo9cqxWSRY6YFDDbToG1U3axhsK7S0JXnbn6ayu
	PeqslgP6kkQUwruR9G8HnFWZ/m+ccZmz6CB8LE3h+nZJ1EdlHMdHrsSg9B6fby9t4rx5vUNnASHUF
	2pgax5uzrh1qp+Z+SVPz3dZJMJlqLIls8i9IIdGUXW0WQiJfDRwh4BeGcl9ayaz8xRG86gWSwru8g
	zpGhte2Q==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czd-00000000u5J-3mhv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=vpbb5RVx1HwMFstUJK5acwduH3
	JnoBbAi/KkyaCH48G63GlAoWo1DJRj1ja5fynO7ijBm9BOWKsG4LjGWLqi6C4ql+v5s0mEJ/1ibE4
	A6nhWQjqpAa6Wzz3QQsSn6+xMe6fZmRFMnxJXNLXv8AaOeBOOg6J7bZax45ITwenulh7fZp6f0Ej6
	GVW17dpzZDsC0CRqwXd6wmdI/zmcGjmoUlN7GzGa44FvYC82GoLw+aUzWzXVdm2gy1IDsC2dBCtHV
	5bERP7dP1g/1wqKdtC9ah8+z6Sdswc9/ZUhI9D11zuK3PYlNdGKza3jNmYWoSjVDw0nqViZCYq+6X
	No5uS1EQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45876 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0czA-000000007Zy-0d4z;
	Thu, 12 Mar 2026 10:09:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0cz4-0000000CzGl-3nXK;
	Thu, 12 Mar 2026 10:09:38 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 10/15] net: stmmac: simplify
 stmmac_set_queue_rx_buf_size()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0cz4-0000000CzGl-3nXK@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_101014_072228_EA317014 
X-CRM114-Status: UNSURE (   9.68  )
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


