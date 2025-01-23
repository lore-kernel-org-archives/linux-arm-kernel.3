Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5556C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zMurHlZ7uGtqY8vr+C9le803uP9XgfHXwzvJheucbI=; b=q7hygnUe997c7X0/pMXsVpPTCv
	vykIA1rIA5BkXFRRRw0i8FKBd8de43lUr4+Z8ZZR2mYa9FrA6BqvSOD6bKPQhoNwW44LODi4+lvmG
	Z3acYOQ2ArSAPjq6n1OgrWdfuGbdASJ1UsXb5inR/cqGmLOZNGoHM3oOQ0PHLWPT+DuMX+bpy9q5x
	skQUdIzUvmaV/Up1g5329UzkW/k/3EO6pD6OtI4SqmYTz3llKF1mRySWne/mtUCMFjQ1zmDYlM2JY
	RpkP9yR8wgU3HQjGEaTUFTMy5/Je+PLgAzw824N0z/aB9uCJQJxC6dCxwiGrp4k086TCHOBxT+ih0
	JrBzV9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavTX-0000000CLSy-1K7R;
	Thu, 23 Jan 2025 11:34:19 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavS3-0000000CL8U-3uKG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:32:49 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30737db1ab1so6928021fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737631966; x=1738236766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+zMurHlZ7uGtqY8vr+C9le803uP9XgfHXwzvJheucbI=;
        b=vkHMKnig0ibUj3L79+7mpjx9UyVOLx4HvCtT43+3agczXq90VSPcivD8bbx/LRT0i3
         mPra7G5COno6CehNYh0s0vkE8ulJGp9uOwBogqNKDg9ONuURxAtRleBBwhi1IAnd5QGi
         YK2FRKZoLjBdR7DCrHSqqDb6QGs3+2TV+7RddvqX0UdCRT5ndMgpZ7/Cs5wHP5bdSYYI
         iw4IubwF/v4B26yzcxkEi+KZ5y9lPatoOn/olaP3wT5EobtO6aT2yQIN0SMf2BmpghLp
         EUEcPabKTu9RYocu0d3a8M18gSbx+eClJtmHZe2mKH7UzVJRVZFdmqeSfstwipGyGV/o
         mw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737631966; x=1738236766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zMurHlZ7uGtqY8vr+C9le803uP9XgfHXwzvJheucbI=;
        b=mNCCYM95byHCkRC8I7XUJx6nsrton7b16tuWQZ3xPmyJ9XGyPbDcyMiesjRoVCG72d
         Z/8HcDU6lbWYgv08Gud0caLwWiSnvXDAUMM0n0KCD+HNv2vKXNAQ2jtDBIrvDe0rKgF2
         e3/RVRhuKAyW6IUm11k4+FV+BGSh86e48/3ydQa0/eZ/XjtqqMuMYF1w9on1nOu0YK/P
         Pa1vFPQmQkS9obxMamnYIF34FCt1MfVr67YzSZiwWmYAb16ifDTI16f0aSSTLC/F0Yrn
         b/ZULA1sP3xlwuJb13JYi5e2OjW3Qd5HVV6jhB9WhUYEuiwxJOw5ED6aqi+SaE5R/sJP
         Qe4A==
X-Forwarded-Encrypted: i=1; AJvYcCXRnUOzC5XTQxzyU0fezMQU2l/cCNT9nPVUh75kP4JPkOzW82vZVU1yb2jtowBv04yfv0UWQfFnRZjlh7io7EuI@lists.infradead.org
X-Gm-Message-State: AOJu0YxNt093UM4xsEeOO81DTuIVvfr5at1iZ1xMAh3oDCeGlpCZ/RTr
	QkL2sv4U94G+tcrXHIw9hHmL7lZxsAXrZDJWBgq2OvKXr+luRBxkCtX2SvH9oKo=
