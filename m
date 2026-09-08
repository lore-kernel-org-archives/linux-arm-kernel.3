Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F108C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lYRpbphz5d0VWM774kHqDgOjW789EXt/riQZS0iTBI=; b=O+NMIxsrKiCcrA0EM9uMgSvuyw
	g+6oCNdwlsFvw9EGh+AvhnDcq6ReIEF6cTvKSVy4OrCAlVDfKz47yAKBxq8Xl3XMnyKsnyFTmzlZI
	Q9igO80XwfvKxdx9cz+0iXqmIuqnOBcl3wHe6T+A86JrCkmKh1RVm3VT3euL0OizQ5ez+GW1YbBrR
	pSn6BoCryLpMeZ1v4E3GammOmVKIhrqt90vlE4VeML3qWK8I2o07L0H2aiFsDS8a3PK2c9x9nB+Id
	QucyFBFNyTpwoTsF+VD4hpx/Kf731K1jUxaNA3ororGLUz34tVsUSMtJzi6b9wMsvhD0ks5XOB0jL
	9wnUdvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sVC-00000008gPu-0kST;
	Tue, 08 Sep 2026 09:52:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sVA-00000008gPf-3vXW;
	Tue, 08 Sep 2026 09:52:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 629B0601DB;
	Tue,  8 Sep 2026 09:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8DC0C1F00A3A;
	Tue,  8 Sep 2026 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861148;
	bh=/lYRpbphz5d0VWM774kHqDgOjW789EXt/riQZS0iTBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tm6zRzmXUseZ+aS9UzB1+ZLcFMe9HmnJ2BjPhrPUR1F6NMyvI5YVVA2YptyDktxRR
	 +j183vcLquwhBFxcEVFDVhTDJSj4OV7ej/FzGuYldqHTk3d5c0/XfKWZcOkoKDqc/0
	 nov4CiEon7xNnP+PwbULARjV8fhMS2ivrjcIJrf15ilKupZHN3OsvMiL2Hqda4lrqi
	 ZrWrnVhFEGhjuy0Uboa7SahsKH7nJpuvzFVtqr0dd/bIOn+wjA3vgSpqI7jjxA80ga
	 dgXBFNlEIDDmp9l5ANf9H6fqTKh8mt+aRkRloFQS4H8KjOFV188Il0g8B9IJTbt4E5
	 yZUVnizXl54hw==
Date: Tue, 8 Sep 2026 11:52:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH] pwm: mtk-disp: Fix period readback
Message-ID: <ap_Zslo-dTKtsvfi@monoceros>
References: <20260827105738.8570-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2zvo2wdfghwgivo"
Content-Disposition: inline
In-Reply-To: <20260827105738.8570-1-wenst@chromium.org>
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


--j2zvo2wdfghwgivo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mtk-disp: Fix period readback
MIME-Version: 1.0

Hello,

On Thu, Aug 27, 2026 at 06:57:36PM +0800, Chen-Yu Tsai wrote:
> The period value stored in the register is the number of clock cycles - 1.
>=20
> Account for the offset when calculating the period in nanoseconds. This
> fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=3D1:
>=20
>     mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
>     	(ena=3D1 pol=3D0 281500/499875) -> (ena=3D1 pol=3D0 281500/499750)
>=20
> Calculation discrepancy in the driver was found by AI run by a colleague
> while debugging another PWM related issue. Check against SoC datasheet
> and fix done by the author.
>=20
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied with the R-b tags by AngeloGioacchino Del Regno and Fei Shao and

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 68a4512e821a..56d10cde5b46 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -210,7 +210,7 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	period =3D FIELD_GET(PWM_PERIOD_MASK, con1);
 	/*
 	 * period has 12 bits, clk_div 11 and NSEC_PER_SEC has 30,
-	 * so period * (clk_div + 1) * NSEC_PER_SEC doesn't overflow.
+	 * so (period + 1) * (clk_div + 1) * NSEC_PER_SEC doesn't overflow.
 	 */
 	state->period =3D DIV64_U64_ROUND_UP((period + 1) * (clk_div + 1) * NSEC_=
PER_SEC, rate);
 	high_width =3D FIELD_GET(PWM_HIGH_WIDTH_MASK, con1);

squashed in to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Thanks
Uwe

--j2zvo2wdfghwgivo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqf2tcACgkQj4D7WH0S
/k7N2wgAihLhQXDL9Cax4wf5Ty8D6JUSMvcK81wXU2CWnzA7RzNxyg4Xrm7sHdTk
V2DWl3w7pJaos4ItmlGALGe6cAZAbeHJIvw3Y7BhWJM88gZqm3ceM9nL2d3pT0Iz
GC2O6pTdoj1VoAqcpgS1JrVn4aqdzkRU52+AH1O3GoqggwBZ9IIzlrmQcLHfqncm
YQb9Mfgf6E9VpTusJxQJetR6Q88nzzGSVsc92jr+V5Cf7uZrSQPFupYAz8hL1eI9
2FaEB0XW8TU3a/pgHN8YEJJ2ICXLzJQGkhLTMQ562RvLKD+aEZrou/65q7SUtjcR
UL1sWd9q3hJZGetdK3ZnCJmpZLebzg==
=oDez
-----END PGP SIGNATURE-----

--j2zvo2wdfghwgivo--

