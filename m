Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43C7FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPu216Incjmw8eB35/lQ6mmp0B1xWpx8Vomx2fAa9Hc=; b=plwhrbKhxoPYo/FlOyxtY4zmGT
	Uxm+3PxmU7WiAj84ke52N6DK0PBDMRTinrhnTEw60C29NU0ohdTgpkqk02UCuvDGxqjk05RezWeAA
	5QVgfziI5XUbCWuT6xs0yl418+A9emlnZzGU6AiXKzzua9/kzXxks2szb+TzoJWELMXnao04sV96E
	2XEdL9XvJixbqVt9/PUGjcdrbJjNnTpkJPsJfSpDPdUQphifS9FUg6Oz1YXAiUxUzRINTQrTVhNeo
	5dxBmzBiot0FfSjfIrc7ebK6FmqpFf9m6k600OyFCdvpLnakV+Cumqmf3Zn9yHXztJ2S/JpOQBizl
	zFk9I2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIaf-0000000GsL5-16QW;
	Tue, 05 May 2026 16:25:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIad-0000000GsKg-43m3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BAEB6024D;
	Tue,  5 May 2026 16:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BE7C2BCB4;
	Tue,  5 May 2026 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998343;
	bh=WPu216Incjmw8eB35/lQ6mmp0B1xWpx8Vomx2fAa9Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oljCHmBFalJCqjOsNZm/6iDsv9Z/utu/RtUTfdZCgSouRJ/iXtBN51p0CrV9AvYeI
	 SjFBjFDFkfVZrC6oh97JlguqYhaITna9Yd3qwuv91OfPXGjwlXlAc+lBSxXwtZbzi0
	 bzk0K3FTIp4GGh+WIjictqdrIgXhbe791hZ6wBAO/m7uVyLy5P1TPja6XLw9Y//48F
	 C4bPj3AMUruUsvvhqgX1pi34jYq9dC58AvopzbteYOuuxvuKzfC4tC6ZDIVeGnWTvj
	 AjnWjRIQT5Gkv/g9uIuvolZyH+wY5QWjW6EzadQ6ig6HXvP+WXvRxpu9sPsy3REJH4
	 ghRRWFkavysuw==
Date: Tue, 5 May 2026 17:25:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQMa8MPxS board
Message-ID: <20260505-eleven-sustainer-5d71b389ac03@spud>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="veD3UL3c+j07JysG"
Content-Disposition: inline
In-Reply-To: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
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


--veD3UL3c+j07JysG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 08:33:43AM +0200, Alexander Stein wrote:
> From: Paul Gerber <paul.gerber@tq-group.com>
>=20
> TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
> MB-SMARC-2 is an evaluation mainbord for this SOM
>=20
> The SOM needs a mainboard, therefore we provide two compatibles here:
>=20
> "tq,imx8mp-<SOM>" for the module and
> "tq,imx8mp-<SOM>-<SBC>"
>=20
> Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--veD3UL3c+j07JysG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoaAQAKCRB4tDGHoIJi
0n3iAP4jZpdMpADxOFMIh+lf54qGmc29o3W8mvfbGPUr1TaJwgEApzbZzyUbjw4R
J5kBwnbcl8PhWUs3oWQdq5DtHYfMvAc=
=Wzmt
-----END PGP SIGNATURE-----

--veD3UL3c+j07JysG--

