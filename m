Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87264FE5202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwND5REbNH+A0ezBDGLVsUfG77wXJkgQnLelbE3C/3I=; b=3TZklSqxsmMe7u63hz7PRqVzJb
	g7JqSJzqpipMmFl+ueazR4E8fGIcS4IuV3U85pfjFY2ndXA3vnCdcn0hvTnv8Z6xI6+x2BlNONh+Y
	UkFXY3SYitZgrDfY9Cphb5wsJDDwSfd2A0OreZYVMA9Gqgk4nPOXnwiuMMDI8ap4dMgaAO7N37G1C
	WcFNMRptej+J3dBM5OEvTQsya2yrrTzTscXyfJrrvomi+l7LSUWAnljw8ZAPmyWbOvWVFlJyU0vj+
	45iVBd/zuF+6n5SD8+aS6bUWCJS/a4s1i1jfO8yv2mJukCFxZQKQWzHNJBdhdryrhzNqP5FiPQUgD
	5vRsdGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGE2u-0000000D3Mb-06rJ;
	Fri, 24 Apr 2026 10:46:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGE2t-0000000D3MU-1Uu3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C80FD600CB;
	Fri, 24 Apr 2026 10:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BF6C19425;
	Fri, 24 Apr 2026 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027562;
	bh=wdjDn556jbNQ7WzXeovxIVH/s2CXei4diJaRwgeH7JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFpfhwgDLwVhkonHJohzjlaMdgRTAV05QdGH90A4J3liKHg1pMfsHoIlIA8JYM4/u
	 KM5X9kK4PESEn1AMXMrr8e9TfO+Eqf2c63LsY/dR73mWFVuxOHH4iKTmcQDoAKhwsX
	 tvmDyC5AHyIJKb5kXi+LQLP4+Il4P/bOZBTeEQ1jDstDfgUavlZsFqlc7p0f6qSzBj
	 HkUUNMXXU/bQdRDaPPuPsIYhFRWA7ILKrMG5DaKJxtCV9JXU0WCUudSaQDq1w4zdPc
	 otMC2pBvlhRjkLcOf/hmdVvfOC/9xE/n7OORCFHJGdo790iqZFZdByPUlCp7dqDlvP
	 2EaQbZO3rfysA==
Date: Fri, 24 Apr 2026 12:46:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sangyun Kim <sangyun.kim@snu.ac.kr>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: atmel-tcb: Cache clock rates and mark chip as
 atomic
Message-ID: <aetJZzTHd4RBcytw@monoceros>
References: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
 <20260419080838.3192357-1-sangyun.kim@snu.ac.kr>
 <aedfEzeRH5tH0-Fb@monoceros>
 <20260422044940.tse3ek7jlv3x2dbt@nunu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xeni4cw4nw33ej5e"
Content-Disposition: inline
In-Reply-To: <20260422044940.tse3ek7jlv3x2dbt@nunu>
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


--xeni4cw4nw33ej5e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: atmel-tcb: Cache clock rates and mark chip as
 atomic
MIME-Version: 1.0

Hello Sangyun,

On Wed, Apr 22, 2026 at 01:49:40PM +0900, Sangyun Kim wrote:
> > On Sun, Apr 19, 2026 at 05:08:38PM +0900, Sangyun Kim wrote:
> > > @@ -438,16 +441,33 @@ static int atmel_tcb_pwm_probe(struct platform_=
device *pdev)
> > >  	if (err)
> > >  		goto err_gclk;
> > >=20
> > > +	err =3D clk_rate_exclusive_get(tcbpwmc->clk);
> > > +	if (err)
> > > +		goto err_disable_clk;
> > > +
> > > +	err =3D clk_rate_exclusive_get(tcbpwmc->slow_clk);
> > > +	if (err)
> > > +		goto err_clk_unlock;
> > > +
> > > +	tcbpwmc->rate =3D clk_get_rate(tcbpwmc->clk);
> > > +	tcbpwmc->slow_rate =3D clk_get_rate(tcbpwmc->slow_clk);
> > > +
> >=20
> > Only one concern left: clk_get_rate() should only be called on enabled
> > clocks. I don't know the architecture details and how expensive it is to
> > have .clk enabled (or if it's enabled anyhow).
> >=20
> > If you're ok, I'd squash the following diff into your patch:
>=20
> That makes sense. clk_get_rate() should indeed only be used on enabled
> clocks, and your change is the simplest way to ensure correctness while
> respecting the clk API constraints. I=E2=80=99m happy with squashing your=
 diff
> into my patch.

Just for the record: I did that, the result is already in Linus' tree
at https://git.kernel.org/linus/68637b68afcc3cb4d56aca14a3a1d1b47b879369
and will be part of v7.1-rc1.

Best regards
Uwe

--xeni4cw4nw33ej5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnrSeQACgkQj4D7WH0S
/k7Z9Af/SgtokfuDRo/0L8At8pZsQlZ3YT0qGgOFnJfR41bAVy9or6XPJUqkqIwn
11iDGuNU8konxGfKY0lXxoBjRTFHIRED+IRHWuxuxGU1w4qgWYG24/6MvjI+BH+D
EraEB/abCs+/orMz96YRsEpp8LfrHO2Bie+GsqU10mOFn889NGDfkiAMQNy0zBsm
fI/rV9cP4lQthcSquYYk2ytoMexP+hiPa4TfWAuOgw5u3zXd0fZlI6Bb1Bgo7YLJ
c4kXKrDyv5ATCO80N9TuTSXKFl7apewuCIocorPcktQ6hdXWyQobSMEtCshRN+vJ
MxYt/zoTs74WqXGUnpu6aa202u+9Yw==
=oCpN
-----END PGP SIGNATURE-----

--xeni4cw4nw33ej5e--

