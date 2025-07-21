Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA25CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oFHz0n1GyV55V/4S4KYjPImNsph9AVWzsk+xOlZFLI=; b=BxPYA/zP35Yacq/etptUwJFLhs
	uma9tGb14PuE7GXrgHcwIlQ/Jn5tmnoaSpcVv+J7M/XIlXcwNomK1G3W3UPdGptiixo/CONWfb/NR
	DQ3Ax6UYVpCEZf66FywnpvKDRt+8M+nfnMGgbPhJ4CDAt/xbd09PwUhsC4tJqdPAsLdILmfeHc8kh
	VnX3+iTWYMuxUB8I7KWBHLPpDURENcKVLG95x8iF3C4/e54IVzj64YHKCKfkgst49+O/r/8Z66wtw
	uxpT+vgxdpsFcVfzsdPHaJiL/WhmQJ/v6QQjfpS7leMeNdBBF9+57S8RyDl9TXITJX8rpo5ig1nAZ
	wBcd/r/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udowU-0000000HAaV-2Y0b;
	Mon, 21 Jul 2025 11:44:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoJP-0000000H24A-3i6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC2C8451E6;
	Mon, 21 Jul 2025 11:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1423EC4CEED;
	Mon, 21 Jul 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753095842;
	bh=EcW+PuwhhXhVoa+pRSceK3tuWnx91zSNXUwkaiOBF8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9dOftA3ryJYz+Ay2nJJO8r8Hjj/RBFk0OgmQdtlf1ef3l6DokAE5VHSbTQQBdGeX
	 Qs420DHiuJsJdHGxj2+MO60aUY+0fPelpG7Zs6f4LQHL/+GScWKMwlUZNa6ARyTbTn
	 0l7Lac6JhTYbLZDtPLQ05t/ebureu9JR/BoCoG39DPhfOiFsmDFIGNAswmIRQ1H22R
	 nw397Iu/AyML2rPT6zYqAA1lc6HIqW3xlP7RXKuAMNms2X7fGJWJ6zdBx0opk0qbRr
	 WObsBeaqSg0ThVBTem2M+P4/ZK7jaRP/oG6qtjYG2wq6q4Rrgz6ook2haBB4v3DwKY
	 AvAGuqkAACxoA==
Date: Mon, 21 Jul 2025 13:03:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: imx-tpm: reset counter if CMOD is 0
Message-ID: <7wsbi7pcwa2otxqkon3zfat7faprhr3l7wc35fkzctmm3cv67m@ph6w7hzwt322>
References: <20250714123634.6442-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="umamwlivydbce7bu"
Content-Disposition: inline
In-Reply-To: <20250714123634.6442-1-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040403_965398_3478A5F9 
X-CRM114-Status: GOOD (  28.15  )
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


--umamwlivydbce7bu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: imx-tpm: reset counter if CMOD is 0
MIME-Version: 1.0

Hello Laurentiu,

On Mon, Jul 14, 2025 at 08:36:34AM -0400, Laurentiu Mihalcea wrote:
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
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This needs backporting to stable, right? So we need a reference to the
commit that introduced the problem. I guess that's 738a1cfec2ed ("pwm:
Add i.MX TPM PWM driver support")? (Please add a matching Fixes: line in
your v3.)

> ---
> Changes in v2:
>   - dropped the "VERY IMPORTANT" bit as per Uwe's suggestion.
>   - Link to v1: https://lore.kernel.org/lkml/20250701220147.1007786-1-lau=
rentiumihalcea111@gmail.com/
>=20
>  drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index 7ee7b65b9b90..b15c22796ba9 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chi=
p,
>  		val |=3D FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
>  		writel(val, tpm->base + PWM_IMX_TPM_SC);
> =20
> +		/*
> +		 * if CMOD is set to 0 then writing MOD will NOT reset the
> +		 * value of the TPM counter.
> +		 *
> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
> +		 * incorrect.
> +		 *
> +		 * To avoid this, we need to force a reset of the
> +		 * counter before writing the new MOD value.
> +		 */

I asked in reply to v1 about these register semantics. The idea was not
that you explain them by mail, but improve the comment accordingly that
someone reading the driver doesn't need to consult the reference manual
to understand it.

So maybe something like:

	/*
	 * If the counter is disabled (CMOD =3D=3D 0), programming the new
	 * period length (MOD) doesn't reset the counter (CNT). If
	 * CNT.COUNT happens to be bigger than the new MOD value it will
	 * reset way to late. So reset it manually to zero.
	 */

?

> +		if (!cmod)
> +			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
>  		/*
>  		 * set period count:
>  		 * if the PWM is disabled (CMOD[1:0] =3D 2b00), then MOD register

Best regards
Uwe

--umamwlivydbce7bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmh+HpwACgkQj4D7WH0S
/k4BGwf+P6kPo7r1ntY/Esoxxhlamfit/RB+dpcIWq3XtsaG5FJjB9BtFHeBQUs3
MgzKcSUT04Ka4PRhM0pFJnJtOTZ2YA5l8tsjM1CHLQXHuYW9x335vbkzjnn3PcBj
thDW2pGSiSioUrY9HHo+JwHeqPSRQaZMNvBroQvxsJyVZd8Cd1lmA1S6+hTDsM6l
ZRqetIHUwQFlFZtAu4DF+J5ApamyNkwmrKFskNX32yKkhcJjYbhgx0H4Ei4ZdbQy
VRdBztPhA+4N+7v3rmUVmnj9NRzjd5yuoMPDdNjVEmuuI2n4q3iPYPK2Xkx1xqQa
U9Lw9/bDBBnrfC4N79YWPy4WQ+3HCw==
=yx+y
-----END PGP SIGNATURE-----

--umamwlivydbce7bu--

