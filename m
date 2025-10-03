Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F1BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 02:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSUrmGeg/uQ/v1FGv+9ZOglS5Bty0KqnX6SvrUiZW6U=; b=hTlzh+ZzkLpgJpeXCc+jQvXmuE
	0RdxUAaPdHw110/56WPElq/RzbhBYV362u+ArQ9KVQ7qXjD5d/oG+VLvGcll4ETlmunHKtEH+ueU6
	02wRDeG8+V36Vh0ZE2mGPn5wscHL+q3hufzc8WasoZcNHA7SOCrCLytNuhNJnjAmwu5EIG63hC+uF
	5MU/OiwrqTuospkkTpOci1gKwANe5kn5XtLQUOIVZb4UyPv4gWDI69dELFsAnh+SahpAID/aBLRDy
	Xkhch2d/ie0Fzioqd4sni5syw18N7hJhMtnuKu9FMPiiMocDSVz3Qb4KFgjr9OISzk1b1uX1nycPt
	q2CsBEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ViP-0000000BZBV-1JfE;
	Fri, 03 Oct 2025 02:40:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ViI-0000000BZ8z-1UJf;
	Fri, 03 Oct 2025 02:40:12 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 47B8F1340;
	Fri,  3 Oct 2025 04:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759459111;
	bh=a56SjKdPdnofjnE+gdaq43yJXNVRI3fzkBu8avmK2n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdnzJnesho3L+CyeILTUtBmJApzlTGy0P/ofHtg4o+VcTWbMsZV4OyZm/7UTX7KXW
	 cILy3JsxB3K8fYKrUt2kaqHeoww6GpgIukmLGDj0he29HCb2cVCbEBH28GbVmbs7dB
	 g+pZB5qQ6cpNqbiuKGdtEeR3s/09qzEs26rXUb0w=
Date: Fri, 3 Oct 2025 05:39:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base
 device tree
Message-ID: <20251003023955.GA1492@pendragon.ideasonboard.com>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
 <20251002034708.19248-4-laurent.pinchart@ideasonboard.com>
 <CALWfF7Lhz2brif4xepWZ71mRqMmXKzxqd=0_hO_b6aF6_GkffQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALWfF7Lhz2brif4xepWZ71mRqMmXKzxqd=0_hO_b6aF6_GkffQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_194006_537021_781EBC74 
X-CRM114-Status: GOOD (  19.49  )
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

Hi Jimmy,

On Thu, Oct 02, 2025 at 07:01:53PM -0500, Jimmy Hon wrote:
> A few nitpicks below
> 
> [ snip ]
> > +
> > +#include "rk3588s-orangepi-cm5.dtsi"
> > +
> > +/ {
> > +       model = "Xunlong Orange Pi CM5 Base";
> > +       compatible = "xunlong,orangepi-cm5-base", "xunlong,orangepi-cm5", "rockchip,rk3588s";
> > +
> > +       aliases {
> > +               ethernet0 = &gmac1;
> > +               mmc0 = &sdhci;
> 
> Since sdhci is enabled in the SoM.dtsi, this alias should probably go
> there instead.

Good point, I'll do that.

> > +               mmc1 = &sdmmc;
> > +       };
> > +
> 
> [ snip ]
> 
> > +
> > +       vbus_5v0: vbus-5v0 {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "vbus_5v0";
> > +               regulator-min-microvolt = <5000000>;
> > +               regulator-max-microvolt = <5000000>;
> > +               enable-active-high;
> > +               gpio = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
> > +               vin-supply = <&vcc5v0_sys>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&vbus_5v0_en_pin>;
> 
> The property names in these regulators are not as organized as the
> regulators for the CPU/NPU.

Which properties in particular ? There are more properties in these
regulators, but otherwise the order seem to match.

> > +       };
> > +
> > +       vcc_3v3: regulator-vcc-3v3 {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "vcc_3v3";
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +               startup-delay-us = <50000>;
> > +               enable-active-high;
> > +               gpio = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
> > +               vin-supply = <&vcc5v0_sys>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&vcc_3v3_en_pin>;
> > +       };
> > +
> > +       vcc5v0_sys: regulator-vcc-5v0 {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "vcc5v0_sys";
> > +               regulator-always-on;
> > +               regulator-boot-on;
> > +               regulator-min-microvolt = <5000000>;
> > +               regulator-max-microvolt = <5000000>;
> > +       };
> > +};
> 
> [ snip ]
> 
> > +
> > +&gmac1 {
> > +       clock_in_out = "output";
> > +       phy-handle = <&rgmii_phy>;
> > +       phy-mode = "rgmii-id";
> > +       phy-supply = <&vcc_3v3>;
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&gmac1_miim
> > +                    &gmac1_rx_bus2
> > +                    &gmac1_tx_bus2
> > +                    &gmac1_rgmii_clk
> > +                    &gmac1_rgmii_bus>;
> > +       tx_delay = <0x42>;
> 
> When using "rgmii-id", tx_delay will be ignored. Does the ethernet
> work without this property?

I have to confess this was blindly copied from the BSP :-/ I'll drop the
property and test.

> See the comment by Jonas in another review.
> https://lore.kernel.org/linux-rockchip/da752790-da17-4d26-b9b2-8240b38b3276@kwiboo.se/
> 
> > +       status = "okay";
> > +};
> > +
> > +&gpu {
> > +       mali-supply = <&vdd_gpu_s0>;
> > +       status = "okay";
> > +};
> 
> This is a feature in the SoC itself, so it's not board specific and
> can be put into the SoM.dtsi.

I'm a bit in two minds here. If a carrier board doesn't have a display
output, the GPU isn't very useful (although in theory the GPU can be
used without a display). That's why I decided to enable it in the
carrier board. I suppose it doesn't hurt to enable it in the SoM, worst
case it won't be used and so won't be powered up. I'll move it to the
SoM.

> [ snip ]
> 
> > +
> > +&pd_gpu {
> > +       domain-supply = <&vdd_gpu_s0>;
> > +};
> 
> Same comment regarding moving to the SoM.dtsi

OK.

-- 
Regards,

Laurent Pinchart

