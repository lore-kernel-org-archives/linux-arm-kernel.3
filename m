Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B38D46606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJlnrgsaFVoPcoz34q36AUaoD7Zky3yzLdKE9x1VEEs=; b=Mqj/eG9v8X6Uh0of467G3Vk+aQ
	iushPVg1OdmttJIV6ZKkVFYm0YA45+v/2CGwW5mWO8RQMydzoZGJox4flDGH+Y/wiXZtZRtjiS+dy
	t5i9tu10hhOCqbB1fWiy4PIGhCpNMZkJSQN3FT8ESbhFbANvnmm97BJmf4hq/Rq3GKCcrnDNClhzZ
	NqxTUL4OviP7geG2OWUvg2TREXlaXH7Kd2hSg1KhCqN+5K1anIPHGJ1oUQGqJ45SHBjblWg3+t4TO
	iuJjR2Mv+r42euo/UEWyzDpM4N2yM3Mp8HrdU6u4dXucyFvUOz//BBqw6B7+O6CzRQFq8k159hwTE
	YhyMkmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRfs-0000000CvVA-0CeY;
	Thu, 15 Jan 2026 18:02:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRfq-0000000CvUq-0SeB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3043960130;
	Thu, 15 Jan 2026 18:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A19EC116D0;
	Thu, 15 Jan 2026 18:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768500140;
	bh=Kn6CM13muJURtMblhTu+B8XKHuWGrLq8ki08pxGulnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnqmmgYLIO6vRVPEhJA3xqQRcAHI6Tr3rX+0ylbgKHHb5hZzfFXPsbTSHSvUoTfcy
	 KSEvpK0KVybSKHRc9Mk22oQmrUiJfX6pOUH/YzS6T51JTeH3qJ38gmod01boQy8jqo
	 K35TBA4GxXb79819zJk5FTZ9ho+8gmxwDHciXSKrh45aHekKYMN+BJwNVdDSkq8hL7
	 IORdvIetisScuTmE9sGnsLeiqZOFuNuYEGCDYzZ3ZVovKy/YM8jkjJohVCRKXhg465
	 xtFDN2HOrzraBuxvz5OPud2GyD4ZVDXuC0Efsy/YU6x4r6gu2PY7zv5onXLoqE3IBh
	 AG+iQhZhbQCYA==
Date: Thu, 15 Jan 2026 18:02:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: clg@kaod.org, boris.brezillon@bootlin.com, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 2/2] spi: aspeed: Add support for non-spi-mem devices
Message-ID: <1adf54a9-56f5-4fc4-bba2-837a132fd123@sirena.org.uk>
References: <20260115150454.1575970-1-chin-ting_kuo@aspeedtech.com>
 <20260115150454.1575970-3-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xvW1NsWVoVmF5xI9"
Content-Disposition: inline
In-Reply-To: <20260115150454.1575970-3-chin-ting_kuo@aspeedtech.com>
X-Cookie: Are you sure the back door is locked?
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


--xvW1NsWVoVmF5xI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 15, 2026 at 11:04:54PM +0800, Chin-Ting Kuo wrote:

> +static int aspeed_spi_user_transfer(struct spi_controller *ctlr,
> +				    struct spi_message *msg)
> +{

I'm not seeing anything here that won't work with transfer_one() rather
than transfer_one_message(), that would reduce open coding so if you can
do it it's preferable.

> +	ctrl_val = chip->ctl_val[ASPEED_SPI_BASE];
> +	ctrl_val &= ~CTRL_IO_MODE_MASK & data->hclk_mask;
> +	ctrl_val |= clk_div;
> +	chip->ctl_val[ASPEED_SPI_BASE] = ctrl_val;

This should fit with the prepare_message() callback.

--xvW1NsWVoVmF5xI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlpK6cACgkQJNaLcl1U
h9DIhwf/W8/a6WTvTXkoR6TsMYE4X1woUmylZmwsFN2UaCmgI1L/AfPz/YPV++Kg
zpWoAhy89sXrI0dewD0d/9r5c6eV/TvYD0nF4IHAwCU7lDxZf3fet4WOztYITdcI
J9XpQD+PGCwrjHTRjq+aXUYYhrS7vGhDUOUuY0xwgglOgygS/c8TRAAe7kcaR/jg
a2X3FYPadw1n/Y44EqG84FWyElTCFCz3V38pry5fc5IPQ9eYIgxD+MkxWa5ReSAg
byWuVsR0D55WyOEdf+ZSkYm4tvHmiM29MuVJmF5MXfP9jnJeG+2KSwKoDRYDQYWZ
9bvRisvSKoCqiQKNeacaATDXKGw6Eg==
=ENSf
-----END PGP SIGNATURE-----

--xvW1NsWVoVmF5xI9--

