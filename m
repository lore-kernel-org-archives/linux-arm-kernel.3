Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AB3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hl/sUGUC;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=g3592kBH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GwjMEVJ55uERIfzFeqRRXZCs23cFREQpH1D8o4Coa70=; b=hl/sUGUCma7DDP3/UsD67C7u6y
	KbaFWDeN5llU7rn+u4Hp4RRpcCLn3iR9Zyn5RSK1gCDlnAYSz8VetHvvaffSGiJ4SQRxjbLZHJkSo
	jZIRwKXsuDlhgcF/5zLKZxnkJAuTm/38iRIxF95GUjZOcVSKA/oxaVB0nHIUkR+dg05Tw/79lDnhD
	csLDyXwpnh0CFIkKPQgoE2nQreKDdRPhgc4Qu3IB8TtwtTL6FZJEnyjaHjBY86YrPuwxMy76IIwMv
	67XFxr6JOnNb/dnxOpbZDYJOJ2h4zNkZICl4ykUtI9149uDZXtgL9jak9CGI8Rtjio5tV60pPVwEq
	1fLha8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIbH-0000000CEsl-1P5i;
	Fri, 06 Nov 2026 11:59:19 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIbE-0000000CErn-01B8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:59:17 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 235C62006C0;
	Fri, 06 Nov 2026 12:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793966354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwjMEVJ55uERIfzFeqRRXZCs23cFREQpH1D8o4Coa70=;
	b=g3592kBHhVuwXVN9D/52YIngNgooMcSim/NI483dNTYm6A8FfDbHfUizYRUcvjYV3+oB6/
	zvMd6Y7WCRI7Sm7u8AQO3oedmWawG/agB3OdHJJo3E+XfKlm0v67SrXzrOlK/OGfv4aO8j
	L3f3pURIKwnkHSaN90w4ijc/mfbFtKk4AJxvB++vrx54SYO4jCWO5RniMWXTNTI8sZylFm
	x2K5pTIU59H1REO5At/K9qEUpLEq846nnUyGa7J9i+j4Dye9mXqkjAo/UbVMvLzDWdXH5d
	d7Mgi2HnXyES5vBIrydvMNvi8EBwAcdUTKhVA+67Eqvvwwd0Xp/TbKMeqKNPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793966354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwjMEVJ55uERIfzFeqRRXZCs23cFREQpH1D8o4Coa70=;
	b=QXqXmz+XtIjz4sHzYo2jKhdRLSQhshOWGHvJPkYZNSl0QQoOul1i8aNNADulO4Vj0AdaCw
	557ZW7sKUsd+I3rDDj8FjWh6R9PeZy3gJL4mauYwRs1nBoRVxMhuCet4in62ixTy+OKxAo
	fmhSzNGn/AykSgwG4kYRyP4tzlQcBk3Uk5zjYUJkQWYMQumQBBS57UCNpfGnxuVGuc7dS1
	3TLFcB1EiRTShrIz0LEUvued1Y5Jsfi/X5UFVyRW1/a3HsS85IuptX19rMCHPcEpNSMHy6
	4KpzzrjGgreyff4k7eo3T8tFEO4ztRcOD0cyYzmhHpHIo+E3d2cDcHZSuWmz+w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793966354; a=rsa-sha256;
	cv=none;
	b=VzPUzq+PILA9d6AAHAD+DrjS1+PbJQ9JejER1JWyZr2zdd5bm6bkCBVY8cHYQpZaYTCf9v
	bx+hNjDHIAoabtuIfySoWh452G21uWLBPz/dtuvWlJyXQzWpQiD1qjuPX7PPlxUhHWfbcK
	acMhfdXNWlXRiQvD9I2ixZHH0Pf7XAiNB0sStFIjmcDPigUKhvarU2CsXUt5kBFA2JE+lY
	9MhjcHgLlWd+42sBfUx9+r90a8nxZqeyT4px+uOkY07XPbXWJoe1C+NxJS3ZVIPl/JpkO7
	5ud3a9p7YvuME5XZB7HsuoJKNlfg6PZGSSl36FqgKcPJ2TD/y7pyHEFApgsmqQ==
Message-ID: <22be96ba4139cad12e46b5e64ae95b0033bde60a.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/7] reset: Add BCMBCA block resets through the PMB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore	 <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Guenter Roeck	 <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Randy Dunlap	 <rdunlap@infradead.org>, Ulf Hansson
 <ulfh@kernel.org>, Benjamin Larsson	 <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org
Date: Fri, 06 Nov 2026 12:59:13 +0100
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-5-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
	 <20261106-xg6846b-bcmbca-xrdp-reset-v3-5-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035916_202979_B0AA834D 
