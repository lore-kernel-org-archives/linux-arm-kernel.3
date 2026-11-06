Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80555606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gsmV1XLQ;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nyKGNyB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CHrI1kjHp/5iGoHZkZHTx8sVaxFMZq6Cnqe7sXoFPl4=; b=gsmV1XLQtDF1NsflqFbd4koZe1
	aLGD3vF+ThaLxGDaudTBcpORoRFWLjXDPujiGOJPDv2Et47pkE/CVtlWBXb5Zxs4CDnPf4fF5S7i+
	Jwgf75PM3n6pW69NsRrPrjz+rC+kMmrRSmOpcOP89mGAgSUtyviIHC/Rwb9zP+Rq4VTPpK2oKNzyM
	tQaYqRl4Pi9LYlG+Eipbcy9N8Ni34UpglUP2v8QQWiFghxOU9+zEFhRWM5mxSide3oc0xDGnlrpO8
	rDOsG0LuuNT6Q7hI5QqKLa/M/8vhBSZp0jQWgnloaaFSCJYnIsNjiD0grjdfnjQbpfFfZuzRvRwfM
	lC2g9BIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPF12-0000000BWh6-3Yyb;
	Fri, 06 Nov 2026 08:09:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPF10-0000000BWfw-0CNe;
	Fri, 06 Nov 2026 08:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CHrI1kjHp/5iGoHZkZHTx8sVaxFMZq6Cnqe7sXoFPl4=; b=nyKGNyB1GN6bxn4Vmwjn3rF3UC
	+S8e/L/utkMkZDWQB31Si0I9y2MoS9aqjmU0uqp4avOKj855x9tM96oti7qTMCttyqW2YCf3oNTTQ
	XtOiVdPRnJUSuPtzt3+81bNXLLSfJYw2oM69FTSKx1A1Mu2MK/Qud1sdG97DC7e+8dzaB7hKYSHQA
	ZtK85bgLt0fQ46ldrAbI4dWVGfomHEYciJPMfriFCLE2SkMkuEZ3PJh+712CrwsWCKQsbnSH7Q2uz
	IWQHV8KK4ncTo3QbYNe2guilYO+4veWMqUbly7fXO5B3W+rLAu7PvrBYp4xwqc4P5BbI4PMH8G63s
	FFUKU4Qg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Fri, 06 Nov 2026 09:09:30 +0100
Message-ID: <6900453.LvFx2qVVIh@diego>
In-Reply-To: <20261106061835.1316-1-yaozhonguwl@gmail.com>
References: <20261106061835.1316-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_000938_109344_8D4F1A8C 
X-CRM114-Status: GOOD (  23.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Freitag, 6. November 2026, 07:18:35 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yaozhong Li:
[...]
> - Describe the slot's own supply, vcc_sd, and use it as the sdmmc
>   vmmc-supply (Heiko). It is fed from vcc3v3_sys, and GPIO4_D6 controls
>   the slot power switch: holding the pin low leaves the card unpowered.
>   This is the same arrangement as vcc3v0_sd on the ROC-PC. The existing,
>   unreferenced lcd_panel_reset pinctrl entry also names GPIO4_D6; the
>   vendor tree uses the pin only for vcc_sd.

I you're reading the schematics, this is wrong.

In the schematics file Shawn linked to earlier (and also the one I have),
GPIO4_D6 is connected to the reset-pin of an AT18.

While the vcc3v0_sd is an always on regulator coming from vcc3v3_sys.
As stated in v2, see page 20 of your schematics.

So you essentially just set vmmc-supply to vcc3v3_sys. As I said that is
merely descriptive.


Heiko

> - Link to v2: https://lore.kernel.org/all/20261105102556.1365-1-yaozhongu=
wl@gmail.com/
>=20
> Changes in v2:
> - Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
>   instead of dropping it (Heiko)
> - Rewrite the commit message (Heiko)
> - Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhong=
uwl@gmail.com/
>=20
> On the boot-time issue described in v2: with the vmmc-supply in place
> the sdmmc controller now probes after the GRF io-domain here, and a card
> present at boot came up in SDR104 in 5 of 5 warm boots, against 0 of 8
> before. That is a change in probe order rather than a fix for the
> ordering problem itself.
>=20
>  .../boot/dts/rockchip/rk3399-firefly.dts      | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa..03858a4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -233,6 +233,19 @@ vcc5v0_typec: regulator-vcc5v0-typec {
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
> +	vcc_sd: regulator-vcc-sd {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vcc_sd_en>;
> +		regulator-name =3D "vcc_sd";
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc3v3_sys>;
> +	};
> +
>  	vcc_sys: regulator-vcc-sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sys";
> @@ -731,6 +744,12 @@ wifi_enable_h: wifi-enable-h {
>  		};
>  	};
> =20
> +	sdmmc {
> +		vcc_sd_en: vcc-sd-en {
> +			rockchip,pins =3D <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	usb-typec {
>  		vcc5v0_typec_en: vcc5v0_typec_en {
>  			rockchip,pins =3D <1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -777,7 +796,7 @@ &sdio0 {
> =20
>  	/* Power supply */
>  	vqmmc-supply =3D <&vcc1v8_s3>;	/* IO line */
> -	vmmc-supply =3D <&vcc_sdio>;	/* card's power */
> +	vmmc-supply =3D <&vcc3v3_sys>;	/* card's power */
> =20
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> @@ -804,6 +823,9 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc_sd>;
> +	vqmmc-supply =3D <&vcc_sdio>;
>  	status =3D "okay";
>  };
> =20
>=20
> base-commit: 940de590b839f71d6dc846160534bf202401b8b7
>=20





