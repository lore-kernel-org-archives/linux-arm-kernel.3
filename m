Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC4DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To43lLDGlzQpKhqrZgIsEKWJQN7tLB4Brx/uP5KjK3U=; b=AS7yACYjfU4Oo9IvZpIru1PSM4
	nBcCjMD9DySCrWzrhp0fS2uATaH/heGe3sPxvN51ZLgi289xXDMGpVaRfGYI4T/e/p5aRZ8q2pCYY
	D2UDONnExaz15w703Nu75tMCYj+BAeCxQC5Q6oVAE8DFJYHlRbeZHXirpCOWPSPQk1bg/5lgSrJ8p
	RB5nrAO4wavF7tpi+k3y+NbcowYSHr7ZYP5mPYd1iqAQFK48ZdFEO2nN5A6eDXZFEAKvftscTnoLA
	MGngn0B9/+WgJwdLSuf0l8nq8ONg7gVZEJOq3ZR4G8pw6jrDMnFS7Dy+iiXMcqquIdXHAnS5rX53X
	nXts7kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toluC-0000000GI1P-2axQ;
	Sun, 02 Mar 2025 16:11:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolsc-0000000GHlQ-0rM4;
	Sun, 02 Mar 2025 16:09:28 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ED48C20746;
	Sun,  2 Mar 2025 17:09:19 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viBQlnlcbeEl; Sun,  2 Mar 2025 17:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740931755; bh=SuCW7erPuPRWso4GqZRpWS+3gl1BI6ZPagbPAaY4PKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jYb+tFVVVYmJwA66Yg/pXiup5NL0cltofMdg5DTZnjV9xaIOWy24o1bTjj2wdVs7a
	 lDQkbqjVfoZ3GIOiETO6LrOmk2D9ssn1q/2SwweEmwTG27FXPnDRNd1scetAqtQe9J
	 fJUwG58qBhgcVgXNJ/p/v7GDDjH6VeQdH9k3VjBu7AGfcr7X0wuI4QJrIfv34jFDsz
	 WFwOak66AoS0NZiR+5pQhOBbNxqKBOJF98sWjc1R1Ch+BSbpxqzz24vicYsNzQ8aj8
	 2ta4xRx2THhrzsg6nKxjgYhSUxlqUbQcw9JPvogdtzkr8EmK4RpYJSn53PUlo0ESUf
	 S5LhLFJBGT15g==
Date: Sun, 2 Mar 2025 16:09:01 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for
 RK3528
Message-ID: <Z8SCnfZxH-H0iGwf@pie.lan>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <Z8GT3rUEyXrTUgtJ@pie.lan>
 <3f0cd767-1fd8-4c65-b8b4-e948288cd02a@kwiboo.se>
 <116104909.nniJfEyVGO@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116104909.nniJfEyVGO@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_080926_504955_87774BF1 
X-CRM114-Status: GOOD (  29.33  )
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

On Sun, Mar 02, 2025 at 12:52:18PM +0100, Heiko Stübner wrote:
> Am Sonntag, 2. März 2025, 12:14:48 MEZ schrieb Jonas Karlman:
> > Hi Yao Zi,
> > 
> > On 2025-02-28 11:46, Yao Zi wrote:
> > > On Fri, Feb 28, 2025 at 06:40:10AM +0000, Jonas Karlman wrote:
> > >> Add pinctrl and gpio nodes for RK3528 and import rk3528-pinctrl.dtsi
> > >> from vendor linux-6.1-stan-rkr5 kernel with the hdmi-pins-idle node
> > >> removed due to missing label reference to pcfg_output_low_pull_down.
> > >>
> > >> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > >> ---
> > >> This was mostly imported from vendor kernel, however the main commit [1]
> > >> list 28 signed-off-by tags, unclear who I should use as author and what
> > >> signed-off-by tags to include.
> > >>
> > >> [1] https://github.com/rockchip-linux/kernel/commit/c17d6325959f0ec1af901e8a17919163454190a2
> > >> ---
> > >>  .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
> > >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
> > >>  2 files changed, 1479 insertions(+)
> > >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
> > >>
> > > 
> > >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> index 0fb90f5c291c..d3e2a64ff2d5 100644
> > >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> @@ -4,8 +4,10 @@
> > >>   * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
> > >>   */
> > >>  
> > >> +#include <dt-bindings/gpio/gpio.h>
> > >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > >>  #include <dt-bindings/interrupt-controller/irq.h>
> > >> +#include <dt-bindings/pinctrl/rockchip.h>
> > >>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
> > >>  #include <dt-bindings/reset/rockchip,rk3528-cru.h>
> > >>  
> > >> @@ -17,6 +19,11 @@ / {
> > >>  	#size-cells = <2>;
> > >>  
> > >>  	aliases {
> > >> +		gpio0 = &gpio0;
> > >> +		gpio1 = &gpio1;
> > >> +		gpio2 = &gpio2;
> > >> +		gpio3 = &gpio3;
> > >> +		gpio4 = &gpio4;
> > >>  		serial0 = &uart0;
> > >>  		serial1 = &uart1;
> > >>  		serial2 = &uart2;
> > >> @@ -166,6 +173,11 @@ cru: clock-controller@ff4a0000 {
> > >>  			#reset-cells = <1>;
> > >>  		};
> > >>  
> > >> +		ioc_grf: syscon@ff540000 {
> > >> +			compatible = "rockchip,rk3528-ioc-grf", "syscon";
> > >> +			reg = <0x0 0xff540000 0x0 0x40000>;
> > >> +		};
> > >> +
> > >>  		uart0: serial@ff9f0000 {
> > >>  			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
> > >>  			reg = <0x0 0xff9f0000 0x0 0x100>;
> > >> @@ -264,5 +276,75 @@ saradc: adc@ffae0000 {
> > >>  			#io-channel-cells = <1>;
> > >>  			status = "disabled";
> > >>  		};
> > >> +
> > >> +		pinctrl: pinctrl {
> > >> +			compatible = "rockchip,rk3528-pinctrl";
> > >> +			rockchip,grf = <&ioc_grf>;
> > >> +			#address-cells = <2>;
> > >> +			#size-cells = <2>;
> > >> +			ranges;
> > > 
> > > I doubt whether the pincontroller should be placed under simple-bus:
> > > without a reg property, it doesn't look like a MMIO device.
> > > 
> > > Actually it is, although all the registers stay in the ioc grf. Maybe
> > > it should be considered as child of the grf.
> > 
> > This follows how pinctrl was added for RK3576 and what is proposed for
> > RK3562 [2]. I have too little knowledge to know if this needs to change
> > or if this should follow similar SoCs.
> > 
> > [2] https://lore.kernel.org/r/20250227111913.2344207-15-kever.yang@rock-chips.com
> 
> The reg address shouldn't matter here I think.
> 
> The "soc"-bus describes the elements contained in the soc (surrounding the
> cpu cores) and the pinctrl controller definitly is part of the soc itself.
> 
> So when looking at the scope, it does belong there and also the
>  gpio-controller elements do have mmio addresses :-)

Thanks for the explanation, it makes sense to me.

> Heiko
> 

Best regards,
Yao Zi


