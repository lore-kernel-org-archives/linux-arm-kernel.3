Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE3ECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSa3ivyS/40EapRrNstrqaTkAzWoTNRFstPbbAtIQsg=; b=OdlW9O1/Ft4W4kuB7YIEX/Fw8y
	nGJwnHkgKwZEetrP63bMVkogl6Jo8AfTlZJGA/wy7Wx3lZOp8d80giQLq6tDhtDtxM6Q3WskNxyhs
	JuqHfhRXClefwXckRT++MYyExgtUqRa3MGqeRkTmSzfb1stOSF3XHGa600gBPH6gqu1TdqKss2OJa
	lW9cCfgk3OodOuyggAZatrmMpmf7JS3L+wnR5+LQABO9c5K02vnFzyo9xnl0nLx/XVG26xPxAZUHN
	UuBODVoWMP30wBakmwCPYiCLQuCxmIjP+o8iXqYT9iv6mU1UnPbLCJMucryRUnil5VspZ+czXUY44
	xwyreDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAHP-00000002GXg-3hbC;
	Wed, 29 Oct 2025 17:48:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAHO-00000002GXH-3Puz;
	Wed, 29 Oct 2025 17:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1584605A2;
	Wed, 29 Oct 2025 17:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30CCC4CEF7;
	Wed, 29 Oct 2025 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760093;
	bh=gmuvfAv/HRo9/GwGj6MrrNns2n4S/yptkDh+ez1A/BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBBijb++94bBV+SfzKmrzvQHpsG2lpDu/Ezjq70clIZUkpYOKyA3Ucnx/leoM5EHN
	 0vXvguO7ibhtHZLH86g0kSFNkQZT9uaU20GSzB2vxK/IXScQJAd5bkuFyS0vB3RkJC
	 VKVwWVMYHbebGpxW5XkPxlzp+aMbXYTZFtjXsWiPm1fYv+oxg/mTiTWhEUejdTuXR5
	 fkMwGORoAbO+FwFdJTrr0e3nHQxK8nR+uJJ6rwrxJ/aw8vmy3INxHi1PGcv9bXRzv0
	 aqz46WoMgdfBdP7BBSOkD7beU9vqkIjYrknRILy5C0BYsQpZteiEB5ol1CsYdWhOrL
	 GvA5x2rdvnZMg==
Date: Wed, 29 Oct 2025 17:48:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol.vincent@wanadoo.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, cl@rock-chips.com, linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: can: rockchip_canfd: add rk3576 CAN
 controller
Message-ID: <20251029-unreal-heroics-6e56a89e34d0@spud>
References: <20251029032302.1238973-1-zhangqing@rock-chips.com>
 <20251029032302.1238973-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="01IpGdZZ9oQxgRWr"
Content-Disposition: inline
In-Reply-To: <20251029032302.1238973-2-zhangqing@rock-chips.com>
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


--01IpGdZZ9oQxgRWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 11:22:59AM +0800, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN controller.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../net/can/rockchip,rk3568v2-canfd.yaml      | 52 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-=
canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-ca=
nfd.yaml
> index a077c0330013..30782218728e 100644
> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> @@ -10,13 +10,12 @@ title:
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
> =20
> -allOf:
> -  - $ref: can-controller.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> -      - const: rockchip,rk3568v2-canfd
> +      - enum:
> +          - rockchip,rk3568v2-canfd
> +          - rockchip,rk3576-can
>        - items:
>            - const: rockchip,rk3568v3-canfd
>            - const: rockchip,rk3568v2-canfd
> @@ -43,6 +42,33 @@ properties:
>        - const: core
>        - const: apb
> =20
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
> +allOf:
> +  - $ref: can-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-can
> +    then:
> +      properties:
> +        dmas:
> +          minItems: 1
> +          maxItems: 2
> +        dma-names:
> +          minItems: 1
> +          maxItems: 2

This looks wrong. You have one dma, but you're setting maxItems to 2.
Seems fine otherwise.
pw-bot: changes-requested


Cheers,
Conor.

> +    else:
> +      properties:
> +        dmas: false
> +        dma-names: false
> +
>  required:
>    - compatible
>    - reg
> @@ -72,3 +98,21 @@ examples:
>              reset-names =3D "core", "apb";
>          };
>      };
> +
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        can@2ac00000 {
> +            compatible =3D "rockchip,rk3576-can";
> +            reg =3D <0x0 0x2ac00000 0x0 0x1000>;
> +            interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&cru CLK_CAN0>, <&cru PCLK_CAN0>;
> +            clock-names =3D "baud", "pclk";
> +            resets =3D <&cru SRST_CAN0>, <&cru SRST_P_CAN0>;
> +            reset-names =3D "core", "apb";
> +            dmas =3D <&dmac0 20>;
> +            dma-names =3D "rx";
> +        };
> +    };
> --=20
> 2.34.1
>=20

--01IpGdZZ9oQxgRWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJTWAAKCRB4tDGHoIJi
0qVhAPsG3U2zIV2IEhCQGMbLtQJNoGSUmzb6yyOYDB/ZsqWM9gD/UvCgdautseC1
gMmchbJQAcHxrEqzZGxopx+iLXenaQ8=
=an9+
-----END PGP SIGNATURE-----

--01IpGdZZ9oQxgRWr--

