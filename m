Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC1C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JiwKhBxuNFYEusTuf1LQBAG/j+AVzq10oWn3l/o6DU=; b=dSdNeh7yOxWEbSWf0KTeXCjDQB
	IehrY5TJMR9htrCqljl16ChR+Mo15ucSjpVPAsvlzdjMNOhVeE80GD2UJwWxtPOoMRvtk3Dw6e8kP
	QrGebDTxj5qRIBz/cP4+/JsM8BPyszFKuFitOFctIXSUyaVw0AISGk4UhAooPMtSdnOqabI85JXuz
	ByyqXCzWqI1/kwjWQo1kRugeRcOLxs932Ns12hVpH3nXuAwpJaf4+D5fr5o6ZncPSQEjFNdGewTuO
	GMoVb1pp9re8TADu3RNACS8PPQfHcLUvCEicqvVuSXez7pn2b7tsoO65xKHWJGnlLHKaKlkwtjxdf
	zIosLF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fdD-0000000GWeO-1VDo;
	Mon, 07 Apr 2025 06:06:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fbS-0000000GWE0-2z3K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 06:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A909343FC4;
	Mon,  7 Apr 2025 06:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1E6C4CEDD;
	Mon,  7 Apr 2025 06:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744005902;
	bh=QdlPTuGFDzHLTqGSHvpyqeL+wyYF1szxTKJZUAoSyAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lLHkWsYj5spzqNUuH90Xd8qyXgoOZloNmjJ0gHK4EvJvTCrNLAwG+3nIJ1Y0l7CuZ
	 8mUzIFqjh6IqSYAnZFL1cUspFhtUhYFTsJ7Dja2j9XI2Gg20dwN9Dyx2uxZrv1fQRZ
	 2gcqVR2csGTopegBDIC3qjkr4RVCKJOGV4m/9voKS8eYYavf86BKA7FFRwKTnKznK2
	 /rDyDVzfe/HHv7a42+Iuw4CxJRwpkRSe3JU8w96H5SsHCwSHvGktXSzNUeEwdWC63c
	 w9V+Q4gQkFmABRMbrJbUEiNiHKAR8X4QFDRjrgiQOswgD1hY1YXbrtt+okKtKsU7gn
	 oCjUqy44ya8Kg==
Message-ID: <befe7d30-1727-4540-9072-f21ef96ea504@kernel.org>
Date: Mon, 7 Apr 2025 08:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: exynos: Add DT node for all UART ports
To: Faraz Ata <faraz.ata@samsung.com>, alim.akhtar@samsung.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rosa.pila@samsung.com, dev.tailor@samsung.com, suyash.bitti@samsung.com
References: <CGME20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80@epcas5p3.samsung.com>
 <20250318075635.3372599-1-faraz.ata@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250318075635.3372599-1-faraz.ata@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_230502_798118_18D01EF5 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

On 18/03/2025 08:56, Faraz Ata wrote:
> +
> +		usi_17: usi@10d800c0 {

Messed order. Keep nodes sorted by unit address (see DTS coding style).

> +			compatible = "samsung,exynosautov920-usi",
> +				     "samsung,exynos850-usi";
> +			reg = <0x10d800c0 0x20>;
> +			samsung,sysreg = <&syscon_peric1 0x1040>;
> +			samsung,mode = <USI_V2_UART>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
> +				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			serial_17: serial@10d80000 {
> +				compatible = "samsung,exynosautov920-uart",
> +					     "samsung,exynos850-uart";
> +				reg = <0x10d80000 0xc0>;
> +				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&uart17_bus>;
> +				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
> +					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
> +				clock-names = "uart", "clk_uart_baud0";
> +				samsung,uart-fifosize = <64>;
> +				status = "disabled";
> +			};
> +		};
> +
>  		pwm: pwm@109b0000 {
>  			compatible = "samsung,exynosautov920-pwm",
>  				     "samsung,exynos4210-pwm";


Best regards,
Krzysztof

