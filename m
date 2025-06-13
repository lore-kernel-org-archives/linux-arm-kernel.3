Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E8FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv4Pqa/1FuG6Cl4k7KZAwhVvN32B2mS5wcZejBitBwk=; b=fHJA5UlIpJsGSS2o49D1t/ev6r
	dJnh48E9YQrk4uNulyC3I8DdaXLWPGBXRZ1TPVc4E64bn5fB+w0nWuMKUnS7Yp7QNqoKEUa9SQyHb
	dNEX1rP6iuZdrx6QGDu3lL6jCD70xwiFtZ3P42+w00BYckvsqFVv7IvvwmWEdRF7Q9SaIZJeQnKoR
	3+Xje03QFtQPQv/LcWVLq/8b6+gQbczWOgC5wiJGohp9dMFE430mtaDLlYGiGmoZixpHZId3c+9I5
	cDQFcUfcNroSCAyfJ7ub9m/PwL/fDWxe64ZwcNYujt3O9DnC84mtYqdbbSSSLQsEa+7ytR+7/0bwt
	IIOuiklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37n-0000000GJdI-1X5I;
	Fri, 13 Jun 2025 12:03:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2ry-0000000GHYl-1lHo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2648249D9D;
	Fri, 13 Jun 2025 11:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A25EC4CEE3;
	Fri, 13 Jun 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815210;
	bh=vv4Pqa/1FuG6Cl4k7KZAwhVvN32B2mS5wcZejBitBwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdiGAmfm65ZeFbeMGTwHL6UxyRQdfgTfZIYn6LqmM7ff73kMv3j2uqU1Z0yObT1y3
	 dqbPkCK863lyBfheR394/wz+8ZFvIScrvTq9gcoP2CNHX0IvUqvTvAWLIuwaKD2H2V
	 +LxU6tVRQFG8Yf9uR2ldtlvYSe9fP5GKbXlmYv+Ikzmq3+ClVkd0HUc4n33oVpTa3x
	 Y2TBpSg6P/9kshW/HOO3qWhYOlT99gdWY/twzR3i4XrGIap8vpc59pXZQ6jcLznmcb
	 rZ1ygISFoPB6Qqyxf7B5MAfCPZVjw9lcvnXwOZnEvTqK+G+N7TlkaRvnTL0Zt0shqy
	 dAJ2r+qMjI/6g==
Date: Fri, 13 Jun 2025 12:46:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de,
	ore@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de,
	daniel.machon@microchip.com
Subject: Re: [PATCH v7 2/6] spi: atmel: make it selectable for ARCH_LAN969X
Message-ID: <51dba7b7-d4fb-46bf-892e-a9634cb91659@sirena.org.uk>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="liIKPqX/LlpnoGyN"
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-3-robert.marko@sartura.hr>
X-Cookie: Use extra care when cleaning on stairs.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_044650_476910_91D7CACB 
X-CRM114-Status: UNSURE (   9.14  )
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


--liIKPqX/LlpnoGyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 01:39:37PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel SPI, so make it selectable for ARCH_LAN969X.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Mark Brown <broonie@kernel.org>

--liIKPqX/LlpnoGyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMD6IACgkQJNaLcl1U
h9A2Tgf/S6jX4OTt8qMSDrYcgp49BzBMvfKq3YWuJ3TFTWtu27WywUPhj8oa42gc
CzCOluHc+ctjn36Z6ENUygx8Sf9f2wO3QKsekaC5m301aySloWnBNCNh1CTWoKWa
pcfCXorRLKUmIgyjTB9QnmFTebtF76O2QJYsosZAZX4E0h3fTyP2/O6eJuNshznh
uW1yFBG7eO96O5ZigTfvCchi4CPiV2Eq44+35WRc/FkxiSyRMCCXpK/t1U8RFgEy
M+DhG9KsPmk8y11dExnW+9rmYy8IY/FTxQwP4DWGTeacxTjwkUhvAacfOsXB6pB+
aocL1gPyEZX8iTv2UnOf81f1YoBl0A==
=og7b
-----END PGP SIGNATURE-----

--liIKPqX/LlpnoGyN--

