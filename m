Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5353ACD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8whuEGimKqlmJTyLi4kF40FmcEXH3cKBnkSKUsbqfGg=; b=lt58OM/4CGMAEIgp3MTjN6J5Hi
	uYuUu82FPVEbWtya5HK98CbrPqeXoVJoTwd0xOl5TBelxsY7k98Pjjc7OleYfqLr1UR2ym4z1qUix
	dWgHVr2TZjRg/2/AqSGYaWYbh9PE1ZanQrCPz/VsS2tW3OCPQ1Abyc5YRzgOSGR0RCQ/rxPWEgnt8
	C2zz7GcMRAJb19GlC10J+xTSvkzamyl/JzvPpl8xhEHkxY6ZSLIoruyPxM8PkZtYu/TSRG20Vw7Zf
	rEXFd3y1CSkgMFoCqoypjh5GJkqUQiLxawPN6X4lRk6U2wsS27618SSA591ZInkYGLXP6rXfwhGry
	PpGnMHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOejW-0000000D3OH-3Hm1;
	Sun, 17 May 2026 16:52:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOejU-0000000D3Nk-3cf0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 16:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A89BE42A39;
	Sun, 17 May 2026 16:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABECC2BCB0;
	Sun, 17 May 2026 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779036771;
	bh=5L9dAUBCKqTLNPQMmC8ulIPgXU0nUvsDamDbIBk8HOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iM+Xn0/suCKUetsnBG+Z0ZW14LMadjHGD/1yeaz6PZttxm/gHHipqufcK6C2juFkG
	 Tf5uEp9qcIzk74Zzk1Q+Xv0wbSagmPdrUPCJ+qvtgQouUggurxhPpRsP/T1jKENe1r
	 BDzqVOJzYrObb8C0eTH0VJzsYtt4+OUyp6ZUqQL8ytPc3NNDgsT8hmeVuGZvZ301CJ
	 UZP1L8QU+YlyCol1E1BNnt8MtqEcI1gxIKQzHXEjAGPaNpj3Z5s8WU8NVMSpFX08SI
	 oi3jhxLWgz8+BnD65tLSyMP8Ay8jc/MLBPZHZQ37Io7hklrD4342qILvCHXI7TrFy0
	 KGoIrGVDSm10Q==
Date: Sun, 17 May 2026 18:52:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: atmel-tcb: Remove unneeded semicolon
Message-ID: <agnyKRxQk5WXSTHe@monoceros>
References: <20260428075329.1234735-1-nichen@iscas.ac.cn>
 <afC3PwD0LfzYSoMP@monoceros>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6j6g6x7ouoc3jvdv"
Content-Disposition: inline
In-Reply-To: <afC3PwD0LfzYSoMP@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_095252_924695_780AF3A3 
X-CRM114-Status: GOOD (  14.55  )
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


--6j6g6x7ouoc3jvdv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: atmel-tcb: Remove unneeded semicolon
MIME-Version: 1.0

Hello Chen,

On Tue, Apr 28, 2026 at 03:36:45PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Tue, Apr 28, 2026 at 03:53:29PM +0800, Chen Ni wrote:
> > -		goto err_disable_clk;;
> > +		goto err_disable_clk;
>=20
> Oh, that is my fault. If you're ok I'd add
>=20
> 	This was introduced in commit 68637b68afcc ("pwm: atmel-tcb:
> 	Cache clock rates and mark chip as atomic") in Uwe's adaption of
> 	Sangyun's original patch.
>=20
> to the commit log. I'll apply it then to my fixes branch but not send it
> to Linus. But if something more urgent pops up I'll send it along.

I'd like to pick up this commit, but don't want to modify the commit log
without your consent. For now this is blocked because of that.

Best regards
Uwe

--6j6g6x7ouoc3jvdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoJ8l0ACgkQj4D7WH0S
/k7CAwf/b87aKYE1W7nwP0lVg5qdA9c7/QmnosUwCcIbHsEe9HATaUfdvvJnbqQ5
O5NRwTPMkaLhMIfY8UbGTqXTpdd3gD6tLJFQTvTxDunJLEUu1HU6kRwn0OnZMfoP
p5z0QQH6P34Iu34FjpqG221hFZzED5aeusRjYF7F2bqzIfy1HyuO0BtH/GbFurZb
FVsjfZXg+jnIaW//rwTxL16CRDICYm8NLJ/3mRQrbEALyXPzoNJro+yZKmcmpeCG
hA/XsCznKPxIBNB6ltx5w221DFNSQVh3BPoU7MCjZGj7ePM2tI6gSgYhuF7Y5/u6
gg5A4m8KX3LfLQhMNMKpU29+XQe2GA==
=wYs6
-----END PGP SIGNATURE-----

--6j6g6x7ouoc3jvdv--

