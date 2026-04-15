Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933CBF43834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D32jNOmDC0+xN4ukcAa/LC46bd75YRkFvbDdniJ5uA=; b=s6G+1pwIBN59/aXZ5uTGQnpJ8B
	bakWAa8lDMc43k1hK8bwHNgUMNfU8CJLrkjODHJW0MVq0oo24dLQU3+QzfPN41yk+9SoJPzwNjvSb
	TKehgwxEr09QOoFShBWRRsl64ZJh35Onr1CrHMcIi15tc6w2IHmXGce9OMbVKnwR2qYHsd8qaJL4C
	5qtktIV5Xq1CeO6VK58MndR5bkQW5fkwVxND6wtIvEiieo5envncCj3UtQrkORqdASBqNRmgxkOyS
	rK9c0aGU/aHOJdTamTznIFN25Uiklhpbm8aMWq8GW3RfamxfKTWNoDTpisVymTRTFB6+pN8KTzqYj
	18/lMlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1v1-00000001IGr-0Qfj;
	Wed, 15 Apr 2026 15:12:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1uz-00000001IGI-1WvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2248860121;
	Wed, 15 Apr 2026 15:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C8BC19424;
	Wed, 15 Apr 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776265959;
	bh=YUJjqqhI9gnFtU556Ey/dqmGHfXQ9/59t0+1jgwdbIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We3/qUExm3NpUuEfh+Nhj5vfjEkZVXtEmFHLQMxarih9Vs8InW4IRliQcLEOcOFyA
	 q9ee479sSUDglZ0g/gHnfTVfMyf1d7XaRingMYQrql8Ib3cg1ogN4bmH1cssTbStuq
	 6sjwatgxMEmdyEfkT1FedUiekoNhAOGd2FOMosvmw30nkw2DBoIdjDzMqkZCStPbkY
	 v3wYDC4KL+DJjwsByqKnjVBWFMfaAMqE8NT/PUjsbmwM+mkcaxrqLCRJJTwX9y6xYb
	 UP6H1XrO4Gao346aaHQeNVXboGUjer7IXZSGE7guY2SLXGeQFepnX/ub6+NeAPmH6+
	 ZZLPF2E+p2gfA==
Date: Wed, 15 Apr 2026 17:12:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sangyun Kim <sangyun.kim@snu.ac.kr>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: atmel-tcb: Fix sleeping function called from
 invalid context
Message-ID: <ad-nOb2Tj9PombuN@monoceros>
References: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hke3yhwg6rcplifn"
Content-Disposition: inline
In-Reply-To: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
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


--hke3yhwg6rcplifn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: atmel-tcb: Fix sleeping function called from
 invalid context
MIME-Version: 1.0

Hello Sangyun (I hope this is the right part of your name to address
you, feel free to tell me, when I'm wrong),

On Wed, Apr 15, 2026 at 06:34:33PM +0900, Sangyun Kim wrote:
> atmel_tcb_pwm_apply() holds tcbpwmc->lock as a spinlock via
> guard(spinlock)() and then calls atmel_tcb_pwm_config(), which calls
> clk_get_rate() twice. clk_get_rate() acquires clk_prepare_lock (a
> mutex), so this is a sleep-in-atomic-context violation.
>=20
> On CONFIG_DEBUG_ATOMIC_SLEEP kernels every pwm_apply_state() that
> enables or reconfigures the PWM triggers a "BUG: sleeping function
> called from invalid context" warning.
>=20
> All callers of tcbpwmc->lock (the .request and .apply callbacks) run in
> process context and only need mutual exclusion against each other, so
> use a mutex instead of a spinlock and allow the sleeping calls inside
> atmel_tcb_pwm_config().
>=20
> Fixes: 37f7707077f5 ("pwm: atmel-tcb: Fix race condition and convert to g=
uards")
> Signed-off-by: Sangyun Kim <sangyun.kim@snu.ac.kr>

The issue is real. I first thought the lock isn't needed at all and can
better be dropped, but the chip lock doesn't cover .request().

It would be great if you could rework the patch to keep the spinlock and
instead make use of clk_rate_exclusive_get() at probe time and then
store the rate in struct atmel_tcb_pwm_chip.

Or alternatively drop the lock and call guard(pwmchip)(chip) in
=2Erequest(). (This however would require to move the GUARD definition to
a header.)

Without the mutex we could then do:

diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index f9ff78ba122d..70856be12517 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -431,6 +431,7 @@ static int atmel_tcb_pwm_probe(struct platform_device *=
pdev)
 	}
=20
 	chip->ops =3D &atmel_tcb_pwm_ops;
+	chip->atomic =3D true;
 	tcbpwmc->channel =3D channel;
 	tcbpwmc->width =3D config->counter_width;
=20
which is nice for some usages.

Best regards
Uwe

--hke3yhwg6rcplifn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnfquIACgkQj4D7WH0S
/k5QGgf6Aix/HhyOFhirW2v/a+a0tm/TCx7DqpvHmb1q0YHSZSdtt7HvjJ37NgYQ
kezD4YvZad2gWuxD3NoHSxFpX8UYQxMmmbCrEVu/WChDCal7YjulEgE9CYWT+xpl
dRUaJjHJc58fH7TpxFk6iiaM8AGJSABE9AVxihKaWXap/ISTkSfw0JKGhKhiuHJU
XBJZpTGoe2s7FcnlEkIPB7PBcMrjwTuK0B7Q9BtqC2WX4mP80qVBnLCKNYg05AS/
vmJzkfrDKn4Ph99Aljg8Fx1HIyCBkLvlomCvbJcpFd4+/5AjAxtYRsfNy+ZqyrHa
Sat6wL0g7ayLDFmwh1aVTGW21o6Sew==
=CSDc
-----END PGP SIGNATURE-----

--hke3yhwg6rcplifn--

