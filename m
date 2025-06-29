Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25192C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX1murptrOVH4xG1C1DogmF5HNLO3DLAS8v3YKRUskg=; b=uiLMZi/4JCmSFePIYkhn6S39Ns
	d7Pa/c6GJCDRg6w/Vu7G0RxSGBVgpOMV6XVOp5KLaFJ4gk+Ijbmc5dB6BBEWDbIxT/1xDJXgOKyYA
	IQD9i0JVgHAwldheJdDXoIINRvwotOcwO3kL7XJ1miDCxymMYJOFVJhumt59OmlF3ILeKzMZuYDUU
	8+VMg9UmMwO8ZZr5Ja+wVHCkuj1mVz8x9jm425cs6dQDUt9jfcGIQksjgmXP9J5gvUbLfPkYokAHf
	B1VIeHcgcG6kl2usd4quXueo6UaPkMj3eQZBVg+nyTOnGhiKXouOaWRhprdytHog1dkkGblDL/lIp
	4Ids8Cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwmA-00000000a5e-0eMX;
	Sun, 29 Jun 2025 18:29:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwjq-00000000ZrQ-31Sf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 18:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QX1murptrOVH4xG1C1DogmF5HNLO3DLAS8v3YKRUskg=; b=kSHAKymUrGqyNPeikA+ET9CRvh
	pi0ce05QS9PdOB8IMyZl+R0lcjJqX1MmVHxGilsqJN11O1J5rXx8IbqSSZuiPNadMLC16k4buMC4I
	2Alv6XuV3aKqIw/lnjyc70ei39mjdElIvmalkojVNajMUeyAyY5h8QuUrhTsPGvAA4E4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uVwji-00HIFS-Jx; Sun, 29 Jun 2025 20:26:42 +0200
Date: Sun, 29 Jun 2025 20:26:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: add support for dwmac 5.20
Message-ID: <4d5a599a-60e5-4141-8671-ffcbda3aca02@lunn.ch>
References: <20250629094425.718-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629094425.718-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_112650_760505_20E47249 
X-CRM114-Status: GOOD (  15.16  )
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

On Sun, Jun 29, 2025 at 05:44:25PM +0800, Jisheng Zhang wrote:
> The dwmac 5.20 IP can be found on some synaptics SoCs. Add a
> compatibility flag, and extend coverage of the dwmac-generic driver
> for the 5.20 IP.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> index b9218c07eb6b..cecce6ed9aa6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> @@ -59,6 +59,7 @@ static const struct of_device_id dwmac_generic_match[] = {
>  	{ .compatible = "snps,dwmac-3.72a"},
>  	{ .compatible = "snps,dwmac-4.00"},
>  	{ .compatible = "snps,dwmac-4.10a"},
> +	{ .compatible = "snps,dwmac-5.20"},
>  	{ .compatible = "snps,dwmac"},
>  	{ .compatible = "snps,dwxgmac-2.10"},
>  	{ .compatible = "snps,dwxgmac"},

I can see a compatible flag being added. But what about the extending
the coverage of the dwmac-generic driver part?

	Andrew

