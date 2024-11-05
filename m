Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C49ED36103
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdvKRMgW7zF0SKQdqUfQdOZv/sf80HPqPrtGxl6gaIQ=; b=fBJstcA8cEFEOB3h1f7D5pBvra
	f6RJrnuqReAxjH1QQl87ZNrhrAF0wZrjhCooWV5d/9iF/yi0rsTPm1wgBkqoy/xOD0bUeDYk8ezpO
	O30/DssQ0gBowwUr7pVyAQEwXFtbR5IthPddPdn8c17hzt4ecVIDtd0VHIUrQBdm500wVIGcyCjXk
	iFdM6vjtT/a23pH97WOFHDcqnrc/G9iP8USvtVoC5NBLI1fQWs2gY7fez090KwAEXe4SruQzPw/Cm
	tWmuA1rzHjExEg6hL+LS2hqZEfIc0nFjc9ZnCLKG7cIR/kmek9EJIdp4O21ppoCQRFZOECnZLIIxy
	O5E0blWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Ojy-00000000UNi-1NGh;
	Tue, 05 Nov 2024 18:57:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OiE-00000000TyK-0Wxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53CECA43952;
	Tue,  5 Nov 2024 18:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367CDC4CED3;
	Tue,  5 Nov 2024 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730832933;
	bh=fdvKRMgW7zF0SKQdqUfQdOZv/sf80HPqPrtGxl6gaIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riXfZ0fP3TYDNEXcR84bacJljgVXs1yvtCSpGF6d0oi9AT/0PjnQgdGpb459+yjub
	 /MVNxPsrXctufX4oDudFI6jIqlIHBpneRgJ0ryO5rPys1TCnH56noTJt4t4nL7XRoU
	 YQLJbiVckj2UdroqxdDzCWkSax1UfOjdKZGa87ZX0hktzF2s+JCO42yXf1mu4Zsa0b
	 qXLCKPFoD8cHOsXW5ONW/vKxFku4ROJ39T+6PPGMvh4HqzWbClYkPHU4raH6inlsA0
	 7ffoHAW7rWCweJnUxXQ3oCiL2lHhyUdG+xPhV855qpNNRXU4lp3B+sTG/eCaidQQ4Z
	 5MQnBQcNl0DBA==
Date: Tue, 5 Nov 2024 18:55:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for AM625-based
 TQMa62xx SOM family and carrier board
Message-ID: <20241105-tinsmith-countable-fbb51045bc98@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <20241104-floral-dexterous-7d3fee2ff616@spud>
 <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BiH5KkwowkxZuLss"
Content-Disposition: inline
In-Reply-To: <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_105534_281611_A7868C93 
X-CRM114-Status: GOOD (  15.12  )
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


--BiH5KkwowkxZuLss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 11:40:20AM +0100, Matthias Schiffer wrote:
> On Mon, 2024-11-04 at 18:47 +0000, Conor Dooley wrote:
> > On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote:
> > > The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx =
is
> > > the matching reference/starterkit carrier board.
> >=20
> > Why all the wildcards? Why isn't there a compatible per device in the
> > family?
>=20
> For the compatible string we've chosen the TQMa6254 as the representative=
 for the TQMa62xx family.

And all the boards in the family are the exact same?

>=20
> MBa62xx is the proper name of the baseboard; this board can be combined w=
ith any TQMa62xx family
> SOM.

Then that one is fine.


--BiH5KkwowkxZuLss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypqHwAKCRB4tDGHoIJi
0jlmAP9cOMTcv1GKBS/z0Rp5HGJWn1/Hbig/hZ/MpUT7ibMGbwD+PNjKY3hXXs+2
2Co/oEtSJ8B74WmjFsXxTJYlYsmT8wA=
=2Dxh
-----END PGP SIGNATURE-----

--BiH5KkwowkxZuLss--

