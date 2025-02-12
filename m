Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54868C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=; b=PUDGNNycpcjsKAT7XL85pv+7SK
	M3D5Zikhbe+x/jX1pjKyaWXIL9xknSE4Oi9tgYHjYNiZWxO0o+W6QVuvfZ0vEHqDZRs3rjehqaI4/
	HGpqt/5Z1O3h5+y2bE49sGvM0R7zGLcFsQo5Izdq/EhlKAK8LEUEtzakIHh5LtECD8sOBLJWZnqW4
	4edKaaqV6tFZ5qGKIEACGQQIep6WIfcImeYsBPa7JP98M2AGeE4qHIEYi2kcB+qou+vgbLXCX+FBy
	huZgETTtIn/UnkDah6nkHTTObqnxyrdvaqIR/QXvMuafFel2rMO33Lzh9FE79RCbyk+0QrHf/ThVB
	DQSQgy5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLHm-000000093Ne-2Tld;
	Wed, 12 Feb 2025 22:32:50 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLGL-0000000931U-0QVa;
	Wed, 12 Feb 2025 22:31:22 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7be8f281714so21219185a.1;
        Wed, 12 Feb 2025 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739399479; x=1740004279; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=;
        b=WzxP01jMwmKe//khU7STiaL9FE19CLIHxEL/uKyqyeFJutoWkZm3J06IFPr+PGX2G0
         RY5DclEjTpXu/fhwO5hOVcpk3ELTS/bFJPIVJugl0H2LZgdL26p60Ec1EQW9rD1PQ9LX
         aFtep5aiI+Q1AeETUjlAeLT01hPNAvZy5MzA5/h1xXURYrnRSnVBaz7dJfWNzcd3ZvtY
         tbJ58WAu9FBggG42c0gzlZe4HPMpZ++k5jVOy9kLQ9gCq2GWpaAkXjjyKf3RGTDSjqhC
         LxR81vybJlm6NkyfCUJnahvtnU5qREyc2hwIWwK+rubyjenZ8PvGyulA2q1G1yxzEUfG
         TYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399479; x=1740004279;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=;
        b=FwWvb5UjchDBIZfXYNK3thSC3NZSUFhWF/JtQqd2b9al3tp+I9ellaJRyIBzjdPOwl
         GWVBlNyyISF/cAO5JFOHdXGntZVI86tLE8HQlU03LAJ8XkrR7sreoJAzGcXAXy0rtYjx
         veFD+Xn+qAIZD201yso60WOsr5X/XyYvafWYhhDPPyOPA6sKajhzcUhEIGT8ttttTaRf
         8LCjFtO+BnOOAwpghxX8elohXy+gupgZPiCvGoHPuzmQV2cXk+dSwVwsuoP5CiEqb6Oh
         O2R/a+sUEYj7LUCQ1leSHz2vPwLq7kF03MQ/j+8yOGpQvuzpRIgle4gSJdwZE6G6u1gJ
         oPMw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSjcYHjcS3gQ3hIxMxLN0l8WfE0TXrMkFOLB1UtDiFGfETSrSsc4Kra12mzJRMKrk6i8HiyMs3lcz8xZv+U8u@lists.infradead.org, AJvYcCXo15BKmlTB2BBnD/xb+HTLkuMrsFoNryOU4ll+6Et/bN9vy0ixdoLpTUS+rsRq/3bxp65zy5xQ0z+S4wY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRPdMED3i15nu4JOjsknzOBSXd2IQ+CmLf3LJPQHBCqcpTxWkM
	vV2tORO38KBNm/7psKJrXq/q/UcoNvQsax4kTITn965wjTcqms1u
X-Gm-Gg: ASbGncumNy5LpNZkMfALzoP/XU8E+ukVRp+pJJ7nn8y0DV43wShEXdyHtd/UH6Kj3J6
	XtcxAM95X6Rv06ZwaXZLBj9AEDqCMsa0f48Mh/2CPju5reZsowZSCJVzXMflEOYtf/10ksPEs9N
	JXxzORt34J65O3sE3w9bdoJlRKOSCZyf13O/CBQrh9BQn7NC/qPejm/G4gbbEB74VrVL5psrS+6
	FplnJGNMzqxs5yM7yPFCPc/G4AkgSzf5756B0lQHwtTLQP2a8QTNk/rGnbF1lQI7Ks=
X-Google-Smtp-Source: AGHT+IG/jqO7Gs3aNEJD2jlxWGUNxNPhJfXHJaQNAvosjjzRMKiNe50EuVFrHjd49yXn9DToPQh2SQ==
X-Received: by 2002:a05:620a:269c:b0:7c0:6c5b:d6e5 with SMTP id af79cd13be357-7c07a1ead00mr229402985a.54.1739399479479;
        Wed, 12 Feb 2025 14:31:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07518e80fsm127058185a.26.2025.02.12.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:31:19 -0800 (PST)
Date: Thu, 13 Feb 2025 06:31:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <p5aolstlrxnhb7wk45eukthlwiui337fssbum4lrpflvui773i@beif6axz66jx>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
 <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_143121_142788_881F1F08 
X-CRM114-Status: GOOD (  31.85  )
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

