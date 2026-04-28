Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45D4FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHQZS/mfe1aAx/WkDiTfniQVSCTk2+2HiwTBJacEYbE=; b=wRBZ8j2sGC6ZSamlSSG5GGjH6i
	w4tvJopn7a/LM0W0yqkXmkNBvXg78CfWIBphmGLDZtBB0PrEwD0LWDi/7gRQ3+5tXfH09MFIVe2/u
	kYrcKHZPydLTqiMQE5+0vEKEJtPxcBbg+60za0yINweUPrs4VjIWyGZWV3y7zXcuN6RcWIKByi2N6
	OxXGE+d6WkOuq0vwT2s7zEi0J2ULiKplH0HWPp5kP0EHI0ptvBcNiiB7iJ695zoCW6oQZuLmFU/nm
	CoTr1d83Q6Z2dZMaZ4cgsfuif2Ch+ZLHiqjTEC9na3lvzpYBLJC7dqFKN8HSgiuuA45Eyl0A0DtRS
	fLhNMtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHezS-0000000170m-1vtX;
	Tue, 28 Apr 2026 09:44:26 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHezN-000000016z9-422r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:44:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g4b9r5hwLz9v6d;
	Tue, 28 Apr 2026 11:44:16 +0200 (CEST)
Date: Tue, 28 Apr 2026 11:44:05 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Douglas Anderson <dianders@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add display support for
 exynos5250-manta
Message-ID: <afCASs-HNDhEVO3V@archstation>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
 <20260425-eccentric-amiable-fossa-fa1cae@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425-eccentric-amiable-fossa-fa1cae@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_024422_350144_AD514F4C 
X-CRM114-Status: GOOD (  24.63  )
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

On Sat, Apr 25, 2026 at 11:58:47AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 23, 2026 at 11:14:41PM +0200, Lukas Timmermann wrote:
> > Adds the necessary entries for panel and backlight as
> > well as the fimd controller.
> > 
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  arch/arm/boot/dts/samsung/exynos5250-manta.dts | 99 ++++++++++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> > index 76d3657eb22f..eb97a28ff4e3 100644
> > --- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> > +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> > @@ -25,6 +25,29 @@ aliases {
> >  		mmc1 = &mmc_1; /* WiFi */
> >  	};
> >  
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pwm 0 1000000 0>;
> > +
> > +		brightness-levels = <2 255>; /* TODO */
> > +		num-interpolated-steps = <254>; /* TODO */
> > +		default-brightness-level = <102>; /* TODO */
> > +		post-pwm-on-delay-ms = <97>; /* TODO */
> > +
> > +		power-supply = <&backlight_reg>;
> > +		enable-gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
> > +
> > +		pinctrl-0 = <&led_bl_reset &pwm0_out>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	backlight_reg: regulator-backlight {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "APS_EN_18V";
> > +		pinctrl-0 = <&aps_en_18v>;
> > +		pinctrl-names = "default";
> 
> No enable GPIO? No voltage?
> 
> > +	};
> > +
> >  	/* Voltage source unknown */
> >  	bmp180_vdda_reg: regulator-bmp180-vdda {
> >  		compatible = "regulator-fixed";
> > @@ -105,6 +128,28 @@ multi-led {
> >  		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
> >  	};
> >  
> > +	panel {
> > +		compatible = "samsung,ltl101dl02-002";
> > +
> > +		backlight = <&backlight>;
> > +		power-supply = <&panel_reg>;
> > +		enable-gpios = <&gph1 7 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-0 = <&lcd_en>;
> > +		pinctrl-names = "default";
> > +		no-hpd;
> > +
> > +		port {
> > +			panel: endpoint {
> > +				remote-endpoint = <&dp_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	panel_reg: regulator-panel {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "LCD_EN";
> 
> That's incomplete. You should have at least voltage.
> 
> > +	};
> > +
> >  	pwrseq: mmc1-pwrseq {
> >  		compatible = "mmc-pwrseq-simple";
> >  
> > @@ -146,10 +191,36 @@ &cpu1 {
> >  	cpu-supply = <&buck2_reg>;
> >  };
> >  
> > +&dp {
> > +	status = "okay";
> > +
> > +	samsung,color-space = <0>;
> > +	samsung,color-depth = <1>;
> > +	samsung,link-rate = <0x0a>;
> > +	samsung,lane-count = <4>;
> > +	samsung,dynamic-range = <0>;
> > +	samsung,ycbcr-coeff = <0>;
> > +
> > +	ports {
> > +		port {
> > +			dp_out: endpoint {
> > +				remote-endpoint = <&panel>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> >  &ehci {
> >  	status = "disabled";
> >  };
> >  
> > +&fimd {
> > +	status = "okay";
> > +
> > +	assigned-clocks = <&clock CLK_MOUT_FIMD1>, <&clock CLK_MOUT_VPLL>;
> > +	assigned-clock-parents = <&clock CLK_MOUT_VPLL>;
> > +};
> > +
> >  &i2c_1 {
> >  	status = "okay";
> >  
> > @@ -396,6 +467,12 @@ ldo25_reg: LDO25 {
> >  	};
> >  };
> >  
> > +&mali {
> > +	status = "okay";
> > +
> > +	mali-supply = <&buck4_reg>;
> > +};
> > +
> >  &mixer {
> >  	status = "okay";
> >  };
> > @@ -489,6 +566,14 @@ wlan_irq: wlan-irq-pins {
> >  };
> >  
> >  &pinctrl_1 {
> > +	aps_en_18v: aps-en-18v-pins {
> > +		samsung,pins = "gph1-6";
> > +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> 
> TODO why? IOW, what are you missing here? Was this tested?
> 
> TODO note can stay, but I would prefer to see short comment explaining
> why.
> 
> 
> Best regards,
> Krzysztof
> 
> 
Yes, this patch was tested for function. I added reminders to triple check these
values before sending the patch but obviously forgot to remove them afterwards.
They won't be in v2 of this patch.

Also thanks for commenting on gpio and voltage, I try to search in 
the downstream kernel to find values or add comments when there
is no information.

Best regards
Lukas

