Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C61CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIYMz4mYBHq48k6rRACGaNwfXKnG72CcqYVFvyjKdEo=; b=A0Y/I4B/wjxW/vk0rxPjN+tV4A
	aw+RiiqE9l+bA6AuDCvkwLdimxlGoW6UbCUp1WdfKOUoMC+5CC7mEBbK25HDJw/2McH2sZQY0GB1K
	IHTbIJGfXpZGc/54IGide45pEXfhq6qNg6OmftFAPQ+DAs4s/ai53w7yFARvSd7s8oF6kGzpN7gW1
	vkzwH/OtzysSPlYc3V3mjWqXKqoTFBpa5huALbyTc38g+qUSw0iclTYFR4RN8fykKtWMTC1SkM9Z5
	j8YqojWSHmFSwZKn9Qr1bVYs9qfWWuoZLlptYWIIS+kANiX9DStQdX7wMduQM84lBtQIgwwwQtanY
	2N9JaLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKI1c-0000000GifF-2zM9;
	Tue, 05 May 2026 15:49:32 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKI1a-0000000Gie4-0jqc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:49:31 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 39D3A1F8005C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 15:49:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id EF848B40578; Tue,  5 May 2026 15:49:23 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 70205B40573;
	Tue,  5 May 2026 15:49:17 +0000 (UTC)
Date: Tue, 5 May 2026 17:49:15 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <afoRe6DI4GJIVtg4@shepard>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IcCSgzqLbu8G5Ifh"
Content-Disposition: inline
In-Reply-To: <20250307002628.10684-9-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084930_378293_BE11C268 
X-CRM114-Status: GOOD (  20.49  )
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


--IcCSgzqLbu8G5Ifh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> Add the clocks driving some core system related subsystems of the SoC:
> the "CE" crypto engine, the high speed timers, the DRAM and the associated
> MBUS clock, and the PCIe clock.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 17a4ffc0b7f52..c59f3f789d052 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c

[...]

> +static const struct clk_parent_data hstimer_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "iosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .hw =3D &pll_periph0_200M_clk.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> +				       hstimer_parents, 0x730,
> +				       0, 0,	/* M */

I was looking at the A523 ccu code and see lots of
SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.

Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_GATE
instead? It would surely be less confusing.

One difference would be that the ops end up as ccu_div_ops instead of
ccu_mp_ops. Do you need ccu_mp_ops for some reason?

Thanks,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--IcCSgzqLbu8G5Ifh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn6EXsACgkQhP3B6o/u
lQwfow/+Nmt6lPhpLN/DGQatcYI/cvk6GcczulX9uuLLoTSneynxgeZy25VIhA9r
gDmZowD4hA4UILkiAczLx0yazfTnpXjYRGqfIDchLwaRBrdflY/lPe/Kz+OkRj35
/InUMORdlfLrOKqADax33IVLZEBre+sZ5laGld+MWQnRjmsGyzb8xyfeygWMS/0E
vPEtQfeSOETnAH9JO8p6t4b+rCj34Z1s9A4kBD93M873OB/IwPrhRebCqDMb9V6y
ASujwO/X4e6FRmZIJfgGH+vL1Ghi9QIoLlEdDMM9JcQzJ9BvHU7d1n+Y4kALHW+m
R9wrg88suUU2UngfiHeF2UlxldTY/0Kj0+2YdeZsoe/v/3LEwj4+p0rdnyb2/KDR
1mkAJG+Z0ww7mAsECDGttSYLX3D7koO2LENC3ADYjO2kauZXE/3br3WjwNsQKusk
PTVwWaGCjyoETzcEGU4Yzw0QTC+jjuGfpEn6KaGRojzuV9ZWbzMquNh0OJA18Hgz
hB2GQrHAVVV6wSJPd/xGlU/1ADSANHg7s8waKT6z/kWchUlV/KtWeAtfK8agb2Hj
vfD2Vl7yBHgRd460lBffM8QhMB9ySPmiBtrh4hzbCnm5+EvvM7gNFsSYHHtu4orI
iOQSyV/2V1w7uOXnpWnHlv1NaAgSg69oN7sZc4ejz6VlinneNIc=
=rNoU
-----END PGP SIGNATURE-----

--IcCSgzqLbu8G5Ifh--

