Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAC7D7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeaqylB7ZGSevZEzf6I6m5NbSZV24/TR+vYt+L3laSM=; b=Y6s2gF5w8GVJ2N2QX9tQCAaN0D
	4jYUI73iI7lE6a0wKbA+5lS5oy094Maa4pjRUUXlArzrsnR+zx7f+L04t6UI5IP3jiHinGg2c2bSd
	pxXxVdvBldP+u2fuoxaYDN7O+qs+/osZV+fSHdaiD8lfUWcTJLaFr+VesDF1voIjuJ/ZqYr5h2Bu7
	F4d78Iesrirhol+LujxFVIsGRYc3lYDU1SECUvvJ2VKbrH2uuTINypuerCzznPW/woyC/oPM5qyma
	irMzyZlQ5iCpiDogbLhrabZaJ3ItwwDkXn9zVO0/MFMCTmU+GvAaTnydo9yT9Y2R3ZjLGo+ju/Nz1
	dWbcGFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI58G-00000005zK6-2LPJ;
	Mon, 02 Dec 2024 12:02:28 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI577-00000005z5d-3Nk2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:01:19 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 18A7A1C00A0; Mon,  2 Dec 2024 13:01:12 +0100 (CET)
Date: Mon, 2 Dec 2024 13:01:11 +0100
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Mark Brown <broonie@kernel.org>, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.10 4/6] ASoC: stm: Prevent potential division
 by zero in stm32_sai_mclk_round_rate()
Message-ID: <Z02hh/K7okT4fvOc@duo.ucw.cz>
References: <20241112103803.1654174-1-sashal@kernel.org>
 <20241112103803.1654174-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3fawmNHJI3c1oRFq"
Content-Disposition: inline
In-Reply-To: <20241112103803.1654174-4-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_040117_984507_D52612E0 
X-CRM114-Status: GOOD (  18.69  )
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


--3fawmNHJI3c1oRFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]
>=20
> This patch checks if div is less than or equal to zero (div <=3D 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.

Well, previous version propagated error code, now it is eaten. Is
stm32_sai_get_clk_div returning 0?

BR,
								Pavel

> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chin=
amobile.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/soc/stm/stm32_sai_sub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 3aa1cf2624020..3a7f0102b4c5c 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -380,8 +380,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *=
hw, unsigned long rate,
>  	int div;
> =20
>  	div =3D stm32_sai_get_clk_div(sai, *prate, rate);
> -	if (div < 0)
> -		return div;
> +	if (div <=3D 0)
> +		return -EINVAL;
> =20
>  	mclk->freq =3D *prate / div;
> =20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--3fawmNHJI3c1oRFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ02hhwAKCRAw5/Bqldv6
8hAkAKC0b/Oh8ldKHa90Tlm10HU7ITeWowCgxMxATUX7/rKamYpZAx5Mk1HHjC8=
=I7ba
-----END PGP SIGNATURE-----

--3fawmNHJI3c1oRFq--

