Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B53FD8FF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjiR1TwqXK5Qwrd2T9B+rxf4jSStXBuyud6ZyusRPjc=; b=lk6PXbla0+Jc9mltr1gmJsmJyp
	vQPFgqn5d/26TpGVR/uVK27pNV6Hvw5pyVIgUggc5+M6ZZ5lmaj02r9w3KCcajYxHRkmMBrPfJosX
	N0i4hZYmAdPbYN1kPTdQZCjcyk5xEjwDEufzdtjZR+IjAWBa7IEZQz3SdhluA3KxXfaHo/IgFW1EH
	aVPlX1V9xAB/MyBwDY2XYrPA4jpNlLPe7+sFDG2s3Y+cBayjHIO13CA/qYs/eL2Iq5BKf5A4aYQxV
	C5o3c5V97bayDzZqP/c4/OmA+SGPcmFpC+f99SPTnflq5WGkgvBYNQp+ETdMBc2+hC9IrtHDYBsmW
	ChtJwlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgl7-000000071iD-3Web;
	Thu, 26 Feb 2026 19:10:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgl5-000000071hN-0Ldn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 19:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HjiR1TwqXK5Qwrd2T9B+rxf4jSStXBuyud6ZyusRPjc=; b=Uuo9qJeAxZxhSDQvCG2THyfgn6
	goN/SZ5wYmb4g5wzXTMlNaPWkQqKj7uB/6w566SYrPrujxs50sfZYENwPPn3t9yfpjvYbPXUlilqs
	8efDz3idaa358SjlUOzL6LOYivhtxwyWu6qwu3GnzrfJyZW8mWfOAmfqaObgWxP9unvufSwvsMrOf
	edMti+IBUeaF7wa0m+Tt/d92YkneueFcO8a80EDhHf73MxhTIn4vGXNBuZxqaS/gxlDyEiqUPTdNd
	5T+8sKrFrKX+VM2XS0Y+YFMS15vuekaYIfoUBiFJ/j1X7MnCd4/6ap/QOzc5nMk2L1DHkyOZq4WYj
	fIDgys9g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50450)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvgkl-000000008Lp-1Mml;
	Thu, 26 Feb 2026 19:10:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvgkg-000000002GM-2Yxa;
	Thu, 26 Feb 2026 19:10:22 +0000
Date: Thu, 26 Feb 2026 19:10:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, boon.khai.ng@altera.com
Subject: Re: [PATCH v7 2/5] net: stmmac: platform: read channels irq
Message-ID: <aaCankErMJZ2XM_s@shell.armlinux.org.uk>
References: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
 <20260226-dwmac_multi_irq-v7-2-f8fe3b945bb4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-dwmac_multi_irq-v7-2-f8fe3b945bb4@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_111047_121664_7854C76E 
X-CRM114-Status: GOOD (  22.97  )
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

On Thu, Feb 26, 2026 at 09:54:07AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Read IRQ resources for all rx/tx channels, to allow Multi-IRQ mode
> for platform glue drivers.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 5c9fd91a1db9..93bd915ab6eb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -697,9 +697,40 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
>  
> +static int stmmac_pltfr_get_queue_irqs(struct platform_device *pdev,
> +				       struct stmmac_resources *stmmac_res,
> +				       bool tx)
> +{
> +	int *irqs = tx ? &stmmac_res->tx_irq[0] : &stmmac_res->rx_irq[0];
> +	char name[16];
> +	int i;
> +
> +	/* RX channels irq */
> +	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES) {

You've missed that there are two separate definitions for tx and rx
queues - while they are currently the same number, code shouldn't
make that assumption.

> +		scnprintf(name, sizeof(name), "%cx-queue-%d",
> +			  tx ? 't' : 'r', i);

I'm not happy with this method of combining the two loops.

Maybe instead:

static int stmmac_pltfr_get_irq_array(struct platform_device *pdev,
				      const char *fmt, int *irqs,
				      size_t num)
{
	char name[16];
	size_t i;

	for (i = 0; i < num; i++) {
		if (snprintf(name, sizeof(name), fmt, i) >= sizeof(name))
			return -EINVAL;

		irqs[i] = platform_get_irq_byname_optional(pdev, name);
		if (irqs[i] == -EPROBE_DEFER) {
			return irqs[i];
		} else if (irqs[i] <= 0) {
			dev_dbg(&pdev->dev, "IRQ %s not found\n", name);

			irqs[i] = 0;
			break;
		}
	}

	return 0;
}

which has the advantage that it becomes a generic helper for getting an
any array of IRQs.

>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	int ret;
> +
>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -735,7 +766,20 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
> -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> +	if (IS_ERR(stmmac_res->addr))
> +		return PTR_ERR(stmmac_res->addr);
> +
> +	/* TX channels irq */
> +	ret = stmmac_pltfr_get_queue_irqs(pdev, stmmac_res, true);
> +	if (ret)
> +		return ret;
> +
> +	/* RX channels irq */
> +	ret = stmmac_pltfr_get_queue_irqs(pdev, stmmac_res, false);
> +	if (ret)
> +		return ret;

These then become:

	ret = stmmac_pltfr_get_irq_array(pdev, "tx-queue-%d", 
					 stmmac_res->tx_irq,
					 MTL_MAX_TX_QUEUES);
	if (ret)
		return ret;

	ret = stmmac_pltfr_get_irq_array(pdev, "rx-queue-%d", 
					 stmmac_res->rx_irq,
					 MTL_MAX_RX_QUEUES);
	if (ret)
		return ret;

This has the advantage that one can grep for rx-queue to find it,
and we also use the correct limit for each queue type.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

