Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDBCEDEBE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL5UFrL2W3+bvnt+QizNUFI8jkJeM7tmhDPm4dGyWOk=; b=aPAPL4XYu6ApyZkeFdef+HCSn7
	DH+aOfVK4IwCaTvxfhWUYCzOn2rhtG6PT9Ui+mNCDigCmI8rLDHAaaHY0pIRXoPc5Cmb5zZpx+d40
	cZ6Wn6+gPWP9gJ8wNzwt4Qflih+ZQ0CYhT+l2qKi4V3BkQdwHM4DKQmKcwlu0B1uHqP0qCQWhuRZo
	Q8yimqLZVP81QLRYfqhARJRLdUMnMVvj8XZFTWM93/V0Rp1vHO1qi1kUAN1aeMUVTL2iZyE/bG/Fg
	meDEXsl1shkXoeJCgppxr78DD66EUJhXg1jCAkW+qg4j6Mftem+78XZUWiJZ0HYCCmns73lOoPtiW
	72YF5EgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUYs-0000000FiMu-0Nbe;
	Tue, 03 Mar 2026 18:33:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUYq-0000000FiMn-3TZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9A7E60018;
	Tue,  3 Mar 2026 18:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46D0C116C6;
	Tue,  3 Mar 2026 18:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562815;
	bh=1XuQcbjSVCUirvk12dolMLOBmrih8eIf7Wn8Zaw4luc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ND6pc2ZI9dCr8y35thKLLe1n03D75jTHm8LHrp2tPH9Ij32qeLq7O44XWO2zO2HEX
	 mmz7YGPrWwXlEQ2dosIuV1vjS0j4R3p0n2RSWRreWyozJ6V5o+I2izYVEPP+vOy/9k
	 +EZSmtYVF4GNSeGfKQGGGn/lKDapuPbAfrKuC8GO114moYRBg29hhfRUFkFRHmGcGD
	 VzAUA1RXbIBUq7asEhDVcRSrYv0iGXCFMnlnARZQK7KHpRq16h4SaSYcoGDnFozYIA
	 5li08ot6ehSrgm/AzV7Jw5gn+XNHzLFsJ5nmrtBUOGrPkB7vjAGBE0pEN7gI+m5YcX
	 DQP8TwRbWO6XA==
Date: Tue, 3 Mar 2026 18:33:29 +0000
From: Conor Dooley <conor@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Message-ID: <20260303-payphone-pancake-b6068c545bc3@spud>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
 <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
 <20260303-hesitate-preoccupy-5e311cbd3e58@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6LVnSUhtxOpmWqK3"
Content-Disposition: inline
In-Reply-To: <20260303-hesitate-preoccupy-5e311cbd3e58@spud>
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--6LVnSUhtxOpmWqK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 06:31:56PM +0000, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 04:13:00PM +0100, Markus Schneider-Pargmann (TI) =
wrote:
> > Add names to the memory-region-names for easier idenfitication of memory
> > regions.
> >=20
> > Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> > ---
> >  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++=
++++++++
> >  1 file changed, 19 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rpr=
oc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> > index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec7=
fcabc7c60b8b286c6 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> > @@ -182,6 +182,25 @@ patternProperties:
> >            - description: DM RM/PM trace and firmware code/data
> >          additionalItems: true
> > =20
> > +      memory-region-names:
> > +        description: |
> > +          Optional names for the memory regions specified in the memor=
y-region
>=20
> Is this really optional? Shouldn't it be made mandatory so that it is
> easy to tell the difference between the two configurations?

Actually, so that you can tell at all, since it looks like anything from
2 to 8 regions is permitted (which this prop doesn't account for I guess,
only allowing 2 or 6 regions).

>=20
> > +          property.
> > +        oneOf:
> > +          - description: Basic configuration with DMA and firmware reg=
ions
> > +            items:
> > +              - const: dma
> > +              - const: firmware
> > +
> > +          - description: Extended LPM configuration with split memory =
regions
> > +            items:
> > +              - const: dma
> > +              - const: ipc
> > +              - const: lpm-stub
> > +              - const: lpm-metadata
> > +              - const: lpm-context
> > +              - const: dm-firmware
> > +
> >  # Optional properties:
> >  # --------------------
> >  # The following properties are optional properties for each of the R5F=
 cores:
> >=20
> > --=20
> > 2.51.0
> >=20



--6LVnSUhtxOpmWqK3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaacpeQAKCRB4tDGHoIJi
0qvUAQDIPlBc+EDtI2V6+OdRXC2bz2e37Ro7IrXPjURmTTJnvwD/WCeUVsN2+kzS
aOee9x9jSExmzCwrrOKhv5ctzekeoQE=
=l+Px
-----END PGP SIGNATURE-----

--6LVnSUhtxOpmWqK3--

