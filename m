Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E657ED1F9CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YiWp5Rpe9QSFpOXsVgq6DquQsYE/tbMh3WbVFGnqzE=; b=a5c6lLJDYxouGF9tkEzL3GT0kp
	wv4cJGDgrB2PHsbEcAABAePMBgj7mUHH1Yx+9bViLXjqO6jots9uKr+nQ2e6jVb4n/JnrOz5uXLhu
	2iZcJBhEkRgpXPdrgKJiMR5qEfb4ZCDz769hZbx9Z38xJlTbSHYyRZgrCmQXOin07cRoDuwUfVjPr
	kdMQ7u06ax0sOrOSzr4lUvwaWJ2D1zoQiDow7l4+iTzx7lPGTP/r1CGYArQM+m3d6G1eIk6ZxXlKF
	aY48KbCsAGbGUMOvK1g5pZ9uyTvSk2FxZ4UN3RM6Nz/ekeG9Ht+/R7Gs3bV3aeLTYR95mBL3WjL++
	TyVue3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7tV-00000007wMf-2U9n;
	Thu, 04 Dec 2025 11:53:09 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7tS-00000007wLT-2k6f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 11:53:08 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D720A1C008F; Thu,  4 Dec 2025 12:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764849183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3YiWp5Rpe9QSFpOXsVgq6DquQsYE/tbMh3WbVFGnqzE=;
	b=d2S2qRoC0mvnlLrZcctaPXXhEaDOuoEDIxRdLjv/bAa0L/BVO88oa4ODTgyFUtxbpUvBGk
	UXV0e6I2ZPd3AGjIIy9iw+msR9Pl2X28EJw2JuOyK9x/KGtI6Xf+Ze/RlloKzgqEQY+0CJ
	rB789gef8wShENrnhCT8TN9Tr2o3PQU=
Date: Thu, 4 Dec 2025 12:53:03 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lukas Timmermann <linux@timmermann.space>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <aTF2H0f9TJiwCLe5@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <aTFvBwjms8msxIae@duo.ucw.cz>
 <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FDzyy11ZIpYXyD8g"
Content-Disposition: inline
In-Reply-To: <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_035306_984228_248A41A2 
X-CRM114-Status: GOOD (  11.74  )
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


--FDzyy11ZIpYXyD8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 12:51:36, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:22, Pavel Machek wrote:
> > Also please cc: phone-devel mailing list with phone related patches.
>=20
> You don't have to. This list is not part of any upstream Linux kernel
> process (see `git grep`), it's not relevant to upstream kernel developmen=
t.

Yes, you should. Its a relevant mailing list.

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--FDzyy11ZIpYXyD8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTF2HwAKCRAw5/Bqldv6
8lwrAJ9/Cr/FM+w6FTvbAKsLqeRHWYEmvwCdHC8XdJFQ4MlX96QTh3SJJVAogCE=
=BgPn
-----END PGP SIGNATURE-----

--FDzyy11ZIpYXyD8g--

