Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF8AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYx3UPsVK+IPBRssh3HUX31FUJIXkBIIqhrriLruBy4=; b=ap+gN8TPgeAMcFpz+mA+HfAwmg
	Xybji+DLFO38WjKJMtxx6VvdI6ytcJd05Rol4SD1J31bfRmK2X7UC01xGwcVgkZ2Yc8jGTqioftEb
	ZyDYB8DW30CNsF+ZaP8VD1t2+70dQVEq9MkS1M/VcWgXFZoyCF95ePiqNFMbjk03cMthKsFLwmdlP
	0KG0x8jBOOOvd7BLUKh6DnnJL4pbOHVg/PmsWuc+aVuAJrrTb9guTkwrO5rWj+ZCgCasXQmrmu9oG
	HUeLWkoUFjUnWfN/Mp8VaAC8p3nRbXTa7UgTGRtQw5lCqek5sYVHrSmjaoxjeKU8v2yJLhkBZqsHR
	RBCp2u6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Zw-00000005ht8-3Tc2;
	Tue, 22 Sep 2026 14:34:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Zs-00000005hql-14F3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D372743602;
	Tue, 22 Sep 2026 14:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F92F1F000FF;
	Tue, 22 Sep 2026 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790087675;
	bh=BYx3UPsVK+IPBRssh3HUX31FUJIXkBIIqhrriLruBy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVXhlT5wGgb5gMxwF42e8R2ZWcR1LA9LWOJ9rscpXNJi/RTyrqB/SaXKwTgY+kVYw
	 I983Mq5N0hNe0sp+WMA8b+OMwVlfi5DiifDQZu5EcNQ2nkvf/yCzgct4LBUzfXM3jM
	 igMjR9zEJntsJ6QZdvyExImLzrdvt6nrUE8ptPWDUh4rX7dQNUXhhM5X/yVBI4HHHo
	 K3wHjqLQJpF8pHPCVmD1MJk9+DFWjR2BwP5n5lNLkxvsABUWVwwMCyQDGDNFSWGkcW
	 Uo4zBio81ZhVeyAQe4Sjhv/whR59s6oCJQ2u032m3h9+NkZpcmT25h5wpUH94SlU05
	 /MKmVzHmf+6Hg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AA5011AC56C6; Tue, 22 Sep 2026 15:34:30 +0100 (BST)
Date: Tue, 22 Sep 2026 16:34:30 +0200
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Message-ID: <arKR9oIjbrTM9fTS@sirena.co.uk>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-3-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f03ZgCX7Ycsbfz7v"
Content-Disposition: inline
In-Reply-To: <20260922112134.4167305-3-joakim.zhang@cixtech.com>
X-Cookie: Too clever is dumb.
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


--f03ZgCX7Ycsbfz7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 07:21:32PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add support for the Cadence I2S-SC controller found in the CIX SKY1
> audio subsystem.

> =20
>  obj-$(CONFIG_SND_SOC)	+=3D snd-soc-core.o
> +obj-$(CONFIG_SND_SOC)	+=3D cdns/
>  obj-$(CONFIG_SND_SOC)	+=3D codecs/

This should be sorted in with the vendors, after bcm.

> +++ b/sound/soc/cdns/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_SND_SOC_CDNS_I2S_SC) +=3D snd-soc-cdns-i2s-sc.o
> +snd-soc-cdns-i2s-sc-objs :=3D cdns-i2s-sc.o

We've moved to module-y for module objects.

> +static int cdns_i2s_sc_probe(struct platform_device *pdev)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv;
> +	struct resource *res;
> +	void __iomem *base;
> +	int i, irq, ret;

> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		return ret;
> +	}

We request the interrupt before we enable clocks or anything, an
interrupt could be delivered as soon as we do the request and the
handler will try to interact with the hardware which I imagine might go
badly if it's unclocked or in reset (at least for some integrations).
It's generally easier to make this one of the last thing we do in probe,
once most things are ready.

> +static void cdns_i2s_sc_remove(struct platform_device *pdev)
> +{
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		pm_runtime_force_suspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}

For CONFIG_PM=3Dn forcing suspend won't do what you want, and when it's
enabled it'll also disable.  devm_pm_runtime_enable() might be easier.

> +static const struct dev_pm_ops cdns_i2s_sc_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(cdns_i2s_sc_runtime_suspend,
> +			   cdns_i2s_sc_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_i2s_sc_system_suspend,
> +				cdns_i2s_sc_system_resume)
> +};


RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() are the more modern things,
and avoid the need for __maybe_unused.

--f03ZgCX7Ycsbfz7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqykesACgkQJNaLcl1U
h9DFuwf5AZA0BHA8EDSLr3yT9wJi1GpTmM5ml1rYBCpGZX65b/A94t5G9/rv/JaK
1U2MY1DOsWahuosjvdisvLkRPpsw7URMRcq/poT0R2uwuun/RE7ZVKl7O6XWTrYn
B0wseq8VmrmIX1D3dZ/JSix1/tWbwo3LlhldEK3coNqE5FJj0i2uE1eLT73s63Qp
5rrbx2ttDF3YUn8DPFMNv5vmsUnrwJNpTZGY5wFwJkMUFHtSzi6SEBP9v3jcVeD4
/YIO5xZzZxYjH9n0MGSQ6jVwpoc5dH7k1CCXNPuHgUJulNIVBWaozuRBEJO5mDQI
TLa9Ipsb9Y+5ibLODi60BjpXBN90Kg==
=KQRK
-----END PGP SIGNATURE-----

--f03ZgCX7Ycsbfz7v--

