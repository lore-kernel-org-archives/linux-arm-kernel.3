Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC59C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlIDXTlNF+hGtIU3ODwro+M7kTSyFeYuOjIjZBNL8no=; b=WiEMw2UhagvAEwI9B2LvGpw5eJ
	J1GKGnfK9TjyYdyKJ5FiIPnNxH/vR38bEvqYCs2ge41vvn2CVgxnNsB17oNsF1X0xwNETt7i4oHrn
	tlEu6ntc6GmByRGJEZSX+jEhi0XlTetc9CXpvIoNQJcehDrPm5H+u1qNUUVFn3Nmy0HMchhcRTTFA
	UXkT5S366RnQXC+vyVoBPaSHY0UAB/e8w95juZcxBfQ+M/BdwvNjgJuHugusL1wTSRJYYEJ/yW3aB
	ScLJFMyjy4qMZvozfQzPXkvGl1PH/fNvCNbWIWsikQ/5N905wIaug3t5bhaWI8T2viSEv4y+EMbkx
	4jySY3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIeb-0000000BFnn-1SYI;
	Thu, 03 Jul 2025 12:03:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHbs-0000000B481-1Plw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8850143278;
	Thu,  3 Jul 2025 10:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023C9C4CEE3;
	Thu,  3 Jul 2025 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751540167;
	bh=Kw2PheC9E/MMW8eMFElXfvA9R2LFtPQHkGQfw1x647A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rihWwu2S05zHYot+UsCmVXJMi0ZgyEPMtCEd877BRgignOfQo8CYUX9Oo6IrexS+V
	 Zed595xMMlKcVUZ1ym1ltx5jIJq6oqVS5icakUpon9Zb6EgTkatxFWfOPt/QeLxdpE
	 n3L6i2eQGnTKotyH0MCNNjYrgVlWVxxBqKf3Ct98sHQtzl1NkvpcOQK4viukuawcvN
	 Xf7Wyy55CsZCphDZvCGxDYnT9X7e8mP+TZuCJanp6SALIGbyYQp3HiiAWEbXUmJws2
	 uNfrSiYlKkBWS3fUkWDV1vUc6Y6ReSayXWC45IZtqXjRMHejpvtRUujfE2khNr83zf
	 uK5tUpzOjnrRA==
Date: Thu, 3 Jul 2025 11:56:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <84a56059-9aed-47f6-b06e-bd5752ee4a0f@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/OzG7Gq/P3EQSxoI"
Content-Disposition: inline
In-Reply-To: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_035608_393600_E79701A3 
X-CRM114-Status: GOOD (  16.27  )
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


--/OzG7Gq/P3EQSxoI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 10:54:09PM +0300, Laurentiu Mihalcea wrote:
> On 7/2/2025 9:49 PM, Mark Brown wrote:

> >> attempting to configure the security-related registers.
> > I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> > system in -next which seem to bisect down to this commit,  I'm seeing
> > separate boot failures on the EVK so haven't been able to confirm the
> > status there.  There's no obvious logging, the dt selftest shows:

> After browsing through the provided logs it would seem like no device und=
er the
> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is =
not being
> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>=20
> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

Yes, it's covering defconfig here.

--/OzG7Gq/P3EQSxoI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhmYcAACgkQJNaLcl1U
h9B3/Af9GmKYHJUj2YUz9rcqkYCIFaTj+Bcdv9as3xUcaU3jCMDuKPsE9TnCGaRn
ocbfagpvAQZSWYGOrXWnSTXjiPNtJ1tK9YjBqJr/AHoKIIA1iPlams7pvTc+tcew
u1+u5qBHT46ehvmrh1ux7lEXcd8pjnLj45PipsMZ+i8eHCxeT6X5Wbc3lA0MVo1q
QYG6V4xpcfpzNgHpZQXxkvxQ7gHUKQ+sgzNhxpaEMX49wku7rSxkqr940Rbn9hr8
SfixRjLRr8wadKk4K5ERJoNIOCg1d2WIETdl3Dvk69GQ+5ybdxNEdmwZsG9ZGR3v
sAyvw097HAvp0lpcFAOPRSKeigC/7A==
=nB+8
-----END PGP SIGNATURE-----

--/OzG7Gq/P3EQSxoI--

