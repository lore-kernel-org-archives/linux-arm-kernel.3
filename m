Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79FBC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo8ikXsQN3snpu67JtKmAbi55HP0/87Ih/FPamOhafI=; b=QGvpozIqi63tU5V9zzoEk+GbBC
	mYpcVv8VjBdglwL16hSwbVdC35VMsf7IRlnFw825/ug5usO80HDyMQyLskc71Tp5d3owR+vIX19fs
	VWh/oDa4fpRin6WEgS/t8UsMBwUZdmqRQyryaD0CDN1587IkZAqh1X6RqrWk1vx+PmeQYTQo9d65Y
	hIe5xgqbZo//g9f+QhTNTGYeORZ1Q5k5sft+rPwASMwmfIHRqwePMnOevGTk0N90SmoAU7fud8KJQ
	az/uXXR5GyekOz/P5hAtcrLOtpOU6IbsNwGPtSA/2EUnsepQjHC9fiOjOkjgRy4w5efxYFnABIMz2
	ti+1uCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJeS-000000081RH-1v8K;
	Tue, 18 Aug 2026 13:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJeR-000000081Qx-0BYJ;
	Tue, 18 Aug 2026 13:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22196601DE;
	Tue, 18 Aug 2026 13:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8736A1F000E9;
	Tue, 18 Aug 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787058885;
	bh=yo8ikXsQN3snpu67JtKmAbi55HP0/87Ih/FPamOhafI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S6Mz5JONNto/xpitSy88eKC0uTEtFdl+6RNAZwsNO8omAP5c8dNy2D9pcEi1ffSDA
	 HXbebYthVY2YjH8ea4kR9zGo/3J7xx7/+C6s0HdMIUgWPpR0p6q35p9Oguj+yBcyHu
	 OZCihV+KLVj1MCIZEA0PZanhSZ3jz8ybVYSSS3zpJBTGWTgLBLvVQstwYuH4gXcGoi
	 YLWwHmOcNrX0L1h/5+yt7gKhPwXpYp8cmo3lMEebZBPt6mMx/1VSG0dhhGYir4b9lh
	 MzBysWOdPKrR6BxFYOBfV//iUbNKtCjfftap4doatdKz2c09whJlvr4faMH3FmuGYB
	 dCmowvTWVEkzQ==
Date: Tue, 18 Aug 2026 14:14:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: rockchip-sfc: disable runtime PM in remove
Message-ID: <3bf4d561-d98f-465f-9aff-68cabc6f1f80@sirena.org.uk>
References: <tencent_DD16C0EEDFEF4ACAFAB5A23EC8235D462707@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K96lpHhbSl2dZtMX"
Content-Disposition: inline
In-Reply-To: <tencent_DD16C0EEDFEF4ACAFAB5A23EC8235D462707@qq.com>
X-Cookie: Smile!  You're on Candid Camera.
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


--K96lpHhbSl2dZtMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 05:05:50PM +0400, Jiawen Liu wrote:
> rockchip_sfc_probe enables runtime PM and leaves the device active with
> a usage count held by pm_runtime_get_noresume(). The remove callback
> only disables the clocks and does not disable runtime PM, leaving the
> device in an inconsistent state and leaking the runtime PM reference.
> Add the missing runtime PM teardown in rockchip_sfc_remove to balance
> the probe's enable and get_noresume calls.
>=20
> Signed-off-by: jiawen <1298662399@qq.com>

Your name here doesn't match the name you're using in the From: of your
mail, that's going to make tooling think you've not provided a signoff.

--K96lpHhbSl2dZtMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEWsEACgkQJNaLcl1U
h9DMCAf+KcCcyXPo7j8LdqOXlUjWViQgcLzlmsM2eiKWlA3fQ7dvKJYXlqc7iE2t
rpeNy1XfD3fIpkYn2C7OgC8brc6H7LjOVR86ItweCHS4hldCjxf5Ck1tZ5tZHSoW
dDXoTwq+o9DJTo56rKHnbEYAKieI1xA9V7HhXd8ltA2UkNav/ePbj6vqlUk6IzPb
xoW1UFzJi5dor+Ui3yJWDSp/ZeexJp5Vy9WnNvgM71wosY1egcB/aqTH+6oqIxxx
buLjQcCdE2KrCy42lsJ6Y5FjaO/sTZKCvr6JKPEo7hyYTmUQTvFeSUW+nsIYNIeO
qhNAS545Pr0mjAangiK+8zqqVrP2KQ==
=6fzB
-----END PGP SIGNATURE-----

--K96lpHhbSl2dZtMX--

