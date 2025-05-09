Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F4EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHz2N90cxTQPl/n3ayGPjZiGdp6MpqFE6UdMTbgIZ0k=; b=JkrQbwXX/iRWhc875eCNZXv3Lo
	rs3GjV2hzsS3Awg+pSpH+EyhTUjASNHtiOq+CrO+FZHQlTbRtOGXvs5N8+7kvzoHt8Qixg/3dQOoo
	zH24TwBFpyoQ5RbCDQtr1DNeQ2N+ijoxwg+0S27FKBd1SOxfRABt99+eHzN350FpZvmXaQAKwPoB4
	XVZmWdcnqz4nxa744XBrpzb+WbKMzRWfeBDMNuMe5295JQg0t4WPnjHonnd/UgThdg9sPEIq+tohp
	hpJKF9uzZ0TDexgEJcTsui/SYfT88bhs6RmlYW59rt0oSI02uH+tFh/pXojw0dbHoWP82ONM5zsy7
	5tXv9KHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOU4-00000003uSP-285r;
	Fri, 09 May 2025 14:13:52 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNXZ-00000003iHs-1ORl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:13:27 +0000
Date: Fri, 9 May 2025 09:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHz2N90cxTQPl/n3ayGPjZiGdp6MpqFE6UdMTbgIZ0k=;
	b=fHb0Bf2Fxn4XphXkw53yBQp5fKOoN8qXoC6co+TQnzQiXmREqHmMNMdXDJhiK9feEPkzCD
	xNWNbVEx3i8gLAOOhU7AUKiMCpTPr5Xto7wkjd/etBl7peOIMinzO1dixZ7S9VJQaQxG7a
	Qpi/uuYD73+Y+chNpJBTUMP32ykNHh8dd/cCqe8a5iOSeZxb+zvJMpFESvDXxX8wJHiCvQ
	ESOT/Bs/K8+OnNz+02TwSK8SeaQxJfa8B9YkLFbrs2gskzUHOWn7Qrt90SrHDOLMaSKvz3
	7vwXPIyawxCHxf7tco0+el4wfQjHSeNB5mDYOgB09LKMMIoi2wOuvrA25zlJwQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 8/9] arm64: dts: apple: t8112: Add SMC node
Message-ID: <aB3_Znc0dsDuByVJ@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-8-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-8-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061325_507224_A8459996 
X-CRM114-Status: GOOD (  12.98  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , May 03, 2025 at 10:06:55AM +0000, Sven Peter via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  arch/arm64/boot/dts/apple/t8112.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index e95711d8337f6cea898e88a3d564caf2c4f94404..861cf2f684a067d73f79d8f01447bc375136793d 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -839,6 +839,41 @@ rtc_offset: rtc-offset@f900 {
>  			};
>  		};
>  
> +		smc: smc@23e400000 {
> +			compatible = "apple,t8112-smc", "apple,smc";
> +			reg = <0x2 0x3e400000 0x0 0x4000>,
> +				<0x2 0x3fe00000 0x0 0x100000>;
> +			reg-names = "smc", "sram";
> +			mboxes = <&smc_mbox>;
> +
> +			smc_gpio: gpio {
> +				compatible = "apple,smc-gpio";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +			};
> +
> +			smc_reboot: reboot {
> +				compatible = "apple,smc-reboot";
> +				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> +					<&boot_error_count>, <&panic_count>, <&pm_setting>;
> +				nvmem-cell-names = "shutdown_flag", "boot_stage",
> +					"boot_error_count", "panic_count", "pm_setting";
> +			};
> +		};
> +
> +		smc_mbox: mbox@23e408000 {
> +			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
> +			reg = <0x2 0x3e408000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "send-empty", "send-not-empty",
> +				"recv-empty", "recv-not-empty";
> +			#mbox-cells = <0>;
> +		};
> +
>  		pinctrl_smc: pinctrl@23e820000 {
>  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3e820000 0x0 0x4000>;
> 
> -- 
> 2.34.1
> 
> 

