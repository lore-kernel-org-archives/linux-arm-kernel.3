Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3E1F89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zD4iibryLA3bNTNIkkuD5WU8zZV2TDGYd+O1YNSifA=; b=o7KgIwQxxQ1l+cPLBDTLIYwZxi
	BNcd9sJfdUGm0LMRr9HJ824xxcj2XAhRcMJF6l7L8H53gOaRiwrdLdz9Z0Ldtk1B+5h5EEHsp/XxW
	yXG5xC7Jsb1g9gV7tsp1IAddzAC7SNf+dhGef4uaFS7qvchmbxDV8kh9yOiHhG2nizyWsquO4oCkH
	RuauNou+vRM1WxvLE3autJ5PriC7a+yKlXGCwMVywnTuB9HKPN5CCKcT0i1qN/3O2g4JeXM/VgEp/
	78nhl2i5hM+eXkErcsK/xiMjgJacIYTS6hZ3gpC+3U7mHEvfR1sl6LaOmVA1nAE9ULZhqRik1LfgA
	5DUUWjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9TS-00000008WuX-2l7F;
	Tue, 21 Apr 2026 11:41:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9TP-00000008Wtj-0jzM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45429440C0;
	Tue, 21 Apr 2026 11:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C072FC2BCB0;
	Tue, 21 Apr 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776771658;
	bh=AMrZo1hx0IaVR554MMJRzqOTHAysXa89TiJakACup3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnHmsRiScc5GjzXlfh0NjHFnm9wOfj8svUl52iPpZKhGdUtgk8jl8OO/AN7wHh2dA
	 9ybsedV1naVRheAdzo6wj0TDYbYK/w2rVR4qsBs3Q/8BSmsJzdEGdK6AJJtcsKGpo/
	 wNHDUVfBPjIDParXLo2fKN4S/HwKhMM6VofQTbx/KhpQ8jgrdiqRfZBeuTk9jOrBoR
	 te9BAsxHW+mqsvhiCWw+WXq+2HC8WOrEBjfa4dZs8w6FLzeZefcuqPPAPbXltEBTzz
	 5ftIjazSXQ/D2AuTaen1lHLuQXFE8Par1wSCHYHOIC3UFG4cLcmmki6Mne1kQJz1UZ
	 3lyiUgPQ3YASA==
Date: Tue, 21 Apr 2026 13:40:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sangyun Kim <sangyun.kim@snu.ac.kr>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: atmel-tcb: Cache clock rates and mark chip as
 atomic
Message-ID: <aedfEzeRH5tH0-Fb@monoceros>
References: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
 <20260419080838.3192357-1-sangyun.kim@snu.ac.kr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmlydvd5ruato4sk"
Content-Disposition: inline
In-Reply-To: <20260419080838.3192357-1-sangyun.kim@snu.ac.kr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_044059_370446_79E3FF28 
X-CRM114-Status: GOOD (  17.78  )
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


--zmlydvd5ruato4sk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: atmel-tcb: Cache clock rates and mark chip as
 atomic
MIME-Version: 1.0

Hello Sangyun,

On Sun, Apr 19, 2026 at 05:08:38PM +0900, Sangyun Kim wrote:
> @@ -438,16 +441,33 @@ static int atmel_tcb_pwm_probe(struct platform_devi=
ce *pdev)
>  	if (err)
>  		goto err_gclk;
> =20
> +	err =3D clk_rate_exclusive_get(tcbpwmc->clk);
> +	if (err)
> +		goto err_disable_clk;
> +
> +	err =3D clk_rate_exclusive_get(tcbpwmc->slow_clk);
> +	if (err)
> +		goto err_clk_unlock;
> +
> +	tcbpwmc->rate =3D clk_get_rate(tcbpwmc->clk);
> +	tcbpwmc->slow_rate =3D clk_get_rate(tcbpwmc->slow_clk);
> +

Only one concern left: clk_get_rate() should only be called on enabled
clocks. I don't know the architecture details and how expensive it is to
have .clk enabled (or if it's enabled anyhow).

If you're ok, I'd squash the following diff into your patch:

diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index 1a2832f1ace2..3d30aeab507e 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -437,13 +437,17 @@ static int atmel_tcb_pwm_probe(struct platform_device=
 *pdev)
 	tcbpwmc->channel =3D channel;
 	tcbpwmc->width =3D config->counter_width;
=20
-	err =3D clk_prepare_enable(tcbpwmc->slow_clk);
+	err =3D clk_prepare_enable(tcbpwmc->clk);
 	if (err)
 		goto err_gclk;
=20
+	err =3D clk_prepare_enable(tcbpwmc->slow_clk);
+	if (err)
+		goto err_disable_clk;;
+
 	err =3D clk_rate_exclusive_get(tcbpwmc->clk);
 	if (err)
-		goto err_disable_clk;
+		goto err_disable_slow_clk;
=20
 	err =3D clk_rate_exclusive_get(tcbpwmc->slow_clk);
 	if (err)
@@ -469,6 +473,9 @@ static int atmel_tcb_pwm_probe(struct platform_device *=
pdev)
 	clk_rate_exclusive_put(tcbpwmc->clk);
=20
 err_disable_clk:
+	clk_disable_unprepare(tcbpwmc->clk);
+
+err_disable_slow_clk:
 	clk_disable_unprepare(tcbpwmc->slow_clk);
=20
 err_gclk:
@@ -492,6 +499,7 @@ static void atmel_tcb_pwm_remove(struct platform_device=
 *pdev)
=20
 	clk_rate_exclusive_put(tcbpwmc->slow_clk);
 	clk_rate_exclusive_put(tcbpwmc->clk);
+	clk_disable_unprepare(tcbpwmc->clk);
 	clk_disable_unprepare(tcbpwmc->slow_clk);
 	clk_put(tcbpwmc->gclk);
 	clk_put(tcbpwmc->clk);


This has the downside that clk is kept enabled the whole driver
lifetime, but that's the easiest way to make your fix honor the clk API
constraints. This allows to fast-track the patch fixing the sleeping
function called from invalid context issue and the optimisation can then
be addressed with more time during the next development cycles.

Best regards
Uwe

--zmlydvd5ruato4sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnnYkUACgkQj4D7WH0S
/k6oIQgAmju9sVnu1SosgbRPtkoA4RXoRnn776xuGDw/YiiUdWY0a74HZ3q1TGln
EsiW5MDYMdWQVF0FRBK8Sx1RnVGzAvBqnupEQdLODs5G48tnLFXBEUmuMV6iU4JB
ackooROEjHtZj7AgAlmDGUUtz0MPR4LPNWxs1RCjE+iUtamtAaEQxbQ0pJKI/QlB
d1UZ2XStLLvVBBhoJhhwmUoEwtCnPRm2O8TZFIxt+1Yb9kUcVc+eH2AGyMVGpGYu
CSFdjbjjWnLwakKgJSZbb4BeXD0a6UY/cYb+AKiaon0Uzqd/QU3YwgJJFkh9W10d
Aj88FgPkNhpZP4oIIFS9qUx/fV6sRg==
=9oZB
-----END PGP SIGNATURE-----

--zmlydvd5ruato4sk--

