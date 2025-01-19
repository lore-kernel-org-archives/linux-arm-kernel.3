Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40744C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 22:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1NEaOvJP6ktRyon1qt65VnsfcXxR9/jvk2LgosJ8u8=; b=QA6dKMqu0MeF8nF88/ETaaV4Qz
	BucPuzX4WWTM9BlG3ubgG44zomZr9HWJ1KA6dtmbH20FfZ7eFj4rBGc/w9zBG3hLb+/FlJDvDPh8I
	eqDpuBSbIVpRswhwfs5ZtNDnnWXlyFIuibCL+fCMNAJVhAiHrzspXNq8G687gAvdE7KlPIDuTOTgX
	+UOG7DvGKo+CP6uMA2Pw9gwXyhe5t5z+5HIXRgMOx3ug3DfuUByXG9inVz8JjQSZCFQJpTpHWUEdz
	ZzNzaS+xvMZIVGsj7qfCH+YCZHwAaAfyKVED1llX/sCbd6xEQ+7Vk8vbeYXe4hwmmOhKAu6orSlL7
	q5uwojKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZdn9-00000004OUW-0Gmp;
	Sun, 19 Jan 2025 22:29:15 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZdlr-00000004OKn-2fbk;
	Sun, 19 Jan 2025 22:27:56 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7b6f19a6c04so340560685a.0;
        Sun, 19 Jan 2025 14:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737325674; x=1737930474; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1NEaOvJP6ktRyon1qt65VnsfcXxR9/jvk2LgosJ8u8=;
        b=LdeXpAaPUA8i6SPyy/3fSQSdovSzybU/nfSaXUWbqFlyVq+D5h3fA/0stdUOW1xaFR
         sWyV/OII6RqQJbAwCeTkT1wwIpakvDJtRS+oIrakJprv/m4ZXYXfTX+PSCOEcQHNu27V
         cD2Kmjz+6ix3xEzn3ha64SDgIa+U6XRDg05hStv1zloxkKm5iXUDDqn6kLREd8AFhoBI
         NV1jHndeCoxk7fjJ7yKwWFiokF6N3LIV2RvBLGCjR4cBYPjhyxTUN13a8fn7xlz7UMaj
         X13w1kBDutvGY16pmN7mBkbReujqPFkaCdTt/+VFq1oC9INcJdZeAJpE70sTGpHeLU9e
         zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737325674; x=1737930474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1NEaOvJP6ktRyon1qt65VnsfcXxR9/jvk2LgosJ8u8=;
        b=lIm13+7Oy8ekyVcCJmPSpY7LQ5jilLsAptTVlszs3c5WhThg6D0vGcUdt8RkFdyZhw
         1+kkC+4Z1DpWDF7toqG8Hb40avrSgo3I4uSm/uZp8d+177Z0bvLtUy8i7Wp0SKfRlJTB
         dXWjR9j9VdEcIObMX6ubiWU8V9oSGfRGVFQhPbiY63nAST+RIh3rhhQMWWWmL113D2T5
         7Z7hG2ZQ/WTudidVtK8WJHkS+VXe3WAPkvncYnAK5Zsm52Nyw23pEw5MlbiK4qAPMQb/
         wCfGX0PWXwfCVbp2HpGoQ052fcUcmKQzqo5lAQwKp+/DdcTAkh9GTVY8rDhK7uYV2EGZ
         lBxg==
X-Forwarded-Encrypted: i=1; AJvYcCVeMfegqRhXKNxiGhr9Q+jZbxf8ihj1vSSmTCZGOs8VavP7DHjN3gFGQAl/HiVU7B6yV4bWadF6Rvg8U9Y=@lists.infradead.org, AJvYcCXutUcSEBP2W86Ho4YAEvjPk5sOfNv73cIxz0Sv7dzv/iUQkjjUGjIHvhcO88je1BmKrCWO0zKNnh9pLHd5VDNs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtc0ShJzXVeLv4dedTdXFJmp3oD959FUQcB7eGSK6q0T1MziKr
	X7ffPWGYUUIDbHLoGn3be5kD74+xK19SOAh7GsnIIw9kpL3DOzmB
X-Gm-Gg: ASbGncuNP9mKvXx+ekbcSoxg38+zaxMVnVlnFufgwqSipglfO9yxYeNhFzQg2n177rr
	Jp9sxX+4da2w6wdu+xadRXOfr4gdlJ3P5QkxWLLPpPc2zP7gWP/UqreGIsEf2+wqbbX9AZoFnfD
	FjxS53WBHPWmVrAvlEJWR8BrGI2h3gjCbJGKCwRnX0W01+PpNNeKgKmXB9/webjZmKGntAbulqT
	ftv/1Qnxx4FBCchUmkrP9CHprPlVBpFopROPbNqrEf/OQ==
