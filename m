Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF21F44860
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KAmExev6QREqTu9zo7T3RzeKjeGOvRTDyJ1tg+D3lYI=; b=B3Hb77Vx8tv8fazyDCr5n7nzxC
	vBK8hQQdCfoihyYz0mHNuTgHyxuli7DUAYcGmoLtIhZHu8mtnHNVVSLFBI3ZGJKNtp2w4HTSaeHSD
	5b05xKZ3jfURapVFkvYgWOgFoC909SY4o+4TeXmKvUzKxrmrdP2DGYdAyj6STKIAKebM9Urq4Va64
	51N8lCAqB0D5vAs/iWKyOU+gBPuTnibliFZyaBu5b1SH1JObjmnDZZKMtcjabiIe6SIHbJmHYhZpb
	5gP48q+f144Iz7OLxzbKWiE+wBAEllmKzhaLQwsvC80CQCpEcdYjCRcXrDSQvUdO8YIn9qCNxuxbz
	Z/oT3Ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBaf-0000000CI9p-2AJ2;
	Fri, 10 Apr 2026 13:08:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBae-0000000CI9Y-2H8H
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:In-Reply-To:References;
	bh=KAmExev6QREqTu9zo7T3RzeKjeGOvRTDyJ1tg+D3lYI=; b=MZ/xhFPKrZIuExJ0fGiLhWRbWA
	9yQkFsocQ1f8FCTfkscoydbEyYpwlmntQ+R8MUI+NdQmN/CL5XeGMIJiRq9/gZca4+QPcL05THrpB
	cPo6JyCVCCIvnmUpX64dVlFTPUd7YXC+4ZPE6wU8mOrII4HNAVOKL1QUnO2LVRDvDk8R+H2YhqJdG
	C5S7JXa8wsiFMoomfTp8g/xKDQ2MiGX4L9jgzy4KewymzM/Fj1VtbaEfql17Y0LJNPO7ydfh9hsCB
	dySyAvH+B8tO0kd6tsW2JpFSPq8e+QV4LsSbay6x9NLUidy2ACZ+OaQI/YbCUMEamAy//TDt1NN+m
	gLlCGh3Q==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBab-0000000DXd6-2r6N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KAmExev6QREqTu9zo7T3RzeKjeGOvRTDyJ1tg+D3lYI=; b=xexf2kxTPDrbMyYxOBx+Da6zK2
	QqFHWAFjua9yf/IB+3akKUPG7JTrHa8hMEym0SmTgRp9p8PVALgL9xZKPWHZ6b4VUMwtTQ1fhWILz
	I2EZj0Gekcg1lnBU2Be/tobXR40ZGUMnGvxSDB+gjIE/NpLdQ4PdNYo6f4MiSBGjL7l31r9vxw8Mx
	FDwkYcIk1oTeAS4/j5ptdYhDEzy5ojgjq59zglqvk4tX0oUpYy6m25AFE+zYcQSPwDMxAT8QzUJD8
	wDnbeIx9sPGDaMi7DF8TOgQmDFCsgYcEFdcAi03tD9+jR7Ug6u2H+3Pyy+J7x6He8FShvG5XCqYJv
	Tb5xElCg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51554 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wBBaS-0000000050J-0ZTQ;
	Fri, 10 Apr 2026 14:07:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wBBaR-0000000GZHR-1dbM;
	Fri, 10 Apr 2026 14:07:51 +0100
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
	Paolo Abeni <pabeni@redhat.com>,
	Sam Edwards <cfsworks@gmail.com>
Subject: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
Date: Fri, 10 Apr 2026 14:07:51 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140801_821197_E7C1B395 
X-CRM114-Status: UNSURE (   9.34  )
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

Enable receive process stopped and receive buffer unavailable
interrupts, so that the statistic counters can be updated.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Since we are seeing receive buffer exhaustion on several platforms,
let's enable the interrupts so the statistics we publish via ethtool -S
actually work to aid diagnosis. I've been in two minds about whether
to send this patch, but given the problems with stmmac at the moment,
I think it should be merged.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index af6580332d49..43b036d4e95b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -99,6 +99,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 #define DMA_CHAN_INTR_ENA_NIE_4_10	BIT(15)
 #define DMA_CHAN_INTR_ENA_AIE_4_10	BIT(14)
 #define DMA_CHAN_INTR_ENA_FBE		BIT(12)
+#define DMA_CHAN_INTR_ENA_RPS		BIT(8)
+#define DMA_CHAN_INTR_ENA_RBU		BIT(7)
 #define DMA_CHAN_INTR_ENA_RIE		BIT(6)
 #define DMA_CHAN_INTR_ENA_TIE		BIT(0)
 
@@ -107,6 +109,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_ABNORMAL		(DMA_CHAN_INTR_ENA_AIE | \
+					 DMA_CHAN_INTR_ENA_RPS | \
+					 DMA_CHAN_INTR_ENA_RBU | \
 					 DMA_CHAN_INTR_ENA_FBE)
 /* DMA default interrupt mask for 4.00 */
 #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
@@ -117,6 +121,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_ABNORMAL_4_10	(DMA_CHAN_INTR_ENA_AIE_4_10 | \
+					 DMA_CHAN_INTR_ENA_RPS | \
+					 DMA_CHAN_INTR_ENA_RBU | \
 					 DMA_CHAN_INTR_ENA_FBE)
 /* DMA default interrupt mask for 4.10a */
 #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \
-- 
2.47.3


