Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A9EFD23D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Vwr+rWR0Jsar34NmyxPBREZAhGVuj7hFZxIBZqkruA=; b=DL33y6KrAUyyXsw6QShCBOfuSu
	bASm2MDZkYBy4M7cJ5y8gzRY0k71Gd5obs+hI2DxEL5ZpmACPHbSjg8Y8z1bmRMTF401hO0OohS+o
	NmGXlkv82VT++OlNf84XndgZbgEKijZ4iWCgj1s3mE4VIH/eFmo+t6o2BpvZ0OBG9uEoCuE3GX5qY
	vEW/rDe3DylTT0x85iCSG5zfz3UE/NUSs9gIq3st33wmmNFoROgATTrToV6f1g7FU3PQPWy86WCTB
	MxvDjP5Kgn7/T0RbR0iAxl7oyFWM2QPnvGRLiNt9B7WfkdYIQEls1lAAenFxfHDIYbV4B+qUzQZRM
	tb4YnE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBjH-00000003jlC-0hvK;
	Wed, 25 Feb 2026 10:02:51 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBjA-00000003jjX-0Xp5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:02:49 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2FA77200D05;
	Wed, 25 Feb 2026 11:02:42 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 13AFE200D16;
	Wed, 25 Feb 2026 11:02:42 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id CD6852037D;
	Wed, 25 Feb 2026 11:02:41 +0100 (CET)
Date: Wed, 25 Feb 2026 11:02:42 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Simon Horman <horms@kernel.org>
Cc: alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
	festevam@gmail.com, chester62515@gmail.com, s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, davem@davemloft.net,
	mbrugger@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	s32@nxp.com, pabeni@redhat.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	robh@kernel.org, kuba@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ghennadi.procopciuc@oss.nxp.com, kernel@pengutronix.de,
	shawnguo@kernel.org, edumazet@google.com, mcoquelin.stm32@gmail.com,
	imx@lists.linux.dev
Subject: Re: [v5,4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aZ7IwgwP5iy2kej8@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260223-dwmac_multi_irq-v5-4-8fc699a5fac4@oss.nxp.com>
 <20260225092513.174261-1-horms@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225092513.174261-1-horms@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020244_461600_256469FF 
X-CRM114-Status: GOOD (  25.45  )
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

On Wed, Feb 25, 2026 at 09:25:13AM +0000, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> stmmac: s32: enable support for Multi-IRQ mode
> 
> This commit enables Multi-IRQ mode for the S32 DWMAC driver, allowing
> per-queue IRQs for improved performance. The driver checks for multiple
> queues and per-queue IRQs, enabling multi-IRQ mode when both are present.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index af594a096676..4aad7077c9d6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> 
> [ ... ]
> 
> > @@ -165,6 +165,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
> >  	plat->core_type = DWMAC_CORE_GMAC4;
> >  	plat->pmt = 1;
> >  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +
> > +	/* Check for multi-IRQ config. Assumption: symmetrical rx/tx queues */
> > +	if (plat->rx_queues_to_use > 1 &&
> > +	    (res.rx_irq[0] > 0 && res.tx_irq[0] > 0)) {
> > +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> > +		dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
> > +	} else {
> > +		dev_info(dev, "MAC IRQ mode selected\n");
> > +	}
> 
> Does this validation check all queues have IRQs? The condition verifies
> only res.rx_irq[0] and res.tx_irq[0] but doesn't confirm that higher
> queues have IRQs when rx_queues_to_use > 1.
> 
> If a device tree specifies multiple queues but only provides IRQs for
> queue 0:
> 
>     snps,rx-queues-to-use = <2>;
>     interrupt-names = "macirq", "rx-queue-0", "tx-queue-0";
>                       /* queue 1 IRQs missing */
> 
> The driver would enable STMMAC_FLAG_MULTI_MSI_EN, but later in
> stmmac_request_irq_multi_msi() (drivers/net/ethernet/stmicro/stmmac/
> stmmac_main.c), queues with rx_irq[i] == 0 are silently skipped:
> 
>     for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
>         if (priv->rx_irq[i] <= 0)
>             continue;  /* queue 1+ skipped, no handler registered */
>         ...
>     }
> 
> This would leave higher-numbered queues with no interrupt handler,
> causing packet loss when traffic arrives on those queues.
> 
> Would it be safer to validate all queue IRQs before enabling multi-IRQ
> mode, or fall back to MAC IRQ mode if any queue IRQ is missing?
> 
> > +
> >  	plat->rx_fifo_size = 20480;
> >  	plat->tx_fifo_size = 20480;

Hi Simon,

I already addressed this in v6 I sent today.

/Jan

