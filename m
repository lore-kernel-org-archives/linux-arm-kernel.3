Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EFCD1F9C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4HN1ODRxsnTDmi4098i1Q+naahHnMBRsf+Px2cNeZU=; b=V4zCJ/0LiBJOOJI/xG9jNqZIXK
	GK2hOg4+4X/29sEBfXHCgVw9v2Hh4V/v8fim8ucqgtF/T/czX0W1/oeb2vrh15ozz+0ld3pL2MWlq
	U2rJh6o9DlahRtj3xh1GKPTNanWIjvxzdQShu6nYs9sOFS0XNohtUa0xx8zXRa7D3YeP9j8b14QAq
	D8dwNFJmuKSxxge34K6QaScLnRnc+jOJeHpkvzuXDuACGMA5V5sgsAZ+PgJCtREjwv6cCqGt0g7m9
	HzdEpc4UXVpQ1jbuwBxxjzkPhyu7I9opT9c+MRAW2vaQr9FMfzVfPhsSBwXiEJtGvpg6EjqSTBfBz
	3RD5nibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7QI-00000007uug-2jUX;
	Thu, 04 Dec 2025 11:22:58 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7QF-00000007uuI-2VFR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 11:22:57 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id CF1B81C008F; Thu,  4 Dec 2025 12:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764847367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U4HN1ODRxsnTDmi4098i1Q+naahHnMBRsf+Px2cNeZU=;
	b=f1l+oW+Ujo9yqI4ZLtQ4rFS54wszz2IFaGz/gJnFhj8Yo3J2lvjV26d/vfTsN2l/08zcwi
	zWQTbkOnGdf4km4Z+hfMBdbiK9HtWzbZkaT3s6XKatraHD2r9YUFjQThShOAsrp1+q95gp
	xfIwC1H+8wmk3TV/u8WKzYDJh3Hek34=
Date: Thu, 4 Dec 2025 12:22:47 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <aTFvBwjms8msxIae@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XH4lO7UPQqMRxwOD"
Content-Disposition: inline
In-Reply-To: <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_032255_948370_A4921E99 
X-CRM114-Status: GOOD (  19.21  )
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


--XH4lO7UPQqMRxwOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2025-11-25 16:12:42, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
>=20
> Add an exception to let the secondary CPU boot.
>=20
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  arch/arm/mach-exynos/firmware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmw=
are.c
> index a5e22678e27b..80e645b4d338 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -61,10 +61,10 @@ static int exynos_cpu_boot(int cpu)
>  	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
>  	 * because Exynos3250 removes WFE in secure mode.
>  	 *
> -	 * On Exynos5 devices the call is ignored by trustzone firmware.
> +	 * On most Exynos5 devices the call is ignored by trustzone firmware.
>  	 */
>  	if (!soc_is_exynos4210() && !soc_is_exynos4212() &&
> -	    !soc_is_exynos4412())
> +	    !soc_is_exynos4412() && !of_machine_is_compatible("samsung,nexus10-=
manta"))
>  		return 0;

Strange -- +       compatible =3D "google,manta", "samsung,exynos5250", "sa=
msung,exynos5";

Should this be google,manta or something?

Also please cc: phone-devel mailing list with phone related patches.

Best regards,
								Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--XH4lO7UPQqMRxwOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFvBwAKCRAw5/Bqldv6
8n+vAKCsQYO2dRBSz9dpzzGmMIKoUrmaTwCdGFG1KdJa3VKWcrHRT/yQ/yhaVno=
=V8Ni
-----END PGP SIGNATURE-----

--XH4lO7UPQqMRxwOD--

