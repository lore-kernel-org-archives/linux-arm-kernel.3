Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE1FCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFeRB9wMbzR5Lg36gM813vRngWsNJslGbR1E32rRVEo=; b=rm/Q5QogcQ9ZYVf/8Xfm0/Cttv
	Dbxhj/zLPXmryLS7EIxWYnZcnV9WMBt7WDSJkNUdnqrMZf0yiH7dEOrMog3wZY7nBEWotrOPdqsG0
	Npi6H0if8snIgImDEcW5yxnzQqko4Fw/vRXSI3KVbs8yo29dEdYDoi9229j7YjrknMvUWN06vEq4j
	8wGd/A16WUqz7S0dA4ocYm1geFnPs1FYNu+Zn2/781KUE/l4YFzsAxP8g2Th/gi8DqFKDCfW8Jl+9
	CpsMEjEPpcnXpBCg3Xu9lUaVG/yI1XLKOfytYSGFP7E1R9shBv4SuqHyaxIOxzNlQ6PVOUY9IVzje
	sIt6hA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw25v-000000093lY-0Z6J;
	Tue, 09 Sep 2025 17:25:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Rz-00000008A7i-37gV;
	Tue, 09 Sep 2025 15:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BFeRB9wMbzR5Lg36gM813vRngWsNJslGbR1E32rRVEo=; b=VKaksjaK+PgOCh7qIEUxmdJKsp
	6NIzmASvKY3ll8cRpNyZ7Zb49fbx4YmufT0Qkv1J2MAlBK8IatmJOOkQscTWmcTN9XCcdcKSy5PE8
	/igNLIQ8mJPOGzvXFT3aN54Eu+aXkAUUWVG2LYoPTFe0deG6ileAh8dqYeCsD4Uwn9xM4HqiJtWl/
	aHjwUIK635NEuWeyVnYbmL/Dv4mOjsvPcyHM7zNQcPCPx3uZlXZ2IImbPKPJVNnX9fROqhaiRzCWc
	GgmAJyrTSNeeNkJMwwyDi2Z5DnWiXWcdaNEHFZ52l8u9R3VOq7Zm506BRLSYoihpDOZTAePtnIaTG
	CDhVtw7A==;
Received: from i53875b3d.versanet.de ([83.135.91.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uw0Rm-0002H9-HC; Tue, 09 Sep 2025 17:39:54 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: FUKAUMI Naoki <naoki@radxa.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
Date: Tue, 09 Sep 2025 17:39:53 +0200
Message-ID: <17232684.geO5KgaWL5@diego>
In-Reply-To: <7d3c3b29-f89f-4801-8fd7-d6d0645095af@kwiboo.se>
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <B055BC95C67D129C+d7a2ff39-8367-48cf-8697-f12fd9f885a4@radxa.com>
 <7d3c3b29-f89f-4801-8fd7-d6d0645095af@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_084009_100606_AA77D7E5 
X-CRM114-Status: GOOD (  22.12  )
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

Am Dienstag, 9. September 2025, 16:48:25 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Jonas Karlman:
> On 9/9/2025 2:28 PM, FUKAUMI Naoki wrote:
> > Hi Jonas,
> >=20
> > On 7/27/25 23:44, Jonas Karlman wrote:
> >> The Radxa E24C is a compact, high-performance network computer
> >> developed by Radxa, based on the Rockchip RK3528A SoC.
> >>
> >> Add initial device tree for the Radxa E24C.
> >>
> >> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >> ---
> >> Schematics: https://dl.radxa.com/e/e24c/docs/radxa_e24c_v1200_schemati=
c.pdf
> >> ---
> >>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >>   .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 519 ++++++++++++++++=
++
> >>   2 files changed, 520 insertions(+)
> >>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/d=
ts/rockchip/Makefile
> >> index 0662fcf00628..dc62fd5305be 100644
> >> --- a/arch/arm64/boot/dts/rockchip/Makefile
> >> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> >> @@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399pro-rock-pi-n=
10.dtb
> >>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-armsom-sige1.dtb
> >>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-nanopi-zero2.dtb
> >>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-radxa-e20c.dtb
> >> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-radxa-e24c.dtb
> >>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-rock-2a.dtb
> >>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-rock-2f.dtb
> >>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3562-evb2-v10.dtb
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts b/arch=
/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
> >> new file mode 100644
> >> index 000000000000..225f2b0c5339
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
> >> @@ -0,0 +1,519 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/leds/common.h>
> >> +#include "rk3528.dtsi"
> >> +
> >> +/ {
> >> +	model =3D "Radxa E24C";
> >> +	compatible =3D "radxa,e24c", "rockchip,rk3528";
> >> +
> >> +	aliases {
> >> +		ethernet0 =3D &gmac1;
> >> +		i2c0 =3D &i2c0;
> >> +		i2c1 =3D &i2c1;
> >> +		i2c5 =3D &i2c5;
> >> +		mmc0 =3D &sdhci;
> >> +		mmc1 =3D &sdmmc;
> >> +		rtc0 =3D &hym8563;
> >> +		rtc1 =3D &rk805;
> >> +		serial0 =3D &uart0;
> >> +	};
> >> +
> >> +	chosen {
> >> +		stdout-path =3D "serial0:1500000n8";
> >> +	};
> >> +
> >> +	adc-keys {
> >> +		compatible =3D "adc-keys";
> >> +		io-channels =3D <&saradc 0>;
> >> +		io-channel-names =3D "buttons";
> >> +		keyup-threshold-microvolt =3D <1800000>;
> >> +		poll-interval =3D <100>;
> >> +
> >> +		button-maskrom {
> >> +			label =3D "MASKROM";
> >> +			linux,code =3D <KEY_SETUP>;
> >> +			press-threshold-microvolt =3D <0>;
> >> +		};
> >> +	};
> >> +
> >> +	gpio-keys {
> >> +		compatible =3D "gpio-keys";
> >> +		pinctrl-names =3D "default";
> >> +		pinctrl-0 =3D <&gpio0_a0_user>;
> >> +
> >> +		button-user {
> >> +			gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> >> +			label =3D "USER";
> >> +			linux,code =3D <BTN_1>;
> >=20
> > I prefer to assign BTN_0 to the 1st button :)
>=20
> The E20C (and other RK boards) already use BTN_1 for user button, it
> only seem to be the recently added E54C that is using BTN_0.
>=20
> For consistency I suggest we keep using BTN_1 for this user button and
> possible fixup E54C, if you want to use same button for all variants.

Yep, that would also keep the amount of userspace-facing changes
minimal.

Heiko




