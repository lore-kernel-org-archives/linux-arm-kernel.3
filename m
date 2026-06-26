Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07813C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFfWRr8y10hg154czzuGpyS/bv0IkGNIbDUnL8w6ntM=; b=YfiSu+Wl+F4bXPGhC1WLJGXSdf
	auwMnJhF03mbUiDAhcoebnWprmHFUtTH5LzxjGoBCqnXHX7hs8tgAJiMSE0ASk/7bPdCB14ANL5iJ
	2d0ijqnVI/oNgPjmwEX5FoTmLd/IDtd4aRO+fEnwztF/CP6GOHTZ5zOzV7ICpRReqiGVEq/AH7HBv
	rvPGLvXLcZFG3ISagkISFT7gsvQ6X4p9jXLvFdtmn5DyvAvTx8rFYYO5bycxzUkL1mqw9EVEGtHTP
	2NsAAKj/BwcGQEttEgRKNOwBA0KM8J1a7hXdEeH1iENh/gr16Dz82xhLwjhnfHvd1/MMdFUymztal
	rTIVc/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8w2-0000000BaAl-0hQF;
	Fri, 26 Jun 2026 15:57:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8w0-0000000BaAc-3JW1;
	Fri, 26 Jun 2026 15:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0465600C8;
	Fri, 26 Jun 2026 15:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3BE1F000E9;
	Fri, 26 Jun 2026 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489459;
	bh=jFfWRr8y10hg154czzuGpyS/bv0IkGNIbDUnL8w6ntM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cG8fnMlh5cSaCm6wDuGl7LW8U1Hvl7MIY0LWTf1iUwzgGY0HXwae87bJrMgB03beF
	 9k5X9jAL9jaqg5Mjfxa/vHbjOJ0Mma91LHO4EJuyuLyE+a/JoFg3iNZ7OK9OXmxpdU
	 qCqYnJPCbrcYy9T77vcBimSDkfu43RnH3nZYov2RjuADQRmef5q5XCYYVlV1QptmMJ
	 MGmwZMTydrJB//WwlIaT1wQd6b7wjw5828Z8rPa8TrNyrsPKswiPZ3W9bFP8QDFNmn
	 xtsz3ndB1aKkSZXMUieAGd4xRKIvdiyo/djap16CuCFx5ipHP7UAYiFlW1/IM66rQY
	 RauCwSmJnV6ig==
Date: Fri, 26 Jun 2026 16:57:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Message-ID: <20260626-quaking-shove-fcc9d8057ae0@spud>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k5rMmSOE0G84CTzG"
Content-Disposition: inline
In-Reply-To: <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
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


--k5rMmSOE0G84CTzG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 09:35:05AM +0200, Gregor Herburger wrote:
> The Raspberry Pi firmware allows to set a reboot mode called tryboot
> that allows to try booting from a different partition to allow updating
> of the boot partition. Allow reboot mode properties by referencing the
> reboot-mode schema.
>=20
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index 983ea80eaec97..30b490e0d9fb3 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -133,11 +133,14 @@ properties:
>      required:
>        - compatible
> =20
> +allOf:
> +  - $ref: /schemas/power/reset/reboot-mode.yaml#
> +
>  required:
>    - compatible
>    - mboxes
> =20
> -additionalProperties: false
> +unevaluatedProperties: false

I think you should keep additionalProperties: false and add
mode-normal: true
mode-tryboot: true

(I don't know if the latter works though, you may need to have a $ref to
uint32-array).

What you've done permits freeform reboot modes, but I think only normal
and tryboot are valid?

--k5rMmSOE0G84CTzG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6hbgAKCRB4tDGHoIJi
0rCiAQDDg0pspsj14SGLKGCowwFULn0NgShcWSuAfhQG5rzqzQD/Ymt/dEAL4KnG
ZR+Qf/2INUCS21KV8pjjudsiq+YmlQw=
=E7wz
-----END PGP SIGNATURE-----

--k5rMmSOE0G84CTzG--

