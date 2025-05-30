Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23B2C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agKHQjxfZDqRcl11omTUAcYR28VqjSi2A39hS2TD8qk=; b=yeB6tKYjCAdiVrxM4+EKjkUeDo
	F9q30+AEsZh3tXw2+d3m5QkPH1xg5jjZ1BN4ekx8q50NbYHsmzUuBWBy8xUOFWT88uq/vHBLf3VKx
	Kihwg26Nzmyih+PQYl+C9fql6WQcI192HPYQzaQP32+7TZ/liv0xhZQvIAbWIb6lFnorn/3mZLLCO
	fZaVxaKzDwqMHjw3y2i6ljMuuSLBwc5BoJvAi82jRV83VXWH94vyUP6GQBqJeS9wXwnwPGNvrAkKe
	I/zQABhlaDa9NGYZcU2g3vfx6Q4RA5TxcUuKEleEZg7tiVEMomb+2gUi4cK2HSMVyEYG9Y2a3HXcm
	ujAAp5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1cN-000000010WH-2Kzc;
	Fri, 30 May 2025 15:25:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1a5-000000010E3-01A3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 15:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBDFEA4F893;
	Fri, 30 May 2025 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905DAC4CEE9;
	Fri, 30 May 2025 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748618615;
	bh=LWFWoggGe46xQ5RQp18Vq6QjeHfIxauE+ObN41PB7bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrfVTlxCx05DUwfOjqI/Y+5oFEqvXplJaFVRb0USAmPukce0NtMccV3wPk95cxeDU
	 bC6SNp+9u2uDpjLj40UgXQ3mlgMKcthZWGBctAe5wBn/owpHTXBs6jQs+QVrB3PjE8
	 oIofx9Icjcm5lJTPLPCfxMctJGh2waqT554jPb/WyXPHZpwGuvKFtIlWS+75kbw1Kf
	 3Um/EaSao1rpeCl/teCkz7VPqIx1b/bzTwPNjpWbnKWnAZPObr8aQCyHZWHgXIbNl0
	 oBxoiaUMqvBevfH6vUUmFLasn5VTzso3O/hrfPWpBO/X5qix1fy24IS/GFFMArfVuo
	 It81f7ltRlxVQ==
Date: Fri, 30 May 2025 16:23:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <20250530-construct-library-64ec665a6fea@spud>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
 <20250526-unpaid-mushy-d47196d04ad1@spud>
 <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ldWk4wJW7G7nxwGc"
Content-Disposition: inline
In-Reply-To: <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_082337_194870_BE823547 
X-CRM114-Status: GOOD (  21.79  )
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


--ldWk4wJW7G7nxwGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:43:59AM -0400, Frank Li wrote:
> On Mon, May 26, 2025 at 04:54:30PM +0100, Conor Dooley wrote:
> > On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> > > Add vf610 reset controller, which used to reboot system to fix below
> > > CHECK_DTB warnings:
> > >
> > > arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e00=
0:
> > >     failed to match any schema with compatible: ['fsl,vf610-src', 'sy=
scon']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++=
++
> > >  1 file changed, 46 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf6=
10-src.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.=
yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > new file mode 100644
> > > index 0000000000000..4c92a5e4892bf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > @@ -0,0 +1,46 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
> >
> > It's a reset controller then, shouldn't it be in /reset, not //soc?
>=20
> It is not reset controller since there are not #reset-cells property to
> reset other models. It just provides syscon to reboot the whole system.

| Add vf610 reset controller
| The System Reset Controller (SRC) generates the resets for the device.

Giving me mixed signal here chief. If you call something a reset
controller multiple times without any additional clarification that it
does not provide resets to peripherals, how is anyone reading the patch
not supposed to come to the same conclusion as me?

--ldWk4wJW7G7nxwGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnNcwAKCRB4tDGHoIJi
0k0fAP9xEMP3RDsq99tpKwUODFMvlZc/u4nYb9rlcX/IGT0BUgEA1fwhbAWRvv7y
JcFusmsVetdwlGO4zY35QGEzwv9h8Qc=
=ttAW
-----END PGP SIGNATURE-----

--ldWk4wJW7G7nxwGc--

