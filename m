Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC44C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkV6XoLaeT2EUCE/NRO86y22RkBlw2IGYotCv1aLQSo=; b=JCpUe9IttNsEoq/KnD34yP7xA2
	AoYNp56Awkix/4qKT1gzEt0m+V4eWTL9d1SabZmZkE1Ld8qtfwvjme3xgs+quplS8VlvZXMp9Ri91
	/Fsy0X23TKHeePhcvqO3HFoOQfTO4gJGkIiiDhwQUqdYN0dmsLNdC4g4P9DFcjQ7CzOofdK8mXEgU
	Ea7+AxR+O+s+kIQTGBQucmMZBTjnBtHbt4IcppdsZLa8LoDDxlnGFJNy/8CtIhDcI2QCaD5Pt4pac
	v9qfBEZpTPql7f+wAKA0BhMZZkOk3Y4AHGiWpyOLFzA4j+emaWbOGlYmU3tIgzAXPg4PPQz73aX2a
	W05CcdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPhQ-000000045dI-1CbC;
	Fri, 09 May 2025 15:31:44 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNYX-00000003iTH-0VlL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:14:26 +0000
Date: Fri, 9 May 2025 09:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkV6XoLaeT2EUCE/NRO86y22RkBlw2IGYotCv1aLQSo=;
	b=KUr0/5jtENQERP52yAYyt9IK2gGgnJxdgoNRDysr1hpd6oIGJJhYkytCXszxuyRDLU9w/t
	fAoT37A+wgjIrLevT7LK0GEoaLSfqnXpAqhsgv09PqVZDeHv62PMWj5DpP5UzawuYvSF+k
	k3YwLakl1UFfkfRE06C178u6bNqoOqO30f0bMfjuFsMge8aMMPPRTrRXa6V2YHVmDni+9d
	kW2h7BSKu5Q6bn2kqNMWFVeMcTOdMjJlOjcWLTMPW6tuiim8B7MaNGSdCD/YKecmfKfiIo
	O61gWmXP7cI87kYTgSHKKB/KLPP17doJLxC90VzzWihh3dylx2QDVR4YsitG+w==
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
Subject: Re: [PATCH v4 7/9] arm64: dts: apple: t8103: Add SMC node
Message-ID: <aB3_nYoHofJ7wD8L@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-7-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-7-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061425_292688_D5157F2E 
X-CRM114-Status: GOOD (  13.62  )
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

Le Sat , May 03, 2025 at 10:06:54AM +0000, Sven Peter via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  arch/arm64/boot/dts/apple/t8103.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 20faf0c0d80927b2e18dd966a61b5507b322c72f..58270e7d79b07ee98340f140972a6f0d14c86dcb 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -836,6 +836,41 @@ wdt: watchdog@23d2b0000 {
>  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		smc: smc@23e400000 {
> +			compatible = "apple,t8103-smc", "apple,smc";
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
> +			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
> +			reg = <0x2 0x3e408000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "send-empty", "send-not-empty",
> +				"recv-empty", "recv-not-empty";
> +			#mbox-cells = <0>;
> +		};
> +
>  		pinctrl_smc: pinctrl@23e820000 {
>  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3e820000 0x0 0x4000>;
> 
> -- 
> 2.34.1
> 
> 

