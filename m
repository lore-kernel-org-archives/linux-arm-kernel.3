Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F6ECA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJ7Cz9cE5jYmh9i7+7gt+I7tJt8elW65y25IztcbqK8=; b=ZTxUfCI26vkzGiD7eY2T32Xamy
	YfXe3pMDks8Wcdrr0DthWyk64FGaekv9JjsEta2Km5mAbXNaWpTSOoje+hW8CTRi85Uxk0YlGkcff
	Nx28VpCRSE69jC15XRx5GaH2kAyPOh8BoitgiIYFyvPiGjjiyjbNM+nHHCae1LKVN0sQ2E07w1cii
	WXmdkg7aWWqKmTuraQ7Tj/i5x4Dc8Bz91bA8aptITjJ6TFIZf67Fjg31h1POP0yjqLRApg2wkmTPD
	1uqzloHbC25TYuiTIaN9VpW+SNvxXkV0k1ukoAfw2E0JcROb6OK4zGASW2t9oX9h5X8ohyGy+xnZi
	m223SUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKYe-0000000BC7A-2IAz;
	Mon, 12 Oct 2026 18:15:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKYX-0000000BC6w-0ILj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:15:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F3674093E;
	Mon, 12 Oct 2026 18:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251301F0089B;
	Mon, 12 Oct 2026 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791828924;
	bh=sJ7Cz9cE5jYmh9i7+7gt+I7tJt8elW65y25IztcbqK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kmSGLKHTM0Xvrvi2qmfl59/BADJyznbG+bzb0bGwHPkZV/MCemLPQtRRvfKMc1SCK
	 EIZRGiHj6qCGSoZR2+EP2wEkB4cYuLid2h42DFhMeCFHqR7/B8jfuFT5HGbkajB2w+
	 AdKCsHPEOFUGlPpzZ5gJLIm0V3evijWTJIuZh9QrFmfbR888KHH0utNWOuYh3jBHdh
	 mCLhiQaFkh+fFUnitd+g8EGWCxESqozjK312zWZ4n5xNr/Plg2su41m/T4P31o4zeo
	 k9yjNS4IL8Z7dZnXWSji7b/T1BwxouuxWIogksUxwOhHeDaN+IZ5KIgXWR8MaRJ+ZG
	 tx0K8SJL6aYxw==
Date: Mon, 12 Oct 2026 19:15:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261012-trailing-makeover-daf4d62ac2b9@spud>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
 <20261009-e284e1844269292657604ec7@squawk>
 <asoSH0CLbi7xmjP8@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vbao+CsgOn8rBfQO"
Content-Disposition: inline
In-Reply-To: <asoSH0CLbi7xmjP8@ubuntu>
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

--Vbao+CsgOn8rBfQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 06:23:27PM +0800, Jelly Jia wrote:
> On Fri, Oct 09, 2026 at 04:31:26PM +0100, Conor Dooley wrote:
> > > +  cix,irq-router:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Syscon phandle for the CIX Sky1 subsystem register block that =
routes
> > > +      DMA-350 channel interrupts to the AP interrupt controller.
> >
> > See comments on the driver for more on this, but I'm not convinced that
> > this should be in this node - especially if this thing controls other
> > device's routing too.
> >
> > Thanks,
> > Conor.
>=20
> Agreed - v3 drops cix,irq-router from the binding completely. We plan
> to handle the interrupt gate as firmware/pre-Linux platform setup for
> v3, so the DMA node should not describe it. With the property gone, the
> CIX-specific conditional in allOf goes away as well, and the binding is
> back to the generic controller properties plus the CIX compatible. The
> corresponding driver changes are in my reply on the driver patch.

For correctness, I think you still need to model this by using interrupt-map
in the syscon node, with the syscon as the interrupt parent. If firmware
will program it, you don't need to actually implement anything in a
linux driver (unlike the Microchip and Renesas devices that I linked),
you just need to put the interrupt-map property in the syscon and common
code will do the rest.

--Vbao+CsgOn8rBfQO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0jtwAKCRB4tDGHoIJi
0rvzAP45h5Dn2C+Y02Q/vohB7N99QpMoe5knRjpH10VLH4udPwD9GSoyu1o41xQ3
1XdkvyTiiRgLHfky9uIGfJ5uVfboRgY=
=jyIs
-----END PGP SIGNATURE-----

--Vbao+CsgOn8rBfQO--

