Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B1CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrnQuKTAT15jPD34x5mJTltCdIB03Vq6YEXGl/Gp4YU=; b=QUBHRWiymLPypA417OOx0OcN7Q
	eaLHimHg4XaWzJISgY2T7m0rkuLW/Ho5dSZVGSoJIaN86Z3XMSK4ShjP6BnNClPvkBh4Z2v136wJE
	Go+j2UbGLXdoYheQIlLlrOHaXKrByBScFgZ9C5BbZZZB4sjYz6hMfmtFEO/ie1uMmfyJWXSNWloGt
	OJqe+oMljBzNtF9JYRuoz4Tg8c3Rx1kCAVtaujpigqxxVttEBkeqDWDVfFxkYQjAm2aPJUrf7jGcF
	gSsU82yxAmKdaUC6DXnT1uqhsGBOkBI5ptEEJnmXPH3znCY93F28LLVWoDzRaZ9GWhOmpcAWRoyh+
	glS9mI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR2V-00000000RsP-3vzB;
	Fri, 07 Nov 2025 18:18:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR2V-00000000Rrv-0YOw;
	Fri, 07 Nov 2025 18:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B98B6190B;
	Fri,  7 Nov 2025 18:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F5AC19423;
	Fri,  7 Nov 2025 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762539502;
	bh=jaL7jopAFlRxmRbiqtgWDWMCdCil7su+tqIETM3BZ7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5ABhgdBgJ8xkku8oBI1QZi+g2rddDAUmX1HuVzsJzYtRZAuKHAcpYe65se/YObsr
	 +2YdET6sMq/F0s//Nf+oZIxfcHkDGPzh5lgZgSbTxMgI0ngJLdp7rpHS6HYCVTxTyt
	 T9YwgsSJ/T237E8l6wtjs1MeZrdBhQzboBi2VVFCxZTbSObV7IR1DZikAUEOFjP0HA
	 19KN8TQdRTnGimBNtMQ2X5DDitkjiqtNJl55ZxcShALA1IIBs7YTsG64E7NNUxXQFA
	 inkYobUD9mKpsKK12Qgz/qSRAP34nUGbX3Htj8Dv7HBQj++kHiq4M0DXvWTkZAy0Ev
	 zJNnOkz4ySPBw==
Date: Fri, 7 Nov 2025 18:18:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20251107-unvalued-fringe-96724cf9206c@spud>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
 <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
 <690e3351.050a0220.15e225.cf82@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZQCrllx4ihXxMaJD"
Content-Disposition: inline
In-Reply-To: <690e3351.050a0220.15e225.cf82@mx.google.com>
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


--ZQCrllx4ihXxMaJD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 06:58:38PM +0100, Christian Marangi wrote:
> On Fri, Nov 07, 2025 at 05:55:43PM +0000, Conor Dooley wrote:
> > On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> > > On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > > > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with=
 some
> > > > > minor difference on some function group (PCM and LED gpio).
> > > > >=20
> > > > > To not bloat the EN7581 schema with massive if condition, use a
> > > > > dedicated YAML schema for Airoha AN7583.
> > > >=20
> > > > You went to more effort than I would have here with that conditiona=
l!
> > > >
> > >=20
> > > Well it was suggested by Rob and it's honestly a copy paste of en7581
> > > with the relevant thing changed.
> > >=20
> > > > > +patternProperties:
> > > > > +  '-pins$':
> > > > > +    type: object
> > > > > +
> > > > > +    patternProperties:
> > > > > +      '^mux(-|$)':
> > > > > +        type: object
> > > >=20
> > > > What's up with this regex? Why does it allow either - or $?
> > >=20
> > > It's to permit either mux-* or unique node name with mux. Pattern is
> > > also used by mt7622 or other schema. Other use mux- to require a name
> > > after the mux.
> >=20
> > Ah right, because you can have the config properties like drive
> > strength in the mux node, so sometimes a -pins has one mux node (mux:) =
if
> > all pins share settings and sometimes there could be multiple, which
> > requires a suffix.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Mhhh why not-applicable ? :(

That's just dt-binding patchwork stuff, it clears it from our queue
since it'll be applied to pinctrl.

--ZQCrllx4ihXxMaJD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ436AAKCRB4tDGHoIJi
0u1rAP4+8ulSe9JeLCu3Gyu4scAX+ZVG1X8+tIGQbmjpnop6AwEAst9/qvwn3IEa
sDwwxMVse34AsCQffwSceZT/1vAWjg0=
=PDnc
-----END PGP SIGNATURE-----

--ZQCrllx4ihXxMaJD--

