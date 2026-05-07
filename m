Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE16ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q64hMkgqIITkVJftbnW2ntRGK5chersKOdT9gYJXGmg=; b=QJ3pqv1Ly17aC8Zw9+bQdo+xzy
	y0ajaKFgV2mThQ7p9b0Kj/sKyVzpc/hnwdrnMpVr9xI/OryPiYvC85Scp1QIaQL/2sfGkIM9G/tnB
	EOG8bqAHLe60Jnnh2DxZSROTFrBpL5fuRUDhqCpVFRsvBzyF9xezRfBhrOO/x592wpyv7EUKI/Y5R
	jG9RoFbDc2jQiEmuMkwH7DaXna81kPnDEWbasj557xCUJqqHllMOd6jG5jTvTB1JPbVnZeuK0VTu9
	D0xzSJY96v9RiBobSMVnVb2DR5YAgKjwPqu7tP1TNp00+/LfpBsuZl4Glxk1icf/ULQPmQeIFXqKu
	6DEcHY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Aj-00000004QjA-1Fqb;
	Thu, 07 May 2026 17:06:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Ag-00000004QiZ-2cLm;
	Thu, 07 May 2026 17:05:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C33943CB8;
	Thu,  7 May 2026 17:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176F8C2BCB2;
	Thu,  7 May 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778173557;
	bh=xP4kvN20Q4l2M3zAgqCtFzM8COxGNtbqy5n6gljAOkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEYVWUFYfs+Hu3bCpGtYs3PemIHPivPhjLOQ+wc2B+b3o8O1XjDIVzjw0cvLRsgTD
	 gDRycUVn51z/r3FD5XkWutO1NrMxGkCr+3yoPXHKbirSCGN4w2UN3CRG5SsgJ86RrO
	 Hgt60M0Een1ax9wSussdAFhHLGVBvV/gF/1eWroNbIzjEe46tEF4dU6ErHZb/wgnz6
	 85JFEi7gcjUAm/AfBOIcALNGPvihLEi/nuPLbDiKHHDjJ1ueYGkuEHOZshyYp6g2m1
	 6F24te6W73TlhF3v1mqdnCDjs/EOxGuxssr/HMYfbYRjUjhZLakpSbcfAEbbeKK3YG
	 ZZMA+ERjc2+kA==
Date: Thu, 7 May 2026 18:05:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
Message-ID: <20260507-wish-acre-1e4389843c75@spud>
References: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
 <20260506-rpi-otp-driver-v3-1-294602663695@linutronix.de>
 <20260506-unguided-duty-892b11b7c618@spud>
 <7g6bvlp5fs4bkviiyywqu5wb5hndkczcamgtir5ow262cqkmdo@xyj2otywjepn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ro8e+12XL9fqGZ2"
Content-Disposition: inline
In-Reply-To: <7g6bvlp5fs4bkviiyywqu5wb5hndkczcamgtir5ow262cqkmdo@xyj2otywjepn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_100558_707379_8CC903C7 
X-CRM114-Status: GOOD (  24.13  )
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


--5ro8e+12XL9fqGZ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 09:42:54AM +0200, Gregor Herburger wrote:
> On Wed, May 06, 2026 at 05:50:42PM +0100, Conor Dooley wrote:
> > On Wed, May 06, 2026 at 02:28:15PM +0200, Gregor Herburger wrote:
> > > Add a compatible string for the bcm2712 firmware.
> > >=20
> > > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > > ---
> > >  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 13 +++=
+++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bc=
m2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi=
,bcm2835-firmware.yaml
> > > index 983ea80eaec9..fbcfa2bc168a 100644
> > > --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.yaml
> > > @@ -21,9 +21,16 @@ select:
> > > =20
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - const: raspberrypi,bcm2835-firmware
> > > -      - const: simple-mfd
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - raspberrypi,bcm2712-firmware
> > > +              - raspberrypi,bcm2835-firmware
> > > +          - const: simple-mfd
> > > +      - items:
> > > +          - const: raspberrypi,bcm2712-firmware
> > > +          - const: raspberrypi,bcm2835-firmware
> > > +          - const: simple-mfd
> >=20
> > This diff doesn't make sense, either the new firmware is compatible with
> > the old one or it is not. It shouldn't appear twice.
>=20
> Ok. I will change it to:
> -    items:
> -      - const: raspberrypi,bcm2835-firmware
> -      - const: simple-mfd
> +    oneOf:
> +      - items:
> +          - const: raspberrypi,bcm2835-firmware
> +          - const: simple-mfd
> +      - items:
> +          - const: raspberrypi,bcm2712-firmware
> +          - const: raspberrypi,bcm2835-firmware
> +          - const: simple-mfd
>=20
> While reading the writing-schema.rst documentation I saw that it says most
> bindings shouldn't need a select. Imho the select in this file doesn't add
> anything which isn't covered witht the compatible. I wonder if I should d=
rop the
> select block?

That shouldn't be required, other simple-mfd users do not have it.
Remove it and run dt_binding_check just to be sure. It'd be a separate
patch from this one FWIW.

--5ro8e+12XL9fqGZ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzGbAAKCRB4tDGHoIJi
0jcEAP9De/nmvd7WAcOJiOqJ8uorUaz7Zs4p72tklWAnAe+kZwEAve3uDlZgWZ8X
+GSEgozVGiK5jmv6gykKHjV7ZQuVLgM=
=B3W5
-----END PGP SIGNATURE-----

--5ro8e+12XL9fqGZ2--

