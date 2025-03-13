Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C4FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxs4GROM3VlTUw4dSB+dQaRKnm6kPQoI2hJBRgKozos=; b=kpoPNDkfUomKUCanNmvi/TnFnx
	5TGBwx+YbPDGjJoPzDgPDd9V9NfXwnq7AoRdLS40cF1XauCxrZWX4wrrqt8z8q3dRlWnCvkD8UncC
	WEgrXWtggu8JDLh89G4gQMKUxsq+egg8k6taso76c5GsyLFa1jynoJzETrqS/QosqptAN8NdcBMbU
	04/xVyOjdu1QIDIdYRX/gj8VMO44dZlOX6VtK3D+ZdKClKW0SwRVXGxapcONsBN/pDWeo/IQvpNXS
	ZRyrr8irGTp3ps25OYoWQdqHQuQqxsGkzLR78cCzlHaoUiKrwx5ToGXCCgs1+Rgu7ec4VRm0dw4Je
	nnhEmPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdFf-0000000APqL-2jY5;
	Thu, 13 Mar 2025 07:45:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscu9-0000000AM6k-1lgu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 07:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2069A45A4D;
	Thu, 13 Mar 2025 07:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989D6C4CEDD;
	Thu, 13 Mar 2025 07:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741850576;
	bh=aFeZ0mb9JxHxNrB2IY5dAI8W9F+KCqBlNLKvYHsoUrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZZIQ0Zf+Wn/FHwFCF0brh5DPmkCHW1BS1cd1iNC0PhnojOpCR/hvAjs0T6TxsxIO
	 iYSZC7Udi+50z/MBOeevkqK7QJp4VeX+v3NUceNdYMHz33m13zbCIeMq2qaKOqyqwG
	 wDmbuyZTBgLUcuwr/H628jKCmOxqY6hbVEoYz2NCKWpYsqaEunNpOro4cnoMnE11iB
	 jwEM+kVFyyPhZ1nKZVDURvDd23e+APOdGjr/9AEwv8r1i96E94z2dIgxgFgCeJ47SK
	 jqpDIoc2pPRFxF/6LAys8KcKhhtbUfPTDjUnCx0+sD73qovvh5eXxlwXL+EiQqYXwq
	 lHyfdJQqgS0NQ==
Date: Thu, 13 Mar 2025 08:22:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, piotr.wojtaszczyk@timesys.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
Message-ID: <b2nlqt3gp4sk7cax722n7t7xonnrjzi6amsfrhylxmurctytiy@yqp7qpttyc5h>
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <57ae63a2-544b-4241-a54d-8fa9917c1e44@mleia.com>
 <yvljnqnlka3ecw2n3hw2zgfszlldvbww3k7gq72dczmf6jwzfo@4vqnygxuzvk5>
 <5b62671c-719a-44f2-b28e-878159859a01@mleia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbj5kzio535yua6p"
Content-Disposition: inline
In-Reply-To: <5b62671c-719a-44f2-b28e-878159859a01@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_002257_566857_88ED2F58 
X-CRM114-Status: GOOD (  18.71  )
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


--fbj5kzio535yua6p
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
MIME-Version: 1.0

Hello Vladimir,

On Thu, Mar 13, 2025 at 05:37:44AM +0200, Vladimir Zapolskiy wrote:
> On 3/13/25 00:56, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Wed, Mar 12, 2025 at 07:59:21PM +0200, Vladimir Zapolskiy wrote:
> > > > +  "#pwm-cells":
> > > > +    const: 3
> > >=20
> > > It shall be 1.
> >=20
> > No, 3 is the right choice.
> >=20
>=20
> could you please elaborate?
>=20
> I find that here the only configurable parameter is PWM period, so it
> should be sufficient to have one cell only like in marvell,pxa-pwm.yaml
> or google,cros-ec-pwm.yaml.

These two bindings are special snow-flakes and the only drivers that
have #pwm-cells =3D <1>. Most other bindings use 3 and since commit
895fe4537cc8 ("pwm: Add upgrade path to #pwm-cells =3D <3> for users of
of_pwm_single_xlate()") (which was created for the pxa driver) the pxa
driver also supports 3 cells. The cros-ec driver even has comment about
that being ugly.=20

I intend to convert all bindings to use 3 soon.

While that isn't necessary for each individual piece of hardware to
provide 3 values, having a uniform binding for PWMs provides a nice user
experience and also simplifies matters with nexus nodes (see
e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")).

Best regards
Uwe

--fbj5kzio535yua6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfSh8oACgkQj4D7WH0S
/k4vDgf/ehubFXBJkC/7G707LTPd9SMCRiU7yo8xzDN/MgRlnqjDQxNaFFrE8xN5
7MIZqJNGy4dCdHGnGsbN6Nk7bpY/gNm/vXJhQepGVo2gBnpNyHrHVHoDsTNVz/Ka
61FazZfuGm6K6sHgwu1RploF6vajrJUYnxf4/+fRJWjLYWbwquaVC0sRrM1k7BXM
97aF6PQYAGMxDLQI4j5CS5Bmn3k4MtOgbgXu2GaPyIIkLP7f9AWy4ZQDmOR96MxN
10z2K223iXO02U8fyRVWwSbu5ya0KZ/q8IANcX/LEmh1gAuaJg56TFQCEDkxkuX4
6RESqFawU5aKcNqipOGIYitK3rzR3g==
=5IFd
-----END PGP SIGNATURE-----

--fbj5kzio535yua6p--

