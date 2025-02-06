Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A733C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7AJ1kUiUbtxdovmqHjIzlfZsiH8tB6kpGPRFSbHPqc=; b=rWiSJ4Uqf3vXI7pd0pUTWuABlH
	aXJk6As3lBt5Kdy0XgmwpMcRmBy3SruPR1sO0pQko33cV9CIQjqIF1xmHy7rVV0qZ+I/wJ0/XuJjm
	I7WeZlbMGwFVgjWdY5kPn9M7qBX8JGUj61RYnjuQCYHiOE/SH6SZHXFczVxUh5TYSFf2Jc37gby8E
	iLW7JSjmd4WK67mJ9grHweT5KBgIJAKjqdxakwSBOzP9hY0kRoSfvup/KJ8B1wrtEVuFvw8OlsVt8
	m7HD1BepQvGJz/Z9JpXN0TjUqKJipzNt6ISuJ6iba3vrO5w0QWUJ5vzVUIr5njjzcZnsNywKnT5iH
	jK+T34lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyJK-00000005rYz-1u55;
	Thu, 06 Feb 2025 09:36:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyHy-00000005rJh-1Yue;
	Thu, 06 Feb 2025 09:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J7AJ1kUiUbtxdovmqHjIzlfZsiH8tB6kpGPRFSbHPqc=; b=Dv7Q/tZ1j+y7GeMqHaU5fMqaNL
	nrN8Xj18QQGynKlgCGkgdoUEeB60cs+s7oKgGSuHa9xaYK1mBetVShnpB23jxvTQVaaqxdlvntYeI
	2r5LxZnOh0iG+aQ6iNxc6NclCcElDIk2gyoxn7oOb+nAoMwR+CZ18WBTVutZR3u9OkMx+uP5+xmyU
	TX4/hi/djiTpaCC+cAmbr0cz/GHijzwNeL2/T58srS4GEodr7yEDszzWl2PvqbvB99gsBPBYR7snn
	QGcz2PLiVKqa4jRSOpZTi4mdNYZhDpaceoiY+iwzkS0CWNc1L/5DULGYPwQWFvnAv4ackObGOqs5/
	Bln36sUA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyHu-0000000Gttz-1wqR;
	Thu, 06 Feb 2025 09:35:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E8F12FC;
	Thu,  6 Feb 2025 01:35:31 -0800 (PST)
Received: from [10.1.30.52] (e122027.cambridge.arm.com [10.1.30.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71C553F63F;
	Thu,  6 Feb 2025 01:35:05 -0800 (PST)
Message-ID: <de9aa254-dcfc-4a7d-b89d-79b41649a6b2@arm.com>
Date: Thu, 6 Feb 2025 09:35:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
To: Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Chen-Yu Tsai <wens@csie.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
References: <20250204161359.3335241-1-wens@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250204161359.3335241-1-wens@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_093510_885769_3EE0129A 
X-CRM114-Status: GOOD (  26.78  )
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

On 04/02/2025 16:13, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The DWMAC 1000 DMA capabilities register does not provide actual
> FIFO sizes, nor does the driver really care. If they are not
> provided via some other means, the driver will work fine, only
> disallowing changing the MTU setting.
> 
> The recent commit 8865d22656b4 ("net: stmmac: Specify hardware
> capability value when FIFO size isn't specified") changed this by
> requiring the FIFO sizes to be provided, breaking devices that were
> working just fine.
> 
> Provide the FIFO sizes through the driver's platform data, to not
> only fix the breakage, but also enable MTU changes. The FIFO sizes
> are confirmed to be the same across RK3288, RK3328, RK3399 and PX30,
> based on their respective manuals. It is likely that Rockchip
> synthesized their DWMAC 1000 with the same parameters on all their
> chips that have it.
> 
> Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

I think it's better at this stage to apply the revert first. However
I've run this on my board (Firefly RK3288) and it works, so when rebased
onto the (reverted) revert:

Tested-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
> The reason for stable inclusion is not to fix the device breakage
> (which only broke in v6.14-rc1), but to provide the values so that MTU
> changes can work in older kernels.
> 
> Since a fix for stmmac in general has already been sent [1] and a revert
> was also proposed [2], I'll refrain from sending mine.
> 
> [1] https://lore.kernel.org/all/20250203093419.25804-1-steven.price@arm.com/
> [2] https://lore.kernel.org/all/Z6Clkh44QgdNJu_O@shell.armlinux.org.uk/
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index a4dc89e23a68..71a4c4967467 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1966,8 +1966,11 @@ static int rk_gmac_probe(struct platform_device *pdev)
>  	/* If the stmmac is not already selected as gmac4,
>  	 * then make sure we fallback to gmac.
>  	 */
> -	if (!plat_dat->has_gmac4)
> +	if (!plat_dat->has_gmac4) {
>  		plat_dat->has_gmac = true;
> +		plat_dat->rx_fifo_size = 4096;
> +		plat_dat->tx_fifo_size = 2048;
> +	}
>  	plat_dat->fix_mac_speed = rk_fix_speed;
>  
>  	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);


