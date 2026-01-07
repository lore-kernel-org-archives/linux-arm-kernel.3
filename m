Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52270CFD647
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ss0hLDjNpXrb9+PXktMBVfwo9Rk00IrVDa1TAGcsC+w=; b=BtijxbP+KGF8YUUkFtasoxAJu+
	xiKc06jQrq2pviUyauWbNy27KY/mNulA6nUEn6akt6AKO/69HzZ458TmxTidufXjaXhGysgsZdmJF
	rbjyOttmibM644Zks8bCaRZlV0AuZ5wPu8qbyOc6VYMYXhvBeS0jyR/Rt4SklFcQpF+NgKAC3uf/K
	la5yHULi2suis4xFWMvzoJK1sT7MlpoRfCp5SFBNQuhIj2rdMHYH178pRFTGeCAafQyy97/q76fvi
	vK7C1LdxdUqBZ3Ygow1c34wpuhMga//zqDVIx0xFlLonM7P/xejYSszYDjHHJQ0SXv8C+yFCPhxjW
	8W48zm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVs4-0000000FCai-2hGp;
	Wed, 07 Jan 2026 15:54:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVs2-0000000FCaF-1Ghz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 629524372A;
	Wed,  7 Jan 2026 15:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFAC4CEF1;
	Wed,  7 Jan 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767801289;
	bh=dQHczuUO01yiJUoA4VVJbRjpUINgq/SBa7rpIL/696o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzrWFiYr1lLU7Zo+vJOoMuB6y3YJDu3ijrEKUJhEYVuiRKPCKpIOagB9YslXNI74o
	 kUQAwTd18zutfYUw+fOkoRM7OsGpAMTNWYkm1jGXjzThQtvLO8eFhX2rq8lW1HUu6b
	 h6fnQ0k89bBDzpAi/xaBxhfFQYlX6X6h0D6WOOhV9jN7zdwAL2udsBD6es5Qu5W6Pk
	 TCIPhLiOQ9++Yz2mFrqZxrvtco6aXeu7+5le5mI01NGQgjOvsZocJA3MLPKut2rT67
	 dvOA4/aegHqCtdG+3Msr/oH97Z4qJrKMCA/3aO4YXAKYqkBd0GeNFcroJmgaN1rC/f
	 EtJJVfnO3/nVQ==
Date: Wed, 7 Jan 2026 16:54:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
Message-ID: <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
 <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
 <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64gye46smpsbdd4v"
Content-Disposition: inline
In-Reply-To: <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_075450_383422_91C08426 
X-CRM114-Status: GOOD (  16.15  )
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


--64gye46smpsbdd4v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
MIME-Version: 1.0

Hey Sean,

On Tue, Jan 06, 2026 at 11:30:34AM +0000, Sean Nyekjaer wrote:
> On Tue, Jan 06, 2026 at 11:22:57AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jan 06, 2026 at 08:01:57AM +0100, Sean Nyekjaer wrote:
> > > After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
> > > polarity changes are ignored. Updates to the TIMx_CCER CCxP bits are
> > > ignored by the hardware when the master output is enabled via the
> > > TIMx_BDTR MOE bit.
> > [...]
> > I have hardware using this driver, will set it up later this week for
> > testing.
>=20
> Very cool, looking forward to hear if you can re-produce.

I cannot. I have:

	# uname -r
	6.11.0-rc1-00028-geb18504ca5cf-dirty

(the -dirty is only from enabling the pwm for my machine, no driver
changes)

	# cat /sys/kernel/debug/pwm
	0: platform/40001000.timer:pwm, 4 PWM devices
	...
	 pwm-3   (sysfs               ): requested enabled period: 313720 ns duty:=
 10000 ns polarity: normal

and pulseview/sigrok detects 3.187251% with a period of 313.8 =B5s.

After

	echo inversed > /sys/class/pwm/pwmchip0/pwm3/polarity

the output changes to

	# cat /sys/kernel/debug/pwm
	0: platform/40001000.timer:pwm, 4 PWM devices
	...
	 pwm-3   (sysfs               ): requested enabled period: 313720 ns duty:=
 10000 ns polarity: inverse

and pulseview/sigrok claims 96.812749% with a period of 313.8 =B5s.
So the polarity change happend as expected.

This is on an st,stm32mp135f-dk board.

Where is the difference to your observations?

Best regards
Uwe

--64gye46smpsbdd4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlegcMACgkQj4D7WH0S
/k4fRwf+IoPI/fQOF4r4TdyNyj65K6n+ilKzhOPYzKYcI84BEcJY/rHKy5tCk9Un
DB3fGdGsshoeaQtmX1qobV/wi6PFT27ecr9Li3lppUnc7ncvEKwKstDEY79THvf9
laZNtq6+trpelYq4JQGCoXwgE+sJTjMpFtoJLFGko4LrJxXvhVZEuU8oYuelRaOe
e7jMVbf/EdBMnLkI7TopaonJ+/FH+YDFED2h1AJPY9RbGU6VbJ+Y76pIFQwC5/Nz
zfheLxXGMWT5G9eV6atq4rcrvRQDB3pr3fULyKSwb8q9vpObaJjyIiOkqCDK8zOF
MIfKdXUl/rx9CggHjkGDcVN+AzBkEA==
=Hapr
-----END PGP SIGNATURE-----

--64gye46smpsbdd4v--

