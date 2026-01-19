Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE9D29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72+10Ixt2YN1uJV/0g27u9Am1AksESQAqb8mf1rCGTU=; b=3MXEeLq60bRgbQ0osNf0e7Jxz6
	0RwAXb4deVqSXILIraX0uoU7i773DOVQG74dL/T46ikoMtBGQCEEwXbNqHM4hLdQgVgYSpwfMNCln
	Y4Vy+NpoJTmVm9PjWyvgN4yGBSwAhPdtvSebBwnGZZxHVxiQSKsXL1dEZI1InmaxKWAYhrGdHxdee
	r8iFsBvow35XfxCV5h6IM3+QDlhKsO83jtNkWxAXokjeRl+VwvwaStiaWFSD5CqYMjaMQ0Fd6u8Gk
	iuRaD1DYcu0KoGRH+o4XVH8l5/2j8XbWuVU6TNdm9upivudlKxQWBeSox8yVxM15X99sZIkA5Yda4
	9Aildzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsSM-00000002Y8e-1Y9g;
	Mon, 19 Jan 2026 16:50:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsSJ-00000002Y8S-1ZL1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C793160055;
	Mon, 19 Jan 2026 16:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C13C16AAE;
	Mon, 19 Jan 2026 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841418;
	bh=rPWmfChoR053x8YbR76MXS2rElz2473/KngimqQn/+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYGzGmcTHl/9m3KQrOWQB0stmXVeQ1bEmfqlV7uuRs6dl9dVw9iu+oLJibSWQ7h6S
	 QewF3isn5jbP84x1ii2sRPH2Ljmx/Zxbtz4n1cUFcTGwjWFvGwD8PIpcYbepzTEO2l
	 54oMd2e2SIRFjH1sriHCFhOjyS6/MAPl/+pk1XQAsDto/y99qJgHjGMA6iE6ffw56C
	 m/BhJB9qcYlLKhOWzx8jYKPGVJRBWqH6QO3NrLC8+Uy8a5n5Tww1onuVT5Mt1PiOu0
	 oGLRg9YLgdldGrucTUEmLxjUaFZAtFITUbIKgxtpoZOdJ2pmmehGp/kdssJrQusTkt
	 i+3MU49l2cp5g==
Date: Mon, 19 Jan 2026 16:50:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HLyi8ks42a9EJ3mR"
Content-Disposition: inline
In-Reply-To: <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
X-Cookie: Does not include installation.
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


--HLyi8ks42a9EJ3mR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 08:47:17AM -0800, Abdurrahman Hussain wrote:
> > On Jan 19, 2026, at 8:32=E2=80=AFAM, Mark Brown <broonie@kernel.org> wr=
ote:
> > On Mon, Jan 19, 2026 at 07:06:24AM +0000, Abdurrahman Hussain via B4 Re=
lay wrote:

> >> -		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
> >> -					  &num_cs);
> >> -		ret =3D of_property_read_u32(pdev->dev.of_node,
> >> -					   "xlnx,num-transfer-bits",
> >> -					   &bits_per_word);
> >> +		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
> >> +					 &num_cs);
> >> +		ret =3D device_property_read_u32(&pdev->dev,
> >> +					       "xlnx,num-transfer-bits",
> >> +					       &bits_per_word);

> > Are these bindings appropraite for ACPI systems?

> Yes, the Xilinx IP blocks are memory mapped and work exactly the same on =
ACPI as they do on DT.

That does not answer the question at all.  Is it appropriate to
configure an ACPI system in this way?

--HLyi8ks42a9EJ3mR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluYMUACgkQJNaLcl1U
h9ABagf/aoghp1Y6Y854M8RhICiNGe+by6Pr/V/BxZb241odrfLyn/7nAHxdjKtS
TqqQAB4HaML+bxNyrPCuJOgu67pCdCvkT4BZB5BS83c1dbZZJE/Exd9+Z8NJzXIT
YBc6VLlXIf941weUZIN3FRZpd6PFEDp/cXr5R6iHpf+TDFJgiXW0MD/ENHiT7px2
WAsjyICgxGzc7BYKwlVzhl1MPQvFSbQIDJ62DVxNb7tTR85SgX5nsoyupZHXbIWI
lXziReTXcXd7zNdaTbBN2kglpHzFSzS73ye/d01/OYCfqnFeEg+KOSb5kV/8rsVK
vU0Ep4TkNfhK+8Cra/h1Ep5Q+xs1IQ==
=JOTa
-----END PGP SIGNATURE-----

--HLyi8ks42a9EJ3mR--