X-CRM114-Status: GOOD (  25.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fr, 2026-11-06 at 09:26 +0100, Linus Walleij wrote:
> Implement the BCM6846 XRDP reset group through the shared PMB regmap.
> Assert all blocks before releasing any of them, preserving the vendor
> reset masks and ordering. Provide the independent PVTMON acquisition
> reset as well. Serialize complete sequences and hold blocks in reset
> on failure.
>=20
> Power domain consumers must enable their domains before requesting a
> reset.

Before requesting or before (de)asserting?

> Zone transitions belong to the PMB power domain subdriver.

Why mention it here?

> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/reset/Kconfig            |  13 +++
>  drivers/reset/Makefile           |   1 +
>  drivers/reset/reset-bcmbca-pmb.c | 243 +++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 258 insertions(+)
>=20
[...]
> diff --git a/drivers/reset/reset-bcmbca-pmb.c b/drivers/reset/reset-bcmbc=
a-pmb.c
> new file mode 100644
> index 000000000000..e8e079c9ccb5
> --- /dev/null
> +++ b/drivers/reset/reset-bcmbca-pmb.c
> @@ -0,0 +1,243 @@
[...]
> +struct bcmbca_pmb_reset_group {
> +	const char *name;
> +	int (*reset)(struct bcmbca_pmb_reset *rst,
> +		     const struct bcmbca_pmb_reset_group *group);

This is again an unnecessary indirection.

[...]
> +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group)
> +{
> +	const struct bcmbca_pmb_reset_block *block;
> +	enum {
> +		PASS_ASSERT,
> +		PASS_DEASSERT,
> +	} pass;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!group->num_blocks)
> +		return -EINVAL;
> +
> +	/* Assert every block before releasing any of them. */
> +	for (pass =3D PASS_ASSERT; pass <=3D PASS_DEASSERT; pass++) {
> +		for (i =3D 0; i < group->num_blocks; i++) {
> +			block =3D &group->blocks[i];
> +			ret =3D regmap_update_bits(rst->regmap,
> +						 BCMBCA_PMB_REG(block->bus, block->device,
> +								block->offset), block->mask,
> +						 pass =3D=3D PASS_DEASSERT ? block->deassert_value :
> +						 block->assert_value);
> +			if (ret)
> +				goto cleanup;
> +		}
> +		if (pass =3D=3D PASS_ASSERT && group->assert_hold_us)
> +			usleep_range(group->assert_hold_us, group->assert_hold_us * 2);
> +	}
> +cleanup:
> +	if (ret) {
> +		dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u device %u: %d\n",
> +			group->name, str_assert_deassert(pass =3D=3D PASS_ASSERT),
> +			block->bus, block->device, ret);
> +		bcmbca_pmb_reset_cleanup(rst, group);
> +	}
> +	return ret;
> +}
> +
> +static int bcmbca_pmb_reset(struct reset_controller_dev *rcdev, unsigned=
 long id)
> +{
> +	struct bcmbca_pmb_reset *rst =3D container_of(rcdev, struct bcmbca_pmb_=
reset, rcdev);
> +	const struct bcmbca_pmb_reset_group *group;
> +
> +	if (id >=3D rst->variant->num_groups)
> +		return -EINVAL;

Since .nr_resets is set to rst->variant->num_groups, this was already
checked by fwnode_reset_simple_xlate() before the reset controller was
created.

> +	group =3D &rst->variant->groups[id];
> +	if (!group->reset)
> +		return -EINVAL;
> +
> +	guard(mutex)(&rst->lock);
> +	return group->reset(rst, group);

Call bcmbca_pmb_reset_sequence() directly or fold it in here.

> +}
> +
> +static const struct reset_control_ops bcmbca_pmb_reset_ops =3D {
> +	.reset =3D bcmbca_pmb_reset,
> +};
> +
> +static int bcmbca_pmb_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *regmap =3D dev_get_regmap(dev->parent, NULL);
> +	struct bcmbca_pmb_reset *rst;
> +
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +	rst->variant =3D device_get_match_data(dev);
> +	if (!rst->variant)
> +		return -ENODEV;
> +	rst->regmap =3D regmap;
> +	mutex_init(&rst->lock);
> +	rst->rcdev.owner =3D THIS_MODULE;
> +	rst->rcdev.dev =3D dev;
> +	rst->rcdev.ops =3D &bcmbca_pmb_reset_ops;
> +	rst->rcdev.of_node =3D dev->of_node;
> +	rst->rcdev.of_reset_n_cells =3D 1;

Do not set of_reset_n_cells, .of_xlate isn't set either.

reset_controller_register() sets .fwnode_xlate =3D
fwnode_reset_simple_xlate() and fwnode_reset_n_cells =3D 1 by default,
of_reset_n_cells will be ignored in this case.

> +	rst->rcdev.nr_resets =3D rst->variant->num_groups;
> +	return devm_reset_controller_register(dev, &rst->rcdev);
> +}
> +
> +static const struct of_device_id bcmbca_pmb_reset_of_match[] =3D {
> +	{ .compatible =3D "brcm,bcm6846-pmb-reset", .data =3D &bcm6846_pmb_vari=
ant },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcmbca_pmb_reset_of_match);
> +
> +static struct platform_driver bcmbca_pmb_reset_driver =3D {
> +	.probe =3D bcmbca_pmb_reset_probe,
> +	.driver =3D {
> +		.name =3D "brcm-pmb-reset",
> +		.of_match_table =3D bcmbca_pmb_reset_of_match,
> +		.suppress_bind_attrs =3D true,

This is new. Why?

regards
Philipp

