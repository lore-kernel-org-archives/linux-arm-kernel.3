Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD00C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5Oe+/qsP9gfaCq5yCuWO510xxb4CYOCrtgkQfYUfqw=; b=18j3utGEUYG9SQU2V0fhN+e6GG
	lNDqHGXSrltAxym8JZQkmD4n2EijRfLzVG70wdUm4aQu9BTsHFiFtsjEdaSRZufpm+eJ/PRsuS+AJ
	uyzmM2kM7YNrl5kVGMlwn2IqPpfpxmyvq+Ics98qRAj2EKUAcnoVgv9gSigC8als7u/uD/Iqj5QCe
	9Z7gTkKdfYUpEMlghIsXeTAXQQAeQFI+BHtGVW2UfvwgRqb+75bZDDieCDFbDbTPsZWBjae0DhcFu
	etdzmP2KRlYpLTx5nA6olafLGYF57acFRmgWrFGTsWI2dIsGuYBKG+fZbkzDFe+i4H5o1sNI0Zmlx
	+eWY5jGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeJu-00000002KkS-3W7w;
	Mon, 23 Jun 2025 10:22:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdo6-00000002F1E-0gXf;
	Mon, 23 Jun 2025 09:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+5Oe+/qsP9gfaCq5yCuWO510xxb4CYOCrtgkQfYUfqw=; b=C3rNVk6/YTgOx18uOwfA/6Kv0u
	aT5jAbMK8fISo1i2ZDI8wtkeuEumGISm2CSaGra/PnZe+QXa8tPOOmCr81d+flSTSM8HI0iz636eM
	Ia1ifm8MCjueTiSq+qkMMy0+C0LY67xLbyYiZgl+XPJ9De4eGjmY48XhvYohx2Fu3l4vKOynwXK5p
	AX+TzQnynxRdFmt6x2zxwaUu3eqxgCtcnYtOwWeZ07IjCnnv4Le+91SiKqzzIJTmv9lmq6cM2zsLG
	y6cAEr5zvlXqp1BUhOuWBM5CmDhd7Vftxr98Q3KoSLCOF+tAtDcNqPF7bPjKKyQupixBLU+lnyzYY
	tHgPAjvw==;
Received: from [185.15.108.45] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uTdnr-0007yN-8k; Mon, 23 Jun 2025 11:49:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Farouk Bouabid <farouk.bouabid@cherry.de>, Johan Jonker <jbx6244@gmail.com>,
 Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: stable@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
Date: Mon, 23 Jun 2025 11:49:26 +0200
Message-ID: <1925003.tdWV9SEqCh@phil>
In-Reply-To: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
References: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_024942_220553_528761B9 
X-CRM114-Status: GOOD (  25.58  )
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

Hi Jakob,

Am Freitag, 20. Juni 2025, 13:35:46 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Jakob Unterwurzacher:
> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
>=20
> Hardware CS has a very slow rise time of about 6us,
> causing transmission errors when CS does not reach
> high between transaction.
>=20
> It looks like it's not driven actively when transitioning
> from low to high but switched to input, so only the CPU
> pull-up pulls it high, slowly. Transitions from high to low
> are fast. On the oscilloscope, CS looks like an irregular sawtooth
> pattern like this:
>                          _____
>               ^         /     |
>       ^      /|        /      |
>      /|     / |       /       |
>     / |    /  |      /        |
> ___/  |___/   |_____/         |___
>=20
> With cs-gpios we have a CS rise time of about 20ns, as it should be,
> and CS looks rectangular.
>=20
> This fixes the data errors when running a flashcp loop against a
> m25p40 spi flash.
>=20
> With the Rockchip 6.1 kernel we see the same slow rise time, but
> for some reason CS is always high for long enough to reach a solid
> high.
>=20
> The RK3399 and RK3588 SoCs use the same SPI driver, so we also
> checked our "Puma" (RK3399) and "Tiger" (RK3588) boards.
> They do not have this problem. Hardware CS rise time is good.
>=20
> Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-=C2=B5Q7 (Ringneck) =
SoM with Haikou baseboard")
> Cc: stable@vger.kernel.org
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> ---
>  .../boot/dts/rockchip/px30-ringneck.dtsi      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64=
/boot/dts/rockchip/px30-ringneck.dtsi
> index ab232e5c7ad6..dcc62dd9b894 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
> @@ -379,6 +379,18 @@ pmic_int: pmic-int {
>  				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
>  	};
> +
> +	spi1 {
> +		spi1_csn0_gpio: spi1-csn0-gpio {
> +			rockchip,pins =3D
> +				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up_4ma>;
> +		};
> +
> +		spi1_csn1_gpio: spi1-csn1-gpio {

naming the node -gpio trigger the bot, I guess a better name would
be something with -pin at the end instead.

> +&spi1 {
> +	/*
> +	 * Hardware CS has a very slow rise time of about 6us,
> +	 * causing transmission errors.
> +	 * With cs-gpios we have a rise time of about 20ns.
> +	 */
> +	cs-gpios =3D <&gpio3 RK_PB1 GPIO_ACTIVE_LOW>, <&gpio3 RK_PB2 GPIO_ACTIV=
E_LOW>;

please also provide a
	pinctrl-names =3D "default"
here.
It feels more futur proof when overriding the pinctrl-0 entry
to also state we only expect that one.

> +	pinctrl-0 =3D <&spi1_clk &spi1_csn0_gpio &spi1_csn1_gpio &spi1_miso &sp=
i1_mosi>;
> +};
> +
>  &tsadc {
>  	status =3D "okay";
>  };
>=20





