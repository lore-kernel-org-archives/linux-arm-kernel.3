Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3479CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiHVPkmJ4kLt15rZlOliv30WPQ7D2hyc8KjNSWJr6fo=; b=w1j7spkmTm6jR/LmcRZyUTANsF
	GYEdi/igs6zFCE2yQT19Ii1/oIuaotIw0aPz4d5dO75iEcAsI1OUrbOzPyd1OcGqD4boSabXj6qIr
	4O5NaXRSr8Dv2DdJShv9VkU4dJi7IkasEzOCtFqyKNy4Fns15NbgrN5knimO4cwCjJvSlnK99pcMs
	FfrzuCX2I1j0Q6wX/f1GSdJ+5v2TcaA5p1NrRiGh2MbLmoasVfXjL/8wxGXOA66bp0aBqcah1jFXG
	ybWu5L5466D7mJFD0Wv/RrbMKgeNcJTbaJBx1WobVlWPwBvfucJB/Djv82eI9t9ZuATtnW0ckfUs+
	Q6oCou7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jIW-0000000H7zj-3QZW;
	Tue, 14 Oct 2025 17:58:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jIU-0000000H7zO-0VwE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 17:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C680443CBF;
	Tue, 14 Oct 2025 17:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0128C4CEE7;
	Tue, 14 Oct 2025 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760464733;
	bh=XDE6Yxeh5XTmulB/+mdNcqgIXS4uoK/1f8lE5Ir5Ezg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bu/eZlsz44HxEbI47lj8muJJ1DeQ5g63sPU/8wR/cfumSftjo+mx1WWB7eCjqTgxm
	 mj2N1DKHcHqc9qcyJM+Mme3ktfwcJLpWKUH4l8ExKtww8bTqPCLqgnTqnFZf82fs3C
	 asYvnH6Q/I+Cn6GCWxIDT4B7nijvusMAZ7Mm21vCTz8n6c8KAPw1BYFvf1x6W2I/+d
	 sMGLcrwHMvbNwdKCDHhl7Wl6U39+xof8+9+4vuTPnf6gNjtzPyrt+8BTOeYvA80/e3
	 7HxvHGN1n5aaPHGiwOmDZ4gJWs0n5Y4+NpVa82qK1vqUhAG5ZvkA8tZdDr3xDqqWgV
	 ywhKGFc5I6vkw==
Date: Tue, 14 Oct 2025 18:58:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20251014-backyard-parted-572627bfc540@spud>
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-2-gary.yang@cixtech.com>
 <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7QY2DKFaWvZjWwF"
Content-Disposition: inline
In-Reply-To: <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_105854_226168_08A61CEF 
X-CRM114-Status: GOOD (  17.51  )
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


--r7QY2DKFaWvZjWwF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 12:44:15PM +0200, Linus Walleij wrote:
> Hi Gary,
>=20
> thanks for your patch!
>=20
> On Tue, Oct 14, 2025 at 3:57=E2=80=AFAM Gary Yang <gary.yang@cixtech.com>=
 wrote:
>=20
>=20
> > +# Client device subnode's properties
> > +patternProperties:
> > +  'pins$':
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      '(^pins|pins?$)':
> > +        type: object
> > +        additionalProperties: false
> > +        description:
> > +          A pinctrl node should contain at least one subnodes represen=
ting the
> > +          pinctrl groups available on the machine. Each subnode will l=
ist the
> > +          pins it needs, and how they should be configured, with regar=
d to muxer
> > +          configuration, pullups, and drive strength.
> > +
> > +        properties:
> > +          pinmux:
> > +            description:
> > +              Values are constructed from pin number and mux setting a=
nd are
> > +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfun=
c.h directly.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          drive-strength:
> > +            description:
> > +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> > +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfun=
c.h.

Isn't this wrong?
drive-strength is in mA but you're just shoving register values in here.
pw-bot: changes-requested

> > +
> > +        required:
> > +          - pinmux
>=20
> Can't you just include both pinmux-node.yaml and pincfg-node.yaml
> to get validation from the generic schemas?
>=20
> 'pins$':
>   type: object
>   additionalProperties: false
>   patternProperties:
>     '(^pins|pins?$)':

Why does this pattern allow foopin but not pinfoo?
Also seems overkill to have both suffix and prefix options, instead of
just sticking to one!

>       type: object
>       $ref: /schemas/pinctrl/pinmux-node.yaml
>       $ref: /schemas/pinctrl/pincfg-node.yaml
>       additionalProperties: false
>=20
> Something like this, I never get this right before actually testcompiling=
=2E..

spacemit,k1-pinctrl has a node of this type, that can be copied from
Gary. Essentially, you need an allOf: for the two references.

--r7QY2DKFaWvZjWwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6PWQAKCRB4tDGHoIJi
0pbcAQDMSqerReJ65uUM71ikHTc6L6kMQSFvvRzk3Z2gSbEsQQEAxn/UVVjIsZKM
A4ol0es58WdnPRa/MXvsm6KKAtTLrwk=
=9CrM
-----END PGP SIGNATURE-----

--r7QY2DKFaWvZjWwF--

