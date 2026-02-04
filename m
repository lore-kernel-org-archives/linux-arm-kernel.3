Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F0E9D3E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=if5483qQrJQt1LsWfjNrmvmy7Ks2C5RuRklaCkb/T1o=; b=0V2xY5tN46fpSKnMSBGx/j4WTE
	uq/Btd0lFzbBT8lFJl/oo45GTRTvg+UXkvvjOLlCL0/aFAX5JkT/N3QYZtNGv95px/3QQSqUqkQaz
	h17uej6oWXfQ90m2m/h4Z6m2EJt1mO/ExHJVHAs7d8fEYx8GHKpYY2AxUy5B0C/z3TKl3mzR3BuGz
	BINjVgOu+jrvDpy8Xced7idCIQzVZJDptMrHPzjFq6HMb2WGt6X5uzLJnRXNOg2aPjYTfb0Il4q7L
	Rusb+OanmOO0/UP7wTxaaQkOj7PVKgB4dUfKu3DdjsPIGiwQGm8WneZ4M18S69ZYIeBc/hTk4ex13
	G/40lglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndf7-00000008ZkU-27jS;
	Wed, 04 Feb 2026 14:15:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndf4-00000008Zk1-1HAJ;
	Wed, 04 Feb 2026 14:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 128EB407B8;
	Wed,  4 Feb 2026 14:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B285C4CEF7;
	Wed,  4 Feb 2026 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770214514;
	bh=21n5lossvuF5I/ddB3keVySdnSktes5dlscbzt0UnQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipyO18yZrcu+f3RbHb117XAIaxuUOT7ZD/+gcha3aOGnUVOa1qb9M2LhMS7vccAC/
	 fImiRVy/L3C2LQ007znheCuFmO1kg0HbDrhd7GZNP9HBcqIBKNqLF1RLQHUYFa3+LL
	 6yW5M2lUw+WztPdhC9i3TPI5Wi7K8sonjphTcQWSYMmGE4P4/7yw9BiVa3L+a0Ye2p
	 6L9tz8nORwg3Qn3GFM0QcT4sWMhHD5QJ36qIgmmjk0TNuH6uVMgmc7rdX9oaJDpQpz
	 8KVq3Om5UsE5D33/XxKjIEJmfnFeo5lAeijLYo5t8q/EJ/++38ZeCpTBx3pKI3oPpp
	 sNviG/meHYClw==
Date: Wed, 4 Feb 2026 14:15:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <20260204-crawlers-nacho-d7c9021cdb6f@spud>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XRukpB6yERUMkTmR"
Content-Disposition: inline
In-Reply-To: <aYL9zgEyCarrluvP@black.igk.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_061518_404600_6A47E623 
X-CRM114-Status: GOOD (  21.17  )
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


--XRukpB6yERUMkTmR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > > pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> > > function, and really belongs in the amlogic-am4 driver. There are thr=
ee
> > > reasons why.
> > (...)
> > > The other dt_node_to_map implementations accept a being called for
> > > either a node containing pin configuration properties or a node
> > > containing child nodes that each contain the configuration properties.
> > > IOW, they support the following two devicetree configurations:
> > >
> > > | cfg {
> > > |       label: group {
> > > |               pinmux =3D <asjhdasjhlajskd>;
> > > |               config-item1;
> > > |       };
> > > | };
> > >
> > > | label: cfg {
> > > |       group1 {
> > > |               pinmux =3D <dsjhlfka>;
> > > |               config-item2;
> > > |       };
> > > |       group2 {
> > > |               pinmux =3D <lsdjhaf>;
> > > |               config-item1;
> > > |       };
> > > | };
> > >
> > > pinconf_generic_dt_node_to_map_pinmux() only supports the latter.
> >=20
> > This alone is a good reason to apply the patch.
> >=20
> > I have a strong urge to apply this already for v7.0 despite its RFC sta=
te.
> >=20
> > Anyone against?

I forgot to say that I had made it rfc cos of where in the cycle we are
and the fact that I didn't test it. I've got no objection though if
that's what you want to do.

> Quite the opposite! I fully support unloading pin control core from OF-ce=
ntric
> code.

> Note, please, remove extra '.' (dot) in the Subject.o

fwiw, the .. was intentional cos I was truncating the pinconf_generic
=66rom the function since the subject was really long, not referring to
a member of an ops struct.

> Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

--XRukpB6yERUMkTmR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYNUbgAKCRB4tDGHoIJi
0v50AP0XzuIH33HOfDbL9/7oTHn9zkO12IFvK8FOElTbGerhHAD+N/GDS9+DqEIr
H9MnAqVbrtTrLy+IpWqQwG1DEW/YAwA=
=goz1
-----END PGP SIGNATURE-----

--XRukpB6yERUMkTmR--

