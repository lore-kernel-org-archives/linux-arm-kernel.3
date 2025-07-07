Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E0CC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVqK2vEKOfCOED6mMam18P/SsPX92DckFNgrT1kaFjA=; b=e92QE1nYXd7SaOmcZGFRfIeEJF
	z8aBGzUMVqPDbm6N/U+Ax+ZRzpvWzTrSYZA1KUXqUea2TkwoC2Bai9Spp+UCNc7Cy0UNDyP4tI7ey
	dBWsJ6qDFxwm8cISRyC5sKrr03kDusFPV7VgqowfQTifx+fHGJWKwFhp+M3eGCip8jz6y2InU7eCX
	52buTX6I1MJqqsJXunUMbE15BoIA6q9+LY42pB4US7G7WYyUctBG5fI9rqe5grPsM56VKNFV7eb6A
	nUYbEzAVeMoYGhk7sPj5U+Tzb0ygGNzqbHa7CK6CWhEUgiRPSkg3dbvARL9IaR393W2JpyhpHCITr
	CMgw7Uyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjlT-00000002FKY-1V3Z;
	Mon, 07 Jul 2025 11:12:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjK1-00000002Bgw-3KwM;
	Mon, 07 Jul 2025 10:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VVqK2vEKOfCOED6mMam18P/SsPX92DckFNgrT1kaFjA=; b=llG7O4sgfJUSMxSqynpQ8nfPof
	ueMIGKtwHAHkjB//2bQBViS9nZw0kHmHiO7gmVHUEUvitAuqRcasj7bG5HqGNY/pNJ1zLxrja6fsf
	gSlqUVuczTzww3+dDgYSnb2cPvIYixbTg8BnVOWMr5Afhqm2H+TXGgJXlPzi08tpJ73dk31hEhOR8
	Q7fofX9to9BwgV5V+mfPeC+IwupK4KAZth3S2zOpzx2tNq6+FRyHXxBdyOnJPtxwjJp4dF4KgU5FX
	8CcRX2LryLJiTofuEDPwWwwisb0WagkAen1egcgMux+T2hxAfX79bBkkrOEl5EVpSRiNVZ9QkTRPR
	4JepuJWw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjJy-00000008SUY-2P9x;
	Mon, 07 Jul 2025 10:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37671A53EBE;
	Mon,  7 Jul 2025 10:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED05DC4CEF5;
	Mon,  7 Jul 2025 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751885014;
	bh=ZAHncvRq/os3HYtn8J7X9/8sN0J5JEZiybhSWcC8h+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiDoMvaMaEtgtwLkbm7fWeJkr74MnR9ckIpH80fi864JSTlJW8GAN+l4MQWNo/QIr
	 KDoX+f13espcJXebVoABhzBqq8HV+GR1+B27AMR1DUe7cOvaBti79jKPsDVm40IQKv
	 6wd5DeUd8v6lV9xth8qOBezBUrCPRfODIbomdLpfUmgkeIUKIx5/GUpwxVRLgVDpXt
	 0lJGqztvJw9fvqFYY1wZ018EOUwfoslkiwCMdpHT2lP4Mg0dAo5FsnvO/9VLI1hDBl
	 zamXhcQZEOLlZVd7alhNqDcn8BuEzs4w1CZe3YRmg0cROX90bT4zliB2UFS/1+9nOL
	 WLgwzoxlObrCA==
Date: Mon, 7 Jul 2025 11:43:29 +0100
From: Simon Horman <horms@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alex Elder <elder@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: Use of_reserved_mem_region_to_resource{_byname}()
 for "memory-region"
Message-ID: <20250707104329.GF89747@horms.kernel.org>
References: <20250703183459.2074381-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183459.2074381-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_114339_095504_04D4C5E1 
X-CRM114-Status: GOOD (  22.72  )
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

On Thu, Jul 03, 2025 at 01:34:57PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource{_byname}()
> functions to handle "memory-region" properties.
> 
> The error handling is a bit different for mtk_wed_mcu_load_firmware().
> A failed match of the "memory-region-names" would skip the entry, but
> then other errors in the lookup and retrieval of the address would not
> skip the entry. However, that distinction is not really important.
> Either the region is available and usable or it is not. So now, errors
> from of_reserved_mem_region_to_resource() are ignored so the region is
> simply skipped.

Thanks for explaining this, it's much appreciated.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c    | 25 ++++++----------
>  drivers/net/ethernet/mediatek/mtk_wed.c     | 24 ++++------------
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 32 +++++++--------------
>  drivers/net/ipa/ipa_main.c                  | 12 ++------

FWIIW, I would slightly prefer one patch per driver.

...

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 351dd152f4f3..73c26fcfd85e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1318,26 +1318,14 @@ mtk_wed_rro_ring_alloc(struct mtk_wed_device *dev, struct mtk_wed_ring *ring,
>  static int
>  mtk_wed_rro_alloc(struct mtk_wed_device *dev)
>  {
> -	struct reserved_mem *rmem;
> -	struct device_node *np;
> -	int index;
> +	struct resource res;
> +	int ret;
>  
> -	index = of_property_match_string(dev->hw->node, "memory-region-names",
> -					 "wo-dlm");
> -	if (index < 0)
> -		return index;
> -
> -	np = of_parse_phandle(dev->hw->node, "memory-region", index);
> -	if (!np)
> -		return -ENODEV;
> -
> -	rmem = of_reserved_mem_lookup(np);
> -	of_node_put(np);
> -
> -	if (!rmem)
> -		return -ENODEV;
> +	ret = of_reserved_mem_region_to_resource_byname(dev->hw->node, "wo-dlm", &res);

Please consider line-wrapping the line above so it is 80 columns wide or
less, as is still preferred for Networking code.

> +	if (ret)
> +		return ret;
>  
> -	dev->rro.miod_phys = rmem->base;
> +	dev->rro.miod_phys = res.start;
>  	dev->rro.fdbk_phys = MTK_WED_MIOD_COUNT + dev->rro.miod_phys;
>  
>  	return mtk_wed_rro_ring_alloc(dev, &dev->rro.ring,

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c

...

> @@ -319,13 +313,7 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
>  
>  	/* load firmware region metadata */
>  	for (i = 0; i < ARRAY_SIZE(mem_region); i++) {
> -		int index = of_property_match_string(wo->hw->node,
> -						     "memory-region-names",
> -						     mem_region[i].name);
> -		if (index < 0)
> -			continue;
> -
> -		ret = mtk_wed_get_memory_region(wo->hw, index, &mem_region[i]);
> +		ret = mtk_wed_get_memory_region(wo->hw, mem_region[i].name, &mem_region[i]);

Ditto.

>  		if (ret)
>  			return ret;
>  	}

...

