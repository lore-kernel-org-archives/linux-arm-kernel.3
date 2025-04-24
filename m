Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1150FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMFW3wIHPSwi+vw3I5qe1qYp9dRZPHP18laWodwcUEo=; b=dK8mOPHFO2lpuG1EzJHO1BcuhH
	ic0ysWUK8hIMnkczU110TOaEYwZOcoR4Cp0VxJrgnuLGtcAcW3i9XARYguSbU7yL9CFMgQndIK9Hf
	2k3kSdycw2qgHqyU62ee9i4Sq42tZWqBIxBZz6ddS6TQ6rISwmOM0p4PPWzPaFy+Tl9R3pFGLz+wm
	rVTLxdyaspOtWW5v5ZkANEmxzs/YS/h0W5ZaWSjYtJHi4mhBBMLyxLek0DgEgNfMgzXYfw3cNVoYk
	PpF5S+P5OHCRJUQIcSeipNftxW9rJhZpg8ho+an54aEMYPHXhzO5cziRvna66R12ZGSHMnocnLHTq
	Z7v+xQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xCN-0000000EJWP-1ITa;
	Thu, 24 Apr 2025 14:05:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vks-0000000E30G-0RgT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AB78A4C16B;
	Thu, 24 Apr 2025 12:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD242C4CEE3;
	Thu, 24 Apr 2025 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745497956;
	bh=bAj2Cd6zSpAtHOLS56DF0jN59+JpDSzxAkHJE1Atm/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2gTDhWO1lj7SAOlBxu3URZgjwWr76VzZrsEug0xRBdbsleFBAoKC7OSDwJs7GiSU
	 MUmg+ycYCjWuZFh1qem2stq0lu8i0AK+T+jdbVkimV7X9dqYIofSebXhN3RitOUZbH
	 duGERiWF3n5P/e5eXZhNXSqYLldidEf5AXKXoeooHLNkm7Q7z/6qctZsprSiPgMmHP
	 QhP8H38dZreTelphhSYUSBEqG1pLDCQlraLlv3631B6wixr173CRgpQlAOt8RLm/XN
	 IIxKQeSTGU88XvFNSWKW5xGAoJzQi9sMHqaHe4rSZbVW2q6mG2Qmu9x1KdejqAuNCu
	 n/jnOVbYlT0vA==
Date: Thu, 24 Apr 2025 14:32:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Message-ID: <eydewrcn4tviu6fbqmmvhoc2zao3uzrxwwlc55tuxuhfrexk5k@7xg5fdeu7wun>
References: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
 <yscledgclp2v4p7djwrszbc3dnqifkcofky7rugkcip7o2rmof@xljfd2kfyzzs>
 <CABjd4YxK+4kEeS_tKBi9zhj85y6U1Dgi3nJNuQ8hfkeoY+iK1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3zgtjqow4ustrybx"
Content-Disposition: inline
In-Reply-To: <CABjd4YxK+4kEeS_tKBi9zhj85y6U1Dgi3nJNuQ8hfkeoY+iK1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_053238_209207_A4BF144E 
X-CRM114-Status: GOOD (  17.57  )
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


--3zgtjqow4ustrybx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
MIME-Version: 1.0

Hello Alexey,

On Thu, Apr 24, 2025 at 12:07:03PM +0400, Alexey Charkov wrote:
> On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@=
kernel.org> wrote:
> > I saw you signed your patch using PGP, which is great. However I didn't
> > find your key. I recommend to make it available on keys.openpgp.org like
> > this:
> >
> >         gpg --export alchark@gmail.com | curl -T - https://keys.openpgp=
=2Eorg
> >
> > and then verify your identities using the link in the output of this
> > command. Still better, (additionally) add your key to the kernel keyring
> > (which however requires you to be in Linus Torvalds WoT, see
> > https://korg.docs.kernel.org/pgpkeys.html for the details).
>=20
> Hmm, I used b4's built-in patatt functionality with a dedicated
> ed25519 key, not a gpg managed one. Looks like keys.openpgp.org
> doesn't understand those directly, or am I missing something?

No, I wasn't aware that patatt also uses signature algos other than PGP.
Without your key known, using ed25519 is kind of useless because it
cannot be verified. I would recommend switching to PGP because for that
the key distribution is a (somewhat) solved problem.

Nevertheless I'll play a bit with patatt and your key.

Best regards
Uwe

--3zgtjqow4ustrybx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgKL14ACgkQj4D7WH0S
/k7x4gf+KZW663SLHY9am5ym6AsnEOLVcgLLWvHMtblGN1bWaspUumkIB6cu+0hL
LFL/526WNp0l6FVL1VlQvE6paqhwVOFQT5+H0y2WvngSFE9iiaFQV7DNYAQmV+mz
T+kVdkfEZuB6+hs+bsDeoYPjS1eQ5gxJWXOW3GBPmQaPC2QpalRv8+OfXLoXxXTL
b73qrkO6WxzioMZIzRTt/kJF5KDBCi8nZTmG0PTctVHYj79KxtvAe8rFQy/Pw8j0
egilgOCIZtsftsYTiMZ8GojlxsTM3ZL/k2qo7SVnOyo0YfX8h2CzydcEKhxPSQWS
gyyVg34D3Fpkjfozq2a/CXZhmSM2Bg==
=TfcH
-----END PGP SIGNATURE-----

--3zgtjqow4ustrybx--

