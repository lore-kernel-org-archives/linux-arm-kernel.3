Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57A3CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPmQCEe63OVI0FqcE40rL2+NSrMCZGArnjtoKkfzx2w=; b=2r9Lb9WL7aw5PloWy1IIHYRzUY
	DhuA3OMMzSyDvhGqy6fczbvQczzzSeydoPirZA2dTouhj66gA4ITc/vh3s/30Zzst+fsg/0kO9QHh
	5BQGJka4cbtOZiyoO6s7d0+ne169aVyOGqUlv7gfNvgQLK3hvVuiROIZ1vHE5Ek6De/woYgMHF5bx
	rM0gZZNusHI+Z3uus+6ybXxVY9XGAWtSj4EvM0ENzMeDr8YOXOpo0SlWY43TKOvTcYq2UN4j1I9dP
	6tzmdDGAdgHDcdmGVSs/XEHRcrH/WCuo4czhMpRtep71yWt1koq0cRkDoqi9AvtFZt8iARO1OUgGx
	HXGqDXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnA-0000000EI2I-2dvT;
	Mon, 01 Sep 2025 23:18:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut9X3-0000000DbLV-2RCk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 18:45:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CF0944A9F;
	Mon,  1 Sep 2025 18:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9E2C4CEF1;
	Mon,  1 Sep 2025 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756752332;
	bh=aPmQCEe63OVI0FqcE40rL2+NSrMCZGArnjtoKkfzx2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdVGEJFD+d3O+xmCqCoUzPLubuH5UEqzH5CIvo0ifs5XZDkzmuvBzucVgRJkecImt
	 DKfFUse75F59WOzEMItsY+HauMdd4ee+djSMgH9VP5f5YyogEVYEfsENVdhLgZoArL
	 LwHNdFmc9BNXnCeWm6RugdKc9tVSGWnGnJppkfqLWGMWyB588vfOTRPGrzGu3/OpPs
	 pRKnFG16tm5VPr4ZE25CN7qljKTdh8uXI1MG2qZmRhtKWr/OUIxDfKUUMz8Va8oyC1
	 n4HmIuEBaNjGK3e8TqFt05SWw3CSwDeNzunkcMH9dbFg9R910ylugx+Wn+KHW4R7zA
	 ti3/y1Fnpo1mA==
Date: Mon, 1 Sep 2025 19:45:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add TQMa91xx SOM series
Message-ID: <20250901-savanna-auction-ce7f91b6941d@spud>
References: <20250901100432.139163-1-alexander.stein@ew.tq-group.com>
 <20250901100432.139163-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hf0FunI82vNiudya"
Content-Disposition: inline
In-Reply-To: <20250901100432.139163-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_114533_642969_5B917724 
X-CRM114-Status: GOOD (  10.75  )
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


--Hf0FunI82vNiudya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 12:04:29PM +0200, Alexander Stein wrote:
> TQMa91xx series is using NXP i.MX91 CPU on an LGA or socketable type boar=
d.
> MBa91xxCA is a starterkit base board for TQMa91xx on an adapter board.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Hf0FunI82vNiudya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLXpxwAKCRB4tDGHoIJi
0nXnAQCQyJOXHSGjB3+/E9eRpLhKIe6oXuKgPwWiZj9JQ9CfPgD9G5r5ZJ4fnwwL
tWoZWdg8Tf3wpg9vMMQQgIFhSRHFTg8=
=JjSq
-----END PGP SIGNATURE-----

--Hf0FunI82vNiudya--

