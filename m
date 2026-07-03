Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C92C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2RhWiRaq5KKyZREhRzsjIz2JBdJD+UIY43UbXOpiYU=; b=kaUeGsnvNCFIZo+ir+lgBhiUXx
	bJuyXtvnCCFAr4xzSGuPWaMAExXtUe9g2jHXKvaQ/ksx56uf9Dfny2iCrSLjyflG6ZNxmIuwaUcEl
	w3bJD81zJQ6A+pZuzs7k31Z0LLs0elsSEY5BxXszl2+hAOEbIYUfM+vdhl+DqVZ/AFeNH3rJXEDan
	TJEb5AMViAdsyqn8NhDGnalKl+ouwF9oxLQ9TNPIpz0Mrjj7mQPVKhWxLUPtt2VwyzKDwcmzjSnny
	TTWB8VvciVyDImiGfUIBtQeelYZtkuIBaLHBqHLMOB0/YjdE2jr/8gOgj8UOS6JoF2eggZDLD0rTy
	VKSMNcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcA3-00000006odg-02AB;
	Fri, 03 Jul 2026 11:34:23 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfc9z-00000006ocp-3WfE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:34:21 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783078457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2RhWiRaq5KKyZREhRzsjIz2JBdJD+UIY43UbXOpiYU=;
	b=kThcjrJ3WwXZnD8HRzSOzOZBH6RUdXCDi3/TyHik03H6pompo8fzfDkse2x5Aswb48ArUK
	Ak6P2WdQqqK8gb6Vvu8BOa5jNcY/e6U4OL47r87llRCAwfFEJoO3KzV8B9+2Wh+LqmUoD7
	OApbtqFNRBsjncxDmc+4ewLrNWvQZD/TOuKFicS3ZxVoN/rqX1eG6fRx9rQDZESOLaBeVV
	H4kOvYwn4UnX51JIzt/OxyoLXLYd3fXBBR6EW7fYzE00uQzGwLjyaP6UVYV4+ztjk5wX0u
	qZEpLYlXM8RPvPt/vKXl/dGKONQkpHxpz1eEeSXzkTmv77YTvRdtr3iMa9zBIw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 13:34:12 +0200
Message-Id: <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 12/12] arm64: dts: rockchip: add support for NanoPi M6
 board
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <joachim.eastwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-12-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-12-8344a1559519@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_043420_208095_49472EDF 
X-CRM114-Status: GOOD (  14.31  )
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

Hi,

On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
>
> The NanoPi M6 board shares most of the features of the R6 boards.
>
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC
>
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts | 200 +++++++++++++++=
++++++
>  2 files changed, 201 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 761d82b4f4f2..2867830eddf8 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-gameforce-ace.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-indiedroid-nova.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-khadas-edge2.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-m6.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588s-nanopi-m6.dts
> new file mode 100644
> index 000000000000..64448bf55cf7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588s-nanopi.dtsi"
> +
> +/ {
> +	model =3D "FriendlyElec NanoPi M6";
> +	compatible =3D "friendlyarm,nanopi-m6", "rockchip,rk3588s";
> +
> +	sound {
> +		compatible =3D "simple-audio-card";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_det>;
> +
> +		simple-audio-card,name =3D "realtek,rt5616-codec";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,mclk-fs =3D <256>;
> +
> +		simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
> +
> +		simple-audio-card,widgets =3D
> +			"Headphone", "Headphones",
> +			"Microphone", "Microphone Jack";
> +		simple-audio-card,routing =3D
> +			"Headphones", "HPOL",
> +			"Headphones", "HPOR",
> +			"MIC1", "Microphone Jack",
> +			"Microphone Jack", "micbias1";
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s0_8ch>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&rt5616>;
> +		};
> +	};
> +

[...]

> +&i2c7 {
> +	clock-frequency =3D <200000>;
> +	status =3D "okay";
> +
> +	rt5616: codec@1b {
> +		compatible =3D "realtek,rt5616";
> +		reg =3D <0x1b>;
> +		clocks =3D <&cru I2S0_8CH_MCLKOUT>;
> +		clock-names =3D "mclk";
> +		#sound-dai-cells =3D <0>;
> +		assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT>;

s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ ?

See these links for details:
https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tec=
h.com/
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/co=
mmit/?h=3Dv7.2-clk/fixes&id=3D946352b2f88fd2378f0341312e47dff1e8dc2fac

Cheers,
  Diederik

> +		assigned-clock-rates =3D <12288000>;
> +
> +		port {
> +			rt5616_p0_0: endpoint {
> +				remote-endpoint =3D <&i2s0_8ch_p0_0>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2s0_8ch {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2s0_lrck
> +		     &i2s0_mclk
> +		     &i2s0_sclk
> +		     &i2s0_sdi0
> +		     &i2s0_sdo0>;
> +	status =3D "okay";
> +
> +	i2s0_8ch_p0: port {
> +		i2s0_8ch_p0_0: endpoint {
> +			dai-format =3D "i2s";
> +			mclk-fs =3D <256>;
> +			remote-endpoint =3D <&rt5616_p0_0>;
> +		};
> +	};
> +};
> +
> +&pcie2x1l1 { /* M.2 E-key 2230 */
> +	vpcie3v3-supply =3D <&vdd_mpcie_3v3>;
> +};
> +
> +&pcie2x1l2 { /* M.2 M-key 2280 */
> +	pinctrl-0 =3D <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken=
>;
> +	vpcie3v3-supply =3D <&vcc_3v3_pcie>;
> +};
> +
> +&pinctrl {
> +	gpio-leds {
> +		sys_led_pin: sys-led-pin {
> +			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		user_led_pin: user-led-pin {
> +			rockchip,pins =3D <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	headphone {
> +		hp_det: hp-det {
> +			rockchip,pins =3D <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie2_2_pwren: pcie2-2-pwren {
> +			rockchip,pins =3D <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {
> +		typec5v_pwren: typec5v-pwren {
> +			rockchip,pins =3D <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&u2phy3 {
> +	status =3D "okay";
> +};
> +
> +&u2phy3_host {
> +	phy-supply =3D <&vcc5v0_host_20>;
> +	status =3D "okay";
> +};
> +
> +&usb_host1_ehci {
> +	status =3D "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status =3D "okay";
> +};


