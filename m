Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE35C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOCVFoZKN/0pqI+VbreA8eza28Uh0Gc02Hvheb6BCGo=; b=slN5bagk3bqzezomWoP5ischwE
	Jj6ZffQOm4/ii4fAjLSjcaQCz2PdOKnd3AerYUmtFGNLmGbGJ3RXq98aHMAvQ0aml7J8+0aTRNW+t
	ibkDQyLEACUcE+lr2O3wpJn+ptJlmx2dfIn2Tee3CGHjChx+5dvMtcUizcPEyxkSpw3KT5ppsUwDt
	MRoo7KULKR/4wOXcKjmcMRpv0KRJcspb1Hyn6I5IQ1EXfO2BfY18A3Fu+26aE7ZznqMS22+55jZyj
	jsJb9V1PvUxiwDg8VCFQ/N4gKmCb4nzNDevStXxVlfx+taWbo2WRImUm84iBb8FvtIKQLGEnaq1AN
	E3yLC7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dd6-0000000GJ9U-0lQn;
	Mon, 07 Apr 2025 03:58:36 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dbK-0000000GIu9-1DUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 03:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JOCVFoZKN/0pqI+VbreA8eza28Uh0Gc02Hvheb6BCGo=; b=MjM7iyEY/h4tSrTK0unjHkO4Oo
	2RuFhUkcyGB72cfF9bCWWIpSkUw7gsLUuo78Mk08Isdsb8djPNEwFTtU3lMbJtH6opFwnNwte3Rt2
	Xm+ZX9TI5ZR1BQLBW91PxI7qXGWQ04x6QuhEa4o2r1EnHehMNpX7ok2ThI6hH8eJp5/PNpXhBkGRE
	nijigLBBfka/ZRIVVMtUE7vwqFxAJcPZwmJb5RpquykO73AzRTJ/4OLT8/gNdKsu22iu+ZVJPnFzB
	nTub1XOMRiaTwQy1G3lhBfe0KCzLRT+YsHMuR7VRRrJvnSh0YzPN7na66M5jZbsFNwKRjjQBDGrgB
	eDSa+SwQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1dbA-00DMQq-2a;
	Mon, 07 Apr 2025 11:56:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 11:56:36 +0800
Date: Mon, 7 Apr 2025 11:56:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] crypto: sun8i-ce-hash - drop
 CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG ifdefs
Message-ID: <Z_NM9LnUF6Gpv_iz@gondor.apana.org.au>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
 <20250401192321.3370188-4-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401192321.3370188-4-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_205646_327505_B0CF336C 
X-CRM114-Status: GOOD (  14.53  )
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

On Tue, Apr 01, 2025 at 10:23:19PM +0300, Ovidiu Panait wrote:
> 'struct sun8i_ce_alg_template' is always defined, even with
> CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled, so the ifdef guards
> are not needed.
> 
> Make sure the statistics have IS_ENABLED() checks instead.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> index b0959d8218cb..530c5181d73c 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> @@ -31,9 +31,7 @@ static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
>  
>  		algt = container_of(alg, struct sun8i_ce_alg_template,
>  				    alg.hash.base);
> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>  		algt->stat_fb++;
> -#endif

Should this go under IS_ENABLED as well?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

