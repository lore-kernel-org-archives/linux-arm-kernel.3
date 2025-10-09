Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7575ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9F+abKdXqvtyi7ggqZNh+zEYgVpxpQqC88ymBoYrTU=; b=QzmsVhRveeCb+LkAQBmRKyEQjI
	u9QpXdRdGMdE+W0G0Simqd5nbZjGvL5tC70fF1zJ4/m22nkE4ktiwK9cJ1v4BxfbEVxkQPI4hhzdP
	alPB7G8hrnV/TS7XWuigvX4sM79NrgjkyEsIfYHmzfRG067tp4E+Lwthh/1kHivQw5NaoSy2Z7W/L
	ly6uPy1V33a64rT6VKJHJPQo77iSCZCuzzZl0F8j0OBEXoNDvNRs7cA1TAsAgrx1ERg4XiBdWOIap
	zjJ5As2Ned3wjQ0UpKYGO7aYpEevpqmwpARkEygoS8fg8OY9K/pcTnAZUp+Vv28HIV25r54rXjfPc
	VHn4T+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6uD2-00000006nUB-3EyU;
	Thu, 09 Oct 2025 17:13:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6uD1-00000006nTy-0ha9;
	Thu, 09 Oct 2025 17:13:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 875CA623C8;
	Thu,  9 Oct 2025 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6127AC4CEE7;
	Thu,  9 Oct 2025 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760030022;
	bh=4m/b40Q8HlHAkCFpCXHLrFt6Ce02CTpjazD5P0VykkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQ3mn/VDly7N6oRo4YHgs3kB4pz8mCUs06Vf6MTzzHsGNRnR0UrMzRMakSX0IlDsO
	 IDxfG4ti/zNQx92aK8O4FkV8izUQ88X1aD3M1R6rccbNrgaqDOqVUmw+wKTHXmvXyZ
	 9gd7gPJF59QtGz5Gd++meMjtLhkcbufX0B2FzNwP1FJti+ONeTDDUvY5usngDNLJkM
	 qzqMhuAFuIU8gNzmjiEWgHMP2w8VIIFi99yzpAR5rR09uEEQLHTUhbUAd2ZNqTCFkY
	 1H/WAapbKklLusROb8CPfopsy7NKxeDDGtgzpxKWwV6PJtV1Gmv/+VXRK6gduHYyZS
	 pJ9R2ZuMWH5vw==
Date: Thu, 9 Oct 2025 18:13:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251009-lizard-slapstick-4de7dfe2322d@spud>
References: <20251008060000.3136021-1-royluo@google.com>
 <20251008060000.3136021-2-royluo@google.com>
 <20251008-slider-uncombed-66790ea92ea0@spud>
 <CA+zupgxnBK_k2X0_KKX9pUMMTwY4VhsyTEEVz6v+__u=2xR8Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V8Kj8DQ2DFM161Td"
Content-Disposition: inline
In-Reply-To: <CA+zupgxnBK_k2X0_KKX9pUMMTwY4VhsyTEEVz6v+__u=2xR8Ow@mail.gmail.com>
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


--V8Kj8DQ2DFM161Td
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 09:40:57PM -0700, Roy Luo wrote:
> On Wed, Oct 8, 2025 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Oct 08, 2025 at 05:59:57AM +0000, Roy Luo wrote:

> > > +allOf:
> > > +  - $ref: snps,dwc3-common.yaml#
> > > +
> > > +unevaluatedProperties: false
> >
> > So every property from snps,dwc3-common.yaml is valid here, with any of
> > the permitted values?
>=20
> Conor,
>=20
> Appreciate the review.
> Ack to all the comments, will fix them in the next patch.
> And yes, every property from snps,dwc3-common.yaml is valid here.
> You can find more context here [1], essentially the dwc3 glue would be
> operating on the same platform device as the dwc3 core, hence all
> properties are allowed.
>=20
> [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722d@=
oss.qualcomm.com/

I find it exceedingly hard to believe that every property from that
file, with every permitted value, is possible. AFAIU, the tensor g5 is a
phone chip that's only used in pixel devices, not something that people
can just buy and integrate into whatever device they feel like. There
should be a vanishingly small number of possible configurations,
possibly exactly one configuration. There are dozens of properties in
the dwc3 common binding, of which at least 10 are for "quirks" or other
sorts of hardware errata that are not going to be variable from one
phone to another.

--V8Kj8DQ2DFM161Td
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOftPwAKCRB4tDGHoIJi
0orZAQDVQounnZp8XW0MZDnLxiorx4hG4jOujXdg9qHFe7k1qgD/eJp5UpO9UKjh
jvA+gND8RxLGnuG3C6H3uJAs4WuugQw=
=JWpo
-----END PGP SIGNATURE-----

--V8Kj8DQ2DFM161Td--

