Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEA0C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SMmn399DijCiUX3gBxnE2kLGfAWmnOcjzp7FDIMbN8=; b=n12U5X+iZHmBdoT+6YC2jMxuHE
	2oNkSPg7kTYxOkflCl9y+ZciOtj41yizFmTJii3r2Xs/cfzaNcNCAaBxOYAQPRPlF21HsPvpiijNE
	yIiYVCdmN6sS3Kng25GzlShtTqgIfLg6XGu/2CJbL/KdcM9toOPOyZYsBYHFI3pAwsRGUz3CGzQ8M
	nBvxdRrHb1j9CCGzGnzdutlv9S9aqv3hL01+cajdL7TkL1m3VKm2WKserVcCG6gGwMYkZXqyAD/VB
	OsTmalXcZTUch89NnwX+K8Vaf6TiEc8hGqCub2ormV58SGpP5sP5kDb+ttpxvhG3X+eq8EU1c55pe
	icV7UDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI62-00000008UGk-1A9L;
	Tue, 21 Jan 2025 17:31:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI4i-00000008TuV-40Xa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6SMmn399DijCiUX3gBxnE2kLGfAWmnOcjzp7FDIMbN8=; b=jLn+HGnFMAjk83/mc/4RxYs8zb
	T728HVItldev866KXmTyPmjhdKDYiKz53jfW6MDTu7K3ooq1gEBbLrb7eKgHZZNd3kkKlabsk6tpG
	EWFGNz/sKFLndPKFTLjLP64aiXG7BGoUE/lX8vUcVfU8PusaRt5GGhBndBZ//68XJaSbDAT/JIaje
	/CJUZD4FsCV6JlGTzcGIFZiVonZPR0hDmU2X49NKOcWvtk7YrBd9K6YKuzfI59XssGUN7EuHIEdGY
	A9tHCfB3DtcbS3mKASK/vNGEMV+skTCQU++Esupmc1FBsCziycMdb5kzN7oiOqAMpwLT8mEmO6wS/
	f5m3YE6g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46698)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taI4U-0007Wc-2x;
	Tue, 21 Jan 2025 17:29:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taI4Q-00044e-31;
	Tue, 21 Jan 2025 17:29:46 +0000
Date: Tue, 21 Jan 2025 17:29:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
	Vince Bridgers <vbridger@opensource.altera.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] net: stmmac: Limit FIFO size by hardware
 capability
Message-ID: <Z4_ZilVFKacuAUE8@shell.armlinux.org.uk>
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <20250121044138.2883912-3-hayashi.kunihiko@socionext.com>
 <07f2f6d0-e025-4b21-ac41-caaf71bb6fff@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07f2f6d0-e025-4b21-ac41-caaf71bb6fff@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_093004_994061_8987437C 
X-CRM114-Status: GOOD (  26.19  )
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

On Wed, Jan 22, 2025 at 01:14:25AM +0800, Yanteng Si wrote:
> 在 1/21/25 12:41, Kunihiko Hayashi 写道:
> > Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
> > stmmac_platform layer.
> > 
> > However, these values are constrained by upper limits determined by the
> > capabilities of each hardware feature. There is a risk that the upper
> > bits will be truncated due to the calculation, so it's appropriate to
> > limit them to the upper limit values and display a warning message.
> > 
> > Fixes: e7877f52fd4a ("stmmac: Read tx-fifo-depth and rx-fifo-depth from the devicetree")
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 251a8c15637f..da3316e3e93b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -7245,6 +7245,19 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
> >   		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
> >   	}
> 
> > +	if (priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
> 
> > +		dev_warn(priv->device,
> > +			 "Rx FIFO size exceeds dma capability (%d)\n",
> > +			 priv->plat->rx_fifo_size);
> > +		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
> I executed grep and found that only dwmac4 and dwxgmac2 have initialized
> dma_cap.rx_fifo_size. Can this code still work properly on hardware other
> than these two?

Looking at drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:

        /* Compute minimum number of packets to make FIFO full */
        pkt_count = priv->plat->rx_fifo_size;
        if (!pkt_count)
                pkt_count = priv->dma_cap.rx_fifo_size;

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:

        int rxfifosz = priv->plat->rx_fifo_size;
        int txfifosz = priv->plat->tx_fifo_size;

        if (rxfifosz == 0)
                rxfifosz = priv->dma_cap.rx_fifo_size;
        if (txfifosz == 0)
                txfifosz = priv->dma_cap.tx_fifo_size;

(in two locations)

It looks to me like the intention is that priv->plat->rx_fifo_size is
supposed to _override_ whatever is in priv->dma_cap.rx_fifo_size.

Now looking at the defintions:

drivers/net/ethernet/stmicro/stmmac/dwmac4.h:#define GMAC_HW_RXFIFOSIZE        GENMASK(4, 0)
drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h:#define XGMAC_HWFEAT_RXFIFOSIZE GENMASK(4, 0)

So there's a 5-bit bitfield that describes the receive FIFO size for
these two MACs. Then we have:

drivers/net/ethernet/stmicro/stmmac/common.h:#define DMA_HW_FEAT_RXFIFOSIZE    0x00080000       /* Rx FIFO > 2048 Bytes */

which is used here:

drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c:    dma_cap->rxfifo_over_2048 = (hw_cap & DMA_HW_FEAT_RXFIFOSIZE) >> 19;

which is only used to print a Y/N value in a debugfs file, otherwise
having no bearing on driver behaviour.

So, I suspect MACs other than xgmac2 or dwmac4 do not have the ability
to describe the hardware FIFO sizes in hardware, thus why there's the
override and no checking of what the platform provided - and doing so
would break the driver. This is my interpretation from the code alone.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

