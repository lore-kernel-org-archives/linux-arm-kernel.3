Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD77CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiTf6R7/XbxFPeS7/3Gkp5ZeD2HKYBMhjJZu/9G9q68=; b=JK1akDEH1rW1QQe7dvirwRpr9O
	+fWbN3PKPzUgbiLIdm2UlUeAYwOsbvtNfQ1UYbj6rqBQ/7wHDTyDb7YiXx3YA+OVXMtJySr/lba2L
	HSGH8BhwtgnDzJDE4mWCzhews5hDWa2IZZOv5S2mPbQVZrYN8m7av21057ZFcsSlyDw+ibpiR7R05
	NTrDFTByVXfyN06JbY6+YtI/Z7fF//awN0SV8JBwOiHO3JZLAJDgwMh8QHp3WQu6Gy4snEeYhcoj8
	XslKMwMze63mS87lm0vbKmW3QwiR9BFy+1cWi1QciW0lWZduYgI5UltHHRSoVldwUlU7DoY6ME+cu
	To/fA/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoFP-0000000Cr1z-2ocd;
	Sat, 03 Oct 2026 01:09:07 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoFM-0000000Cr1J-2MKj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 01:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1790989738; bh=cCaASWiDqDydkWfC2ZpLgcqJU2sQoDOPhkCTl6TbzHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=abgJ7qfsIMaf1tzJuhUl5U54FzfopBDpg9Mp/Ky3wj4lHSfbUbKRb62yn/2PFIwAC
	 klU6gwn9jjoOhHEKTSrluT4vVovt5SygFMl3eHHSWfdDeko/z1l7n7fqmWYB3IYg82
	 ZtN7YuxaFKDNOx0uAQoVbMKpmI0zCq0fN2OsqriFvybjnZf5X1rBM2+sE58k1YwdGW
	 IQ4L15TShbSW7r8rjXzqrcraqiXw8Ztxhl+vRaWy5lTHaaWKlz7ASvRK2uU3ZHrBUz
	 3Vj/EgzrGgVCPQwK4vPAH17IyGYNGrIQYAqOJrR8bpu7u6KNo1x2UppaSm7g5XCQ6p
	 /F6+h40YL+LCQ==
Received: from pliszka.localnet (83.24.12.19.ipv4.supernova.orange.pl [83.24.12.19])
	by ms.puri.sm (Postfix) with ESMTPSA id C8D53217DC;
	Fri, 02 Oct 2026 18:08:56 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
Cc: sre@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, daniel.baluta@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, angus@akkea.ca,
 Vincent Cloutier <vincent@cloutier.co>
Subject: Re: [PATCH v1 4/4] arm64: dts: imx8mq-librem5: Set BQ25895 input voltage
 limit
Date: Sat, 03 Oct 2026 03:08:50 +0200
Message-ID: <TUmf9Hq_Txaw7MkIttVh3Q@puri.sm>
In-Reply-To: <20260927145538.233548-5-vincent.cloutier@icloud.com>
References: <20260927145538.233548-1-vincent.cloutier@icloud.com>
 <20260927145538.233548-5-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4PRw5kfOQamMwtcngPadMA";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_180904_776609_389AF00E 
X-CRM114-Status: GOOD (  14.73  )
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

--nextPart4PRw5kfOQamMwtcngPadMA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
Date: Sat, 03 Oct 2026 03:08:50 +0200
Message-ID: <TUmf9Hq_Txaw7MkIttVh3Q@puri.sm>
In-Reply-To: <20260927145538.233548-5-vincent.cloutier@icloud.com>
MIME-Version: 1.0

On niedziela, 27 wrze=C5=9Bnia 2026 16:55:38 czas =C5=9Brodkowoeuropejski l=
etni Vincent=20
Cloutier wrote:
> From: Vincent Cloutier <vincent@cloutier.co>
>=20
> Purism's production Librem 5 kernels used a 3.9 V absolute VINDPM
> threshold for years,

=2E..because it was (likely accidentally) left over from the devkit dts whe=
re it=20
was genuinely needed.

> from the 2019 board support through the releases
> preceding the March 2026 charging update.

=2E..which is when it was changed because it was found to be the cause of i=
ssues=20
due to interactions between TPS65982 and BQ25895 cut-off limits observed wh=
en=20
used with power sources that struggle to provide the required voltage when=
=20
under load.

> Use this established board
> setting for the BQ25895 input voltage limit.

Why? What makes you want to bring the bad value upstream?

> Set input-voltage-limit-microvolt to 3900000 to select absolute VINDPM
> and program the 3.9 V threshold through the generic binding.
>=20
> Tested on Librem 5r4: REG0D remained 0x8d across an attached boot, unplug,
> and flipped replug.
>=20
> Assisted-by: OpenCode:gpt-5.6-sol
> Assisted-by: OpenCode:gpt-6-astra
> Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi index
> 099195279e84..8badebfcdbb4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -1195,6 +1195,7 @@ bq25895: charger@6a {
>  		pinctrl-0 =3D <&pinctrl_charger_in>;
>  		interrupt-parent =3D <&gpio3>;
>  		interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +		input-voltage-limit-microvolt =3D <3900000>;
>  		ti,battery-regulation-voltage =3D <4208000>; /* uV */
>  		ti,termination-current =3D <128000>;  /* uA */
>  		ti,precharge-current =3D <128000>; /* uA */


--nextPart4PRw5kfOQamMwtcngPadMA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIt2frgBqEUNYNmF86PI1zzvbw/8FAmrAVaIACgkQ6PI1zzvb
w/9PaRAAyovF677HImIcOzNmNYk8sCgAzYbXHuXezcHn0rEHn3Ok1dsAHHjLuFyq
5FkBbuTa04vepyenQ2hWXWR/ad7kMnUw5leMg2QXDbwjXadbUlfba2uVUlO3VS59
k3C8RwJIQuOVxcSG1nvCUjbONw5aDzcyqiDbQe9zewCiSY6Q9MTj/wwAPTRFk1nE
BZs5akpwi8QwoysnjS76H+I0h5iWdbUX71UG+rYn2WMKMaQ+zyaLGp0NTZ9bbwxF
cfZQA11W+abBbvF3FKu2zPwYBt1+l1JSn3ZjnQZ/dkyMBZ7pQsID1lSKAwqj+jN7
cAtgNNHib1ub+gGm6rJkhCckhhlUWMr0uq9xvHwyCAE80lckRoh25qPDo6Yzs1e/
Wys9tseSOqRVsusVAZjqlmrg2jYfbE9LbdeZl1WWFoV0/yL3KTLIHGu6sSxyj2We
F8Nyk9oZZETpOR0zNONvD7ItWTO9srw7SrhAorHnSGj3ObyUQuDAX2mld88WAfGk
ETfMVdfqGgoyi2fhV8M0bnWX4NE2aFuokJRAc7lckf7bCIXCMS3o6FZg3RUUiK4a
IS6WED8WVEApN6+ry1UZX5t+S1w64JiLyTZcr+hbtEUUIxwuKX5LjI4sClLpa6OR
D2yd15HdnZvlDY+fxOxdcDxvua6h6Fd+w85n7ja7lC8Bs+miUQk=
=parr
-----END PGP SIGNATURE-----

--nextPart4PRw5kfOQamMwtcngPadMA--