On Wed, Feb 12, 2025 at 06:44:15PM +0100, Alexander Sverdlin wrote:
> Hi 
> 
> On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
> > > > > Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> > > > > core and interrupt controllers' parts into the respective per-SoC .dtsi
> > > > > files.
> > > > > 
> > > > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> > > > > into "plic" interrupt-controller numbering.
> > > > > 
> > > > > Have a nice refactoring side-effect that "plic" and "clint" "compatible"
> > > > > property is not specified outside of the corresponding device itself.
> > > > > 
> > > > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > > > ---
> > > > > Changelog:
> > > > > v2:
> > > > > - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> > > > > core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> > > > > included cv18xx.dtsi;
> > > > > - define a label for the "soc" node and use it in the newly introduced DTs;
> > > > > 
> > > > >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi    | 64 ++++++++++++---
> > > > >  arch/riscv/boot/dts/sophgo/cv1812h.dtsi    | 64 ++++++++++++---
> > > > >  arch/riscv/boot/dts/sophgo/cv181x.dtsi     |  2 +-
> > > > >  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
> > > > >  arch/riscv/boot/dts/sophgo/cv18xx.dtsi     | 91 ++++++----------------
> > > > >  arch/riscv/boot/dts/sophgo/sg2002.dtsi     | 64 ++++++++++++---
> > > > >  6 files changed, 240 insertions(+), 102 deletions(-)
> > > > >  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > > > > 
> > > > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > index aa1f5df100f0..eef2884b36f9 100644
> > > > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > @@ -3,6 +3,8 @@
> > > > >   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > > >   */
> > > > >  
> > > > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > > > +
> > > > >  #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > > >  #include "cv18xx.dtsi"
> > > > >  
> > > > > @@ -14,22 +16,62 @@ memory@80000000 {
> > > > >  		reg = <0x80000000 0x4000000>;
> > > > >  	};
> > > > >  
> > > > 
> > > > > -	soc {
> > > > > -		pinctrl: pinctrl@3001000 {
> > > > > -			compatible = "sophgo,cv1800b-pinctrl";
> > > > > -			reg = <0x03001000 0x1000>,
> > > > > -			      <0x05027000 0x1000>;
> > > > > -			reg-names = "sys", "rtc";
> > > > 
> > > > 
> > > > > +	cpus: cpus {
> > > > > +		#address-cells = <1>;
> > > > > +		#size-cells = <0>;
> > > > > +		timebase-frequency = <25000000>;
> > > > > +
> > > > > +		cpu0: cpu@0 {
> > > > > +			compatible = "thead,c906", "riscv";
> > > > > +			device_type = "cpu";
> > > > > +			reg = <0>;
> > > > > +			d-cache-block-size = <64>;
> > > > > +			d-cache-sets = <512>;
> > > > > +			d-cache-size = <65536>;
> > > > > +			i-cache-block-size = <64>;
> > > > > +			i-cache-sets = <128>;
> > > > > +			i-cache-size = <32768>;
> > > > > +			mmu-type = "riscv,sv39";
> > > > > +			riscv,isa = "rv64imafdc";
> > > > > +			riscv,isa-base = "rv64i";
> > > > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > > > > +					       "zifencei", "zihpm";
> > > > > +
> > > > > +			cpu0_intc: interrupt-controller {
> > > > > +				compatible = "riscv,cpu-intc";
> > > > > +				interrupt-controller;
> > > > > +				#interrupt-cells = <1>;
> > > > > +			};
> > > > >  		};
> > > > >  	};
> > > > >  };
> > > > 
> > > > Make all soc definition include the common cpu file. 
> > > > Not just copy it.
> > > 
> > > I was acting according to Krzysztof's suggestion:
> > > https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> > > 
> > > Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core + interrupt
> > > controllers into it. Would it make sense?
> > 
> > 
> > I don't understand the original suggestion.
> 
> This is the snippet in question:
> 
> ---[ cut ]---
> #define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> 
> / {
> 	cpus: cpus {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		timebase-frequency = <25000000>;
> 
> 		cpu0: cpu@0 {
> 			compatible = "thead,c906", "riscv";
> 			device_type = "cpu";
> 			reg = <0>;
> 			d-cache-block-size = <64>;
> 			d-cache-sets = <512>;
> 			d-cache-size = <65536>;
> 			i-cache-block-size = <64>;
> 			i-cache-sets = <128>;
> 			i-cache-size = <32768>;
> 			mmu-type = "riscv,sv39";
> 			riscv,isa = "rv64imafdc";
> 			riscv,isa-base = "rv64i";
> 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> 					       "zifencei", "zihpm";
> 
> 			cpu0_intc: interrupt-controller {
> 				compatible = "riscv,cpu-intc";
> 				interrupt-controller;
> 				#interrupt-cells = <1>;
> 			};
> 		};
> 	};
> };
> 
> &soc {
> 	interrupt-parent = <&plic>;
> 	dma-noncoherent;
> 
> 	plic: interrupt-controller@70000000 {
> 		reg = <0x70000000 0x4000000>;
> 		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> 		interrupt-controller;
> 		#address-cells = <0>;
> 		#interrupt-cells = <2>;
> 		riscv,ndev = <101>;
> 	};
> 
> 	clint: timer@74000000 {
> 		reg = <0x74000000 0x10000>;
> 		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> 	};
> };
> ---[ cut ]---
> 
> Inochi's proposal is to put it into separate cv18xx-cpu-intc.dtsi and
> include the latter in 3 other SoC-specific .dtsis. 

Yes, this is what I want to say. Since I can confirm all cv18xx
series have the same riscv core (IIRC they share the same hw
design). There is no reason to duplicate them.

> In v2 I've just
> duplicated the above snippet 3 times (refer to diffstat above).
> 
> What are your thoughts? In Renesas everything is duplicated, I believe.
> Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dtsi). 
> 
> > Inochi, please trim unnecessary context from replies.
> 
> -- 
> Alexander Sverdlin.
> 

