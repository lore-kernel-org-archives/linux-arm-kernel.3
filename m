Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24073CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDIFPtcXac/d89aY2gWzpfszX8HPNkLGfWopva5KX6k=; b=KIUsPQRKROAJJNITFXiZc0FmZ9
	+dsLc4Y7F4vXSygZ2mJNaccaumK4oe2tMs3UHDdhxo/avFu1tWcVvsoapNnXoXjcmmOt3tsXUzK5d
	nstTO1G6lTS5F+Ag3w0g8kbGr6SkwaBv2L0C8XrV2jFu6/zhiAqHwovQjT00Hh6KQlaCDTXOgxDjZ
	7b3CLFS6Ne5tkdlUr9vh6U9w+Qn2URs2GKIy+Km/wq3Y+jtbVp9Umi5L2PtISDUmDsN5y+XtlDqnA
	L663JovMgG0XQRgR1o4ZPZYBKs7Jt//f4NuyXKKjjceE0fT/IqRTIBHrLsqog6lgMO+JANWWP42mn
	P2SxovTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA4M-00000002q9A-0Rea;
	Wed, 13 May 2026 13:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA4K-00000002q8r-14JP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 13:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XDIFPtcXac/d89aY2gWzpfszX8HPNkLGfWopva5KX6k=; b=cjNiC+4ZkmqeD0w4ubx8iUrV8/
	DOxSH+LGX+aRRFLbMRa/P2phBm/LEsKEqXqzVet1AchO+sSpSY8dof84BScwUOmOCR9LFjp0VHh+6
	byQvCMMPf05/g/iT7QfqOJqzHRP3MszpV58xm8MdGV+1QWRw176ylJtoXLk05bgsGAjPuPRL4imKk
	mGciPsCQ1EcXt1czVhNgbCDjGGOGtAR0rfkWXK3xg4nqWD9DSZGgIcoqYKqQdVzWCV8H9qhH4EDQQ
	bXmqt6o64HW/0efn+k3CvUPA32qvQQmEiNE5ZE7skhRYRedKv+DTWtjEFhANfQdfH2ZCLWS1+V574
	BSxcgN3A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA4G-000000005PP-3zJe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4185409DC;
	Wed, 13 May 2026 13:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AE3C19425;
	Wed, 13 May 2026 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778680567;
	bh=MXMJ2YErhR+rt5lb41KSQgYV1/p19akuZJWzhANohVs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cWq8Je6PS5XGkz1S2cUgi5ffcz11rJG2ojxOUvvndVu0qhf08oxOU3Pl6af1ne+xv
	 2Hd8YeNeEs1EYhcq8UEF900sc5Ta7hXDFo6A6QTV8ygS1ZDBMChwuuoR+vEl6aGWOo
	 VJ+KL6Zk3T1x8tTKM91jL8NpiAURhC28ZQFCSb8fZbtar93p9wNvyoZrmIEL7hhG7c
	 4MAWL64MDOC7TiSYztz/N1s0Asj7Fvs3b8eHiEIV1Nnx3ANTdwznAk5zlIDIG97XsR
	 MecnOivwZqFMgYTjiVAo+MitaHOslFRqA6YMLn0BaRunJk1ISyw5mRVJG2fvK+pFkq
	 Kl1lJbpqlff+w==
Date: Wed, 13 May 2026 14:55:54 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for
 resources
Message-ID: <20260513145554.39bdbf33@jic23-huawei>
In-Reply-To: <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
	<20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145609_533163_6AA59485 
X-CRM114-Status: GOOD (  17.51  )
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

On Wed, 13 May 2026 11:14:33 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Align also other resource declaration using DEFINE_RES_.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
Trivial but I'd prefer to have seen the 'cleanup' then the 'new stuff'
after that.  So swap this and previous patch.

Not worth a respin!

However, request for some more info in the commit message - see below

> ---
>  arch/m68k/coldfire/stmark2.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
> index aa2b4d2a8a64..a5b36af8e70a 100644
> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -63,21 +63,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
>  };
>  
>  static struct resource dspi_spi0_resource[] = {
> -	[0] = {
> -		.start = MCFDSPI_BASE0,
> -		.end   = MCFDSPI_BASE0 + 0xFF,
> -		.flags = IORESOURCE_MEM,
> -		},
> -	[1] = {
> -		.start = 12,
> -		.end   = 13,
> -		.flags = IORESOURCE_DMA,
> -	},
> -	[2] = {
> -		.start = MCF_IRQ_DSPI0,
> -		.end   = MCF_IRQ_DSPI0,
> -		.flags = IORESOURCE_IRQ,
> -	},
> +	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
> +	DEFINE_RES_DMA(12),
> +	DEFINE_RES_DMA(13),

Good to mention what result of splitting this into two entrees is
in the commit message.  Basically say why it's a non functional change.

> +	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
>  };
>  
>  static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);
> 


