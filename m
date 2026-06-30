Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2668C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3sGTFQyxhf710EoXPL7ZgKgQDTu94F/o5gJOr5YAFU=; b=fMc3WghfQtQeXl74yjHbqAvWIT
	t52kGdtXmTXNsEBPPpvLSwkIdC2J0vxJmEQIgNOlGg8+JNkGT7aURXTyY1UB2kk+aHcOav/JpXlmr
	tf6pzmJDZ3akut5/NdzLziH+SrNozITwy4QbX/83tOMmAfcQo46wwXrddNMSRgm6oXh78T1H7O8e9
	UrXmzqFFF5hBLdau1utbcxsi4V0CTMhyQ23ywR77BKei45r76rgMG1MFYa5yR8/0+Ib5JRfZE1QrB
	4l0nTy76eeFJww5umThf4a8F5Y0TocusS79mPi87A7+fDkcpRIiD0PvEOukNkwYeW8JAuaqSjouMs
	8jR/OyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYSa-0000000H9f5-43Pb;
	Tue, 30 Jun 2026 13:25:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYSX-0000000H9eg-0z1k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:25:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 621FF4E40B9B;
	Tue, 30 Jun 2026 13:25:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21ECA6025A;
	Tue, 30 Jun 2026 13:25:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4772B106F1825;
	Tue, 30 Jun 2026 15:24:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782825900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=M3sGTFQyxhf710EoXPL7ZgKgQDTu94F/o5gJOr5YAFU=;
	b=NCUS11JPwA+J9uH1x6EmuZisSfg1N27jNVUGA4+oa/XrDXtnkh4+PfNiHe//NHF5uGkybc
	9+HzyGP4ac6GG5KxdH4NAJK5NdKZxUql9EA1nFOu1T+dCxsZNyttEaM2yG32VZdfKCHQFM
	vgPE95AAKipzasMHwuemjGRQuXi7VoZS4faa+PFGQv5pg3/jE1+CvYGfcMA95ELVTcS66R
	qfCFRQQ4IaqqpAooacmWlmq7u2uY0D/kO707c6wt9zwr9+vmpm6xKuOaiGjn7Q30J/B57m
	yZsNdyBincX/LrhiZxs1iYC/It6uz8gTYDAal7G70TqkQ+1pQg5PtY1g0o9qlQ==
Message-ID: <984d68f4288c225bb4bbb2db88f29098ebaa0ccc.camel@bootlin.com>
Subject: Re: [PATCH v5 0/5] Add support for AAEON SRG-IMX8P MCU
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: thomas.perrot@bootlin.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley
 <conor.dooley@microchip.com>,  Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Shawn Guo	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, =?ISO-8859-1?Q?J=E9r=E9mie?= Dautheribes
 <jeremie.dautheribes@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Lee Jones	 <lee@kernel.org>
Date: Tue, 30 Jun 2026 15:24:54 +0200
In-Reply-To: <CAMRc=MdJJnRTOSEecqpX-EddJRAzWc_1a-cg3wrW8m0jR2Fihw@mail.gmail.com>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
								 <b4396f57-3501-4e89-9cf3-8dc5d7cad9b7@roeck-us.net>
	 <31477953aace52bb6594461e82ddf99493af2329.camel@bootlin.com>
	 <CAMRc=MdJJnRTOSEecqpX-EddJRAzWc_1a-cg3wrW8m0jR2Fihw@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-9X53wTzqLt2/ZcqSFvOL"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_062505_552385_55669EC4 
X-CRM114-Status: GOOD (  15.02  )
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


--=-9X53wTzqLt2/ZcqSFvOL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bartosz,

On Tue, 2026-06-30 at 00:47 -0700, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 18:04:59 +0200, Thomas Perrot
> <thomas.perrot@bootlin.com> said:
> > Hello Guenter,
> >=20
> > On Sat, 2026-04-11 at 17:12 -0700, Guenter Roeck wrote:
> > > snip
> > >=20
> > > Sashiko has some interesting feedback that might be worth looking
> > > into.
> > >=20
> > > https://sashiko.dev/#/patchset/20260408-dev-b4-aaeon-mcu-driver-v5-0-=
ad98bd481668%40bootlin.com
> > >=20
> >=20
> > Thanks for the pointer. I went through all findings and addressed
> > the
> > =C2=A0 valid ones in v6:
> >=20
>=20
> Did I miss anything? I don't see the v6 neither in my inbox nor on
> lore.

I just submitted it. I was waiting for the tests to finish.

Kind regards,
Thomas Perrot

>=20
> Bart

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-9X53wTzqLt2/ZcqSFvOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmpDw6YACgkQn8ALBXH+
Cu3Z4QwAtYCULW7li/8c+W51thD4TA+XAWl/WlY9Ygahvsw/16ifn5pstgFNxRvz
LavDMxiMsym+2YAcZ8Y3UaAWhOdTU18j6LA4mLqb+NUrq7jN2TGepGqcZme5pPdZ
5NnBdflkVEYlBVcKZp5O+o3TsCKNlgiN7LYpIQ7AZWRlzdNxsdStBUbsK3SZJtUi
RSKYrjYj5nT11lAMlWWnucJd+9EfIQR+sLUyrkd8nf8NaUWaOH25ltkmhmaeSC9v
0rsELJYKjWi+xvripQsCgwF9mgY7vTMfVNgnfbw4w8ZYN/4avpqSwZwnDJEB25T7
NIoNsKoMmbiw/AADZ4yqxNPe0RqGw7+JZ7G9chtrpcoRDAhhYOLHhaxGZxyHZjcS
1jHcL4KDExhlR8U7WNj7ooJO+Scg1Yq9hlP/p15W7JJ/yLLXNhKrb5VNeWh8P4LY
tZ2oQvt5yiZThaoh6mSbQYa9u4MENm1tEk9hilHvJLcS60MtXrINYK8PrXK9jw9W
kpiTGMur
=CcQS
-----END PGP SIGNATURE-----

--=-9X53wTzqLt2/ZcqSFvOL--

