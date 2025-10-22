Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4FECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24OkgosBerV7T+lgYIYHuKbrujn61EaFVukeV2kjpwI=; b=PkxmV1ElrCnQcjyoiffj6bMOOP
	izDNSxUSCIm4WO8Mswc3MN065YUHnIn2AH2bmhiEKqVexvz5d4mvtAwgHdBlsdqcQRpG8SA+HLqxa
	4VgyfdSguz9db0Rdbe1b6tyvNGVYalNaEt+oO7106QW7oyEdrMB8Q35vuU6EXvTwaH9PyzRk9tO8T
	HZhjPWxWspGAVgxwAmDpECi9GDpNza5uU0TuxBUOVUqfpGfpH1rREhlIB8S5i8H2Ne0cnE1ec2JOq
	rrbtAgb5Fhtu+V7S51Cgbo/p4UASw7dLe7eEr4Pvkinye4oTU31tv8+vdit3rPWKy3fURca9Aqina
	LuW7SKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcoC-00000003p0f-3DGp;
	Wed, 22 Oct 2025 17:39:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcoB-00000003ozu-1v3s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DABB663D73;
	Wed, 22 Oct 2025 17:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5DFC4CEE7;
	Wed, 22 Oct 2025 17:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761154774;
	bh=24OkgosBerV7T+lgYIYHuKbrujn61EaFVukeV2kjpwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNk+wK5/F5AARFiynLtMZjhIK0/T/uIjd66vNx6B9TgIlKTHJWNVpcEnYlevf/Wb0
	 WqSJW45hV8z2EC4oTCKgxUUk+PmS4cHKStL6T8i3PFZGHJukcU1qwPh9EyjnvhxGf1
	 RrFb3JPiGn/Z1+uI8JTdPNQe5vp5s4pRSVK4UaGYs4tCOsf63TBoWkru2riYNbyNU7
	 0AUfrIDEyn3nN+vdxQZPzMccFMWL7yJCWGAWN8AxUgDevs6J2P5ks3ZXBOjf4pKlbf
	 ZXxYF/9Zs98v+u2YFW+0wDtgZaz9u2OhWX1c1+9r/pbXDRNekzJHlydj04fwN06Pe8
	 nBpsBHDsEHTAw==
Date: Wed, 22 Oct 2025 18:39:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add PHYTEC
 phyBOARD-Segin-i.MX91 board
Message-ID: <20251022-eraser-latticed-6d0291a07589@spud>
References: <20251021093704.690410-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvtMwzI9nOsPH2Aq"
Content-Disposition: inline
In-Reply-To: <20251021093704.690410-1-primoz.fiser@norik.com>
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


--kvtMwzI9nOsPH2Aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 11:37:03AM +0200, Primoz Fiser wrote:
> Add device-tree bindings for PHYTEC phyBOARD-Segin-i.MX91 board based on
> the PHYTEC phyCORE-i.MX91 SoM (System-on-Module).
>=20
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kvtMwzI9nOsPH2Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkW0QAKCRB4tDGHoIJi
0pJqAP0RqklqLO4Tj2pIuOr/1kpPnRUHFAdHRi7L4FSO4wfjMwD+IHHxz9L47553
PrSJhvtbBG2KwrOsGRDYOkUzyGz2Tw4=
=ZqaT
-----END PGP SIGNATURE-----

--kvtMwzI9nOsPH2Aq--

