Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6C3109878A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEq0lkHiWlfzRjTk9tAbY2BUU4eS/9QAmtJ8rJpta60=; b=J1Avz5Nt8XDN1zXvzaCU1KXuge
	oUxdEUe68agNXD5KAlhgFrgTG30hFNNyH46d8XQsfoCKvDaU4G2zMzOvqMu50A4kSTsgUodInFhzm
	U+WsSCffsOA88sU5cHJhuY0E0y9n0/PudlDFKVenIcaxq3/RGyMVXIt45pK4h8ZlkmMGwOPJdQ+HD
	mPf2tDrYvwZ54y+FAeQpRMSEwzdCXp3rbaeU/bPHDNG2Ash8FKUVPFnJSaxNvwEmZWO/9xAtVme1x
	u/Iz+mOrD8LPWZ5huFXZE6dBKEtDPwlYH8p9tbSgnRZOofOkWMMwnda1gnuhbiAx2j7r9qwADtESs
	FV2fmY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bBH-0000000CxlU-3Yrn;
	Fri, 20 Mar 2026 14:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bBF-0000000Cxky-0tXt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2CF143C5F;
	Fri, 20 Mar 2026 14:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FC3C19425;
	Fri, 20 Mar 2026 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774018227;
	bh=xEq0lkHiWlfzRjTk9tAbY2BUU4eS/9QAmtJ8rJpta60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8PyEklXlRJu+UqDu9GCKeEZJfQdaZQ3fRzearO8/+biLOD5xVHtfvWxJ83UTPeTm
	 e3vfw/zpLxQpWpcuCfR/Ot1WDWP6YV6P0j3HqTUX9hXJDnxljg+GIn6pFEgBlqPe8i
	 GMJJKLqjV2etuZF+CCXEUaMFnWJKgxzzldDO9rHQdo0vESuUDXw8L/GJAGpYHk44bO
	 v+KchtE9yiJAOELCm8qR2BhmbUSSPoviK0FF2OWgY2BSP9ciCloM3FwE+nPW9lzSdZ
	 x/jvOIcgKEl/RfsbNMEDvoNAJ3xRPleQRcLWO2w2X9XMw0kVjdrM4NhhMMcXvtgYAV
	 VoCq4zNKjnF3Q==
Date: Fri, 20 Mar 2026 15:50:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8122
 compatible
Message-ID: <ab1d82Y9dGzstkgy@monoceros>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-7-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pshe747cvhfvjhsk"
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-7-5842e1e393a8@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_075029_295649_CB307194 
X-CRM114-Status: GOOD (  11.12  )
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


--pshe747cvhfvjhsk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8122
 compatible
MIME-Version: 1.0

Hello,

On Fri, Mar 20, 2026 at 01:23:25PM +0100, Janne Grunau wrote:
> The PWM controller on the Apple silicon t8122 (M3) SoC is compatible
> with the existing driver. Add "apple,t8122-fpwm" as SoC specific
> compatible under "apple,s5l-fpwm" used by the driver.
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>

You didn't say what the merge plan is here. I assume they should all go
in together via arm-soc?

If so:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--pshe747cvhfvjhsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmm9Xq4ACgkQj4D7WH0S
/k7iZQf/VTQKMp3e1OfZ1SAfsbTIm7E2kaGDHWHFtIVuX45NMEsa5s60N6D2/j0T
nwX7JnD1CLlsDCLGR9s3H/iTHHlfdmptcfT2+I8ViUMDZ5driYxpysuUMnyDfzMe
aQbUtV3SRsRzD35HLuiLV06UIUXEiwt1aeBCZRlzfmWsi14Or0IPcHY/D1lPnVvT
bLrFxHXIfECSWwXcuFekr+Iu7h5iM5EuUiJ7JcaPW4G/K0a+mL8s5LbV69kGF9Lb
2y+ow+PAdQbmSY9swQuO17set/frraA/XfgUV5DmB+QDwXZ/r927lMNIbdsfTPuk
woJH3T+AOnP7z2Su0xKexD40E0FiBA==
=kFFv
-----END PGP SIGNATURE-----

--pshe747cvhfvjhsk--

