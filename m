Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94721C369A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azBeY/ABdzLCK2gCU3irIQ43T5ERKSG6fIfSiV5Z92s=; b=L3WKknBVj1XU2VBjGKVqM+PmZ/
	ofI2mfaiwpJtgOPmHcUOvX7dghOq4LTYPxFwyobklfvHpaMtwV52s4VNrUk0sEpgkiUGT8w3fRScH
	8v89QVpISfUy/lnmkjrgztpgxWoV+Kcjs5tojkF9lN5GJrpYAkGpIfwFwx+EfM1j97VpTWgKOQILU
	SjfxSsZ4XElImjvtpmxuGfeVnVvv2Og2/DDpxEumQXfk24Q9naCXyK/RNAsKkgF3NvlU+EpCndXOV
	9VHHmL04UyI88GkXbErrKb1U3J/xAxOR+iTMtGDVk0MxNNcAR7YSMOxDFYmlnTF3+6QJIwJttnVCh
	l52tsL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pta-0000000ACPu-17ti;
	Thu, 10 Apr 2025 11:16:34 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2o8c-00000009vcR-4337
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:24:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0309A1034EAEC;
	Thu, 10 Apr 2025 11:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744277036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=azBeY/ABdzLCK2gCU3irIQ43T5ERKSG6fIfSiV5Z92s=;
	b=CI4cOCBPBMLylFiXGeRD7c3jrqxluWRjSNAlIVxYBRtfkxu65x+EH4XLY/RWNVQLhZosUf
	SNRanfj363p0NmPSjDBbtK4Aa0/DGdWK1QYocBqQRsROGf+9BoyW+6BUpmDG3PEKT72AzW
	Kt0PPuHmbSfEeymFfHcUdhia9ba74M+Bizo3HQVmUWtKhZT/AhaMEzY9AJ4/fJLJUAXNpY
	4VbjZzMTsHkVRJjxPHOrMpaKk7G7pLhyYiuIE6wCsNy8CwGb2UNE/d5gH5CO/Bw5ahhDaN
	a64VEcfrTUvWWIGW92YyCAn0cDiUW4xAL3k3/Y/X8EwEnICsbdvfcnGQmm3EIQ==
Date: Thu, 10 Apr 2025 11:23:50 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next v4 5/5] ARM: mxs_defconfig: Enable
 CONFIG_FEC_MTIP_L2SW to support MTIP L2 switch
Message-ID: <20250410112350.7dbb299c@wsk>
In-Reply-To: <ea8cc94c-b212-4ae2-8c5b-7697e9b358aa@kernel.org>
References: <20250407145157.3626463-1-lukma@denx.de>
	<20250407145157.3626463-6-lukma@denx.de>
	<c67ad9fa-6255-48e8-9537-2fceb0510127@gmx.net>
	<20250410090122.0e4cadef@wsk>
	<ea8cc94c-b212-4ae2-8c5b-7697e9b358aa@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r5tjFsU34eWBYPJ.iEWYDwo";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_022359_156355_E7BE6DE0 
X-CRM114-Status: GOOD (  32.90  )
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

--Sig_/r5tjFsU34eWBYPJ.iEWYDwo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 10/04/2025 09:01, Lukasz Majewski wrote:
> > Hi Stefan,
> >  =20
> >> Hi Lukasz,
> >>
> >> Am 07.04.25 um 16:51 schrieb Lukasz Majewski: =20
> >>> This patch enables support for More Than IP switch available on
> >>> some imx28[7] devices.
> >>>
> >>> Signed-off-by: Lukasz Majewski <lukma@denx.de>   =20
> >> thanks adding the driver to mxs_defconfig. Unfortunately it's not
> >> possible for reviewers to identify the relevant changes, =20
> >=20
> > Could you be more specific here?
> > As fair as I see - there is only 14 LOCs changed for review. =20
>=20
> Really, the comment was very specific. You make multiple independent,
> looking irrelevant changes to the file.
>=20
> >=20
> > Please also be aware that MTIP L2 switch driver has some
> > dependencies - on e.g. SWITCHDEV and BRIDGE, which had to be
> > enabled to allow the former one to be active.
> >  =20
> >> also the
> >> commit messages doesn't provide further information.
> >> =20
> >=20
> > What kind of extra information shall I provide? IMHO the patch is
> > self-explaining. =20
>=20
> For example explain why do you think GPIO_SYSFS should be dropped.
>=20
> >  =20
> >> In general there are two approaches to solves this:
> >> 1) prepend an additional patch which synchronizes mxs_defconfig
> >> with current mainline
> >> 2) manually create the relevant changes against mxs_defconfig
> >>
> >> The decision about the approaches is up to the maintainer. =20
> >=20
> > I took the linux-next's (or net-next) mxs defconfig (cp it to be
> > .config)
> >=20
> > Then run CROSS_COMPILE=3D ... make ARCH=3Darm menuconfig
> > Enabled all the relevant Kconfig options and run
> >=20
> > CROSS_COMPILE=3D ... make ARCH=3Darm savedefconfig
> > and copy defconfig to mxs_defconfig.
> > Then I used git to prepare the patch.
> >=20
> > Isn't the above procedure correct? =20
>=20
> No, it is not correct. Do not make any changes in the "Enabled all the
> relevant Kconfig options and run" step and check the result. Do you
> see difference in result file? If yes, then why such difference
> should be part of this commit?

Ok, I get your point. Then I shall prepare a separate, pre-patch.
Thanks for info.

>=20
> Best regards,
> Krzysztof


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/r5tjFsU34eWBYPJ.iEWYDwo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf3jiYACgkQAR8vZIA0
zr2DEgf+KE3yYGEwlrYyU8JplEso25aCWU0x5ENkFsHPsIds+J9TLbxooFsu53fP
6Y2JsJPakI0iBlKqW55uuZWh20wPWTFpIoqAk77FautHOO3BcML3lov3upWRH273
RGVQEJHRGURV/Q2w2jGM6fNH7JjWZjNHRS6WqNZnRm4WedNh5o3MJobE60k/yNOn
0RFMSqPOegpWpEJQnSmcip2s66i50dy2ou8kqmUwpDX6OMwJP8sELshq2eJDgH2G
z/p9pXjh5tfkJw3KO/LUktGgHfCdsjhP4pK3WNaLpSIHEMd1kDEnrrbhaQwMyVwt
qfkJipgw2GEVOxmgaUF5g4GIJ92exQ==
=Cxw1
-----END PGP SIGNATURE-----

--Sig_/r5tjFsU34eWBYPJ.iEWYDwo--

