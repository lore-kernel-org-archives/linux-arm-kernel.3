Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58BAC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mvzvj3+uBjZ2P6EYQWNLPK6UKaBiFgtR0j4cfu3WJTQ=; b=fYbeE91mLCp8YDhTP6r2oRKZtH
	lspiuGxl0C/12G/F4oXol662VSxcU6S7KQtIbuAZCHi6Gx3/+Y3FTfJp905Ct/LvII4oSbd70w1rE
	+laZGF6SskhHf2Ewqw8zx8ZtBY9XcufShEIToDgNqC7MK9nPnsoMCC41K3lt+ObFopZl6SjgOrRNP
	3XOWUqQAnzpwSxlhiS6II+C2snI0BvfjcD1lePc44IMA8cQgQGo91obyduXA/n6ZjAgFOMzCA3Qv1
	r6Yclg+ZgKlFmtfr+FQX+eBodYjsypfNXV/EY8n94YVN2KbXopoekXgru22zIzm4XVSgDawmKUjMd
	LCAkGerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0hr-00000005i8i-2Zq0;
	Wed, 12 Feb 2025 00:34:23 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0fF-00000005hgK-0heN;
	Wed, 12 Feb 2025 00:31:42 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c0590fdae5so462126385a.0;
        Tue, 11 Feb 2025 16:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739320300; x=1739925100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvzvj3+uBjZ2P6EYQWNLPK6UKaBiFgtR0j4cfu3WJTQ=;
        b=WPu3bDG23kNojJG1BlzKnLbCshOzZ+cgnOhrs3Qj9mhmLekpoPNt/voD0oQukufM8Z
         Jd7RIr/j2Ln/ReES2D/sjPzsAE9avVnsF51aagD33ZoK0pFFXUXzfarcaHIWgWdYOv0U
         Pxglfqyuex4PAxWiOa3pBm94Aadr8XORy51fdP25n0Lidy575955DdmVhXtiE59V4M1j
         kGTXYLN0bybjvG7+PUMY6UWIROobrNtiqQFstyvPNlcAS0yst98aI/fBRJuU+udZ+RcZ
         A4bMqkJfB3qCJaeRapunADI3lHNcFhVf2OXDOZOXkSHhu4jn5Kz31/VH/r2RMSm3ejWG
         A/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739320300; x=1739925100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvzvj3+uBjZ2P6EYQWNLPK6UKaBiFgtR0j4cfu3WJTQ=;
        b=NB4hhJM2NLqlDOT4z9L3RSV5DWZbvWsGqgWMFDYDLQT5D7iy6JgEB9POM0uvRjoxY8
         zT/94VAlC/EnjWxMFjjraWYjXCGf9x4vxrQnBHP1I9eHB9pL1NdD9hABHuFwGbhxCCEa
         37OSz4ZQXAG8/jV9nz1hu8lEX6qFqXh0benEs+fiBGlbKLfpcjhzn13n13IIpFcW3Ckk
         +rCQ6IF/Jpo+w6FLnu4frkYSNxbBCc71c3CxZelrUKcCgpUH/aN4+6YSuEc9egveENTM
         wnDbbOWhvLqxP+PK+THxu7TdQQ0qWzpKBVmAGEwj8b5ie015V+WtE9H5rrG0J8DvB/88
         VrIA==
X-Forwarded-Encrypted: i=1; AJvYcCVVpwD6rngIeQ41dhlT3/oIQ+vErtd+6MCtwWMN35zWE/o/L9sia7H+n4l+QZ+l7/6t5EjYIs0QJN9zF1AbWCSv@lists.infradead.org, AJvYcCWWENCknTx1GSz0reU0IDRu2ord/fFSGYz0GLELbPjGl4qk1gntqloxpSi6ZfDXljxi+FwqWElS3O1jd4w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdVSapJoxZcGrR1NL6LwzUP8kMwlzhDrvK2I2/C9UdA1AuFi22
	b8SILKz4BZAPnalUmjGttLMEXG/b5OQ33EIqTAxGYB9gOqI4Bc0I
X-Gm-Gg: ASbGnctnXWj7nl61HonGOOGYYM0+Q7E0Kdd9Nhjgd0tG/n7x1GuJrposyEXuLyG1df1
	Zdp1zTU64Kpcn18mfmfAghhnlwWc/9LAPlWShQmM18d0dKXOGkvTtH6cuMDl+tqFjvDy9axxt7u
	AKu2H322k2UgY3YDcxCCqPcTBDghPmyQStQRiRzeg87GYE7F4wMWbOxKgZ9YUm1lK5uiOqHrcWV
	o2A/j+ayNOzI8YZaEIZyCi8rWCwPEuZeFkRS5Rfc3DmFeAAM2tCjyaJApjtb5FVtoI=
