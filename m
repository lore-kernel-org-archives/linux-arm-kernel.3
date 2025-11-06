Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fviQHGCYJFCoPtMQXSFf5ZMCVe4fKRmPRhSasTWSSMU=; b=paryRtvDmvAg7peLoqhDKjC+RA
	220M8JZOHs+pW6+RBPBq9H9lji6hEU8f73UpoGmUSbOe8z8yPHtx4IBiE0XpGmfHuIZQ5IRmXLeIy
	EXt63Z54Iz+VO7Qta1+IOML+Ja0gCWU7d3wWofHlqozbS5UZdlY6XLQoz0GPSKNf434sOWTOcPS/1
	x/cNOm2cZrL1XncFFQWObrpXFfgbC3tYSuzb72QRPElO3RpkwjD+cZB1jHZ9ALLGUiGmzGP76el8m
	toeTL4iKVsGNCjQ+oBnaZ0x4S6vjF0NzmeP/7oxaEaZNlLcoCLDniEAirhspu9YmoddW7VUleMs5W
	6gUDnpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4HI-0000000G49s-3VzJ;
	Thu, 06 Nov 2025 18:00:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4HH-0000000G49k-2p4o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 18:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8E876022D;
	Thu,  6 Nov 2025 18:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9C7C4CEFB;
	Thu,  6 Nov 2025 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762452006;
	bh=K+BPFyLCfamSMDwZ8KsDrlpG6nZVikNteJeFbcNvR1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnFKoMEFqcXmAXLY7UpAsgh5Zec4rO+wbWtiCLFMA0YR81DrS5LpP5k7y5PcQUdEH
	 OHPUB95uvy5Br5km/980AHA7p18JHWwh5iUdqBD2qUPVCH+XrWB4jpGcZkvWPllhve
	 vtVo5ocT0IgZYEKj8d1BUs6OVVna3GtqZKqfxzF57TgBJwPaa6ekCTZPa4PUgTD06t
	 qFgeIxkuudLyEB2YJdAs7DZgFQBlxoR+pkFVHrGY0PFWTxqaLV/K6MqbM35wdRNRB5
	 rcyWKKOSfLGbekmDsDU0td2VopjUj/ty34vSQIcZjfB7xy+/GSV0rQQRPfQHUSxvIC
	 12D7G+CbMvclw==
Date: Thu, 6 Nov 2025 18:00:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: imx6ul-clock: add optional clock
 enet1_ref_pad
Message-ID: <20251106-trapezoid-evaluator-b6bff0ce8932@spud>
References: <20251105-ccm_dts-v1-0-6aadcdf97cb8@nxp.com>
 <20251105-ccm_dts-v1-1-6aadcdf97cb8@nxp.com>
 <20251106-seventeen-gilled-5146c6dc9720@spud>
 <aQzhbZwEYgALKqPJ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEXwvQb1v3ypYyEa"
Content-Disposition: inline
In-Reply-To: <aQzhbZwEYgALKqPJ@lizhi-Precision-Tower-5810>
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


--HEXwvQb1v3ypYyEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 12:57:01PM -0500, Frank Li wrote:
> On Thu, Nov 06, 2025 at 05:44:36PM +0000, Conor Dooley wrote:
> > On Wed, Nov 05, 2025 at 11:55:28AM -0500, Frank Li wrote:
> > > Add optional clock source enet1_ref_pad, which input from ENET ref pa=
d.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/clock/imx6q-clock.yaml  | 4 ++++
> > >  Documentation/devicetree/bindings/clock/imx6ul-clock.yaml | 4 ++++
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml=
 b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> > > index cd3c04c883df4ab02af29582369757df36269cb6..49475aec22a81ba87048e=
ef588368261cbb38465 100644
> > > --- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> > > @@ -29,20 +29,24 @@ properties:
> > >      const: 1
> > >
> > >    clocks:
> > > +    minItems: 4
> > >      items:
> > >        - description: 24m osc
> > >        - description: 32k osc
> > >        - description: ckih1 clock input
> > >        - description: anaclk1 clock input
> > >        - description: anaclk2 clock input
> > > +      - description: clock input from enet1 ref pad
> > >
> > >    clock-names:
> > > +    minItems: 4
> > >      items:
> > >        - const: osc
> > >        - const: ckil
> > >        - const: ckih1
> > >        - const: anaclk1
> > >        - const: anaclk2
> > > +      - const: enet1_ref_pad
> >
> > I think you could drop the _pad from here, and just make it enet1_ref.
> > Only a suggestion though,
>=20
> The old dts already use enet1_ref_pad. But anyway, after I double check
> that it should be enet_ref_pad for 6q, enet1_ref_pad for 6ul.

Okay, cool. You can retain the ack on the new version with the 1
removed from 6q.

--HEXwvQb1v3ypYyEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQziIQAKCRB4tDGHoIJi
0scfAP48vkBJzTstyVGwHIy6JnaQfvK8Pr/lOLLAEyXPEDKEqwD/ZY0vXFQRYQXR
oJAO3KS+3P5a518czGSMjX+ALexZAgY=
=IguN
-----END PGP SIGNATURE-----

--HEXwvQb1v3ypYyEa--

