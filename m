Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69E2CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nto9INm4CCbJIWVUu3KMo/+Lg9Zdef2HK/jv7cJfWrY=; b=U3039G8cen3DgQq51vDns/fJRs
	dMwEgn/XJICxDNqa3H0tcKkIx7B5CioijG5tnjJnAkSxRUk5LKze6hzfM3DPPhaJvsH47LccoRXIz
	UoYgZon8vqujiBay/XMEHamz21FESvbp/68oYw1nJbBSH3YfLbLncvRHk8znSm6czEfYqrjrhjDML
	y69ElU2ICZpgpOwPrMiS8sQQFyzeJ4P9W300hgtPg5y3Ro1Vgwc269FDl+kINwh+wG/EQA+zJc27t
	lZjrvw8VRpmLX3+vmCBzLj7ArqZfgi9u29AxHqPtumXP/CDvv23h8cXhe7+/7mC69Gdnql+lRpjnT
	7sEHpJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcLa-00000003jQF-1RMs;
	Wed, 22 Oct 2025 17:10:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcLY-00000003jP5-1fqp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 325A94065A;
	Wed, 22 Oct 2025 17:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B5CC4CEE7;
	Wed, 22 Oct 2025 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761152985;
	bh=ydlTxjvYq5Gbbz05N9YC6KCF1ed5gKytazDIpqij1vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkAbGohsjFE2PmC5J3+B5AhYmxAZOt9QBJ9AqO7gndioVHRicMTS/t4a7GN/50y5C
	 OpI1maQRestudc0QW9UFiMIOpLWBexwCVWo637tpeEPODDz4lSKDH57BJwmQi9EKaQ
	 iRiN61u6qDwq0uMERlzBFgJlVxBS/eN/q59jEzsdNIF5iXLa6j9dVe5hca2p4T9q4k
	 FhiymCb/qOxWW/Mxri4x1JwhXARodSgexLjwpawz4cV+FKyi105lBaqy8ZYgPliaHp
	 6ukssOFpJY2jjAqLSxLBo3MWY2wcHO35ANp6YLV4MbOJyLxZQXuTDGy9ewBnlZibgZ
	 u54QbKR/Y5i0w==
Date: Wed, 22 Oct 2025 18:09:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: toshiba,visconti: Drop
 redundant functions type
Message-ID: <20251022-magnify-skirmish-de92e7055795@spud>
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
 <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqpAgK9IAwUWzlVV"
Content-Disposition: inline
In-Reply-To: <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_101000_450178_2A01E613 
X-CRM114-Status: GOOD (  14.91  )
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


--iqpAgK9IAwUWzlVV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:34:27PM +0200, Krzysztof Kozlowski wrote:
> Referenced pinmux-node.yaml schema already defines type for "functions"
> so $ref is redundant.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml    | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pi=
nctrl.yaml
> index ce04d2eadec9..0eff0a0ee9e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.=
yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.=
yaml
> @@ -42,7 +42,6 @@ patternProperties:
>        function:
>          description:
>            Function to mux.
> -        $ref: /schemas/types.yaml#/definitions/string
>          enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
>                 spi0, spi1, spi2, spi3, spi4, spi5, spi6,
>                 uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iqpAgK9IAwUWzlVV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkP1AAKCRB4tDGHoIJi
0gdcAQD7GTUJXvhA+RwYqh6TGon8QqMhvI96fkPeC9+JX0Ju2AD/VYaxl3bsh0Kk
8ADeQ3fRjl7GcBL7FT+uDuYtw6UenA0=
=VdM7
-----END PGP SIGNATURE-----

--iqpAgK9IAwUWzlVV--

