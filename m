Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B27C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joJW+D0CZd0k3aVe20JA5YgO5s4LttQGX9HFQMhhsJc=; b=F9eRdq3cWUTxaWWCjF3p4ORcnX
	j7uPZ4VJgUb3p0/mWJ/SBzrc4iEgalFNSOkZ0+jR/VIOyVj+5ENwnafkr4Miz3lA9C/ADMKrh1+/M
	ZJIY9kl3vlgZ7EcELhR+YLfYFX2fEdaneQySpxh+HHo+fIfilPBbCe5bTZHKuAF7SWZyDFOsLbF3s
	lz77+92fHdilVYiizUVuMYdUUjePyaUUTE+lrSfLpCBwub7kO6uqBJqblrZ6jSrTRlcnTgJhYJRGY
	KHeW9FEMmvei+0UqrQuR0HV90dnH3zagBZdxOJ8Gnpxk3XXa5dzafpTp+7ZItFrXWESjEupFPP32r
	9yB/oqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOXy-00000003vI9-3x0H;
	Fri, 09 May 2025 14:17:54 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNY6-00000003iQK-1E1w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:13:59 +0000
Date: Fri, 9 May 2025 09:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joJW+D0CZd0k3aVe20JA5YgO5s4LttQGX9HFQMhhsJc=;
	b=uHLP1FXRDuVoH6y7Cbl0iajt9qTPi8FeHcFm++zSbsY/lrniwAEekeRiFzsgic0yf0djaF
	2FqUDyy/UU2ZH2fku0JEgms0JdoCYJiETboXysp9hJAYhwlWE7jkISob7TxpKbSzFxyk+5
	/jpyTj+3LsAtkMxE+JSB7706YFqXRSfMS9ATvnqtoHRLHyw2vLRfsi4tWR+jrMbrrbFAmU
	u36wZadzCxbYvTcVoJEhjfJFWOD5mWKi9b3K0/gK/BNy40fAPJ0BH6T1bbKuOOje1zBcZS
	gAhXsf1/K6s9+69R/MA4Pi/4eMhrc3uAer6xuyDmze5VmJl1zxd3myfKsiBxFw==
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
Subject: Re: [PATCH v4 9/9] arm64: dts: apple: t600x: Add SMC node
Message-ID: <aB3_jnRXu4wKdD4o@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-9-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-9-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061358_467922_D5D358DB 
X-CRM114-Status: GOOD (  13.10  )
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

Le Sat , May 03, 2025 at 10:06:56AM +0000, Sven Peter via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 35 +++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 110bc6719512e334e04b496fb157cb4368679957..4993a8ace87b2fc7e645b08c19fcd9b0c21896aa 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -24,6 +24,41 @@ aic: interrupt-controller@28e100000 {
>  		power-domains = <&ps_aic>;
>  	};
>  
> +	smc: smc@290400000 {
> +		compatible = "apple,t6000-smc", "apple,smc";
> +		reg = <0x2 0x90400000 0x0 0x4000>,
> +			<0x2 0x91e00000 0x0 0x100000>;
> +		reg-names = "smc", "sram";
> +		mboxes = <&smc_mbox>;
> +
> +		smc_gpio: gpio {
> +			compatible = "apple,smc-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		smc_reboot: reboot {
> +			compatible = "apple,smc-reboot";
> +			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> +				<&boot_error_count>, <&panic_count>, <&pm_setting>;
> +			nvmem-cell-names = "shutdown_flag", "boot_stage",
> +				"boot_error_count", "panic_count", "pm_setting";
> +		};
> +	};
> +
> +	smc_mbox: mbox@290408000 {
> +		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
> +		reg = <0x2 0x90408000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 754 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 755 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 756 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 757 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "send-empty", "send-not-empty",
> +			"recv-empty", "recv-not-empty";
> +		#mbox-cells = <0>;
> +	};
> +
>  	pinctrl_smc: pinctrl@290820000 {
>  		compatible = "apple,t6000-pinctrl", "apple,pinctrl";
>  		reg = <0x2 0x90820000 0x0 0x4000>;
> 
> -- 
> 2.34.1
> 
> 

