Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A8FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v9SkFwl/ve+JKrXB6vX0OhxF4yTcqiGTFvwt+d7IhY=; b=JxXvIIXpvk6/F/oe2zoSEICi60
	Yln3YV4Ata7to8CvE1wn0seAu/WTNClXusszghT9jN7iLiqrVKjtkNfAPpKFrS7mpcHFycCOx4HcH
	q0t5wvLp0sIjA8kifREG1CAdwa2pAk/LlY4yZv02HPldv7iD20QA8nW97yj07YFSPm/8ddSF7N3vI
	PCGsx4embKEzaF97PPBP/oDHr0zs99W5WPiUh6C14iiQHi2SwuvBXWk2VHq0G6xh3GNlwSHsAYV5P
	EdKmRvAK00CV49KQPBIr1Nxu7sEkfmRJg7zHaI7CboOn5LuYdTf8yTGSjm0q5IzbCZrYISvR6MAPv
	si/tXUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKoN-00000001idJ-1xAr;
	Tue, 19 May 2026 13:48:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKoK-00000001icg-3VK2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 374C1439B7;
	Tue, 19 May 2026 13:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097D7C2BCB3;
	Tue, 19 May 2026 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779198520;
	bh=FVOuV8wf9sDM1YaPL2xSfJNpfl3qVq5yw5xsV8IJn6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKwfVucYoqBDygenr8Akgjc5r7KOUdujiqdNYti/LwjOIL1htVXoi+pWK3qloDJ1t
	 ON9Ux+efzXO3pELn8xOxlH0ZCCwgo2+ieZJk/p7fhqZLVpWvIHwGIeUtdo0hpvuzy2
	 54Qjcf1mSysaQwRk6JP90HhbX2pS/4KCHgwqJaqirGO/CdfTsvIxDD0ePBpUcGBVkv
	 OWj1dtZSx9X2QJGLES/pqx4hwuIg4s4XTUQMDigmZ5IlDxqh1m4OHcmW8eA/v7JrcL
	 SKqsyKhnVd57Cuj+4bF2rOSgYmjmfG5G25Hd3OY/LuPKG8uB2Ya+9FRBZjyq7ODPVg
	 KJcQRCjKh/DEw==
Date: Tue, 19 May 2026 14:48:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu.pirea@microchip.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Wenyou Yang <wenyou.yang@atmel.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] spi: atmel: fix DMA channel and bounce buffer leaks
Message-ID: <b6f36521-a33f-4a2a-8018-d95b890e2147@sirena.org.uk>
References: <20260517-atmel-v2-1-36c836be6345@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="USxQfCqMN9ynMD/J"
Content-Disposition: inline
In-Reply-To: <20260517-atmel-v2-1-36c836be6345@gmail.com>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_064840_894944_4B218157 
X-CRM114-Status: GOOD (  16.07  )
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


--USxQfCqMN9ynMD/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 17, 2026 at 06:39:54PM +0800, Felix Gu wrote:

> Changes in v2:
> - Switch to devm-managed variants to fix Claudiu Beznea's comment.

The switch to devm is possibly a bit enthusiastic.

> -	host->dma_tx = dma_request_chan(dev, "tx");
> +	host->dma_tx = devm_dma_request_chan(dev, "tx");
>  	if (IS_ERR(host->dma_tx)) {

> -	host->dma_rx = dma_request_chan(dev, "rx");
> +	host->dma_rx = devm_dma_request_chan(dev, "rx");
>  	if (IS_ERR(host->dma_rx)) {
>  		err = PTR_ERR(host->dma_rx);
>  		/*
> @@ -580,12 +581,27 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
>  		 * requested tx channel.
>  		 */
>  		dev_dbg(dev, "No RX DMA channel, DMA is disabled\n");
> -		goto error;
> +		host->dma_rx = NULL;
> +		return err;
>  	}

If the rx allocation fails then instead of jumping to cleanup we'll
return, and since the driver supports PIO operation it'll still be able
to probe...

> -error:
> -	if (!IS_ERR(host->dma_rx))
> -		dma_release_channel(host->dma_rx);
> -	if (!IS_ERR(host->dma_tx))
> -		dma_release_channel(host->dma_tx);

...with the tx DMA channel still allocated.  This is very much an edge
case though, how much it matters is very questionalble.

--USxQfCqMN9ynMD/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMajIACgkQJNaLcl1U
h9CmEgf/QakNzbInpiu4NTqeeVvIoWpIy5d3bZjZxD4S3uYpZjqCFqFGwEaVhp6q
OuLIqkR8yMPbb6TSSSfuysRodTqRwCnKcumkMjAIWkGavZHTSkD7G2REk1hMyPhz
gxWJjR0cOdHivysmKvBYjTaeIV+rDaFR7ygCwYXaX/9wFoB/IFJ7rESApmGT/NcM
kkJWwDtUfh9b4V5hax+S5t2du00PLeuJK3+utumG8MW7IsRpK4F5XLik/0T6kM4l
I5R0TlN5a0beK6JNfA5ui/EhFbDSkthanKVQdjyyh128r6tZzx9u/4/BRN9kqyrq
oGfifMIztXUNb4iZcaIAGKwsFO2zfw==
=kR06
-----END PGP SIGNATURE-----

--USxQfCqMN9ynMD/J--

