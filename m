Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A83C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yIRsFHirJ37KBcLD30+yZG2Opb6u/GoLSe5oqPfVTk=; b=3rAs2LCvMehiHImyeJNOcPPMtN
	vF0Ad45lkiGjcAfXUaPtHwYqGH2iTiB5cfeLJt5WNsICWmUci7HjSiJ4GehCc0T/P9w7+ioCtrgjO
	VosAiQLzk79mW+L8X8NoznzTW2ljCtFi488Zse4KI/zjMXi2YSKr927GIk0VFhO/u2tntI7CLsmSY
	jaF64l01BTBp+0iYSri0oJqPypatr/+9hssZkUit8UgBTamz62S4nSx1Nk8praGk/jvbBql5jX7y1
	wsacYtWIEl0qVsv9VSqCTdN/zFoQ0NmFt6epg/pI59oucE6f33zMuPBg/wQDmWMDhG18e7saQPHxW
	ciq91UHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tucpP-00000006wWz-0MG7;
	Tue, 18 Mar 2025 19:42:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucnh-00000006wMa-0GDe;
	Tue, 18 Mar 2025 19:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2yIRsFHirJ37KBcLD30+yZG2Opb6u/GoLSe5oqPfVTk=; b=g/KHEQ5HuI0l8F6zgsgk6oHdFg
	TfUN3InEJ5E+MTgL/itqTJpX3ootj1FWXqQzd7rl8//QbBWqScJDg5ZJHBVCXwuXnDC/AItAkGxmG
	cB/c0o1uv67ZeVYvwIp+bheSnj0X88axXENu7NtMXnSsKQ+LnkD5hKCtkrSiB8febnkkdegLDZqQ+
	CaufOzzMeL6qvCk2QtJIwIGxo7nTxLSMV7wriKfDEcPJ30TXHeCcJ3qTuxS0AHoKHQzixfVBjMG8F
	B6vNsj6FGbSSWvoukwz7twEmJgz0NWqNPHeBnQBYqby6zUcSc7iRHonK3vEaEXt4MdPogXXudNs8o
	2gUG8i4A==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tucnY-0001yR-FC; Tue, 18 Mar 2025 20:40:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Improve gmac phy setup for QNAP-TS433
Date: Tue, 18 Mar 2025 20:40:23 +0100
Message-ID: <2984786.e9J7NaK4W3@diego>
In-Reply-To: <20250318184550.47642-2-uwe@kleine-koenig.org>
References: <20250318184550.47642-2-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_124033_126066_12A625C2 
X-CRM114-Status: GOOD (  18.16  )
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

Hey Uwe,

Am Dienstag, 18. M=C3=A4rz 2025, 19:45:49 MEZ schrieb Uwe Kleine-K=C3=B6nig:
> Instead of relying on the MDIO broadcast address (0) talk to the phy on
> its configured address. Also add the phy reset gpio which was found by
> Heiko inspecting the U-Boot vendor source code. He is still trying to
> recover.

I believe these want to be two separate changes ... as indicated by
the "Also ..." in the commit message:
=2D reset-gpio addition=20
=2D mdio address change

and I guess both could possibly have a

=46ixes: 9da1c0327d58 ("arm64: dts: rockchip: Add basic support for QNAP TS=
=2D433")


Heiko

> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> ---
>  .../arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> index 7bd32d230ad2..411f8ac7994b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> @@ -481,9 +481,14 @@ eeprom@56 {
>  };
> =20
>  &mdio0 {
> -	rgmii_phy0: ethernet-phy@0 {
> +	rgmii_phy0: ethernet-phy@3 {
> +		/* Motorcomm YT8521 phy */
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
> -		reg =3D <0x0>;
> +		reg =3D <0x3>;
> +		pinctrl-0 =3D <&eth_phy0_reset_pin>;
> +		pinctrl-names =3D "default";
> +		reset-assert-us =3D <10000>;
> +		reset-gpios =3D <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;
>  	};
>  };
> =20
> @@ -556,6 +561,12 @@ &pcie3x2 {
>  };
> =20
>  &pinctrl {
> +	gmac0 {
> +		eth_phy0_reset_pin: eth-phy0-reset-pin {
> +			rockchip,pins =3D <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
>  	keys {
>  		copy_button_pin: copy-button-pin {
>  			rockchip,pins =3D <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
>=20
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
>=20





