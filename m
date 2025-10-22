Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEF5CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awrBL649S9Sm0PM7VBAIkW+cEYbtNLUZTFQ5hekfKOw=; b=XQDvXoTGRYrIGkGbVluksWaqnI
	6xlLoeX0ET7nsy/sQIRkFq6mLAAi8zVqFScSW1qXCDrnaudRM0x3UR1K2EgRBHgLR5F7WPXfTxqUV
	z1H+l7hebpGDBMVQNaKjxyzyjys4sn77bzjmtlgr2X9JlH+iYyK28z+OZOJ53ARP8FITdCv3JQz7z
	PSNpZztXLQOloOgzd4DSrOiij3aNec3JLqHE3fP0hlpinQ3kXAE9aJy3pmLunebGLlqXKtgV9XTlN
	JwOPK4ppPPXW8Y3GvJqBP5ufFNI5uBzvubB/4fcggyc8mZ+4KnHl70rufv/13ro2cz2ETFiOQ1pzy
	zE979mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWkm-00000002avP-2kyf;
	Wed, 22 Oct 2025 11:11:40 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWkk-00000002auj-4101;
	Wed, 22 Oct 2025 11:11:40 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3E50B1C0088; Wed, 22 Oct 2025 13:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761131497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awrBL649S9Sm0PM7VBAIkW+cEYbtNLUZTFQ5hekfKOw=;
	b=Lrq7+uhHtpKyC857gievF88tNHyEYqyTn8nZD/MjIjPYm0c0ba/zpMVTy2/Qd6YpO5qE+k
	FSFKMIXW9BTA90M/jQ3gI6s5ZKCO6x6nIcfM0m/rNvKiFWgkrrCl7IgW225OdYvxBoMv3M
	GWNrtT2gDWj1kiaeeIsmfeRSe3gptII=
Date: Wed, 22 Oct 2025 13:11:36 +0200
From: Pavel Machek <pavel@ucw.cz>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>,
	Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>
Subject: Re: [PATCH v4 2/4] arm64: dts: rk3399-pinephone-pro: Add
 accelerometer sensor support
Message-ID: <aPi76OR8RJYWUSuj@duo.ucw.cz>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
 <20250929-ppp_light_accel_mag_vol-down-v4-2-6598f22d3451@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kG/KRNe2a1V815DB"
Content-Disposition: inline
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-2-6598f22d3451@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_041139_157576_EE418D5D 
X-CRM114-Status: UNSURE (   9.30  )
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


--kG/KRNe2a1V815DB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> // Put the phone face down so the screen is touching the table
> z: 16000
>=20
> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Co-developed-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--kG/KRNe2a1V815DB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPi76AAKCRAw5/Bqldv6
8jD5AKCRomNj90PxMlQ8EJ1tMJuCwV32PACfaDakNiy6j4mT0JrZvpoKWX8m3+A=
=Uzhj
-----END PGP SIGNATURE-----

--kG/KRNe2a1V815DB--