X-Gm-Gg: ASbGnctthaGLEHfGp3icUr4mWvpY/qJM8hJuAo9QHXlAMfJ13TL9g6psBkB9v9MaRle
	UjvTL4ATu9PklNpai5RPFEWTJkCBEMZ5hegSyCkkHm7wZ+GeEt3OSazEJ+VhfWiVJ7bpVo6kg6X
	yrXUrZ2mCVqLRhc/FAIOH56frrVcxjlYgSO5s42fWzohLM68TgNhB/uBlHqTOWE51WxzE6adyOa
	BorNR8IOkXTGT5ZONVywEQQj9s4+rL58Bo2XPpU1d5OIkOVXQ12wNw7F1U1eYU2/8emQ8JZTE3C
	zlfqENIjuB/ym7JeLCdJ+VpnqJ0bPLz8T6vFuq93BeXAl+2nLjlVIGLkfjiA
X-Google-Smtp-Source: AGHT+IGv3eRW1iX8AGSWOKHG3VFmFTMTVFcrPCnNhNO4BTbpmlhnROuDMhCvalg4dPHCeDzpS5d6Ng==
X-Received: by 2002:a2e:b90d:0:b0:304:4cec:29f9 with SMTP id 38308e7fff4ca-3072ca60ef9mr67919831fa.3.1737631966038;
        Thu, 23 Jan 2025 03:32:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm30489481fa.3.2025.01.23.03.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:32:44 -0800 (PST)
Date: Thu, 23 Jan 2025 13:32:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 14/14] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
Message-ID: <u3qiasthay5xrtu4bfu5ihag7x2wajrpbktrcs7bxutvc2iwrk@on5ymtwq5vwx>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-15-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033247_970434_83491CA8 
X-CRM114-Status: GOOD (  23.87  )
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

On Thu, Jan 23, 2025 at 06:07:47PM +0800, Damon Ding wrote:
> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
> - Set pinctrl of pwm12 for backlight
> - Enable edp0/hdptxphy0/vp2
> - Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL
> - Add aux-bus/panel nodes
> 
> For RK3588, the PLL_V0PLL is specifically designed for the VOP2. This
> means the clock rate of PLL_V0PLL can be adjusted according to the dclk
> rate of relevant VP. It is typically assigned as the dclk source of a
> specific VP when the clock of relevant display mode is unusual, such as
> the eDP panel 'lg,lp079qx1-sp0v' paired with RK3588S EVB1, which has a
> clock rate of 202.02MHz.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Remove brightness-levels and default-brightness-level properties in
>   backlight node.
> - Add the detail DT changes to commit message.
> 
> Changes in v3:
> - Use aux-bus instead of platform bus for edp-panel.
> 
> Changes in v4:
> - Add comments related to the use of panel compatible "lg,lp079qx1-sp0v"
>   in the commit message.
> 
> Changes in v5:
> - Use "edp-panel" instead of "lg,lp079qx1-sp0v"
> - Remove unnecessary comments in commit message
> - Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL
> 
> Changes in v6:
> - Add PLL_V0PLL related descriptions in commit message
> ---
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> index bc4077575beb..a8c151b41e21 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "rk3588s.dtsi"
>  
> @@ -238,6 +239,41 @@ &combphy2_psu {
>  	status = "okay";
>  };
>  
> +&edp0 {
> +	force-hpd;

Why? Please mention the reason in the commit message.

> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			backlight = <&backlight>;
> +			power-supply = <&vcc3v3_lcd_edp>;
> +
> +			port {
> +				panel_in_edp: endpoint {
> +					remote-endpoint = <&edp_out_panel>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&edp0_in {
> +	edp0_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_edp0>;
> +	};
> +};
> +
> +&edp0_out {
> +	edp_out_panel: endpoint {
> +		remote-endpoint = <&panel_in_edp>;
> +	};
> +};
> +
> +&hdptxphy0 {
> +	status = "okay";
> +};
> +
>  &i2c3 {
>  	status = "okay";
>  
> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
>  };
>  
>  &pwm12 {
> +	pinctrl-0 = <&pwm12m1_pins>;
>  	status = "okay";
>  };
>  
> @@ -1168,3 +1205,20 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
>  		};
>  	};
>  };
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vop {
> +	assigned-clocks = <&cru DCLK_VOP2_SRC>;
> +	assigned-clock-parents = <&cru PLL_V0PLL>;
> +	status = "okay";
> +};
> +
> +&vp2 {
> +	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
> +		reg = <ROCKCHIP_VOP2_EP_EDP0>;
> +		remote-endpoint = <&edp0_in_vp2>;
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

