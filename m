Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A77CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfnCXyA/oCmJMg63qZA9zeEFaDLAorqeev+pssB07o4=; b=x2QXfBTSe2y07wehBq2JRrfMqW
	dMY6va4CHsZp269KrplEE0HO+fEB8y+9y8O5R20LS7piO35yy44FVP6e0uXcrODxl6n9J2kOHhEe4
	Ofx6oZqW+MwPcMvvaYTtKfAkC5qEDq3Y/sM8rU14QwZ+j2VJ/2+yFE+Kcx5glP6jjEHeFHzP6QzSD
	yyc3swssw42efCTsbiXqPJU8YKkwxGQfV5Z6aT4/H8v2vzqbHsyUmBj+W0C1YdzoPiRMSN3qS8CDx
	NqnxgN7E96Qercm3+cmiQvX5a/Qy3P5zfVQwaP8o/i17H1bUHoIRgtlt+MzXicWOpcOjruodG03Z5
	aMnU0RRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umesQ-00000000Wml-2lcY;
	Thu, 14 Aug 2025 20:48:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umept-00000000WeS-2VEo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 20:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8764601D8;
	Thu, 14 Aug 2025 20:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82092C4CEED;
	Thu, 14 Aug 2025 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204368;
	bh=kfnCXyA/oCmJMg63qZA9zeEFaDLAorqeev+pssB07o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ajp0MAan8mnfg02TfjT5lUysbCxrw9yaulIJev4x2yyw2W8TyBdyIc+cNZBNa8Yzt
	 9JsY7t+F0nVj42y759akjlD/N+byuugu1Qm8BQ+1PJyZEs6SqKW7L3UI71D2QUtErj
	 SaeRcSQxnUWjck0ZDY+85DFkd2JdYQ9NDfm35Z0SUuFpVvhSQ7qNxPQ/bC5qzyiOhz
	 wq/RZFJpPquHOEMBocIGdla3IgLelAZxqP44q/L1iiO+UaWEaVLkGlPkNziK2kSZn5
	 qpXjj5zp2euyB614SUbvOnAtyBuXZ8Khcyd0cm+WvXrNJrGCTJHEDsMyGxVQNpp9ga
	 gqPbA+yr3Ra2g==
Date: Thu, 14 Aug 2025 21:46:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: List actiontec devices
Message-ID: <20250814-goliath-exfoliate-e4d36c37751e@spud>
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
 <20250814-ixp4xx-mi424wr-dts-v1-2-b7c10f3c4193@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+kleRLDHyW8gH3M"
Content-Disposition: inline
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-2-b7c10f3c4193@linaro.org>
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


--3+kleRLDHyW8gH3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 06:40:04PM +0200, Linus Walleij wrote:
> One two IXP4xx device families from OpenWrts backlog:
> Actiontec MI424WR revision A/C and revision D, both
> of these are IXP4xx devices.
>=20
> Revisions E and later use different chipsets.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3+kleRLDHyW8gH3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ5LCwAKCRB4tDGHoIJi
0nhDAQDw9dpawR+UCnD7Nl74TDq6wKcVBgBVKbqWB6SihMdXvwD+IGnzcnDv6QLl
QI/cAnnWJd7kuyTsJks4WWVrhIdA2g8=
=Do5K
-----END PGP SIGNATURE-----

--3+kleRLDHyW8gH3M--

