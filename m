Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F4EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxEfwZZVQON9rzKpeEf3w/DZmcBf+IaqVJSn86t2ssQ=; b=3WifCrXt/IREgIce2NfrsqH8um
	PoIaSbwWWhnJJqT90dBSTfz3v8dJfmzGQvpxbgDKfsBFGmJ89ElTF3tWqsqJVCwEa/T6ypsEUTr/N
	lJYj1cPcWCld4/ZikXD8sqQs6HsCx/14lA/1RNZyMq+ontQ6EQBRnWsvgPWSwxtv9i7iEkZ06nvpk
	JxBZEfJOMi8k54L98bB6cZJsHtWSISCuv0ZBR41gn5HoAUWpe3KxbgrzZkC/P6nLfiIoYxZLI+IU6
	22TVNVqxtZITrNMH5oUgJ0muoZvbH3B1pRKauIHiUWp6T4Bf6oNqGcAVMQSNgIwKvBc2nMEb0MqAF
	msNLFKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoZD-0000000HP6K-2ye9;
	Tue, 29 Jul 2025 17:56:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoWk-0000000HOtX-1jKH;
	Tue, 29 Jul 2025 17:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1D015C36EB;
	Tue, 29 Jul 2025 17:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCFBC4CEEF;
	Tue, 29 Jul 2025 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753811653;
	bh=Iwuu7Y+7MX/mR2K6h/H9itzDgZzQD+SpABNB9DHk9R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkddaFw0w8n5PeSLmPokQCXVbPWkUNv/qFzM8HUmsD4Ls4zM0dlU5USFutiWoKcmK
	 XkQMCf738wBF+ouzYx1L/8DxqiSfZdCxyjVuyDpVcApKovpMI3iwRQoO4QpNnEx4YU
	 rEWP5zzTfhnR5laJT3sN6/N0p2s1NLocO6kt2hNkh7kjShvylztPPRnaeKpv9DTPSr
	 P1SxWuITUk5iDytvQCkInAGP7N4K47c2JGqjd0YvcEmPWzZTMuCE8BoW5R1mbx13c1
	 hb8a8h3I6eewofsiFPOhGhbqHDdYmgCDjW1jwZG2S2fAfo4qPIHPCbclUfq7U2hEfV
	 qncPTyh9JLgxA==
Date: Tue, 29 Jul 2025 18:54:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
Message-ID: <20250729-reshuffle-contented-e6def76b540b@spud>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sAUlFocIDHyTEwNs"
Content-Disposition: inline
In-Reply-To: <20250728225319-GYA900803@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_105414_540018_DB40F8A7 
X-CRM114-Status: GOOD (  26.05  )
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


--sAUlFocIDHyTEwNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
> Hi Alex,
>=20
> On 17:00 Mon 28 Jul     , Alex Elder wrote:
> > There are two compatible strings defined in "8250.yaml" that require
> > two clocks to be specified, along with their names:
> >   - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
> >   - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
> >=20
> > When only one clock is used, the name is not required.  However there
> > are two places that do specify a name:
> >   - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
> >     compatible serial device is named "main"
> >   - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
> >     serial device is named "uart"
> >=20
> > In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartc=
lk'
> > and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that t=
wo
> > named clocks be used for the NXP platform mentioned above.  Extend that
> > so that the two named clocks used by the SpacemiT platform are similarly
> > restricted.
> >=20
> > Add "main" and "uart" as allowed names when a single clock is specified.
> >=20
> > Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional s=
econd clock")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp=
@intel.com/
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Docum=
entation/devicetree/bindings/serial/8250.yaml
> > index e46bee8d25bf0..cef52ebd8f7da 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -61,11 +61,17 @@ allOf:
> >              - const: uartclk
> >              - const: reg
> ..
> >      else:
> would it be better to drop this 'else', and moving following 'if' block
> to the same level with "nxp,lpc1850-uart"?
>=20
> the reason here would avoid too many indentions if add more constraint in
> the future if other SoC uart need different clock-names..

I agree, it's more typical to do it that way I think to boot.

Also, why is there a k1/lpc conditional bit that is not part of the
allOf in addition to the bits in the allOf? Can that get merged with the
allOf please?

--sAUlFocIDHyTEwNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIkKvwAKCRB4tDGHoIJi
0pONAP9z4KxzBZNfA6xqUmrszss49y0ubUoa2zcWYPh1PRgK0QEA5wD3A3FO0a+r
lTA/zPRsDFuxU4vdnLj7IcL94dKEXAM=
=6Rl4
-----END PGP SIGNATURE-----

--sAUlFocIDHyTEwNs--

