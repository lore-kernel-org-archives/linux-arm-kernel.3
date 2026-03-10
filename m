Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEB1FD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgVok77ydmHWVh+ahxz7osxU2z9yZEJnsyFLgiBfunk=; b=ba8tCglbFhOsWWfHaECe2Sa4bv
	xTkGjS67elInNvc7tmbqlpr9C8tfo+BEH98w0HRcFEnXklXFafLfLD6LKr+eIXog7+zbdZv6NrvlP
	PC2sYIEI99UqRybiM4ritOpXHlWLF9M2Conryp0dHcETXe8mbJEbc7bX3mxEd6JxGHpinMgD+SS4T
	zehEDfUEnqn/cCNmGGvLNWspytNUy0AN50H9Ua88M1RH3z+nRyu8+2JYU3eMrAc5Rds1VFmi1husA
	EtoApWlG7j8xcrRpgxRObeYoqc73ElfHZI1jRldrINrtp/1L55BOj4+gY/CjNqbuFD/DOm32RKP3v
	yJsYNTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02y4-0000000ABs2-49x6;
	Tue, 10 Mar 2026 19:42:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02y3-0000000ABrW-3jKB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12C9C60054;
	Tue, 10 Mar 2026 19:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8618BC19423;
	Tue, 10 Mar 2026 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171730;
	bh=CigGH6JiI8W8KJKapguNODR/msvRj40XB6BkvqNHkKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijjLGhNyEcPEqHKDIl15varq8Q2E/Oh5l/VOD4WQfcGfEnglkEaSWsMijccA1v4Vz
	 ijAb08LXcTM/VrneSBWQ0aq0RRFMPul1NWf4gfhA9gy5SRBAAO0sv86SVNmoEy/Ufl
	 7RNTEEUMcr8ATsO8A9PeYQJh3oXquoIFXlfAtci4Y7SU79MDWBcbmVtCzpXU+4kJ/D
	 WRV9OSYmWfkngIimkKyJ0eJ9qYEx9+TjQHkyM0qp39daqquH5NYgpZ5CY/Sgz6yPPA
	 mCnjhn0dEftZu5YrRgmbQoD8b22TzdpLUHsq7qTrSBBmGAxAAoRSLUkBgCdFcROJ2u
	 fQsJOmXW8uIqg==
Date: Tue, 10 Mar 2026 19:42:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: allwinner: sun55i-t527: avaota-a1: Add SPI
 NAND
Message-ID: <f3ed7b81-4e43-4baa-8a56-b18fa7f56436@sirena.org.uk>
References: <20260302153559.3199783-1-wens@kernel.org>
 <177317166704.379398.1719490251066452420.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEq4wRQDZZFl5gi9"
Content-Disposition: inline
In-Reply-To: <177317166704.379398.1719490251066452420.b4-ty@kernel.org>
X-Cookie: A fool and his honey are soon parted.
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


--HEq4wRQDZZFl5gi9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 03:41:07AM +0800, Chen-Yu Tsai wrote:

> [1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
>       commit: e2f93f45d38f7b6dacb44203cfc7bb5d7e287b8e

I'd have expected to take this one?

--HEq4wRQDZZFl5gi9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwdA0ACgkQJNaLcl1U
h9Byhwf/S7pGaDNtUJP08GdwI+ftl6eicg2ff8c5/ZBis8+eTVl0rPWoSjWzjq/H
uZg96h/gr+O4QYPKgmVeZqDWt93mDNpveN4bpD6OmVBxRjRiKBP2Sn+KiCiPe2bU
F0cwm6KO5LxJq756b5K9s+HoGXMsLf2GMq5P4CSuukLsJP73bqc8Ca/1DmbdGWVk
jk+txsG9vQ8Lu/iwu+bF7TrlCu62jlOWQ7Ea2EDgYfMRM8mA5ugtLfd1cHOu78BQ
Dsjubd4TjVIpg4s3DrPdmvWPP0I0//BJ09R+037oh4UzIR2XiO3OgNMo/LNQvgb5
0OPd5Of1BySEEHkcXaQpLIfhthE5ZA==
=U8r6
-----END PGP SIGNATURE-----

--HEq4wRQDZZFl5gi9--

