Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9148E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2VaKbgrjuGZ1kWErVgzrW1HLeAX7dy+PBMuNXfy6iU=; b=s+yy2Zr3wm2ffBezmWUQDR0cL8
	ZPRnHrNLylf5/B8CX/dBhpSvdzx6Jow65Vh2PzgAonPun/uJ0Vb0nMnVQda9ZkxOBJ3/lWAeVeb0n
	JUoa3fontPWwMn42hzEDib2/Bbajppk6NS1wRnjs4Xo5mgMYuGYD+SX13HEkvuZSKwkExP0G0wSmH
	VxsmTJwnqRQMLdjda0iB75VBZ76XAqhEUPwPVNDiELL2+G7C8m6vCkuCKVh82i9P5z0khba9hoC/r
	OLEHn6jJrrfeG5whYb4NATrTQlTd7ySt0Rw+5kf0l12wQKNQXMU7mhuGWmBAeOw90iygH4MlnO0UD
	I44wRLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Kr-0000000FCBK-3cFv;
	Thu, 05 Dec 2024 08:35:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Jr-0000000FC38-1AbK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 08:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A2VaKbgrjuGZ1kWErVgzrW1HLeAX7dy+PBMuNXfy6iU=; b=HFDuFhbS/y4yr6o399pCm+Z8lb
	0SDicoq+5Zr79uXcAsHxOu5Le0hoXaM0oavi9IDXKVzhHeuFuDRfjheo/ozDJSu/lIFzrFiz5HEPT
	m8IaX/y8wQuFSsplwtzhZvKTBGZxOSyMf0obd/BtuemJMcBipwjKwMaApbyXWPgYb92zdzv2NAGYL
	LM/e5yKgH7pQvchY+iMtgMGoAM6WJcm53AbsuzDexoU5ZxHsyhKU5cQfxQlVoVBvvz8i10J1iyHTV
	o0j5v4tSaLscUKRamhSPUhZFSZrdlcR7OUNIKdeQI6HPCE+G3UacnMOTnfjUsBrOcG6oRlKJKAK+W
	W+kW6n/w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Jo-00000002ndP-15ud
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:34:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 750CE5C718D;
	Thu,  5 Dec 2024 08:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF60C4CED1;
	Thu,  5 Dec 2024 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733387676;
	bh=gKCbD7Svx+y4jFvtnoFhWfAzzEJNorqOmAWV9TmCq9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOVY2eowOfL3vNW8Xwy5XggMKNW3YYHT+8993h3w9/y8N1zctDMuY7oVKQfrb/Shm
	 XZoSoyO7+uNHD8uaqywzHVzQdlixDFafBXjnbpSJiNKB7dJ4WF5wC/wYemnYNRPl7D
	 30F4TCXZQPxhMIo8oO/P6rN10HxY/wFCS+nieVBBTB/MrCWCHYSIOdCv0G5aSrwMtL
	 6cLO7bCYv6wsLJC+NDMaCd93D4AZ01fRD8MBXj3QhMlNNdK3fCbHxiZAYJQ0uLndCY
	 TGVt4FZ1Xyh8sDS1ekD1atTSyi3kuhNvWTdcVeG0NQLTn9HuWutbzvaaQuyz6bQrbJ
	 k6oIIa9CsKNlw==
Date: Thu, 5 Dec 2024 09:34:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: fabrice.gasnier@foss.st.com, coquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, lee@kernel.org, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] pwm: stm32-lp: Add check for clk_enable()
Message-ID: <geyicxufezkbu7cdvnbgnr2qeuwrn5ubz5ent3spk5biuozxrs@gsqx2chgiiot>
References: <20241205051746.2465490-1-zmw12306@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shdmdu5ypwpb65ru"
Content-Disposition: inline
In-Reply-To: <20241205051746.2465490-1-zmw12306@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083440_674455_BF0ED949 
X-CRM114-Status: GOOD (  16.53  )
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


--shdmdu5ypwpb65ru
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 12:17:46AM -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.

Is this something that you actually hit, or just a janitoral fix you
noticed while browsing the code (or reading some checker output)?

> Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
> index 989731256f50..4abef304417d 100644
> --- a/drivers/pwm/pwm-stm32-lp.c
> +++ b/drivers/pwm/pwm-stm32-lp.c
> @@ -163,12 +163,16 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *=
chip,
>  	unsigned long rate =3D clk_get_rate(priv->clk);
>  	u32 val, presc, prd;
>  	u64 tmp;
> +	int ret;

Please move this variable to the block where it's used. No need for such
a big scope.

Otherwise looks fine.

Best regards
Uwe

--shdmdu5ypwpb65ru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRZZUACgkQj4D7WH0S
/k4TXwf/Wzw/hs8+EisqpH4An6STPdmc8pwIJCKQu1lwE6fQKkTYk5nYTs4JMxRx
9JLhTTsBNGJrQ3mjJrjjOEPscREqkZoVBxdlZFEPaPpYukjgvSiYQwvPERXQNqbR
y+Xb+CZuo5cITA51Jd3UDRIHktAIABl3Ox8GcqDhGgMq1Cje+XE24dwQ85kMyFJq
2ncZRb7TuNhF9XtQkUmGcWXsEUq5iVlhG25UziKlX+ZhMz9MJaU5LnVOFSy9HAPb
DTUS7vmaNGJiePZagOduLZ5Z/f7q/xMu311Xi4ylcjc59I54Ohp+VKuEnTMVzqaR
R1M+5N2Zbe9/BZGXpnHvfs9MOLb7pg==
=wFbu
-----END PGP SIGNATURE-----

--shdmdu5ypwpb65ru--