X-Google-Smtp-Source: AGHT+IEvXRhN3YOjdvwsWeaMRKtp+AaGrFt8Vm/FPxPy/a3iJh+S2H70++OJxxsiqffQ3B4rmvMnqw==
X-Received: by 2002:a05:620a:44d5:b0:7b6:d1f6:3dc with SMTP id af79cd13be357-7be6321bf8cmr1874388785a.18.1737325673880;
        Sun, 19 Jan 2025 14:27:53 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7be61487360sm369189485a.57.2025.01.19.14.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:27:53 -0800 (PST)
Date: Mon, 20 Jan 2025 06:27:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <3iz53irwp7u3cvxf53j3ibcqbyojodnbxq7kgr4v6rvj3rx7ng@v3lolzcxh5ev>
References: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_142755_718945_EA7ED252 
X-CRM114-Status: GOOD (  31.63  )
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

On Sun, Jan 12, 2025 at 01:55:05AM +0100, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> 
> ---
> Dear ARM, RISCV, DT maintainers, I'd like to ask your opinion on the
> below patch, which I plan as a base for ARM64 BSP for dual-arch (RISCV or
> ARM64) Cvitek SoC SG2000. The main motivation for ARM64 support is the
> ARCH support in the upstream gcc, which is not that mature for RISCV.
> 
> I believe it's the first time we already have quite some base in the
> tree for a SoC, so it would be advantageous to re-use it and not
> duplicate the same SoC structures in two places, especially having
> in mind that Cvitek/Sophgo are still working on upstreaming and by
> far not all HW blocks are populated in the SoC DTs. They focus primarely
> on RISCV, so ARM64 would be dragging behind in this case if it would be
> forked.
> 
> On the other hand, including SoC dtsi from RISCV into ARM64 poses
> some technical challenges by itself, obviously CPU cores have to be
> deleted, same is true for interrupt controller. And the interrupt
> numbers are of course difference for ARM GIC, so they have to be
> overwritten.
> 
> Alternatively I can split existing .dtsi included below into their
> RISCV-specific and generic parts, so that both ARM64 and RISCV would
> include generic part and their corresponding ARCH-specific parts
> bringing CPU cores + interrupt controller + IRQ numbers for each and
> every device separately.
> 
> The below example isactually booting (being included into board-level
> DT), so it's a real example I'd be ready to submit if there will be
> no objections of the cross-ARCH include approach in general.
> 
> What are your thoughts?
> 
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi | 164 +++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..96afd342bde5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "../../../../riscv/boot/dts/sophgo/cv18xx.dtsi"
> +#include "../../../../riscv/boot/dts/sophgo/cv181x.dtsi"
> +

> +/delete-node/ &cpu0;
> +/delete-node/ &plic;
> +/delete-node/ &clint;

You can split the riscv specific device into a separate file
so you not need to set delete-node.

> +
> +/ {
> +	compatible = "sophgo,sg2000";
> +	interrupt-parent = <&gic>;
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;	/* 512MiB */
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +		always-on;
> +		clock-frequency = <25000000>;
> +	};
> +
> +	gic: interrupt-controller@1f01000 {
> +		compatible = "arm,cortex-a15-gic";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		reg = <0x01f01000 0x1000>,
> +		      <0x01f02000 0x2000>;
> +	};
> +
> +	soc {
> +		/delete-property/ interrupt-parent;
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible = "sophgo,sg2000-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +	};
> +};
> +
> +&cpus {
> +	cpu0: cpu@0 {
> +		compatible = "arm,cortex-a53";
> +		device_type = "cpu";
> +		reg = <0>;
> +		enable-method = "psci";
> +		next-level-cache = <&l2>;
> +	};
> +
> +	l2: l2-cache {
> +		compatible = "cache";
> +	};
> +};
> +
> +&clk {
> +	compatible = "sophgo,sg2000-clk";
> +};
> +
> +&saradc {
> +	interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
> +};
> +
> +&dmac {
> +	interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi0 {
> +	interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi1 {
> +	interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi2 {
> +	interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi3 {
> +	interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart0 {
> +	interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart1 {
> +	interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart2 {
> +	interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart3 {
> +	interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart4 {
> +	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&porta {
> +	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&portb {
> +	interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&portc {
> +	interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&portd {
> +	interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c0 {
> +	interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c1 {
> +	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c2 {
> +	interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c3 {
> +	interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c4 {
> +	interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&emmc {
> +	interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&sdhci0 {
> +	interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&sdhci1 {
> +	interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +};
> 
> -- 
> Alexander Sverdlin.
> 

