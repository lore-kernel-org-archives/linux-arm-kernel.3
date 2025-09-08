Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E2FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z9Gt7CVHtANjbWoKy7Kc/rDcC9TpjisQBCwLl/Ilao=; b=f36Fe3QJzonTinbvr1b38ST8tX
	M9gIbk841tyShW8Qp1y8BGpzFQZgLZOpvwsNortQrc/bqEPnPVlLZbtwvJaN79sucrNMAIiuE11D7
	qLg/6txU1I2i5DR3kpRa/obmNU/8i4Hxt9awrtsu5AMYj4kJ4EaXRImjXT/GZSNkJtcED860ngJf4
	+su4/alTjAV2gjYIkporwE9+yU0ycHRvcj7/3x0e2/rqPBV2uyXqwELYhyFjMSV+LHGuMSsTh1Tfg
	j8IXka9pGJL0VhwlFDWnzuZjnvlANpkhkAPBHEmziqNtqCBpRaEAPNdQFG7DO3taSH2T6xvSy8yaP
	MyQX4b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVz1-0000000FBJi-0k5R;
	Mon, 08 Sep 2025 07:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVv4-0000000FAC1-2evB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D77F403D5;
	Mon,  8 Sep 2025 07:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A62FC4CEF5;
	Mon,  8 Sep 2025 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757315044;
	bh=AeCZC4Xp7UU/zbofHlE39ClcIKd0OAOo2hV/opiz/HI=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=Qo5ioNbDYXLZBOcfB57TuPhIDmEBPVgxU0Nt4F4XuDcuG7MJXGTsh3G5SkwVktuS2
	 ClFLPN5pRdpmQJtbA+htpWImcAwVWKnbc08VdnDfmIBVO1pn6m6YemHavpRauO/t6R
	 ojCTOSumLfYsGxSJrJyvrSBvvDEyRH9NMSEeSapbX+UnWOlqrJcUK1im5M2IecVL4V
	 9nL24j1BMPdFjFRTbuWpqXkeLagxUfs+8QBR1mTP0UJSrE6obyuQuP9EEcAFpkq/RW
	 txZ4NWhKDg3mx6fJA0QGdnbEq5qPKel3nBgWK428IM15JDP948dw/c2F9FmV3in2Rd
	 cfjNdTE3+lYlw==
Content-Type: multipart/signed;
 boundary=6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 08 Sep 2025 09:04:00 +0200
Message-Id: <DCN86WR0CPF1.38V3X1O08VYJG@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Lee Jones" <lee@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Wim Van Sebroeck" <wim@linux-watchdog.org>
Subject: Re: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-7-mwalle@kernel.org>
 <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
In-Reply-To: <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_000406_691401_17BC9369 
X-CRM114-Status: GOOD (  10.37  )
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

--6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Guenter,

> >   static const struct of_device_id sl28cpld_hwmon_of_match[] =3D {
> > -	{ .compatible =3D "kontron,sl28cpld-fan" },
> > +	{ .compatible =3D "kontron,sl28cpld-fan", .data =3D &sl28cpld_hwmon_c=
hip_info },
> > +	{ .compatible =3D "kontron,sa67mcu-hwmon", .data =3D &sa67mcu_hwmon_c=
hip_info },
>
> Effectively this means that the two chips have completely different funct=
ionality.
> One reports fan speeds, the other reports voltages and current.
> This should be a separate driver.

Fair enough. I wasn't sure, the reason why I've chosen to add it to
the sl28cpld driver was that I don't want to clutter the directory
with many small board specific drivers. They all have the simple-mfd
parent driver in common. In the end it's up to you of course, so
separate driver?

-michael

--6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaL5/4RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iHHAF/SN8mk4/c9/7qoNU/dYaz4jj027g2vf2/
pv7+yMMwRPbtPffTZM2Eh0NvFRSzQidQAYC/Bh8oKn1Xd+dtXLuRsnqvhWFxlUV5
u8IrsKk3DiMbCQ283oy2lbs60sRh1CNZlTI=
=W+tq
-----END PGP SIGNATURE-----

--6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7--

