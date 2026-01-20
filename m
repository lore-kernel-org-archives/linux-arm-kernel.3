Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C128CCA5FB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiTvikaA7R411Hnz5E0Ypqj2SvsLAewFRLLdvMaWnhU=; b=iPWP9FdJu4+KYOsCSWN1350+pp
	LICZz0R6iHyWoMKDvc4N+BQC2JbBEEymFF/tj5bzg2n3HGE45Nz5T5f7CTWPe8AjtyJJbS6jKc/i+
	tShyDkoZflQOMtDTD3J5MNYFmRz+HJxZjcVXJQIJce+/iM5OPXDt6DKeqTRvELcKzxaimmScGVp3E
	WOLGEdh90fM5PgRwyxGztPYeNOt0CLjguKkYblj11B6x3m4yo2BakqbUcn+Shdykhcvwg9gwdxKwj
	VFOTsoZyhbMqgiBCD0fb7cE5nFKQgvAvjeLg5tG9v17QZGyWRkdW66SKvYTzFeQbGBiEThi3gVIKF
	7kmpkhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGBW-00000004HcJ-1UiH;
	Tue, 20 Jan 2026 18:10:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGBV-00000004HcD-2PtJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 18:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B5BB600CB;
	Tue, 20 Jan 2026 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED289C16AAE;
	Tue, 20 Jan 2026 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932632;
	bh=z4qhv19x14mJR2BlyaLHoajY1A4AII07YFtQh1gYJc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mb9RRNfJjyLzKjUI+XE6tHgNWbzbonmZ5QYGFcUdZzQnvC/RY/e19MfQaUgxhk4g7
	 sBGlUtufESyYxhFpuyB1h1IydMzrTULYsg/rZKSjW/rHKBn0iij8MRHFKUfq3dIyoZ
	 kpH2KgoUTipvxYCZOYT3oYO1/b0jK6RHFhyhsMGD6gVPHFYH0Xo91ilJQpnboEdjB2
	 hjd+FaeFC62PL1duTxbwjH0dRzRmrRG0r33w4fyETblshDJVpdAkF7jeuoIWJDkRiq
	 q2WcmTvUiPpdaH0epXI16mQPlwYLlXjqvjT8epRDh3bquK3RFunEeT6mi02nLm6wob
	 6fOdEybrMVxRA==
Date: Tue, 20 Jan 2026 19:10:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Add optional
 Motor Control PWM interrupt
Message-ID: <b3r6azklrc2p5v7eb22hjh6uivxfm3uevrfvalmgz5ijrzeqgp@c2rfbscdhaij>
References: <20260110014524.3379187-1-vz@mleia.com>
 <20260110014524.3379187-2-vz@mleia.com>
 <20260112-garnet-axolotl-of-acceptance-3978fd@quoll>
 <20bd5723-212b-474d-84ea-52dec73a5333@mleia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="amfavhcheyxo4tm4"
Content-Disposition: inline
In-Reply-To: <20bd5723-212b-474d-84ea-52dec73a5333@mleia.com>
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


--amfavhcheyxo4tm4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Add optional
 Motor Control PWM interrupt
MIME-Version: 1.0

Hello,

On Mon, Jan 12, 2026 at 12:14:39PM +0200, Vladimir Zapolskiy wrote:
> On 1/12/26 11:10, Krzysztof Kozlowski wrote:
> > On Sat, Jan 10, 2026 at 03:45:23AM +0200, Vladimir Zapolskiy wrote:
> > > NXP LPC32xx Motor Control PWM has an interrupt line shared with TIMER=
4,
> > > and the interrupt may be used to report events from programmable coun=
ters
> > > e.g. timer counter limit (period), match counter (pulse-width), or fr=
om
> > > counters on input lines of PWM channels.
> > >=20
> > > As a reference and for more details see NXP LPC32xx User Manual, tabl=
e 595.
> > >=20
> > > Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> > > ---
> > >   .../devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml       | 10 +++++++=
+++
> > >   1 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> > > index cdd83ac29caf..53520f005acb 100644
> > > --- a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> > > @@ -32,6 +32,16 @@ required:
> > >   allOf:
> > >     - $ref: pwm.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nxp,lpc3220-motor-pwm
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          maxItems: 1
> >=20
> > Properties must be defined in top-level. You only narrow constraints or
> > disallow them :false per variant in if:then: blocks.
>=20
> It makes sense. In this case would it be better to split the schema file
> into two, one for each PWM type? Two described PWM types are too unsimila=
r,
> apparently it was wrong to merge them under a single .yaml file in the co=
mmit
> 4cd2f417a0ac ("dt-bindings: pwm: Convert lpc32xx-pwm.txt to yaml format").

No strong feeling either way from my side. I marked this patch as
"changes requested" in patchwork and drop if from my mailbox.

Best regards
Uwe

--amfavhcheyxo4tm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlvxRMACgkQj4D7WH0S
/k7LjQgArQ9OG0El4KPIYCalTIisTIEIwv4joOjv55eqJE0bjoWhg6KaFm9l59Sw
WNLOOAT5qSrdCtehO6+D3We5OEFUvS85BSvpB1Kgd9Ka4Uk4/M98zxrJILTEw6/s
5ZrgxvBb/5fPg2XWueaZ43KWCxPPe5QQa3k4/0AJluJd8azKAVKI0BROw8dzHEt6
+BdT12rgpYzVPpzmqPPlYJMcCscXrkMtAq+8zMUACcw4Ufgv57+nU4aMzqRJwvgP
CK6Iv7bxhMOpMyngWfg8EKFduZeGd6MuJBgPY+UQl7HXcvb1/GfKKSORhMk8qznC
Mn+DpQ607KeYZH7phzglWRKALeMucw==
=Znar
-----END PGP SIGNATURE-----

--amfavhcheyxo4tm4--

