Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352B2C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgOphpMZQaLhZ23QXn+GUqOhSFA5+GAho7L5ktP0kac=; b=lQzxAb3mk5gWM3+VCEjM9FvuCR
	RdTuNdaCglFIFPoDp8ZkygQyt5Ue5avUSxacvuBhc3yB2Va+RvmCPLYO+sahuakS6dm3z8bcvVlP3
	pLomDUWD3XfpP5k1z/01W/Eqypn16PgrpzUxIvXTcmgnMck+qMsrhtNW/0nm3/uolC8QXmPMktkW6
	Eq3PXOTwx8JGw+IYv9dTrU2bACk03HcKVaIP0T6sQzH5KILbFqZrC/osdpz+/cpvEWfQ8Bl/UdI5G
	GBKQXYCRFRe3H91lnWqueLaKpNbVLjRX/cMgNeaRl6bRPepwWQjq+zjvpvtG0ZNgD6H30Ze7V4LBb
	BTP/jBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSnU-0000000Cn7l-33gv;
	Thu, 03 Jul 2025 22:52:52 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQIO-0000000CPqB-0tfA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 20:12:38 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0D95D1C00AB; Thu,  3 Jul 2025 22:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1751573549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgOphpMZQaLhZ23QXn+GUqOhSFA5+GAho7L5ktP0kac=;
	b=FiCglh9Tms8WiSo2BtH3bmVpvbGxSAA+H8ByhHyEwFc5/ma9s41tmJrEqtguzLkvlWIiF6
	uZM/wv6OEGMQQYm2Qghymc0jY08FVc4oavnkRCYR8Y7ZzPaJpKJ8U6nNQrFrqq4huTTvjh
	UGiCg7Qtk6C7N7wGXUrLGYvqVroZ5Zg=
Date: Thu, 3 Jul 2025 22:12:28 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: t.antoine@uclouvain.be, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
Message-ID: <aGbkLIFkMlihbJUt@duo.ucw.cz>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
 <4cahu6dog7ly4ww6xyjmjigjfxs4m55mrnym2bjmzskscfvk34@guazy6wxbzfh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eiYFnwelYqG2iU/c"
Content-Disposition: inline
In-Reply-To: <4cahu6dog7ly4ww6xyjmjigjfxs4m55mrnym2bjmzskscfvk34@guazy6wxbzfh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_131236_701889_5AB389BE 
X-CRM114-Status: GOOD (  25.61  )
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


--eiYFnwelYqG2iU/c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Other differences include the lack of V_BATT register to read the batte=
ry
> > level. The voltage must instead be read from V_CELL, the lowest voltage=
 of
> > all cells. The mask to identify the chip is different. The computation =
of
> > the charge must also be changed to take into account TASKPERIOD, which
> > can add a factor 2 to the result.
> >=20
> > Add support for the MAX77759 by taking into account all of those
> > differences based on chip type.
> >=20
> > Do not advertise temp probes using the non-volatile memory as those are
> > not available.
> >=20
> > The regmap was proposed by Andr=E9 Draszik in
> >=20
> > Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a=
116.camel@linaro.org/
> >=20
> > Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> > ---
> >  drivers/power/supply/max1720x_battery.c | 265 ++++++++++++++++++++++++=
++++----
> >  1 file changed, 238 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/su=
pply/max1720x_battery.c
> > index 68b5314ecf3a234f906ec8fe400e586855b69cd9..c9ad452ada9d0a2a51f37d0=
4fd8c3260be522405 100644
> > --- a/drivers/power/supply/max1720x_battery.c
> > +++ b/drivers/power/supply/max1720x_battery.c
> > @@ -37,6 +37,7 @@
> >  #define MAX172XX_REPCAP			0x05	/* Average capacity */
> >  #define MAX172XX_REPSOC			0x06	/* Percentage of charge */
> >  #define MAX172XX_TEMP			0x08	/* Temperature */
> > +#define MAX172XX_VCELL			0x09	/* Lowest cell voltage */
> [...]
> >  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> [...]
> > +			ret =3D regmap_read(info->regmap, MAX172XX_VCELL, &reg_val);
> > +			val->intval =3D max172xx_cell_voltage_to_ps(reg_val);
>=20
> I haven't reviewed this fully due to all the feedback you already
> got from Peter Griffin and the DT binding being broken, but something
> that catched my eye:
>=20
> POWER_SUPPLY_PROP_VOLTAGE_NOW provides the voltage of the whole
> battery and not of a single cell. E.g. a typical Li-Ion battery
> with two serial cells has a nominal voltage of roughly 7.4V while
> each cell has just 3.7V.

Phones normally only have one cell...

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--eiYFnwelYqG2iU/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaGbkLAAKCRAw5/Bqldv6
8sYEAKCh0wimF36YRI80R6pAVmloU8qRRgCgnXM0UWB0vtffIz/feHaS3ubBHak=
=t4+u
-----END PGP SIGNATURE-----

--eiYFnwelYqG2iU/c--

