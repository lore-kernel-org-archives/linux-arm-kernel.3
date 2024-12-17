Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtOzAojt8SPqapBFcvWSKRgjZ1YwFdgzYc3syrc1FbQ=; b=UsD+ma2rVMSWlLETo3E8dJSMXg
	GkfFQOX9zI6eKiFT/3lQUuXU7kU7QbVykegQ8fTRIZsvbe1uu9zzxD5mTCcXN8cxCZhBW3f3iiDnY
	9xEQcMh4FZLVB+XHa8Tho0rCchd43LHWwuPBqqjfE2FKZSOq/U40usu6eWsIzAVq++4/YkTwohDsy
	3UWknKHAFR1TfHWpUHP9kWv1D67GUXcdapZPdIEgidEIQXtGlv6EyM/3swq221xXGQ74MsoVjaP3B
	3QsEQXZMSohquaJGVFIRRovGYnB6EeqOXnd2x+TcpwnagTrHdAonIkM6/3PMm4yg4k7GXVljanaUj
	uGjO7lQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY7H-0000000Df8K-2p5b;
	Tue, 17 Dec 2024 14:00:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY6C-0000000DezO-0lTG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AED57A40E0B;
	Tue, 17 Dec 2024 13:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0276C4CED3;
	Tue, 17 Dec 2024 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734443935;
	bh=XtOzAojt8SPqapBFcvWSKRgjZ1YwFdgzYc3syrc1FbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9heHZ3M17lG7OmKwcjR7ssCnGSkfd8Wp4jjvOKSrwtaaqcjadQqaRrRdNhWzdHVK
	 44fR4YkUHrTQvKJDj/icIhua/mMwDMflmkROPaQb0OSHRXz0ScRIwTxEpkHOy0QTJP
	 gNNhFQrPRqwZpOUG459uSNGfpMwJwswK+vTZUtzsMpo2t4RzTIpLceA2SoVnOt80Iv
	 4ABb1Ud5YackxYrrDd0TaDphAFnAvfNAzRslJv4eDTygbELM5IRUsOq9At2QSk32im
	 sULg/4ybpD6H55O/G25WwfRWiJPSyfs8tOEZiAjP1QdUbcya/Pu2vWoYy8ACR6VccM
	 9aM/O0WG2tZBQ==
Date: Tue, 17 Dec 2024 14:58:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <20241217-impossible-chameleon-of-flowers-8ce18a@houat>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <CACRpkdbcDwJaLmCa_YoP2zFw3fiWn-d1Q773jGh9kcVN8aWQKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fmngw2akgqtiotkg"
Content-Disposition: inline
In-Reply-To: <CACRpkdbcDwJaLmCa_YoP2zFw3fiWn-d1Q773jGh9kcVN8aWQKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_055856_301790_E7C9E097 
X-CRM114-Status: GOOD (  18.23  )
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


--fmngw2akgqtiotkg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 02:41:36PM +0100, Linus Walleij wrote:
> On Tue, Nov 19, 2024 at 3:43=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
>=20
> > [Paul]
> > > The pinctrl code supports an input-debounce device-tree property to s=
et
> > > a specific debouncing period and choose which clock source is most
> > > relevant. However the property is specified in microseconds, which is
> > > longer than the minimal period achievable from the high-frequency
> > > oscillator without a pre-scaler.
> >
> > That can be fixed by introducing a new property with a ns resolution.
>=20
> Perhaps, but I think a setting of 0 should just yield the minimum
> resolution in this case, as apparently the debounce cannot be
> turned off? This would also make sense to expose for
> gpiod_set_debounce() as explained in my other mail.

Yeah, if we want to have 0 =3D=3D lowest resolution, I'm all for it.

Maxime

--fmngw2akgqtiotkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GDmAAKCRAnX84Zoj2+
doNUAX0SGEEc2COqYPAEcGxCntC52XBXJzHjAagNNW0LH235odQkGdtI2AF/bUB9
FcxbRikBf1fW676Lu6RJzC/s3juQeRS4Y/zPRIIfSZpzNHQ7em9kXV3WNMtTUC7/
CD2hcqnSTA==
=tuS5
-----END PGP SIGNATURE-----

--fmngw2akgqtiotkg--

