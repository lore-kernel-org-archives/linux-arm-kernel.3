Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87587C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ajwAaY0cVsvSHCyTqIKZnd53jar7upwfZE55GX+kls=; b=rbbJl0mJG+R9HOBDhFrq3Uloth
	Wut+kQq6AAGmL0kH3HCTAawdwC5GtO9RKyAJgsNUP3q5lQ18wQu9+l69RhsDjbh4kvWkNMUwpw7yA
	pHLc8o5iVr9oD+U9OED74qemrYfut4v6Wdfxngh7gYbhUubD6ystoKNnSgr1p3w8ulMCzYyKXGszX
	LqUhci39rCtNajWn/5WcLFb7XYqmfCMgJT81POROc1AFLDltUW7e2ez/KI7fpGp6GxKBRbnEGH7PR
	ROTslijh/jvRw4okIdaSoLiX9/pqirs/UwlaPpKeHvu9NRGUWZvyCnQpJsGJoy3nYAw/UUNg0Z4e8
	7w+fRtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56IB-0000000HTRr-17E2;
	Fri, 11 Sep 2026 18:48:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56I9-0000000HTRb-48PW;
	Fri, 11 Sep 2026 18:48:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8B1D404E8;
	Fri, 11 Sep 2026 18:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF981F000FF;
	Fri, 11 Sep 2026 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789152485;
	bh=9ajwAaY0cVsvSHCyTqIKZnd53jar7upwfZE55GX+kls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NxhUj3uRiZdCUVnfy9OJ6JxZSwXTLbC2JDs2SOawDDUst15bOPObpauIjTa4/lYez
	 B2q/sRDfkck9M3N9IDoieUVemUV7eFXoyAZy8RRe5XD7vHLydhRCAb009rmiUlJRkP
	 2U/g9JZX05It1GjaJj3gNnMIxz7B5IkAOTjIn5QumtQDQDQroFA0maitbO2TjL8Haj
	 2TVt5zM1L6/P2aYau3PZzL1Mcbq4Akaz3GJtFm2kcSxWXjLtSkvjmpx4l2C9RwnwMd
	 9K+8X0o6DpC+LjytkD0lU3ZjnpkNkSDVkl5HNOtWyziqf4nw6L+dpGSXNEznk+Elep
	 XKjkkSjOf4dEw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 6213ADAB022; Fri, 11 Sep 2026 19:47:51 +0100 (BST)
Date: Fri, 11 Sep 2026 19:47:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Message-ID: <aqRM17TZ0-5pd6Y0@sirena.org.uk>
References: <20260911172701.58177-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yXCBlsD+8N8P77Ma"
Content-Disposition: inline
In-Reply-To: <20260911172701.58177-1-mhun512@gmail.com>
X-Cookie: Orders subject to approval.
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


--yXCBlsD+8N8P77Ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 01:27:01PM -0400, Myeonghun Pak wrote:
> With rockchip,sfc-no-dma, probe skips allocating and mapping the transfer
> buffer. However, controller registration failure and driver removal still
> call dma_unmap_single() for that nonexistent mapping.

>  err_register:
> +	if (!sfc->use_dma)
> +		goto err_dma;
>  	dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
>  			 DMA_BIDIRECTIONAL);

Rather than adding use of goto to skip aroud within the cleanup here you
could guard the calls that need guarding with if statements, that would
look a lot less scary than jumping around like this.

--yXCBlsD+8N8P77Ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkTNYACgkQJNaLcl1U
h9CWowf9FYhn4CUqLi778/DZdnlco03RF07n1WzzIV7B/q7VDMOeIelC+xtd9Ltq
7MDi3uvnr1X7i6KKjqeOD74R0Ty5sDH5nVjCtilRp+GZZ9E19CjA41jA9+Gb+Y/7
9g3bpHT1bykk+xr9VgZM42sZ7sl5m8tFtSnrvDckjqzb4eC5To5MbkHwJM3ZXE+W
UTQNnDachWQHnWxSQXCOYCpoQHfvy3BBsUP//ByXb/y/6M+7gvEhozDUJY5MEm06
AXWiqb4zlZwznGh0gPNZ8vDy8JU74GRhF+xGrwLRDsg1zTuZPQ+5GwXJs40WWMia
7jh1hekMc9VqDUbIG56TVwSaIk/7Gw==
=AA3J
-----END PGP SIGNATURE-----

--yXCBlsD+8N8P77Ma--