X-Google-Smtp-Source: AGHT+IF75ejZFbfqk8foSxt+7CSfMkjAVcQVx0BfgcCLGCCCi9HSZrbtSb2foVAqGkn8iXyNbfm/FA==
X-Received: by 2002:a05:620a:390f:b0:7bf:f916:faf3 with SMTP id af79cd13be357-7c06fc4dbdcmr203669585a.8.1739320299786;
        Tue, 11 Feb 2025 16:31:39 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e9f965sm746971285a.86.2025.02.11.16.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:31:38 -0800 (PST)
Date: Wed, 12 Feb 2025 08:31:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_163141_225674_4D5779D0 
X-CRM114-Status: GOOD (  23.15  )
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

On Mon, Feb 10, 2025 at 11:09:41PM +0100, Alexander Sverdlin wrote:
> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> core and interrupt controllers' parts into the respective per-SoC .dtsi
> files.
> 
> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> into "plic" interrupt-controller numbering.
> 
> Have a nice refactoring side-effect that "plic" and "clint" "compatible"
> property is not specified outside of the corresponding device itself.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v2:
> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> included cv18xx.dtsi;
> - define a label for the "soc" node and use it in the newly introduced DTs;
> 
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi    | 64 ++++++++++++---
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi    | 64 ++++++++++++---
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi     |  2 +-
>  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi     | 91 ++++++----------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi     | 64 ++++++++++++---
>  6 files changed, 240 insertions(+), 102 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aa1f5df100f0..eef2884b36f9 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>   */
>  
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
>  #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
>  #include "cv18xx.dtsi"
>  
> @@ -14,22 +16,62 @@ memory@80000000 {
>  		reg = <0x80000000 0x4000000>;
>  	};
>  

> -	soc {
> -		pinctrl: pinctrl@3001000 {
> -			compatible = "sophgo,cv1800b-pinctrl";
> -			reg = <0x03001000 0x1000>,
> -			      <0x05027000 0x1000>;
> -			reg-names = "sys", "rtc";


> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <25000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "thead,c906", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <512>;
> +			d-cache-size = <65536>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			mmu-type = "riscv,sv39";
> +			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
>  		};
>  	};
>  };

Make all soc definition include the common cpu file. 
Not just copy it.

