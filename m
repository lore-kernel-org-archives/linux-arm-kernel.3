Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51371C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AB5HMFb5Ze0rWihKOGGWtd3NJzKOYTViPUGmV8IbG6s=; b=eLA2RG4scvluH6EpN0XKqvX3oD
	inLOD9WDQp5k2oeJDSwWDWqV5LIgGT2xc2QPZEe0x6JTZCnYHsUKrdvfhNV8vAwgbE/q4vjAEr+kG
	7Dn8Kk7+X1NBDIUMpTNAVazzMhjKAmiJy7o+hgYy6d5qZma/XL9MWvvKS5k3CtCJnW++BUuCLoV/D
	5PY0a34XZUpOzzN73WGnWjXRcNWWUX/ythBzKyO/2osCfB1K3Fyyj01K9Jq0tWfPTGFwQRlYBisYA
	jzNdDit9RRwyggwDFf5E31ySBt+gpmvVw5kuU08e8qztNsZT+qPTIsL/JQ21L5f+t5Er6nAF9wgGX
	o0v8yIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozEr-00000007BXM-088C;
	Wed, 29 Jul 2026 08:02:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozEp-00000007BWp-2YIf;
	Wed, 29 Jul 2026 08:02:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 45789407A8;
	Wed, 29 Jul 2026 08:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A2DA01F000E9;
	Wed, 29 Jul 2026 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785312123;
	bh=AB5HMFb5Ze0rWihKOGGWtd3NJzKOYTViPUGmV8IbG6s=;
	h=Date:To:Subject:From:References:In-Reply-To;
	b=n/kHgj/9nbxsgT5ELgKoxSwW7yZ+m7ueHe8STjaH4ll3CMeD+A42uqK/VLI2tTtHt
	 zbYl/Oe+MTochKh7lIbuxvcy2TxEgJ7bOscmWVQAaH2zLaN+yC+Hyw+23YASOh1mJu
	 TxKYkFVW6vHRoEzm/Mnmyd8lQBifvA5ERhT7NNUzMlgu7sIpvWSVoNsvR7ogxdLQ/H
	 bBvNLUdpHH4iFyznAr+GJBsYq3D9WI22buXifcY3tb32qEDDCX3b8fnK5w0RWVRlGH
	 GjXCpC/i3iMwjUPTO0ka3pl2JHGpHWSExKmLj+jIf7ju034caZQuTTqtGXbrJ3CWc+
	 kZyQ2VnWpSPBw==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a369d9f282471ab4613f2d34b9edebaf16481b78715d95de6253cba98872;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 29 Jul 2026 10:01:59 +0200
Message-Id: <DKAWBT1F1VM2.1LA8AKQ6B17AE@kernel.org>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
 <linusw@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v6 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
 <20260729043026.1811147-4-manikandan.m@microchip.com>
In-Reply-To: <20260729043026.1811147-4-manikandan.m@microchip.com>
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

--a369d9f282471ab4613f2d34b9edebaf16481b78715d95de6253cba98872
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 29, 2026 at 6:30 AM CEST, Manikandan Muralidharan wrote:
..

> +static void spi_nor_sfdp_nvmem_put_np(void *data)
> +{
> +	of_node_put(data);
> +}
> +
> +/**
> + * spi_nor_register_sfdp_nvmem() - expose the SFDP as a read-only NVMEM =
device
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * Expose the whole SFDP, in on-flash byte order, as a read-only NVMEM d=
evice
> + * rooted at the flash's SFDP child node (compatible "jedec,sfdp"). This=
 lets
> + * generic (fixed-layout) or vendor (nvmem-layout) cells reference any S=
FDP
> + * data. The device is only registered when a child node with the "jedec=
,sfdp"
> + * compatible is described in the device tree.
> + *
> + * Return: 0 on success or if there is nothing to do, -errno otherwise.
> + */
> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> +{
> +	struct device *dev =3D nor->dev;
> +	struct nvmem_config config =3D { };
> +	struct nvmem_device *nvmem;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!nor->sfdp)
> +		return 0;
> +
> +	np =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
> +	if (!np)
> +		return 0;
> +
> +	/*
> +	 * Register the put before devm_nvmem_register() so it runs last on
> +	 * detach, after the NVMEM device that uses the node is gone.
> +	 */
> +	ret =3D devm_add_action_or_reset(dev, spi_nor_sfdp_nvmem_put_np, np);
> +	if (ret)
> +		return ret;

Sorry I've missed that in the previous version. I guess we do that
because we hand the device_node to nvmem. But shouldn't it be part
of the NVMEM framework to do a of_node_get()?

> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;
> +	config.name =3D "sfdp";
> +	config.id =3D NVMEM_DEVID_AUTO;
> +	config.owner =3D THIS_MODULE;
> +	config.read_only =3D true;
> +	config.word_size =3D 1;
> +	config.stride =3D 1;
> +	config.size =3D (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords=
));
> +	config.reg_read =3D spi_nor_sfdp_reg_read;
> +	config.priv =3D nor;
> +
> +	nvmem =3D devm_nvmem_register(dev, &config);
> +	if (IS_ERR(nvmem)) {
> +		/* NVMEM support is optional. */
> +		if (PTR_ERR(nvmem) =3D=3D -EOPNOTSUPP)
> +			return 0;
> +		return dev_err_probe(dev, PTR_ERR(nvmem),
> +				     "failed to register SFDP NVMEM device\n");
> +	}
> +

so we can do a of_node_put() here?

-michael

> +	dev_dbg(dev, "exposed %d-byte SFDP as an NVMEM device\n", config.size);
> +
> +	return 0;
> +}
> +

--a369d9f282471ab4613f2d34b9edebaf16481b78715d95de6253cba98872
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCammzdxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/it6gF/V3GubkwpHoS9P9IU244sBsKtytRavuvh
hXPhPMqXriH2cB1f70x+LBiHYBye74L+AYDkK5z86ahoo8Muf+vFJGWwpFHZziaa
0bbnosqgeVloCl0urxpv75kT0JbgJEHN8es=
=fp/9
-----END PGP SIGNATURE-----

--a369d9f282471ab4613f2d34b9edebaf16481b78715d95de6253cba98872--

