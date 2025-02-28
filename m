Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0B1C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjGOzywR+nxiQoCA+yHaJkoAOsNKtNtPbN+ke7Axj74=; b=Lc+PwfJ0Nzg5VEMHsgElvLiHt3
	FJEloWVAjCJRve6uwGwuZf19bmffKbMaz0Xs3w9rap7uJOk/iD+pCNDJPdbaCUjGqkhVrIkWBGx/s
	v/d9ccGR89Oxl3HNEOOW+6ay3hzwizIs44J5fW8R66cdNip+wTWCV+Tl0333sXj7uDkbtJUFWfXUx
	ZFoontxhupy6wvQeaeieU92dMr+G23CzK/Orl7XAU2D/NGuyrdexw6VKOfY4t+215LUWv7WJOSHPI
	vTjFLtDvaPRUdkVGzJ/FU7xmuh4wy6GeiqEMi5DSvFdapgc81oVAyh/G5aUKLKR/r9a8IrUnY6GE0
	9TywZd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyO5-0000000AjDv-0sQU;
	Fri, 28 Feb 2025 11:18:37 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxtM-0000000Ae07-30gV;
	Fri, 28 Feb 2025 10:46:54 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1F27725B10;
	Fri, 28 Feb 2025 11:46:49 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzMnRzDWYUA6; Fri, 28 Feb 2025 11:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740739608; bh=U4f39K22AT2uLhlBihafrDKiaAl4zq7R+BWNHeeQvIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmspyZjBlr/nK/v9Lg8q2qjjEHQAXily7IiaveTLICIjaKnmm1F4qjVgw2KggkmKz
	 WYEB/5j4AoNEtMr3KPKadNm9ZCjGIywSv5Tc+xDUJDMq3wkYB6qJjjApAZXuuLxqCz
	 z3r79UNmdr3r9rsKt27LgDD5EqS5PB9TIbuUcW3Jr8xe4JvCOBks9Ll3BhpO4D4C22
	 rhvCzjCOnX7eGbPgKsz0nJszJtkVXjJHqK2TvxbA4vZhXARy7W+Bz/oRz/KBu6jkY0
	 qEkhOh9AlSpdIGCmqrQr3yTdfFd7TxpqpP9Z9vhGT7K5LbH/jbmkxVcykZxTvKpwV7
	 sGAzXFRt5Mj5w==
Date: Fri, 28 Feb 2025 10:46:29 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for
 RK3528
Message-ID: <Z8GT3rUEyXrTUgtJ@pie.lan>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-5-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228064024.3200000-5-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_024653_185751_DA1C17DF 
X-CRM114-Status: GOOD (  19.10  )
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

On Fri, Feb 28, 2025 at 06:40:10AM +0000, Jonas Karlman wrote:
> Add pinctrl and gpio nodes for RK3528 and import rk3528-pinctrl.dtsi
> from vendor linux-6.1-stan-rkr5 kernel with the hdmi-pins-idle node
> removed due to missing label reference to pcfg_output_low_pull_down.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> This was mostly imported from vendor kernel, however the main commit [1]
> list 28 signed-off-by tags, unclear who I should use as author and what
> signed-off-by tags to include.
> 
> [1] https://github.com/rockchip-linux/kernel/commit/c17d6325959f0ec1af901e8a17919163454190a2
> ---
>  .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
>  2 files changed, 1479 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
> 

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 0fb90f5c291c..d3e2a64ff2d5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -4,8 +4,10 @@
>   * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
>  #include <dt-bindings/reset/rockchip,rk3528-cru.h>
>  
> @@ -17,6 +19,11 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> @@ -166,6 +173,11 @@ cru: clock-controller@ff4a0000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		ioc_grf: syscon@ff540000 {
> +			compatible = "rockchip,rk3528-ioc-grf", "syscon";
> +			reg = <0x0 0xff540000 0x0 0x40000>;
> +		};
> +
>  		uart0: serial@ff9f0000 {
>  			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
>  			reg = <0x0 0xff9f0000 0x0 0x100>;
> @@ -264,5 +276,75 @@ saradc: adc@ffae0000 {
>  			#io-channel-cells = <1>;
>  			status = "disabled";
>  		};
> +
> +		pinctrl: pinctrl {
> +			compatible = "rockchip,rk3528-pinctrl";
> +			rockchip,grf = <&ioc_grf>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

I doubt whether the pincontroller should be placed under simple-bus:
without a reg property, it doesn't look like a MMIO device.

Actually it is, although all the registers stay in the ioc grf. Maybe
it should be considered as child of the grf.

Best regards,
Yao Zi