>  
> -&plic {
> -	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> -};
> +&soc {
> +	interrupt-parent = <&plic>;
> +	dma-noncoherent;
>  
> -&clint {
> -	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> +	pinctrl: pinctrl@3001000 {
> +		compatible = "sophgo,cv1800b-pinctrl";
> +		reg = <0x03001000 0x1000>,
> +		      <0x05027000 0x1000>;
> +		reg-names = "sys", "rtc";
> +	};
> +
> +	plic: interrupt-controller@70000000 {
> +		compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> +		reg = <0x70000000 0x4000000>;
> +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		riscv,ndev = <101>;
> +	};
> +
> +	clint: timer@74000000 {
> +		compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> +		reg = <0x74000000 0x10000>;
> +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +	};
>  };
>  
>  &clk {
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 8a1b95c5116b..54f7e229bcd8 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>   */
>  
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
>  #include "cv18xx.dtsi"
> @@ -16,22 +18,62 @@ memory@80000000 {
>  		reg = <0x80000000 0x10000000>;
>  	};
>  
> -	soc {
> -		pinctrl: pinctrl@3001000 {
> -			compatible = "sophgo,cv1812h-pinctrl";
> -			reg = <0x03001000 0x1000>,
> -			      <0x05027000 0x1000>;
> -			reg-names = "sys", "rtc";
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <25000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "thead,c906", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <512>;
> +			d-cache-size = <65536>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			mmu-type = "riscv,sv39";
> +			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
>  		};
>  	};
>  };
>  
> -&plic {
> -	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> -};
> +&soc {
> +	interrupt-parent = <&plic>;
> +	dma-noncoherent;
>  
> -&clint {
> -	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> +	pinctrl: pinctrl@3001000 {
> +		compatible = "sophgo,cv1812h-pinctrl";
> +		reg = <0x03001000 0x1000>,
> +		      <0x05027000 0x1000>;
> +		reg-names = "sys", "rtc";
> +	};
> +
> +	plic: interrupt-controller@70000000 {
> +		compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> +		reg = <0x70000000 0x4000000>;
> +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		riscv,ndev = <101>;
> +	};
> +
> +	clint: timer@74000000 {
> +		compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> +		reg = <0x74000000 0x10000>;
> +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +	};
>  };
>  
>  &clk {
> diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> index 5fd14dd1b14f..bbdb30653e9a 100644
> --- a/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> @@ -11,7 +11,7 @@ soc {
>  		emmc: mmc@4300000 {
>  			compatible = "sophgo,cv1800b-dwcmshc";
>  			reg = <0x4300000 0x1000>;
> -			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(18) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_AXI4_EMMC>,
>  				 <&clk CLK_EMMC>;
>  			clock-names = "core", "bus";
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> new file mode 100644
> index 000000000000..a68d61131efb
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
> +/ {
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <25000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "thead,c906", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <512>;
> +			d-cache-size = <65536>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			mmu-type = "riscv,sv39";
> +			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&soc {
> +	interrupt-parent = <&plic>;
> +	dma-noncoherent;
> +
> +	plic: interrupt-controller@70000000 {
> +		reg = <0x70000000 0x4000000>;
> +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		riscv,ndev = <101>;
> +	};
> +
> +	clint: timer@74000000 {
> +		reg = <0x74000000 0x10000>;
> +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c18822ec849f..62c1464a0490 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -12,47 +12,16 @@ / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  
> -	cpus: cpus {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		timebase-frequency = <25000000>;
> -
> -		cpu0: cpu@0 {
> -			compatible = "thead,c906", "riscv";
> -			device_type = "cpu";
> -			reg = <0>;
> -			d-cache-block-size = <64>;
> -			d-cache-sets = <512>;
> -			d-cache-size = <65536>;
> -			i-cache-block-size = <64>;
> -			i-cache-sets = <128>;
> -			i-cache-size = <32768>;
> -			mmu-type = "riscv,sv39";
> -			riscv,isa = "rv64imafdc";
> -			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> -
> -			cpu0_intc: interrupt-controller {
> -				compatible = "riscv,cpu-intc";
> -				interrupt-controller;
> -				#interrupt-cells = <1>;
> -			};
> -		};
> -	};
> -
>  	osc: oscillator {
>  		compatible = "fixed-clock";
>  		clock-output-names = "osc_25m";
>  		#clock-cells = <0>;
>  	};
>  
> -	soc {
> +	soc: soc {
>  		compatible = "simple-bus";
> -		interrupt-parent = <&plic>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		dma-noncoherent;
>  		ranges;
>  
>  		clk: clock-controller@3002000 {
> @@ -75,7 +44,7 @@ porta: gpio-controller@0 {
>  				reg = <0>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
> -				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
>  
> @@ -93,7 +62,7 @@ portb: gpio-controller@0 {
>  				reg = <0>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
> -				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
>  
> @@ -111,7 +80,7 @@ portc: gpio-controller@0 {
>  				reg = <0>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
> -				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
>  
> @@ -129,7 +98,7 @@ portd: gpio-controller@0 {
>  				reg = <0>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
> -				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
>  
> @@ -137,7 +106,7 @@ saradc: adc@30f0000 {
>  			compatible = "sophgo,cv1800b-saradc";
>  			reg = <0x030f0000 0x1000>;
>  			clocks = <&clk CLK_SARADC>;
> -			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(84) IRQ_TYPE_LEVEL_HIGH>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			status = "disabled";
> @@ -162,7 +131,7 @@ i2c0: i2c@4000000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
>  			clock-names = "ref", "pclk";
> -			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -173,7 +142,7 @@ i2c1: i2c@4010000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
>  			clock-names = "ref", "pclk";
> -			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -184,7 +153,7 @@ i2c2: i2c@4020000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
>  			clock-names = "ref", "pclk";
> -			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -195,7 +164,7 @@ i2c3: i2c@4030000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
>  			clock-names = "ref", "pclk";
> -			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -206,14 +175,14 @@ i2c4: i2c@4040000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
>  			clock-names = "ref", "pclk";
> -			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
>  		uart0: serial@4140000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x04140000 0x100>;
> -			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(28) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
>  			clock-names = "baudclk", "apb_pclk";
>  			reg-shift = <2>;
> @@ -224,7 +193,7 @@ uart0: serial@4140000 {
>  		uart1: serial@4150000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x04150000 0x100>;
> -			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(29) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
>  			clock-names = "baudclk", "apb_pclk";
>  			reg-shift = <2>;
> @@ -235,7 +204,7 @@ uart1: serial@4150000 {
>  		uart2: serial@4160000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x04160000 0x100>;
> -			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(30) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
>  			clock-names = "baudclk", "apb_pclk";
>  			reg-shift = <2>;
> @@ -246,7 +215,7 @@ uart2: serial@4160000 {
>  		uart3: serial@4170000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x04170000 0x100>;
> -			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(31) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
>  			clock-names = "baudclk", "apb_pclk";
>  			reg-shift = <2>;
> @@ -261,7 +230,7 @@ spi0: spi@4180000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
>  			clock-names = "ssi_clk", "pclk";
> -			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -272,7 +241,7 @@ spi1: spi@4190000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
>  			clock-names = "ssi_clk", "pclk";
> -			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -283,7 +252,7 @@ spi2: spi@41a0000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
>  			clock-names = "ssi_clk", "pclk";
> -			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
> @@ -294,14 +263,14 @@ spi3: spi@41b0000 {
>  			#size-cells = <0>;
>  			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
>  			clock-names = "ssi_clk", "pclk";
> -			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  		};
>  
>  		uart4: serial@41c0000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x041c0000 0x100>;
> -			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(32) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
>  			clock-names = "baudclk", "apb_pclk";
>  			reg-shift = <2>;
> @@ -312,7 +281,7 @@ uart4: serial@41c0000 {
>  		sdhci0: mmc@4310000 {
>  			compatible = "sophgo,cv1800b-dwcmshc";
>  			reg = <0x4310000 0x1000>;
> -			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_AXI4_SD0>,
>  				 <&clk CLK_SD0>;
>  			clock-names = "core", "bus";
> @@ -322,7 +291,7 @@ sdhci0: mmc@4310000 {
>  		sdhci1: mmc@4320000 {
>  			compatible = "sophgo,cv1800b-dwcmshc";
>  			reg = <0x4320000 0x1000>;
> -			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_AXI4_SD1>,
>  				 <&clk CLK_SD1>;
>  			clock-names = "core", "bus";
> @@ -332,7 +301,7 @@ sdhci1: mmc@4320000 {
>  		dmac: dma-controller@4330000 {
>  			compatible = "snps,axi-dma-1.01a";
>  			reg = <0x04330000 0x1000>;
> -			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
>  			clock-names = "core-clk", "cfgr-clk";
>  			#dma-cells = <1>;
> @@ -344,19 +313,5 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <4>;
>  			status = "disabled";
>  		};
> -
> -		plic: interrupt-controller@70000000 {
> -			reg = <0x70000000 0x4000000>;
> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> -			interrupt-controller;
> -			#address-cells = <0>;
> -			#interrupt-cells = <2>;
> -			riscv,ndev = <101>;
> -		};
> -
> -		clint: timer@74000000 {
> -			reg = <0x74000000 0x10000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> -		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> index 7f79de33163c..732d0e72cf13 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>   */
>  
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
>  #include "cv18xx.dtsi"
> @@ -16,22 +18,62 @@ memory@80000000 {
>  		reg = <0x80000000 0x10000000>;
>  	};
>  
> -	soc {
> -		pinctrl: pinctrl@3001000 {
> -			compatible = "sophgo,sg2002-pinctrl";
> -			reg = <0x03001000 0x1000>,
> -			      <0x05027000 0x1000>;
> -			reg-names = "sys", "rtc";
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <25000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "thead,c906", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <512>;
> +			d-cache-size = <65536>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			mmu-type = "riscv,sv39";
> +			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
>  		};
>  	};
>  };
>  
> -&plic {
> -	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> -};
> +&soc {
> +	interrupt-parent = <&plic>;
> +	dma-noncoherent;
>  
> -&clint {
> -	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> +	pinctrl: pinctrl@3001000 {
> +		compatible = "sophgo,sg2002-pinctrl";
> +		reg = <0x03001000 0x1000>,
> +		      <0x05027000 0x1000>;
> +		reg-names = "sys", "rtc";
> +	};
> +
> +	plic: interrupt-controller@70000000 {
> +		compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> +		reg = <0x70000000 0x4000000>;
> +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		riscv,ndev = <101>;
> +	};
> +
> +	clint: timer@74000000 {
> +		compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> +		reg = <0x74000000 0x10000>;
> +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +	};
>  };
>  
>  &clk {
> -- 
> 2.48.1
> 

