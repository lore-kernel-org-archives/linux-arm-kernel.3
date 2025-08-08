Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0036C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuZ9g9XS98deNhUpvfIEudupikEWzNYWGLOR/GgCxQ4=; b=CLSp1f9lCR7Etl78Rp9rLOt9Og
	ZPQ5NsWpS0np55je9qYyisXW+B3gcxWjhWrBEU9tCIOdgtLRilRRZa6Aa2FxeF0KBhWW1cKAlriiK
	Nz+lmrqPWMjcp82AGZ0FiMa3htbeKuHyPNys6SCQsCS48KB7ZHeRLE7w1ZCCMXbIYdnH4xUjIh52H
	8k6EyVfzLmn5ObHQANyR5Ho4U3lYyuFk+SYB4hWL+Bl/gFKgn8CP0E7AQ8vM/sn1To3ndUpyDiArF
	tsxRcAldYFVuSlC2co7pzirY5kutTo3djug4ftrIWbwbNZ9qIkXPErREszhhe+z+f+2ZG8ZabvDfn
	xNftuIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPU3-00000003FXS-26Bg;
	Fri, 08 Aug 2025 15:58:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPRT-00000003F7G-41n7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 15:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B2E4452B8;
	Fri,  8 Aug 2025 15:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73039C4CEED;
	Fri,  8 Aug 2025 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754668539;
	bh=nuZ9g9XS98deNhUpvfIEudupikEWzNYWGLOR/GgCxQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBOaR7ovp6fjp+sJtSNMhxOPBwVPDbEtsxrPwoTC6RuZZWEwWiSGU3OgWOdQ1yy8e
	 ddZg8wpqKy611x1gNWPntA1Ji5sumsYlC+XqSKf/X/JaKXCy4PA7T25WTkvaCTInEw
	 WFcztoaq3N4XJXBy+tieSQ75l0SZ0SBlUVgnVsPtEynZP1Zzmyyam3IDMt9tCWYlNY
	 nikd64zthJtmhUeFL3d8cvcx3xzpJ7hldSkGjRXlnIvmGq0NZNo2Z0NCuCtSUnV24c
	 rmvAjdPIYEzgD7Phm7qEr/g3CcxBOWKBgorNwADzhX11tbEKDaoD01xLIlMCv1pESf
	 geuGtZj8aRPhA==
Date: Fri, 8 Aug 2025 16:55:34 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: Drop imx-audio-sgtl5000.txt
Message-ID: <20250808-pureblood-princess-ee6902b82af7@spud>
References: <20250807214358.4172451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PZ/KRAbWhOF6Zls9"
Content-Disposition: inline
In-Reply-To: <20250807214358.4172451-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_085540_015140_8524499D 
X-CRM114-Status: GOOD (  10.13  )
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


--PZ/KRAbWhOF6Zls9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 04:43:57PM -0500, Rob Herring (Arm) wrote:
> The "fsl,imx-audio-sgtl5000" binding is already covered by
> fsl-asoc-card.yaml, so remove the old text binding.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PZ/KRAbWhOF6Zls9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJYd9gAKCRB4tDGHoIJi
0kNmAQCK+Q/xDJm3yc05xw7IemO22vGZ1iB9oUmNTEPFBvkk8wEAkugWYoCdikr5
lR7BcpOyJtMbWDS9osCbkCSL4NMsRwo=
=Krot
-----END PGP SIGNATURE-----

--PZ/KRAbWhOF6Zls9--

