Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35639CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8L0edQt/Ee/yQpXmlrZgcjgW4ACeKUS6LxtyCaw9XY=; b=CDaAbfgXIYfuZZpygWYQ3IecPz
	pidyoIlwPPsHkoradTZBsiwMLAI+ERuOfov3rkbr4CAe2nSBQhpDa8dYZd4vBaxXdI1r3d2Iza+2+
	wSX9bCH3864pFXpGqKWKMAPxoMr1MPiN5WhWGTK4fxomP9ibNjTFe/HcYscR0NF3LdNkQ0qjxfAfD
	x2/lfy8ky4C5HmdB1pUQ4CGKPHPGVdkAAdbqu8PxRhjABvX5xj44cCW1r1SrZ9CGWGN2+Q98P2Qae
	Vj32U+GZQa1klX/o8JP1ygk2JLjEhOR8UnuzBIQKTcKTqHyCMoxj1Ry/Ap8bX1/nHSN640Nqw/5ta
	YDXoZ/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZxe2-00000000LWP-0Vk6;
	Wed, 17 Jun 2026 21:17:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZxdz-00000000LWC-3oPJ;
	Wed, 17 Jun 2026 21:17:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA3D86001D;
	Wed, 17 Jun 2026 21:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3F71F000E9;
	Wed, 17 Jun 2026 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781731074;
	bh=r8L0edQt/Ee/yQpXmlrZgcjgW4ACeKUS6LxtyCaw9XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EUFhYcTqHHFprC+qZA3THeFlIO8qFuA5cHIEVgLsAZVQ6sMUJU+vSWkNNi3if6Zv0
	 OkPfTUuHql8WSH92iBZoJyldI9iRlKLs8V4PBdp+VV6pmYSmXiKyrmaWAZAo777F/B
	 vbo8e2TjqdunvNkZUG10as16NbmOWAdi9cA/BcWQN7kas0fUJFIBJGnQSa35vgur4R
	 oF2182EZPnrUMy8qvWvKwc7NYFxSQT0vgOA8bKxvd8P/wv2yPo8tC+jmCyYmpJ6QJ2
	 kM0Ov8CC+QfE9NBm0IOUvLEVXJCTjPwsKJee/DQoL3N/KELYjdOiZKG3LncoK6sJsZ
	 v5kDJI6h/C4lg==
Date: Wed, 17 Jun 2026 22:17:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Message-ID: <20260617-defrost-handler-3290abc01857@spud>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
 <20260617-feature-mipi-csi-dphy-4k60-v1-2-4611ff00b0ff@wolfvision.net>
 <20260617-deviate-sulk-c57104ef939f@spud>
 <c34d4167-1a33-4e20-820c-735811b6a966@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ickn2VCpN26N0qJ+"
Content-Disposition: inline
In-Reply-To: <c34d4167-1a33-4e20-820c-735811b6a966@wolfvision.net>
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


--Ickn2VCpN26N0qJ+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 06:20:19PM +0200, Gerald Loacker wrote:
> Hi Conor,
>=20
> Am 17.06.2026 um 17:51 schrieb Conor Dooley:
> > On Wed, Jun 17, 2026 at 02:23:14PM +0200, Gerald Loacker wrote:
> >> Add support for the optional rockchip,clk-lane-phase device tree prope=
rty
> >> to allow board-specific tuning of the clock lane sampling phase for
> >> improved signal integrity across supported data rates.
> >>
> >> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> >> ---
> >>  Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 7=
 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-d=
phy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> index 03950b3cad08c..0d824d1511bc0 100644
> >> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> @@ -56,6 +56,13 @@ properties:
> >>      description:
> >>        Some additional phy settings are access through GRF regs.
> >> =20
> >> +  rockchip,clk-lane-phase:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 7
> >> +    description:
> >> +      Clock lane sampling phase in 40 ps steps. The hardware default =
is 3.
> >=20
> > Can this instead become rockchip,clk-lane-phase-ps and be listed in the
> > actual unit?
> > With the -ps suffix, you can then drop the $ref.
> > The default should be listed as "default: 3" (or default: 120)
> >=20
> > pw-bot: changes-requested
> >=20
>=20
> Thanks for the suggestion.
>=20
> The phase setting is a hardware tap index (0=E2=80=937) selecting a delay=
 line
> position. The datasheet mentions =E2=80=9Cabout 40 ps=E2=80=9D per step, =
but this is not
> a calibrated or guaranteed value and may vary with PVT.
>=20
> Because of that, I=E2=80=99d prefer to keep the property as an index and
> document the approximate delay in the description:
>=20
> Clock lane sampling phase selection (hardware tap index 0=E2=80=937). Eac=
h step
> corresponds to an approximately 40 ps delay as described in the hardware
> specification.
>=20
> This matches the hardware model more closely. Happy to adjust if needed.
>=20

Sure, I think that's fair.

> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >>
> >> --=20
> >> 2.34.1
> >>
>=20

--Ickn2VCpN26N0qJ+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajMO/gAKCRB4tDGHoIJi
0nNiAQDGqdn+tVrfgHKSxX2jDI4GVxuPM/2N7UWyiTmGN1rXPQEAgQ4uRnmAPDwA
ghCPMmy7HHNGhVGn8aephG5ofuMtPgg=
=h3/b
-----END PGP SIGNATURE-----

--Ickn2VCpN26N0qJ+--

