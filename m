Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2E4CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ua7ilpqGQ1TJZ+Bnhifl0cs54R7li+gA4PLtG5KdeuQ=; b=FfR+4zGrXqO9X1cHX18J03+8w7
	KSAef4zWpuYXRzWmnvVku6yxELGwtpi5rG8QSVX+fW0t6wUnx1hlK4AjIEYHZcr/rBF7LFojGJPDK
	gved1l9p957+mBucQ1EPEKio7PD8ggEJjvkjPqn/GHIJLtg8jkLFm28X/DCru96g9MMb1GSBIGjAs
	pJwe0X4Y029t5WnW2+awZJ5rJfYIh+isWbjRKvFA063O8OwW4nzpmxx+5X4rS+lYUauq+eFNBnFAh
	9RCiF3W9HVW87PLxo+vknKWjFmAcrx/BseqQJh87dYavpGqzpmVdEfWXN571rkXk9Ki5LIyTQNXVj
	eRDKMaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY43G-0000000BAmz-0grF;
	Fri, 12 Jun 2026 15:44:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY43D-0000000BAmq-2sQ0;
	Fri, 12 Jun 2026 15:44:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6998D6008A;
	Fri, 12 Jun 2026 15:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD361F000E9;
	Fri, 12 Jun 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279046;
	bh=Ua7ilpqGQ1TJZ+Bnhifl0cs54R7li+gA4PLtG5KdeuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h91m9/RTVoc4n7+PHfPlE/bu8XLven6nAKb35XV39yApAjaHBXzKJ8LUiHX1Ax3Uc
	 hs+12QVOwd6kjjJHbtVqYUbhAHbpwTwAT5pFJ1nP+Sh0z/nfy0DvOJYNcBQNju/VQ8
	 P04Ynl5UWyd/Y7FiICFoenOJs8qje3zDwnbGwSrCRteIPXWRqJ+I5RPoff7YUeQKum
	 036rNdlfFTMd8xwP8TnkpAhJ8pars/jTvXV2Gk1guqSQ4I9+GOgKudR2CLNTsWKdV3
	 iLGdyKn3IuvIXLxhLCWAjcln79zQPU1A7k5OmuBwMgVtAKBb5X12h4oXaUeQjm/24M
	 9ALyckPrchIYg==
Date: Fri, 12 Jun 2026 16:44:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 phy-next 6/8] dt-bindings: fsl: layerscape-dcfg:
 define DCFG_DCSR region
Message-ID: <20260612-graveyard-hacked-c65d54a1ece8@spud>
References: <20260611193940.44416-1-vladimir.oltean@nxp.com>
 <20260611193940.44416-7-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Anvk3G/afIgQqFuh"
Content-Disposition: inline
In-Reply-To: <20260611193940.44416-7-vladimir.oltean@nxp.com>
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


--Anvk3G/afIgQqFuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 10:39:38PM +0300, Vladimir Oltean wrote:
> In Layerscape (Arm) and QorIQ (PowerPC) devices, hardware peripherals
> are accessed by the CPU through a portion of the SoC address space
> called CCSR ("Configuration, Control, and Status Registers"). All
> hardware IP blocks have their registers mapped here, and the Device
> Configuration block makes no exception.
>=20
> However, there exists a secondary range of the address space named DCSR
> ("Debug Control and Status Registers") which, like CCSR, also holds
> registers of hardware IP blocks, except the DCSR contents is hidden in
> all public reference manuals.
>=20
> The intention of the CCSR/DCSR split, to the best of my knowledge, was
> to place the functionality that is too low level for normal use, and
> which is necessary only for debug, in a completely separate address
> space which can be hidden.
>=20
> A use case has appeared where networking SerDes lanes need to be
> reconfigured at runtime for a different protocol (example: 10GBase-R to
> SGMII), and the architecture of the SoCs does not normally permit that.
> The Reset Configuration Word (RCW) is a data structure read by the SoC
> preboot loader (PBL) which contains stuff like pinmuxing and SerDes
> protocol mapping for each lane.
>=20
> The RCW that the PBL has loaded is visible in the DCFG block's normal
> status registers (from CCSR), as read only. Turns out, the RCW is also
> mapped in the DCFG's shadow register map (in DCSR), in a write-only
> form. Writing to the RCW registers from the DCFG's DCSR space to change
> what the PBL has loaded is called "RCW override".
>=20
> It has been validated that the RCW override procedure is necessary to
> reconfigure the networking data path when a SerDes lane performs a major
> protocol change. It changes some internal muxes which connect the PCS to
> either the 10G MAC or to the 1G MAC.
>=20
> Defining the DCSR area of the DCFG as a secondary 'reg' array element
> allows operating systems to perform RCW overrides. Since it is
> introduced late in the binding's lifetime, it is optional. It can be
> identified by name, but also by index (first 'reg' is CCSR).
>=20
> Note that while all SoCs should have a DCFG register block in DCSR, we
> only need to expose it for the SoCs where the RCW override procedure is
> known to be needed and has been validated.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Conor Dooley <conor@kernel.org>

Where did this email come from btw? get_maintainer.pl result should have
+dt in it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml     | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcf=
g.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> index 3fb0534ea597..fc14fd0bf84b 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> @@ -36,7 +36,20 @@ properties:
>            - const: simple-mfd
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description:
> +          Customer-visible DCFG register map from CCSR address space
> +          (Configuration, Control and Status Registers)
> +      - description:
> +          Customer-hidden DCFG register map from DCSR address space
> +          (Debug Control and Status Registers)
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: dcfg_ccsr
> +      - const: dcfg_dcsr
> =20
>    little-endian: true
>    big-endian: true
> --=20
> 2.34.1
>=20

--Anvk3G/afIgQqFuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiwpPQAKCRB4tDGHoIJi
0iTkAP4y8yskNE7dxgDzs/Wxh5ly8vIUHNi1EsapV2wtvfvMrwEA//4T48+aL7mC
/esW1vHzfucr882C38bIUCbZewcjhgE=
=NKQc
-----END PGP SIGNATURE-----

--Anvk3G/afIgQqFuh--

