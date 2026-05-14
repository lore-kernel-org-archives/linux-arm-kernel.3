Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D111ECD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2sOJtj76Izq0zlnjJf+ObK3SW4sVqbT+2qNXmhMs2c=; b=LlJNzWnqIVHh+RK5xlj68fA//D
	S0pe+gTNJCg2uhuyTx0+Qs5WSV46FhuNKNwn3H3xC/l00knY7GGXdfUHrnKZiCq2gJTOT7Jk4pVq4
	zwe0+rgYLAF6oKVGUxn4EcsBggqJd7m67RKQnGscJn0YaL8Feqz195s+dtViLIrDheGem9gB11Hiq
	aI155W+yRKCqsaEK7pfgeLPRm3lhKbH7kTqTuuULzvNYpapaSvSC3heJnwKM+TVnov/jFhEIrbaFo
	ZnECPtlzhZDOZlWZ9TwqQXO0yiBLI3ckzG8LcP6FSOUAySygEnPIwk5COqNCQb8+NxMwnxaDKxT5O
	tmLd2Kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaeP-00000006Ihh-3MtJ;
	Thu, 14 May 2026 18:19:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaeN-00000006IhE-3gO5;
	Thu, 14 May 2026 18:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44D9441926;
	Thu, 14 May 2026 18:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BC0C2BCB3;
	Thu, 14 May 2026 18:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782750;
	bh=oskWj6FYOM+YyUjtoCyY/BW6/OJD3HZ2otLe5Zw5UH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d85W4tHohozL3MJLZFbUXdKr5bp29xyRxseVltsCJghOeRL4AdrCDe9u4Jfk/uBVW
	 dhnNL0kC0iv72zYcBF6fK3HmJmlu79zj1iuQE02HU+qy3+6LRheOAjgPuSi//IXgSs
	 +bAIMCs9p7U/oN4yGpxj9cGpmRB3Tcu8YHWFPEiFwFf2fnpe3hnM//YXrPdf0Sn1KU
	 37VxJ2Ywu4BAjgHJpPUIg+UtL4UOdLDa6hrD23V5RzRQ/bvjfL4snOZCy4oOuqVXxz
	 QdelQhH/roIoiCCXJDtVjq6ZjwZ4vrNmSoivyWoOo+GB8w+jcRfgjXaIGBivgTrunO
	 IoaGoiImUYKBA==
Date: Thu, 14 May 2026 19:19:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Message-ID: <20260514-jolly-confining-997882e502c7@spud>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ND+hi1ksBt5vREJc"
Content-Disposition: inline
In-Reply-To: <20260514070133.2275069-3-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_111911_953251_32BDDC25 
X-CRM114-Status: GOOD (  16.90  )
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


--ND+hi1ksBt5vREJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 03:01:32PM +0800, Damon Ding wrote:
> Add data-lanes property support to the port@1 endpoint for physical
> lane mapping configuration.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/bridge/analogix,dp.yaml  | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
=2Eyaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b0924..a82f9b7776c0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> @@ -36,19 +36,35 @@ properties:
>        Hotplug detect GPIO.
>        Indicates which GPIO should be used for hotplug detection
> =20
> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true

Why are you adding a new property as deprecated? Why does this duplicate
what you're adding to the port node? At the very least, your commit is
lacking an explanation.
pw-bot: changes-requested

Cheers,
Conor.

> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> =20
>      properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Input node to receive pixel data.
> +        description: Input node to receive pixel data.
> =20
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> =20
>      required:
>        - port@0
> --=20
> 2.34.1
>=20

--ND+hi1ksBt5vREJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYSFgAKCRB4tDGHoIJi
0vfuAQCYa7+xBuugVT/DlZ1pBbcXCBgN8Wyd8R33GiHPMNg7LwD+KCtqQx6uVzXy
gMRBovmIOEAUzvyOimAsHgCmjhx66wI=
=B72q
-----END PGP SIGNATURE-----

--ND+hi1ksBt5vREJc--

