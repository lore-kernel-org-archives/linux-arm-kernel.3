Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFECCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjnN+L59+oCEAhHVMW3WoiFgla7Z0W+Dy7OVqL4cvAk=; b=L4MIeaBbhiOnPT1b6WwVvXQLhw
	szZoku7+tpjMdT8Con1zRxhotgS1ZQAuzcP4W8fosmul0Rq5cRAP2Etdh0UvwX6rz4RJwM4kw7o6V
	wysXxT5vrDwfMzfH4CEm14Si7fN9IfWfYKiF9JY3coVBr9xTbQoSips7sQKvKAYxI/xHakrr5FPFn
	f5mD2u/kJ5bUrWlC4UcdLTO76+tSWeYCMtK4E6/aTGXlVzgMcp1Xluo/Myod2dMS/HpGhoFCPQ16b
	Tw56n8Q/RP8j+e1Ug+KeZPnHjIVtp9TxgcspzrJLyX5x/jgIut8TzuTdY2Eb0f60kkGGK66a65t/s
	MfKBu4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3zy-00000008FnN-1XjE;
	Mon, 18 Aug 2025 17:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3Gs-000000085JW-0EMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 469DC600AE;
	Mon, 18 Aug 2025 17:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50122C116C6;
	Mon, 18 Aug 2025 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536624;
	bh=LsUeufe182oeOYuRXyKOtbmmFBfg6vhanNGoljpohVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkRfL/7ZkgW0LFbBk7UqwdcY1KYuQ/VkRLwHCquXycZ+zYdXc6Qyzz/Awl83lQYoE
	 FWN9rIIT1cB5kePfP2+JBnr5mVW5jkyuX33cYUVEVlHzjaj6P7NsgkGWwIZVdquBsz
	 hagQFujhG7jAHgNbZ4mDUi0dRqBbV4KKqTNn6I4tP51pJxXUi5nCJzeaM4OLtgztS7
	 MC7WigYjh0JRnW5a3B0jaavtgAGHkDRJvU/sbR3GhBrAMwzhXpCkMgzROcq4bHKc/V
	 RATz74UaTSb4LQ/291wp9JEPu6NlodBuotMR5PP3DzSDnaajt4RZZ7nsnPK3T9HSkT
	 2Z3DXdYhjfCrw==
Date: Mon, 18 Aug 2025 18:03:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
Message-ID: <20250818-tyke-pungent-20d9ffd47ecc@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kD3gyAnEQtUYwXo5"
Content-Disposition: inline
In-Reply-To: <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
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


--kD3gyAnEQtUYwXo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>=20
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>=20
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>=20
> 	qe_pio_b: gpio-controller@1418 {
> 		#gpio-cells =3D <2>;
> 		compatible =3D "fsl,mpc8323-qe-pario-bank";
> 		reg =3D <0x1418 0x18>;
> 		interrupts =3D <4 5 6 7>;
> 		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> 		interrupt-parent =3D <&qepic>;
> 		gpio-controller;
> 	};
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Document fsl,qe-gpio-irq-mask
> ---
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
>  drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.t=
xt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> index 09b1b05fa677..9cd6e5ac2a7b 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> @@ -32,6 +32,15 @@ Required properties:
>    "fsl,mpc8323-qe-pario-bank".
>  - reg : offset to the register set and its length.
>  - gpio-controller : node to identify gpio controllers.
> +Optional properties:
> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item=
 tells
> +  which ports have an associated interrupt (ports are listed in the same=
 order
> +  QE ports registers)
> +- interrupts : This property provides the list of interrupt for each GPI=
O having
> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should =
be as
> +  many interrupts as number of ones in the mask property. The first inte=
rrupt in
> +  the list corresponds to the most significant bit of the mask.
> +- interrupt-parent : Parent for the above interrupt property.
> =20
>  Example:
>  	qe_pio_a: gpio-controller@1400 {
> @@ -42,6 +51,16 @@ Example:
>  		gpio-controller;
>  	  };
> =20
> +	qe_pio_b: gpio-controller@1418 {
> +		#gpio-cells =3D <2>;
> +		compatible =3D "fsl,mpc8323-qe-pario-bank";
> +		reg =3D <0x1418 0x18>;
> +		interrupts =3D <4 5 6 7>;
> +		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> +		interrupt-parent =3D <&qepic>;
> +		gpio-controller;
> +	  };
> +
>  	qe_pio_e: gpio-controller@1460 {
>  		#gpio-cells =3D <2>;
>  		compatible =3D "fsl,mpc8360-qe-pario-bank",

Why is there a binding change hiding in here alongside a driver one?

--kD3gyAnEQtUYwXo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNc6wAKCRB4tDGHoIJi
0gifAP4zV29lsa0wp7PTs4uJEEK4ElPSQZMpreO7o/az7p/onQEA4mIyE/65qlAv
TvH4uKCtgNCyRIAPqS8vTdBswhJBaws=
=PqSq
-----END PGP SIGNATURE-----

--kD3gyAnEQtUYwXo5--

