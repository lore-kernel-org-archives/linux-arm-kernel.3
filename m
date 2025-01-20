Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D7AC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFmjfRIAfD/TWhtg9QJn1hbIzJmPBaW6wdlpqeT5TsY=; b=hs5/anrNTvdD1DGcX8VFC4SAGJ
	BeQ97yIMQTH2s17e+ZdgMlZiKodWFty/2QjwdiE6immcjBice6yIQDSN9T0ydUZi+8vxEis0ghxNi
	COSv/zD1TZzdQeBATmVNJk961h+H634CbpER+GIoRgmaPBfI/VOj0uB4kTd7DR8H/GXDQp9VIEXpx
	qaO40YUYhz7s6+9x1tr53VJx2WwdWC5AykV73+DHmJxzSE0XAzY27h53Qy9ORBJ0qm+Gj0b1agK15
	e8x/OpKtchjlGvT2W8TTGjWjnjSavm3bsTAgNKw31tMtcxy4td7zYabrrgCITE5Hq0L8PauRgdJ7o
	GR2wTMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy9v-00000006NpY-0VhY;
	Mon, 20 Jan 2025 20:14:07 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy8d-00000006NkD-2GnV;
	Mon, 20 Jan 2025 20:12:48 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737403965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFmjfRIAfD/TWhtg9QJn1hbIzJmPBaW6wdlpqeT5TsY=;
	b=YPYYnsKAYboHxdwLOk4OYK2A1lONri4zXIFe27yH0muhHZKyomsxiVN72QkPutXZNwxeqi
	MsnPtRcV8cj7f0Nxgfle0fYAGWXSjUPzk7rCOfQMPUdq34vLRFJF0uJd1Kq03I+26zmdHp
	21Gjwx1wbE71sdEaHn6nY94gpjaW7ZAFL3/Gwlaz3A01anBBD7U7n6Y1yB2ZfvSfchjOeh
	CyQIG4LZMPJTqXjSPODuKwYN6bpDL3P07qbTggo3b1WaC0bb3gXZDlUGxiB9/AXyeCzBg4
	MrR8nLQfOkxN3oWMDSvsWal+wR9vlJ6a82cpSqgx4fzAvHtNmck6xg8Ie87fbA==
Date: Mon, 20 Jan 2025 21:12:45 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable automatic fan control on
 Radxa Rock 5C
In-Reply-To: <20250120-rock-5c-fan-v1-2-5fb8446c981b@gmail.com>
References: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
 <20250120-rock-5c-fan-v1-2-5fb8446c981b@gmail.com>
Message-ID: <e73f651566aeab85952a4abbe23d55b8@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_121247_729085_D52E248E 
X-CRM114-Status: GOOD (  13.74  )
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

Hello Alexey,

On 2025-01-20 20:22, Alexey Charkov wrote:
> Add the necessary cooling map to enable the kernel's thermal subsystem
> to manage the fan speed automatically depending on the overall SoC
> package temperature on Radxa Rock 5C
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 32 
> +++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> index
> 1b66a69cf0f8795d7305852fa7fef3d0672ada7f..6e56d7704cbe0dc06242cb39df56b2fc9d6bc774
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> @@ -68,7 +68,7 @@ led-1 {
>  		};
>  	};
> 
> -	fan {
> +	fan: fan {
>  		compatible = "pwm-fan";
>  		#cooling-cells = <2>;
>  		cooling-levels = <0 24 44 64 128 192 255>;
> @@ -417,6 +417,36 @@ rgmii_phy1: ethernet-phy@1 {
>  	};
>  };
> 
> +&package_thermal {
> +	polling-delay = <1000>;
> +
> +	trips {
> +		package_fan0: package-fan0 {
> +			temperature = <55000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +
> +		package_fan1: package-fan1 {
> +			temperature = <65000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map0 {
> +			trip = <&package_fan0>;
> +			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
> +		};
> +
> +		map1 {
> +			trip = <&package_fan1>;
> +			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> +
>  &pcie2x1l2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie20x1_2_perstn_m0>;

Thanks for the patch, it follows the usual approach for keeping
the fan noise down, and it's looking good to me.  Please, feel
free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

