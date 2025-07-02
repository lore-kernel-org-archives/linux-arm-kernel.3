Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E859C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMctilNB4pfzBcDvfNeYJrjUkus1MyRB/lahmMtWAjQ=; b=tOd1zfXJh83ig+wN0RR6Qsfpdw
	kh4Rbs6LBRu1MHC07i1ZcOKn5eUPx2TvudgUwZDzDjsi9PUpUpCMtJxQCwVfOEls3kjuJEUMdLHrL
	Oq9DI67fRJZXJsO9ooyVdGBzZ/hgroJzZxEHfi/54MBGpAm8DjyTkH20VGZ4Rp807V3oJrQgJruNH
	ceufkGQrrh03CV9WIty9iEKBtpLyFquxpw8RKtx0cTeW4MayLUUEhq7nIzKeYb/PH/6ZD3IuWRU+5
	mqbzbXQEjqjB433MqpcL/9BJi9fqhZ5AtodU7c6gNb/0H7NejrHJwOAUAcNicq3gM6NIk3jl8dDPD
	1+vVlT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqRR-00000007KZx-0Ysw;
	Wed, 02 Jul 2025 05:55:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqNB-00000007KMA-0oyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 973865C691C;
	Wed,  2 Jul 2025 05:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FEDC4CEEE;
	Wed,  2 Jul 2025 05:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751435468;
	bh=ZGAD34V2+/nppac1OT0z+GzgTDgySO7EWRziPrZ69y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dM7AuOf1hTRbGtNWbCOJAPZl67ADKPrFWgVugY011aGKwfSiAFwq8dvNEL97Vyp8s
	 xTn+6uU1tZs/T9/eBkUPoRD83JOAQJW+1edZsd0pgtPKbFueoai22a8Q9SvxlHEGQ9
	 cf9bByoDeJfGh7mnG6Pu8iwRz8vNlhNYfD88/4m5wB2nrNknIU0f2GOJwR+dikebwt
	 GdT8eDtYQD7HuuQJ6p/gKttY1xjyG16qEF21A6n57p5ml5eGd0vYoBQtVV4OPQcrvL
	 BXvELVmxzhwkmcQBQnnHDxduPaixhatWSVmZXsgjon9WI/4bSBfdZXDDDpd8n/6g5m
	 iXDiaIw0yKAcA==
Date: Wed, 2 Jul 2025 07:51:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
Message-ID: <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3g6nf2e7dhscobr3"
Content-Disposition: inline
In-Reply-To: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_225109_314275_512ECA90 
X-CRM114-Status: GOOD (  24.53  )
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


--3g6nf2e7dhscobr3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
MIME-Version: 1.0

Hello,

On Tue, Jul 01, 2025 at 06:01:47PM -0400, Laurentiu Mihalcea wrote:
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
> ---
>  drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index 7ee7b65b9b90..30f271826aed 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chi=
p,
>  		val |=3D FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
>  		writel(val, tpm->base + PWM_IMX_TPM_SC);
> =20
> +		/*
> +		 * VERY IMPORTANT: if CMOD is set to 0 then writing

The "VERY IMPORTANT" is correct today as this is missing and so
disturbing operation. However once this patch is applied, it's only
normal to have it. So I suggest to drop this.

> +		 * MOD will NOT reset the value of the TPM counter.
> +		 *
> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
> +		 * incorrect.
> +		 *
> +		 * To avoid this, we need to force a reset of the
> +		 * counter before writing the new MOD value.
> +		 */

Without the reference manual at hand or a deeper understanding of the
hardware this isn't understandable. What is MOD? What is CMOD?

> +		if (!cmod)
> +			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
>  		/*
>  		 * set period count:
>  		 * if the PWM is disabled (CMOD[1:0] =3D 2b00), then MOD register

Best regards
Uwe

--3g6nf2e7dhscobr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhkyMYACgkQj4D7WH0S
/k4iHQf8D+bL01vDv300bdPlR2TetB6qvOXjNcXttTNMBqfVUKF0sjh6CPnD9AF4
+UYCBnykBN7RCMFHgKjVj9GhRXC+uZOVJ9dzCGRIA3IthpOQ9bDk+JHQKbSZvZ2S
Ojsa8DXIHC9DILnx3a9+iDTKAYo9mujgg7nm9iJhkqqsUZMNTmzdB+vi1lVBr6Lp
4B01fzHsEGfcnIJI5x+YrYwMVlibGMBTQQe8I4qyf/L0EQjg+7wCwyyfTd9l3Mzv
4DZd0T4ZkQYO/BGUzJjLJhwyfEydNLIIlSFIC0NujZ77I8pytN2Kg224UgvcsagK
+L9FL0eZBLvFJSsg2tf2IML/rNum5w==
=cNud
-----END PGP SIGNATURE-----

--3g6nf2e7dhscobr3--

