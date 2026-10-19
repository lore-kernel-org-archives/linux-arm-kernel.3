Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74FD606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rwfb+72s;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHfKuVM9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RmZPFBfj7v4b5aamDYgEDfYQqHkIotKYcIH5uShXek=; b=Rwfb+72sGWePpWLA+wLyDWzJNd
	ouaxgPKqkK+qoFWZLFmudfADmvF16ehZ7/pAhOrNWEknXfyAWJKacFqNGS7LHll7B/t1Hj+MV3/Tq
	ZB59ePsT0Z7gKkJRbtuUFRWBeExsM9oYA8Q46eMU8FDQljWWr9g6uX/BqNVKv9y9ZF1xApKG0urTk
	fVjPmEZrYyNyYPuRLIJsqFV80l29WOhU9eMzf7UTun9f3BFGpRppT7ZRfZdB6wgH3loc9NtbxclSR
	uBWxGvPleknqcteutEGg1GbO0aBbuC0LGj0E0vqP4Mbe0D9oURbG91/0H7m1hqhTRvHjwh05aDYJ9
	ReRNEheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsVu-00000008C8c-2fy5;
	Mon, 19 Oct 2026 18:55:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsVs-00000008C8S-49Pv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 18:55:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE098601EF;
	Mon, 19 Oct 2026 18:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87211F000C4;
	Mon, 19 Oct 2026 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792436111;
	bh=2RmZPFBfj7v4b5aamDYgEDfYQqHkIotKYcIH5uShXek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XHfKuVM95PPcz3dVwQJiCtFfo4RGV7OrTiZGSwVsbdpwdWZ+Dk0FbIR17Z0WIhpxl
	 HHljZZZoG2Xkh9t6s8KrFS3GRWxWuw7hKwHE3LYCWxTDmJcZsVBDQCbAFO6iMD80GZ
	 9wwUXN7PXUYC3B1HlTUpgR/jjoj4UgmqYKPxPZ27Qh3f9GRO10vniu1END3opd9mD9
	 NbTNx90GoImBvwTiZ+0gGV33dGGlOzXXkKK6HmNDxO3YCJIIuCGfJyFPHro9N15b1Y
	 BSAkPmN/yPXQLiQe6bKpZQbAy8DsdvkYRgAHj6tlrU62bWCMbQKc31a9WEoFa8hXTZ
	 CcZpn8jpFDZiQ==
Date: Mon, 19 Oct 2026 19:55:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Olivier MOYSAN <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
Message-ID: <20261019-puzzling-lyrically-8e28577ba301@spud>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-2-olivier.moysan@foss.st.com>
 <20261001-tribesman-gauze-862e1ef0cdd8@spud>
 <bb8af256-5a77-4215-9eeb-fbcd0cae1829@foss.st.com>
 <20261008-9e2a48675c1a4c28f2dfa73b@squawk>
 <950f2801-a613-4f5a-a5a7-cb30101cf293@foss.st.com>
 <20261009-8db882a9fa159f8759aa7327@squawk>
 <2ba9235f-182e-4906-92e2-e35cf831d289@foss.st.com>
 <20261019023037.24674f30@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dnsGHyuHUFnfWdYk"
Content-Disposition: inline
In-Reply-To: <20261019023037.24674f30@jic23-hlaptop>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--dnsGHyuHUFnfWdYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 02:30:37AM +0100, Jonathan Cameron wrote:
>=20
> > >> Yes, we can have two clocks gated independently but sharing the same=
 rate.
> > >>
> > >> Using the clock framework apis seemed to me the right way to manage =
cck1 and
> > >> cck0 gating and divider computing. I think I would have to introduce
> > >> proprietary properties and have to implement code in the driver, tha=
t would
> > >> be handled natively by the framework otherwise. =20
> > >=20
> > > The CCF is still the right way to do it, especially since CCK0/1 can =
be
> > > exported to other devices. I don't believe you need to actually have a
> > > reference in DT to do this though, plenty of "real" clock controllers
> > > have only one input clock and hang a whole tree with multiple layers =
off
> > > that.
> > > Down below I mentioned this under "ouroboros devices", I think this k=
ind
> > > of ability to chose which clock a channel uses is a fairly normal thi=
ng
> > > to do in IIO land, I just dunno what the preferred mechanism is - I j=
ust
> > > know that it is not referencing yourself (probably it's some sort of
> > > property that you put in a channel node that says 'blah-clock =3D "cc=
k0"',
> > > but better that the IIO folks answer.
> > >  =20
> >=20
> > The adc.yaml binding do not expose clock properties. But maybe IIO=20
> > experts can answer about this.
>=20
> Hmm.. For an 'conventional' ADC channel a clock is a novel thing to have
> on a per channel basis. What does it mean for an analog signal?

tbh, I don't think this has anything to do with adc.yaml or ADC
channels, the channel that I was talking about here was the channel on
the backend since in Figure 349 the serial interfaces can select between
the two clocks but also select to be clocked by the MDF_CKIx input. We
definitely have some properties about that are used by devices to change
between clock sources - I just dunno if any of them have that capability
on a per-channel basis.

> I think these are signals between the front end (which here typically
> has one channel only) and the backend. They are useful because they
> end up indicating (I think) whether we want to interleave or not?

If it was just about interleaving, I don't think you'd need two of them,
since only one set of interleaved channels is possible? There's also the
option I mentioned of having the MDF_CKIx be the clock. Maybe being a
clock controller is actually the right thing to do, just with the
frontend sdmodulator or w/e connected to the SITFx being the consumer?
In that case, you'd need to do something to actually represent the clock
mux in dt, one mux per SITFx, leaving us with N output clocks from
CLK_SITF0 to CLK_SITFx rather than two because we're thinking in terms
of programming model not physical outputs. Additionally, the number of
input clocks grows by N since MDF_CKIx are all parents of the muxes.
You'd then use assigned-clock-parents from the frontend node to set the
parent of the mux (I think anyway). I'd be a little afraid of creating a
loop there though, that needs to be broken, if the MDF_CKIx provider is
the sd-modulator - but idk if that's possible and cyclic dependencies
like that can always be dealt with anyway.

That's probably the most natural way to go about things from a DT point
of view, and makes some sense to me if the clock is being used to drive
communication with the sd-modulator - although it seems a little forced.
It's still better IMO than the MDF referencing itself as things are done
now.

>=20
> Anyhow, right now I don't have this clear enough in my head to
> give a firm answer.
>=20
> Jonathan

--dnsGHyuHUFnfWdYk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatZnigAKCRB4tDGHoIJi
0mKNAP9F3SWOYMYRc/4Of82HP549AOQX3WB3DwH966A+KxAz2QEAg1E5l/OKtJFY
3Du86t2+XxQnrU6xgkcsMFsTwqp8PA0=
=9ZWD
-----END PGP SIGNATURE-----

--dnsGHyuHUFnfWdYk--

