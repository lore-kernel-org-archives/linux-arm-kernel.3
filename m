Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8C0CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29W5nbATLg28IhUhpNbWJzH8SNHYX5AYEkj889sc9+k=; b=nWXL70KEealtmg43pQzdi9C1je
	g7qrXUV2ceVjAyDhUAEpGVH8cetfQ+UsZgSMdQdtFmb93nT1JifhXpdIkMqGReVmR3Q4yQRaUYKj3
	QUXk3IEU3+GXokGwH3aZa7B07ypEsCW895iVv/tKElWTV+IYRthFNmqg/2+lbIxllFUYG+afjfhat
	SZ1cF2nJC1t6Z8Ak/uIKPniRtGhbgAJuCnoryp+3ucRnBW014c2apC6ZZYMS4QnhPclsDF84S+ezZ
	eFz4oE9ds6Gh2r//Vv+H9SUwXjtGAbJl7SHEtqZEuEWYo1L/3I3da7MHZM+CMUnC5I5UtRH9u6Ku0
	PoZNIbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QtG-00000005R7M-1xtV;
	Thu, 16 Oct 2025 16:31:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QtE-00000005R74-2FVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:31:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F49743D73;
	Thu, 16 Oct 2025 16:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB2FC4CEF1;
	Thu, 16 Oct 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760632303;
	bh=29W5nbATLg28IhUhpNbWJzH8SNHYX5AYEkj889sc9+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFtCA44i6uxF+9s4JNBqT9WeY/G9YYlQMIH20RphumNcs3qYiz9OzadSzPhPCqgdW
	 rvjp16iCsQgrS3D33mowTrTFqqgs5UbnhZDZiqbn3KxMheWP4Cpv2J26+iiPlzko6F
	 lcaAeaZ/+m2cniCZ3zj+2wu0RhyYouFsbwOVTykcxFWsr3HY0AH/Ayxv1wd+TrR4WM
	 lB1a0Evjy4vWqH7iAs9bYte2IH7iXz5EzcQT74rQK9qDVdz6tcRX4LPEAYokTowTc+
	 +J2afBV6FMYZL2CgcBwLmnw6pCD3p4rjk8MdyS5KIJK88afhucf56TPuJ6/lbJL7nF
	 ff2X8UaZJCJUw==
Date: Thu, 16 Oct 2025 17:31:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: fsl,irqsteer: Add
 i.MX95 support
Message-ID: <20251016-anger-pretzel-87c1f84b8673@spud>
References: <20251014215801.51331-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T89yuDH1YCgqWT9Y"
Content-Disposition: inline
In-Reply-To: <20251014215801.51331-1-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_093144_593446_21DBC4B0 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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


--T89yuDH1YCgqWT9Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:57:15PM +0200, Marek Vasut wrote:
> Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
> backward compatible with "fsl,imx-irqsteer".
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T89yuDH1YCgqWT9Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEd6gAKCRB4tDGHoIJi
0vgtAQCsWApIMcAo4VKXn6RTQPNgNRFXtSQGMXFxXZFAmCE4WQEAnpcjtLoHMOEm
RAckTJ0NvNnAdqmW9zbbJNm50vefMAU=
=16D2
-----END PGP SIGNATURE-----

--T89yuDH1YCgqWT9Y--

