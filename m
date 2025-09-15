Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F159CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IS5vHz7rcdvKn59w4ocCeK9p2cO4wgkBK087OWWbDc=; b=atl8DMTc6f/JexZdLLZSRxjNeY
	9jO3X4QV69eBoHoPLoQ3o2QlkT0vJk91fJvYVzlZ4/1IN6pZOvQi91aUTWzhCMrtRSMfpbHQnD56S
	o7qqNMaa85sPuwJ6jmL97VjOa+4iYnfE6p1rI9HK/H8jXKUDzwO9AjGtPACvfsLOW7ORmoiEJt6dV
	BBGnuHg1m7zWHbvx+qSz20iAET/wOWb+lld23kWomzcUxiM2VkycYtLfzeFWHpjFP3tvL/0wd5aI1
	8/jKbvSULKHYH+hXYKskpW+IOVeLuq9tckp/GetlKd39yw6DroJOJ3XuJ6SgeJGpnshy1qQkYI61X
	hOJm5A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyADv-00000004hn3-2uBG;
	Mon, 15 Sep 2025 14:30:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyADu-00000004hmt-3Ri5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31FF560244;
	Mon, 15 Sep 2025 14:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8F5C4CEF1;
	Mon, 15 Sep 2025 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946629;
	bh=apPcCqsC8a6v7Kjyoy9pw3XOQ7f+yRGI8jPksoqPdkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFt57mQz/v2JY1RBdOkAHsCBt/JhVM6K/IfIadF5CMVc7qLDvu4ODHS4fLhs2wqDJ
	 8BGNFsvIJWxwPUaEpeim4emSs/5o2hh/tD0hcNYw6RuAzNnhLCTMVAkz94KvtPIi6l
	 9ehKfhFUdY1AbEU/Z8f78KlBqbOVQIt10/tGnyHxKkLhJJUkGF9X8PsTdTwigkdQgz
	 mE7K8k2JqeHVwyxOJovchUFObbp/IiT4rTJfn378MMk7eQe13S5aF450zYKytNQEwr
	 7NiwwNPk5VtUNvTA1+9601OsvFf/MckI8gLZ4vU3WDQi9b+LvKWkvSS01P1tiHDnCB
	 Lp6vkRYteVvIg==
Date: Mon, 15 Sep 2025 15:30:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Axiado Reviewers <linux-maintainer@axiado.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] spi: axiado: Add driver for Axiado SPI DB controller
Message-ID: <9b6aaad6-3dca-49e3-9a59-8e8a0179a517@sirena.org.uk>
References: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-0-814a1fa2a83e@axiado.com>
 <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-2-814a1fa2a83e@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6o3ytfShT2K67AjJ"
Content-Disposition: inline
In-Reply-To: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-2-814a1fa2a83e@axiado.com>
X-Cookie: Use a pun, go to jail.
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


--6o3ytfShT2K67AjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 15, 2025 at 06:11:56AM -0700, Vladimir Moravcevic wrote:

> +	/*Calculate the maximum data payload that can fit into the FIFO. */
> +	if (fifo_total_bytes <= protocol_overhead_bytes) {
> +		max_transfer_payload_bytes = 0;
> +		dev_warn(&spi->dev, "SPI FIFO (%zu bytes) is too small for protocol overhead (%zu bytes)! Max data size forced to 0.\n",
> +			 fifo_total_bytes, protocol_overhead_bytes);

This might be a good fit for dev_warn_once(), I imagine if gets
triggered lots of whatever operation triggers it will happen and the
current code would spam the logs.

> +	ret = devm_request_irq(&pdev->dev, irq, ax_spi_irq,
> +			       0, pdev->name, ctlr);
> +	if (ret != 0) {
> +		ret = -ENXIO;
> +		dev_err(&pdev->dev, "request_irq failed\n");
> +		goto clk_dis_all;
> +	}

None of the other allocations are managed using devm, you most likely
have unsafe race conditions especially if the interrupt line is shared.

> +static void ax_spi_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr = platform_get_drvdata(pdev);
> +	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
> +
> +	clk_disable_unprepare(xspi->ref_clk);
> +	clk_disable_unprepare(xspi->pclk);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	spi_unregister_controller(ctlr);
> +}

This will do a bunch of teardown before unregistering the controller
meaning that new operations might be submitted after the clocks are
disabled which I imagine won't go well.  You should unregister from the
subsystem first, then tear down the other resources.

> +
> +static struct platform_driver ax_spi_driver = {
> +	.probe	= ax_spi_probe,
> +	.remove	= ax_spi_remove,
> +	.driver = {
> +		.name = AX_SPI_NAME,
> +		.of_match_table = ax_spi_of_match,
> +	},
> +};

There were a bunch of runtime PM calls but there are no PM operations
here at all.  That's not specifically a problem, for example power
domain level PM with full state retention would work here, but it seems
like at least stopping and starting the clocks would be a good idea.

--6o3ytfShT2K67AjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIIwAACgkQJNaLcl1U
h9CPLwf/RhrIkexh1/aNsOJYJL1gMHWTqKfNxLZYYXlBw8Nz2ZLtKKwNdPENxr/Z
+6dnY8StmyTSKkUOHjzsLH7xqN4gGvxf9RIBWHp529LSu+LkTxcGgaAHkfWcftvF
RbnW46hMV/aq4A48M7xL8OlK2FXopDGmyicThrkm6T6XgfKcgMExMlxyDCVEt+0E
YBO2phalHJCkPltNmzJrSbJzf6o0nGEf6Bxl7r/WXadmTRuF2hLZ5cYMJ5G8JC+G
UYfRYZMuVhMh6E0KC55r2JEoYZy+YBYFC+7mkmi2SDxVh2moz9GRkveGp/7L2r82
VajNVG7ozKcYcYpsx5VuwhvpK8r8jg==
=W84H
-----END PGP SIGNATURE-----

--6o3ytfShT2K67AjJ--

