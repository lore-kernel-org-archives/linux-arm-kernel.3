Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CE8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VgqZk2+M4O8X70VgHeDWO5bVKrL7Qb344B9KtlXxf0=; b=NaCJj3ls3sXo3G9euOnvTM6FIR
	cLksLlNUQScRcvVPErI+9uFeWMW6j67pdA3Jh7Ur0fQ34HIx6FmKjYixk0bLzQM1YhEwK/8cSyVPH
	Zlr3T8rJ+X08KoGMJWxsG8Ii1fqU6Le4SDH4VPoeKasAxyFFuSLuQo1fP4xMWDlvMoJiCOGAnknsg
	UOKtbHqwJDPsLaza+gq2ebNgHDEA5O/LaAvC3/lXIE5P4prINFGZJnGLUEvK3a/U+98L9IQD+RNQ/
	n2tCQtVuOUSXzhhC2zoOeRt3yOhnjGoIbAwGNzoUVsyUIItEBmPrt7qwz7FJadTlkd/A+5Pe/iyDN
	TvtXUQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB43-0000000FgGp-1qj1;
	Tue, 07 Jul 2026 19:02:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB40-0000000FgFN-0Mvi;
	Tue, 07 Jul 2026 19:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0VgqZk2+M4O8X70VgHeDWO5bVKrL7Qb344B9KtlXxf0=; b=IcdSnAl0GWmvivyH9PIGEfrrG/
	m+vhRS1GrEpSZnu3BwWkB0bW+kHnF1uCU4b0j8snGm8yeWJwaeo0EXqHRVrD4/uIgY/kP4qrDHYJW
	HWkGEbBSUPSeC+wC/4zOZBwpAgngtskkQx142Op/JWy93GHP3lNc7cP0NYr1gXG7IAn+qZGAOY/j1
	T18dIjxuFJjTQZVAHJsccGj9xEZWnFUxizEVjfQEzdosal+0NkZaGJ1ofZNrZVZMU+fHObcoIgpDy
	7GAorD5oPsPWJ8hdqKSvzTUEeqvi/65SFE+RxQQddNqr5h5pKFzbCC1XunfOZ+gExBV0Gt5sTpODv
	XNwL81ZQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Mayer <bleemayer@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Tue, 07 Jul 2026 21:02:30 +0200
Message-ID: <48203626.fMDQidcC6G@phil>
In-Reply-To: <20260705181920.8633-1-bleemayer@gmail.com>
References: <2960762.AiC22s8V5E@diego> <20260705181920.8633-1-bleemayer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_120236_133415_6424EFDD 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Brian,

I've applied the change with some changes.
Please the comments below in mind for future patches, but there is no
need to send another version:


Am Sonntag, 5. Juli 2026, 20:19:19 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Brian Mayer:
> Hello again, to clarify: I tested the v1 patch in my radxa cm5, but since
> this v2 only contains name changes I didn't test. I added the missing
> agent tag and am sending the patch inline. Thanks.
>=20
> The Radxa CM5 IO carrier has a Haoyu HYM8563 real-time clock on I2C6 at
> address 0x51, with its interrupt line on GPIO0_B0 and a CR1220 backup
> battery holder. Without a device tree node, no /dev/rtc* appears even
> when CONFIG_RTC_DRV_HYM8563 is enabled.
>=20
> Describe the RTC, wire the interrupt pin with a pull-up, mark it as a
> wakeup source, and point the rtc0 alias at it so RTC_HCTOSYS/SYSTOHC use
> the external clock. Wiring matches Radxa's downstream board support and
> uses schematic names for the rtc_int_l pinctrl entry.

Please way less AI fluff. The patch content show that you're wiring up the
interrupt + pinctrl etc.

Also, please no personal "Hello again ...." in the actual commit message.
The text above is the text that ends up in the git log for your change,
so should be short and to the point.

I've shortened it to:
=2D----
Describe the Haoyu HYM8563 RTC connected to I2C6 on the Radxa CM5 IO
carrier including its interrupt line.
=2D----


> Assisted-by: Grok:grok-build
> Signed-off-by: Brian Mayer <bleemayer@gmail.com>
> ---

Personal comments, remarks etc should be here, below the 3 dashes and
above the diffstat. That way we can still read them, but they don't
end up in the git history.


>  .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> Changes in v2:
> - Rename pinctrl to rtc_int_l / rtc-int-l to match schematics
> - Drop Tested-by (covered by Signed-off-by)
> - Add Assisted-by: Grok:grok-build
> - Send inline with git send-email (not as attachment)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> index af4a9bc01..d22db4d18 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> @@ -19,6 +19,7 @@ / {
>  	aliases {
>  		ethernet0 =3D &gmac1;
>  		mmc1 =3D &sdmmc;
> +		rtc0 =3D &hym8563;
>  	};
> =20
>  	chosen {
> @@ -198,6 +199,18 @@ usbc0_dp_altmode_mux: endpoint {
>  			};
>  		};
>  	};
> +
> +	hym8563: rtc@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "hym8563";
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&rtc_int_l>;
> +		wakeup-source;
> +	};
>  };
> =20
>  &i2s5_8ch {
> @@ -221,6 +234,12 @@ usbc0_int: usbc0-int {
>  		};
>  	};
> =20
> +	hym8563 {
> +		rtc_int_l: rtc-int-l {
> +			rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +

please sort nodes alphabetically (hdmi -> hym8563)
I did that when applying.


Thanks
Heiko


>  	hdmi {
>  		hdmi0_tx_on_h: hdmi0-tx-on-h {
>  			rockchip,pins =3D <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
> base-commit: 87320be9f0d24fce67631b7eef919f0b79c3e45c
>=20





