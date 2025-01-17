Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D0C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hn4WqnCnOAaJEqM9ANt1xzctkgUmGPZUZcypgc4DlI=; b=WsTIl36CCe1di9cIuirvrGYml3
	HxAb0bTvhu+6SjC/Uup8nE8zPXMYTAVM0SZNYoo0ciSOAf1Zb4TjNAjsG6URgRC13/Mp45YzOB0jy
	VwO8KBQ8mx2JG1tnizz4GL/FYRPBX9Na41a8aMLSsfqOoSjU2R9kw7l+sLxJ60lktb39pYLOyX3rt
	kY89xweA2bkyw77uhL8YqgLv4MDeq4f8Fr5nXNA5WLDXlN8oeXtnozX0ugmaEqoC3w6op8LLBU9yz
	dL3samH9zN0MecDyobFBFeXlbgAlGFypmkZcl/ywqKMzKjVhZdAUBwnJKhmaiG12TjVPYSIC8LPum
	pQTTQ4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhvx-0000000HMWY-3Laq;
	Fri, 17 Jan 2025 08:42:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhuh-0000000HMM1-0ElO;
	Fri, 17 Jan 2025 08:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C16625C5B7B;
	Fri, 17 Jan 2025 08:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B44C4CEDD;
	Fri, 17 Jan 2025 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737103270;
	bh=kGwC5vFFwzp3w+dyxaz6e/ANo3uETs7cf9+OazoI00A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3Gr3JTF8hmWPXIiNSO1Avv80+CZsRG+ZZdaKq+av8p12+FcomDCLDZJnEZ6KOSul
	 7S7Y4XKsiK9ATHyhow6VsigSFfS2WIOTRVlbuuoAXRxSmTgPr4XJR1J8XuPkkp5nlL
	 Yiv+1424bVYMLa8qgXrZDlb/ogzSIhEblC4Azmzmh6CohwGAnDRt21jHVHZnMeLqQo
	 QMqpi7MX+uggyXaGmZ3Y3ODNPv0UGPq4Srh3LlO8P/KKGxlvAD/2qmEU37GSixr8lj
	 wiclioW1A1FmJ589KM53EHUR7FK/v3c+KnHS5A3wi51R8J1tqrxNPtywdZd05wKUY9
	 ENIBGMAEE2VeA==
Date: Fri, 17 Jan 2025 09:41:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <20250117-fascinating-ape-of-upgrade-0c298b@krzk-bin>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
 <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_004111_182992_5F0D5A49 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Jan 15, 2025 at 02:42:02PM +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 133 ++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index de10e7aebf21..8eb95580d64a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include "amlogic-a4-common.dtsi"
>  #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>  / {
>  	cpus {
>  		#address-cells = <2>;
> @@ -48,3 +49,135 @@ pwrc: power-controller {
>  		};
>  	};
>  };
> +
> +&apb {
> +	periphs_pinctrl: pinctrl {
> +		compatible = "amlogic,pinctrl-a4";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpiox: gpio@4100 {
> +			reg = <0 0x4100 0 0x40>,
> +			      <0 0x400c 0 0xc>;

One line

> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_X>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
> +		};
> +
> +		gpiot: gpio@4140 {
> +			reg = <0 0x4140 0 0x40>,
> +			      <0 0x402c 0 0xc>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_T>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
> +		};
> +
> +		gpiod: gpio@4180 {
> +			reg = <0 0x4180 0 0x40>,
> +			      <0 0x4040 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_D>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
> +		};
> +
> +		gpioe: gpio@41c0 {
> +			reg = <0 0x41c0 0 0x40>,
> +			      <0 0x4048 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_E>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
> +		};
> +
> +		gpiob: gpio@4240 {
> +			reg = <0 0x4240 0 0x40>,
> +			      <0 0x4000 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_B>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
> +		};
> +
> +		gpioao: gpio@8e704 {
> +			reg = <0 0x8e704 0 0x16>,
> +			      <0 0x8e700 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_AO>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +		};
> +
> +		test_n: gpio@8e744 {
> +			reg = <0 0x8e744 0 0x20>;
> +			reg-names = "gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			bank-number = <AMLOGIC_GPIO_TEST_N>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +		};
> +
> +		func-uart-a {
> +			uart_a_default: group-uart-a-pins1 {
> +				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,

Missing space before '='. Follow DTS coding style.

Best regards,
Krzysztof


