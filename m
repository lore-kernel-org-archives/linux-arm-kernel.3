Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CE9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z80Zrosde97YBz7Ubg5HD+igCGm3hX2mgXP8gtZ7ExY=; b=AMUCwRiRi3pd7X4QDGrl8Cijm1
	+SH5GUtSw6TRS7/ZZ574mJzBsoSHMtTZzKNKLnJfkVA+/Vsgaa0l6y5JJLtfRyUwYhk8wwt331QlS
	6aPxHoN+uxhyK3J13EvFdR0qSoaYWFXnXszq7WMybaAWpe08FxkceqNjCENRLfuQZSPoiVFs6/1XV
	6gWqqGfWZlISvRX4LB3E7MgRcsILRerHeKQ70vWgBReKM8vyLYybzIwIbW1Yz9owM1NMYt+kjSAhl
	l6iPUZMqgeHMv/DY+FKZvjMPQ9ZspOQpgScK0jl2uAamxKfFY7upEkfm+7tOcQQSQ8YYqeKuYQ6Ua
	7j+gmuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnLd-0000000HHzR-1V3z;
	Tue, 29 Jul 2025 16:38:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmuG-0000000HEed-0ybC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3891D5C5C48;
	Tue, 29 Jul 2025 16:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CF4C4CEEF;
	Tue, 29 Jul 2025 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753805422;
	bh=8PqRrJ4T1GIZlo9A5K1NFm+LtDjYC1pJgTCd4O4aAMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTA0aK9UOoK2ym/J1kozYqDufRATC87ozTu2dcOE8R9riGJty2rKAH0ZFwyS5etFG
	 znwiee/8xiGhtqzLxLAi79OYj5gGqeevHhw+dEXpY5Z1McQ8cWJ42pGi815NRBDhJK
	 7jl+GMCchEUyoMkK6m7dCQhEnMwF85xdwQuNP2uKWNYnfGCNqyTmdz4g58FmeTzjF+
	 9C12Q0PBu3+TUV9aaeZURd1EwZr4KPRCF1231dnTIeMXWjOIEQKw05WY515GP0SkGC
	 h8ZTqThxhxX9t0UB2tMyv5XoDA1BR2AIU4NuJTltnXXKRSpRWOVziBbvNsMnUI5UgW
	 WdEgRH/dnRJuw==
Date: Tue, 29 Jul 2025 18:10:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pwm: imx-tpm: reset counter if CMOD is 0
Message-ID: <ylg2wadbfbyg6ncvoxxz5zthxokphs52lgzscus4qwqgn7q3vy@xzljjzukbtle>
References: <20250728194144.22884-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcvyewca57ejyx32"
Content-Disposition: inline
In-Reply-To: <20250728194144.22884-1-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_091024_309116_B4D614E6 
X-CRM114-Status: GOOD (  14.95  )
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


--lcvyewca57ejyx32
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: imx-tpm: reset counter if CMOD is 0
MIME-Version: 1.0

Hello Laurentiu,

On Mon, Jul 28, 2025 at 03:41:44PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
> of the TPM counter does NOT get updated when writing MOD.MOD unless
> SC.CMOD !=3D 0. Therefore, with the current code, assuming the following
> sequence:
>=20
> 	1) pwm_disable()
> 	2) pwm_apply_might_sleep() /* period is changed here */
> 	3) pwm_enable()
>=20
> and assuming only one channel is active, if CNT.COUNT is higher than the
> MOD.MOD value written during the pwm_apply_might_sleep() call then, when
> re-enabling the PWM during pwm_enable(), the counter will end up resetting
> after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
> normally expected.
>=20
> Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
> written.
>=20
> Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Thanks for the respin, looks good now. For consistency I capitalized
"Reset" in the Subject.

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

=2E I'll give that a day or two in next and then send it to Linus for
6.17-rc1.

Thanks
Uwe

--lcvyewca57ejyx32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiI8mgACgkQj4D7WH0S
/k79agf+LH57UR0G6y7RA0SZ7VTuCOOu8rGs7cN4IkwsVO/fpcWnZvidGDVERCL7
HCk0IuDvQJIk1zCIv54AgJkHcMk3HtWfWf/lYM5QhVZxHbHQSKEDQgMM6J2pAEBJ
uE0PJ+4fvdYrPY0YPQhSIICwuKS+rhUyFi5ksRbeKetgMRtuiBEFETkt1MmfWOWd
cGDljyV724kVk3uD6PpuK1OMdWb9Rx09ZMCxwER+HllGGks2Esiia0F3NLIXQm8R
8p1a9CRVSq/zNO+/vS83imY/XAmwkOJ2ucS/oH+zFhu3EJQysY3FSzXsen+ywl7V
YKCb1/VjVFk7SX7puGqqE2Viv9oXJA==
=N9cL
-----END PGP SIGNATURE-----

--lcvyewca57ejyx32--

