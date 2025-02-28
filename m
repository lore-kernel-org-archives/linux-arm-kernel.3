Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031F3C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmq1mAp+ubUa/2vrvXTFJdel4a+NQJQNinqAYsmH9OA=; b=lbfX2d2wiAkmAK8hKhTM7BrQnb
	XaBhyoZUddty86rBn/XWhtyo3gpsOWmeCIcKd4siIzQAQB77bm6nuYzcXswVNjyl5jMcxygjrC/TI
	2ffNkAgqJ7389oz8GH8TPvKIdq816PPTyXyZfBgmRAf0z+VNFghs6K4VGPrPw3BuGidQ6H7CXWL+N
	iDl+d6SS30GDfH3gmgw/qZOJl9j4r7qT8UuNl8zibWfNouGY6f4KkGd2A4VqaQSVW234xD9b7fuX8
	zvxHwhWcIhi0D4nHIQAJWBRztTQzU99kl8igH93EEsGSWN+uhYimGLnyqa7IBNQ5QFs3T7mWf4s6q
	5Bs0XPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnz4w-0000000Aprt-0YbO;
	Fri, 28 Feb 2025 12:02:54 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyKh-0000000AieW-25mI;
	Fri, 28 Feb 2025 11:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1740741302; bh=isHbY/IQxLptRIvosa0pjZEubSG4kQQCkajcw2CB5gI=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=IrXbWTDt42YWW0LfUD6JRUzdY30YbkSXYXfEjbBQvSh5oqGzgCG9/B0KsLLNdchIZ
	 lX04oNsne8r+Azz+kmHDH5/Hb5ZfaTLc2WAtKoctfQhgf8UqqCjBx4hqYV/CZT6zPj
	 4EQUlYQfEAf4nGoU9ZHqQaaeLzDl17phtaILEnYw=
Date: Fri, 28 Feb 2025 12:15:02 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Cenk Uluisik <cenk.uluisik@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Florian Klink <flokli@flokli.de>, 
	Muhammed Efe Cetin <efectn@protonmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH UNTESTED 3/4] arm64: dts: rockchip: Enable HDMI1 on
 Orange Pi 5 Plus
Message-ID: <5qi24bxuamu3agtldyxhrnlefao6zy2mw2qmx62ycsdg3v6sbz@2jeawstukcyd>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Cenk Uluisik <cenk.uluisik@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Florian Klink <flokli@flokli.de>, 
	Muhammed Efe Cetin <efectn@protonmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250227235623.1624-1-honyuenkwun@gmail.com>
 <20250227235623.1624-4-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227235623.1624-4-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_031507_990143_6E4EDE01 
X-CRM114-Status: GOOD (  19.23  )
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

Hello Jimmy,

On Thu, Feb 27, 2025 at 05:56:22PM -0600, Jimmy Hon wrote:
> Enable the second HDMI output port on the Orange Pi 5 Plus

RK3588 hardware design guide states that:

  - When working in HDMI2.1 mode, HDMI0_TX_ON_H is configured as low level,
    Q1700, Q1701, Q1702, and Q1703 are not turned on.
  
  - When working in HDMI2.0 and below modes, HDMI0_TX_ON_H is configured as high
    level, Q5007, Q5004, Q5005, and Q5006 are turned on, and the 499ohm resistor
    to ground and the 50ohm pull-up resistor at the Sink end form a DC bias of
    about 3V.
  
  If you only need to support HDMI2.0 and below modes, Q5007, Q5004, Q5005, and
  Q5006 cannot be omitted. It is necessary to ensure that the tube is not turned
  on when the machine is not turned on, because the HDMI CTS Test ID 7-3 TMDS
  Voff test item requires that the Voff voltage must be within AVcc+-10mV when
  the DUT is not powered on, otherwise this test item cannot pass. 2: The Coss
  of the control MOS tube cannot be too large, otherwise it will affect the
  signal quality. It is recommended to follow the reference figure model or the
  corresponding Coss value.

And Orange Pi 5 schematic (which has almost the same circuit as Plus variant)
states this explicitely too:

  https://megous.com/dl/tmp/5dc98e91dfee3b5a.png

The same applies to HDMI1.

Maybe it would be better to pull up HDMI1_TX_ON_H more explicitely for now via:

&hdmi1 {
+ pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+              &hdmim1_tx1_scl &hdmim1_tx1_sda
+              &hdmi1_tx_on_h>;
};

&pinctrl {
...
+ hdmi {
+         hdmi1_tx_on_h: hdmi1-tx-on-h {
+                 rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+         };
+ };
...
};

AFAIK FRL is not supported, yet, so this may be a better default for HDMI1_TX_ON_H.

In any case,

Reviewed-by: Ondrej Jirman <megi@xff.cz>


And I've also tested and used identical patch for a few weeks already on my
Orange Pi 5+. :)

Kind regards,
	o.

> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> ---
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 0f874b87b47e..53797f633d3a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -26,6 +26,17 @@ hdmi0_con_in: endpoint {
>  		};
>  	};
>  
> +	hdmi1-con {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi1_con_in: endpoint {
> +				remote-endpoint = <&hdmi1_out_con>;
> +			};
> +		};
> +	};
> +
>  	ir-receiver {
>  		compatible = "gpio-ir-receiver";
>  		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> @@ -125,10 +136,30 @@ hdmi0_out_con: endpoint {
>  	};
>  };
>  
> +&hdmi1 {
> +	status = "okay";
> +};
> +
> +&hdmi1_in {
> +	hdmi1_in_vp1: endpoint {
> +		remote-endpoint = <&vp1_out_hdmi1>;
> +	};
> +};
> +
> +&hdmi1_out {
> +	hdmi1_out_con: endpoint {
> +		remote-endpoint = <&hdmi1_con_in>;
> +	};
> +};
> +
>  &hdptxphy0 {
>  	status = "okay";
>  };
>  
> +&hdptxphy1 {
> +	status = "okay";
> +};
> +
>  &hym8563 {
>  	interrupt-parent = <&gpio0>;
>  	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> @@ -342,3 +373,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint = <&hdmi0_in_vp0>;
>  	};
>  };
> +
> +&vp1 {
> +	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
> +		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
> +		remote-endpoint = <&hdmi1_in_vp1>;
> +	};
> +};
> -- 
> 2.48.1
> 

