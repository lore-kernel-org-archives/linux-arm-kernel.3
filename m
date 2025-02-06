Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A67FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irt24W+6XdyrTtvyBZVblXcHK+oqF3lGLKv/6Uv/mdE=; b=YxZFwjUWrpVrgahzk2XxFsrda0
	xlcFGk6E3sm6jd8ewQJwm8KzPAETTqaVcyy/Tn75ZrjDzkWJyzkzBW7cUMT1kBxz8v0L7ZnIbu89m
	inYookFyB94o8W7DdC8pXBjLWGd9Fd9mM7ulkfPNQeE5/EbZImJfHwKcYObNhx7b+HhRUi+mstCgX
	e2AWN6BACVloz9FQnho93Drd0wV4qlpN/LrJ4JDAjJMZ0k+ljvje1dT+tHgfpJwX2abXdqMz4QV3d
	kngPSTwBBR11ckNjcb+DJ27zKpCIy8E99USQu3PwK9hP8EDLyIO3QCAHsFydX50VhZKU3gH523f3V
	QdxzX/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyCa-00000005q4p-3oXh;
	Thu, 06 Feb 2025 09:29:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy8Z-00000005pLY-0jVl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:25:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94A9F12FC;
	Thu,  6 Feb 2025 01:25:51 -0800 (PST)
Received: from [10.1.30.52] (e122027.cambridge.arm.com [10.1.30.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 732CC3F63F;
	Thu,  6 Feb 2025 01:25:25 -0800 (PST)
Message-ID: <4ed5b1dc-4f5c-4d2a-97e2-7b1f43dccfdc@arm.com>
Date: Thu, 6 Feb 2025 09:25:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] Revert "net: stmmac: Specify hardware capability
 value when FIFO size isn't specified"
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_012531_310794_8F7C3E5F 
X-CRM114-Status: GOOD (  22.76  )
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

On 05/02/2025 12:57, Russell King (Oracle) wrote:
> This reverts commit 8865d22656b4, which caused breakage for platforms
> which are not using xgmac2 or gmac4. Only these two cores have the
> capability of providing the FIFO sizes from hardware capability fields
> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
> 
> All other cores can not, which results in these two fields containing
> zero. We also have platforms that do not provide a value in
> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
> 
> This causes the new tests introduced by the reverted commit to fail,
> and produce e.g.:
> 
> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
> 
> An example of such a platform which fails is QEMU's npcm750-evb.
> This uses dwmac1000 which, as noted above, does not have the capability
> to provide the FIFO sizes from hardware.
> 
> Therefore, revert the commit to maintain compatibility with the way
> the driver used to work.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested on my Firefly RK3288

Tested-by: Steven Price <steven.price@arm.com>

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 +++++++++----------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d04543e5697b..b34ebb916b89 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2424,6 +2424,11 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
>  	u32 chan = 0;
>  	u8 qmode = 0;
>  
> +	if (rxfifosz == 0)
> +		rxfifosz = priv->dma_cap.rx_fifo_size;
> +	if (txfifosz == 0)
> +		txfifosz = priv->dma_cap.tx_fifo_size;
> +
>  	/* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
>  	if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
>  		rxfifosz /= rx_channels_count;
> @@ -2892,6 +2897,11 @@ static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
>  	int rxfifosz = priv->plat->rx_fifo_size;
>  	int txfifosz = priv->plat->tx_fifo_size;
>  
> +	if (rxfifosz == 0)
> +		rxfifosz = priv->dma_cap.rx_fifo_size;
> +	if (txfifosz == 0)
> +		txfifosz = priv->dma_cap.tx_fifo_size;
> +
>  	/* Adjust for real per queue fifo size */
>  	rxfifosz /= rx_channels_count;
>  	txfifosz /= tx_channels_count;
> @@ -5868,6 +5878,9 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
>  	const int mtu = new_mtu;
>  	int ret;
>  
> +	if (txfifosz == 0)
> +		txfifosz = priv->dma_cap.tx_fifo_size;
> +
>  	txfifosz /= priv->plat->tx_queues_to_use;
>  
>  	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
> @@ -7219,29 +7232,15 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
>  	}
>  
> -	if (!priv->plat->rx_fifo_size) {
> -		if (priv->dma_cap.rx_fifo_size) {
> -			priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
> -		} else {
> -			dev_err(priv->device, "Can't specify Rx FIFO size\n");
> -			return -ENODEV;
> -		}
> -	} else if (priv->dma_cap.rx_fifo_size &&
> -		   priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
> +	if (priv->dma_cap.rx_fifo_size &&
> +	    priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
>  		dev_warn(priv->device,
>  			 "Rx FIFO size (%u) exceeds dma capability\n",
>  			 priv->plat->rx_fifo_size);
>  		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
>  	}
> -	if (!priv->plat->tx_fifo_size) {
> -		if (priv->dma_cap.tx_fifo_size) {
> -			priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
> -		} else {
> -			dev_err(priv->device, "Can't specify Tx FIFO size\n");
> -			return -ENODEV;
> -		}
> -	} else if (priv->dma_cap.tx_fifo_size &&
> -		   priv->plat->tx_fifo_size > priv->dma_cap.tx_fifo_size) {
> +	if (priv->dma_cap.tx_fifo_size &&
> +	    priv->plat->tx_fifo_size > priv->dma_cap.tx_fifo_size) {
>  		dev_warn(priv->device,
>  			 "Tx FIFO size (%u) exceeds dma capability\n",
>  			 priv->plat->tx_fifo_size);


