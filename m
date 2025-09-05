Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1124CAC580
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IY5e/bi/IuFCjaNFAS6qOCicO0lRgzau7l0rYzHPtk=; b=OFuWhSSY5Km6wdzJvpPJQqj3x9
	uIlCug8Bdlgr5yRvv4J0LwxYzl8ZoI5/EED5yXGhc4oKfsm1TK7GrLYBdB3QfsLB00Ybr3rmjxuaF
	EN9yevB6filfzUwnd7cLT1fKU9eyxoz/98Rs1Yln5xkB+WGLwoGcBOZFzdt73QthMmf9l1I1bnAF/
	teXSXSWF2jhZk7CZf/tXuWElKi1nMMJFE9cPw5vMYJeXuqsaFZnVSg4882/3P4Io3hRo0pLstqsh1
	EU049l4elOF+zTYw6F2iPcNc8Y/Vq5yhW7pmiIFBYKtgI/hUNjHLykGA/KoYTup/4nxHab8hxxydT
	Z2pnXI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXh-00000005VhA-3hRZ;
	Sat, 06 Sep 2025 00:12:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubiy-00000003zep-1VTh;
	Fri, 05 Sep 2025 19:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12E5F402DB;
	Fri,  5 Sep 2025 19:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B445C4CEF1;
	Fri,  5 Sep 2025 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757099031;
	bh=qIzUbO/sBwBn9eM4w3lfY4+Ygc/NgXkLIDsWHrZsw7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRvttllvXeb50lo2c6avwb4bRJQ+NCYyMwYgaFiVlwGx0Z7FeRc+xYt2XXQtMEe03
	 8nHhvafQABC07nspDJXdU7tfIvVMbhV5mVcdmx29WGm8umdS5E1xTWqNwmFjcAWZXd
	 46FjguhS7QFjidiygR8Iq6nDdGt3sgN0STzYk9Ovo7R9y12m4Pd3wbq24CJD1CM8pB
	 XTncANdPUBTgfUcqpe4tbbioRUYdZSiNVvUpX1skP5X+sl89HzaRi1UBVN5s0zEg2W
	 6hsJQe9v9xSlihdamw1et5v2LFUNB8WS4PVkEk1YU2BRq2GQkg3WnP2ZNFDeksjoQw
	 eea5XLXldT2MA==
Date: Fri, 5 Sep 2025 20:03:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
Message-ID: <20250905-imaginary-crazy-a5734cb794fc@spud>
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
 <20250905-humble-framing-3d9b786c87a2@spud>
 <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usBmjWL10C9rXeNB"
Content-Disposition: inline
In-Reply-To: <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_120352_416203_2C33A96F 
X-CRM114-Status: GOOD (  19.12  )
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


--usBmjWL10C9rXeNB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2025 at 08:55:16PM +0200, Marek Vasut wrote:
> On 9/5/25 8:46 PM, Conor Dooley wrote:
>=20
> Hi,
>=20
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +      gpio@45 {
> >=20
> > ngl, seems strange to classify the device as a regulator in directory
> > and name, but use gpio as the node name in the example.
> >=20
> > Otherwise, this seems fine - if you feel that the hardware is
> > substantively differentially to what's in the "v1" regulator then
> > keeping them apart is valid.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> I can rename it to "mcu@" or "mfd@" some such ?

Sure.

>=20
> I originally thought it could be compatible with the V1, which is why I
> tried to conflate them into single binding in 6d09c6e474bd ("regulator:
> dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280") , but
> they are too different, so this undoes the change and creates separate
> binding.

--usBmjWL10C9rXeNB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLs0EwAKCRB4tDGHoIJi
0iY+APwLj1336PzN6WjULb9ViDkp1qnpKP4J2cicUnX08OB1iwD/XZpDBQy97xa3
JXXKMGD3tzx/lj6Cmg6vuuX/kd/xCQY=
=kAJA
-----END PGP SIGNATURE-----

--usBmjWL10C9rXeNB--

