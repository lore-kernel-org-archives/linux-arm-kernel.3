Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC81CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS5vzTWiFCVV3CCvTa86S3rAsEqBDW1fk6YNyU4jtpg=; b=dcRspdVGkktBE6Ce96r9Y+dxnz
	6vqaLk5QFYlnPbSGa3+fVHL9FEQYoVzNvWoVPZ7/CDr+yna92IRkNmUMuB5JjzAy3J7IRb1DzlQB9
	y95eBpvYyuR3xOg/OyGgZrlbnkVwS7iI+//Q/L+j+kzlwhuErMRorF4yReutiHujJCCWwCE6BNgJ5
	F6oYWgWuJdPhWwBwlI9fpiq3wjAbBzIF4HSijt7LdDG2FE6g62ks1y52clnqNfx7spqW1PzWA4Go7
	YqPhM3r+L33FeATTAj9HBN6dPw42f4mexY7I43zJydDDy3np3iF0xLMUtv1sxYRjt0JfKjKWd5CKN
	xCEQvHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhjK-00000005CT9-0I3N;
	Mon, 22 Jun 2026 16:42:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhjI-00000005CSs-0Frt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:42:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C30A8436D7;
	Mon, 22 Jun 2026 16:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8BD1F000E9;
	Mon, 22 Jun 2026 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146555;
	bh=jS5vzTWiFCVV3CCvTa86S3rAsEqBDW1fk6YNyU4jtpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnCi4B8VwCOumOVFdE2j3qraJ+BMRPUyrJLX+cqoIfqHyopKQI6tLQekmRsdKz5l2
	 ilk0NICDuqMs3c3zvNmCpv4/4+2yJtwSpWqHiqBgyFyIqt8W4qqIpLGsNaLE1KsY7x
	 qryAzD8JC4dl8lCdOquSuuNbl1lffu93AX0BFtqXnJhYCGxGjYe91Sr25ScFiqXszL
	 BV0X8eCrCUA1zX+lUB/UBK6hWED22CyK935uy2+IN0wVzvDj/uWdPPWko3caBOQqvs
	 m9jvSZG9IMlhtEFZuc0/jTVYoQUIdOePQgAM6jRNeGSr0fZqTO/SZZT27oxCDYdEll
	 K65MrslhGSJAA==
Date: Mon, 22 Jun 2026 17:42:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: dma: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Message-ID: <20260622-line-underrate-af8018529dbe@spud>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
 <20260621-sun60i-a733-dma-v2-4-340f205891cc@gmail.com>
 <ajhjj7FLn136qMmt@SMW015318>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peIRuF7CVWCE39IV"
Content-Disposition: inline
In-Reply-To: <ajhjj7FLn136qMmt@SMW015318>
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


--peIRuF7CVWCE39IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2026 at 05:19:59PM -0500, Frank Li wrote:
> On Sun, Jun 21, 2026 at 09:40:57PM +0000, Yuanshen Cao wrote:
>=20
> subject dt-bindings: dmaengine: ....
>=20
> > Add `allwinner,sun60i-a733-dma` to the list of compatible strings for t=
he
> > `sun50i-a64-dma` dtbinding documentation.
> >
> > While the A733 DMA controller shares many similarities with the sun50i-=
a64
> > DMA controller, it requires a specific configuration due to differences=
 in:
> > - Interrupt register layout and mapping.
> > - Number of channels per interrupt register.
> > - Support for higher (32G) address widths in LLI parameters.
> >
> > Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> > ---
>=20
> After fix subject tags,

Do not change this unless you're respinning for another reason. dma v
dmaengine is not worth resubmission, especially since dma is far more
commonly used and is the directory name.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
> >  Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | =
2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64=
-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.=
yaml
> > index c3e14eb6cfff..1cc3304b7414 100644
> > --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.ya=
ml
> > +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.ya=
ml
> > @@ -25,6 +25,7 @@ properties:
> >            - allwinner,sun50i-a64-dma
> >            - allwinner,sun50i-a100-dma
> >            - allwinner,sun50i-h6-dma
> > +          - allwinner,sun60i-a733-dma
> >        - items:
> >            - const: allwinner,sun8i-r40-dma
> >            - const: allwinner,sun50i-a64-dma
> > @@ -70,6 +71,7 @@ if:
> >            - allwinner,sun20i-d1-dma
> >            - allwinner,sun50i-a100-dma
> >            - allwinner,sun50i-h6-dma
> > +          - allwinner,sun60i-a733-dma
> >
> >  then:
> >    properties:
> >
> > --
> > 2.54.0
> >

--peIRuF7CVWCE39IV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajll9gAKCRB4tDGHoIJi
0l4hAP47PVrBv7GeDeVOvJgI2ZJy5w1r98XvDUdIdvTX634bFwD/aLHVuG6enEsl
VyC9c36IFrvNVMK1iB5+10sOdmY9vQU=
=O0oF
-----END PGP SIGNATURE-----

--peIRuF7CVWCE39IV--

