Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA31049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=zvTYo4v5OUtK3KertpTULp7iN5
	wys1ws5ixprmeLtmnVeNf6H7/D845Qhhgc9nysWikd5c7ZKITyl9CeNXf4rtUqnD46SbxZagHgy4K
	IsejfcQJwRaTtUrQAI4ioLjLeqPnPWPt16IliUkU4bWmGTCSJLXqNbmIq7aovcIoRh4TcoH/KBB06
	QNDcamoBd0uOdPqhH6txd/4iDeYsUL0WJ06v0hmHzmB1MQ+3zJJm2wSGgw0JUzMut2NTCKiVr2r4j
	WGRe+/+KLuOFxILeDhHVGpuLjK9w96e6dv0uVE2ypKbcUcLjV0lPzCnU+XHjTTHzk1dp+DCgsEt4U
	jpGJf1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFi-0000000BKzQ-1IjB;
	Wed, 11 Mar 2026 09:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFe-0000000BKvT-47B9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=VFJ13fOzwoO+mhkXKmxBnyTxzt
	z8FMU3KETRAw0WuJ1ut0Zt0Xgd43pF5lPyAOaYZqDrgizqnrX7/lsGcltLTnC5wsqMFfRJ3LN/tP3
	03kFVy/9PUTXIRVjh+rWwvZ37tsbku66TOqEU4Diw2I/GbxWMP6y5311iewxw3RqwW3isJaTKNcIY
	olDpnlvIqKNHBJ9Cx2FeNC1C9vkcSkXDC8NhRZ/N2Ui1MkwcOHGhIY2ZGcTQ6+MUI/iYSEAvlZQys
	q7jTZ+MNWPhzhvB8Sa9iyTYP2Lh5WFerZaFw6bRgAsi3jYMb73sLFKMi+nwllJJbKu5bQVFubbyrS
	cUONG51w==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFc-0000000GcOs-0q2W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mN5vxj18DEG/GzsK/ZAK4TM2Y4zdJSMNto0z0SCK1Fo=; b=DxwJOamyFQJasiEEGIg6PQGra/
	c3RbdoTkyMuaqpPTiz+DTFczICSEfdmbzPFM5SaMLy17PU/OJSlwJ6KmA6KhQoWBSuk8Oysi2sHvM
	RHlcPomYiCfoOVjL4OE4e4eODtAn3yKlk6NkHZpnjaCejQgHwdjOcOYvHOyyJZlIMeZFwVyEzGfJJ
	FM6uUUSC/Ekmx3s2GNf6xaXIauxiCVQXIvoRcHB9WFGrOTJxFK2SO6IvaOvhmVTUI7j3dhAAZ3jl7
	VUfLcW1Y8dkVmD5AjM2zXkF3xfmPNYGPhJkA9iHgr0KxHFOdumJ7egvm+Jj3YcCbqoRL+CVeQXXDQ
	+3+NtCJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42730 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GFO-0000000069N-0wQd;
	Wed, 11 Mar 2026 09:52:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GFL-0000000CiTV-1cdM;
	Wed, 11 Mar 2026 09:52:55 +0000
In-Reply-To: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 10/15] net: stmmac: simplify
 stmmac_set_queue_rx_buf_size()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GFL-0000000CiTV-1cdM@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:52:55 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095312_322023_C8E04C3F 
X-CRM114-Status: UNSURE (   9.71  )
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


