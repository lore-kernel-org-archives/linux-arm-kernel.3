Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279DBD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2EmsbSh+wdLOpkXuTE6mDTQFKjUSKxhk79rnFcaH3Y=; b=TMDyG4jsR7szDdLKS4XfwEJdvO
	wQ4GB49FCoQNNnWAp0EZUU6kOb3nNsyxxPFtCA4PObWoVFyns28dnN0HzmSerhtqSdGXUGnHe17b1
	D3B0lyAmg7cfo0++t0LT6BXfwwUPpTYaMnniD0A3u0pUcwGWqxHTFEBarCZ7LEuolS2O2jAti6Fpt
	8cfzRzvn++jiehTPodCR+n+jCHtLDVhSLyUVW99iPBvJ1s8AWNYdEK8Q8F2HCq59i9uZVbNoDis1h
	mB41hF0QU+Hi6f9olYkLhoRDfGcdaAXEVyT4zTI8VIOPW5tTtoP3w9QElK8OSyBJqf5Y3pJSjGrOL
	4o7dWehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSel4-0000000DLsm-2rkJ;
	Mon, 08 Dec 2025 17:10:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeky-0000000DLjn-39sN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 17:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ED4F44460;
	Mon,  8 Dec 2025 17:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3945AC4CEF1;
	Mon,  8 Dec 2025 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765213839;
	bh=HUczN0JOy5c/9Nhyo4/4Hy2U/dsetbWKARZVVXVoP9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IomiSZG43h+0wzBvViLmonXggdL1L8miPSoGm147yGhfQYDIp64e1fJGYbESJXiy8
	 NqnE82zKagCuYc7xpcswOpSlliIJEg0He+IwQY++G7PcYLdtKJhoBW3Evg2tjAvV8x
	 XAegUd63IVJ2e29Jh++NR/1f6koztv2A0KCs4TQW5Gf7i139Ysep8ATNbDgSdRDJ7n
	 SpTRfbcamtXduMd1gLBdBMZ55NNPcnsQ4cQ2/i0NTitZyBp2sZ/lwz44rPSulZQhgH
	 x4P8xHfiIK3N6cY5PY775Q0edhoVWQ4cdMQKCwk7KUfUIsIMjLZbTTC7ok5Wu/M18M
	 h6ZG/jgxbklPA==
Date: Mon, 8 Dec 2025 17:10:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Message-ID: <20251208-absolute-diploma-6575729ab43f@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr>
 <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f/ANzMaVIMozCDGI"
Content-Disposition: inline
In-Reply-To: <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_091040_844612_27E54DBD 
X-CRM114-Status: GOOD (  18.29  )
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


--f/ANzMaVIMozCDGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > Microchip LAN969x is a series of multi-port, multi-gigabit switches b=
ased
> > > on ARMv8 Cortex-A53 CPU.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++=
++
> >
> > This should not be in a unique file, put it in with the other microchip
> > arm devices please. Also, the wildcard in the compatible is not
> > permitted, only way it'd make sense is if these are different binnings
> > of the same silicon. If that's the case, you need to explain why,
> > because compatibles are meant to be soc-specific.
>=20
> Hi Conor,
> The issue is that there is no unique place for Microchip SoC-s,
> LAN966x series is in the AT91 bindings
> while SparX-5 has its own bindings file.
>=20
> What would you suggest in this case?

Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
looks pointless and can be deleted IMO.


--f/ANzMaVIMozCDGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcGiQAKCRB4tDGHoIJi
0hJgAQDZXZvEtWbFycCBtjtvAkegJzipsK18lKX3sa/WHe6VoQEAzIrZMT4k0/6l
bcJKf5xlAsTcmcBNT0hxrPSamMF+sA8=
=rUuT
-----END PGP SIGNATURE-----

--f/ANzMaVIMozCDGI--

