Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5EFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iafs5z4t51PC0mR6Jsk4lkno3kKA00NuzAJHsxDXm0U=; b=ZFSN2H/LNuHwPqC3fE5qjRKA4Q
	yHzQ9rh3PDh6MtR79l/teWZgO/j5ezkZcBqIWQvod1Z6UtcvIsv05RubKzFd2FdA/u9jsSAdyKlQ2
	kfVAixS6mo6+McBuVPvXd2gIZXI5tH+AqKuIxW7exDIoja0GvzcYSraiIUN2dCUosXixPzpCmFhgI
	Tv1I9XNxI/NbIB4VYOn//xDsGYLCRcCbS/Rp/sUD/RihiRYfd6X39GF/Uwg6xVgQW19pI6RtHQ7qS
	vYeroxmnjUz/aVZzr2o50PX+MTZUMM1OJT+oG1XApDZ3MTeUh+t10hEwTtktoBnqMcKKtN4CvHAq/
	qkWIOVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiINX-00000008d9R-23pC;
	Wed, 12 Feb 2025 19:26:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIM5-00000008crn-15kf;
	Wed, 12 Feb 2025 19:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08D945C6194;
	Wed, 12 Feb 2025 19:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7737FC4CEDF;
	Wed, 12 Feb 2025 19:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739388304;
	bh=7sesecLH7TnirzeBcMYhfkDs4c2KfL3v0QPmpCbmrjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fXXOzCdXve+Cj0IcPQfCSkT54RQbKorXd/SFMTBClDoXtj0zTZEi8L2oDTOtqDvhA
	 vRZsUw6on+dtKrngKRf0NyZV6L1UClNLFczOhoFaCLtqS8woQYrN+tZhUVpjP49Ijc
	 S0GYPyrL6o+0s1CAxQaWwJlWqj56Q9wI3QKPUxpUgAnkfUZVwzHrucs8vURKRxUVkH
	 kPFfxDwiMbeeDRSZ3YSfI8yS5t8XDyzdOZ1DuLC5UQZi7hyA0ZM3WglEBQUayfNqed
	 YZrGjmAm399SwRplMlsaqGUQY4BC4ztkPJxKCCS6657WPNaG+dxp2MMX5HU7mf1BYh
	 kMQhZzdwi8G2A==
Message-ID: <a01de9d5-726c-4064-9617-86e01aa7e75c@kernel.org>
Date: Wed, 12 Feb 2025 20:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Chao Wei <chao.wei@sophgo.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
 <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_112505_418646_1C0719C3 
X-CRM114-Status: GOOD (  19.12  )
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

On 12/02/2025 18:44, Alexander Sverdlin wrote:
> Hi 
> 
> On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
>>>>> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
>>>>> core and interrupt controllers' parts into the respective per-SoC .dtsi
>>>>> files.
>>>>>
>>>>> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
>>>>> into "plic" interrupt-controller numbering.
>>>>>
>>>>> Have a nice refactoring side-effect that "plic" and "clint" "compatible"
>>>>> property is not specified outside of the corresponding device itself.
>>>>>
>>>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>>>>> ---
>>>>> Changelog:
>>>>> v2:
>>>>> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
>>>>> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
>>>>> included cv18xx.dtsi;
>>>>> - define a label for the "soc" node and use it in the newly introduced DTs;
>>>>>
>>>>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi    | 64 ++++++++++++---
>>>>>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi    | 64 ++++++++++++---
>>>>>  arch/riscv/boot/dts/sophgo/cv181x.dtsi     |  2 +-
>>>>>  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
>>>>>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi     | 91 ++++++----------------
>>>>>  arch/riscv/boot/dts/sophgo/sg2002.dtsi     | 64 ++++++++++++---
>>>>>  6 files changed, 240 insertions(+), 102 deletions(-)
>>>>>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
>>>>>
>>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>>>> index aa1f5df100f0..eef2884b36f9 100644
>>>>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>>>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>>>> @@ -3,6 +3,8 @@
>>>>>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>>>>>   */
>>>>>  
>>>>> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
>>>>> +
>>>>>  #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
>>>>>  #include "cv18xx.dtsi"
>>>>>  
>>>>> @@ -14,22 +16,62 @@ memory@80000000 {
>>>>>  		reg = <0x80000000 0x4000000>;
>>>>>  	};
>>>>>  
>>>>
>>>>> -	soc {
>>>>> -		pinctrl: pinctrl@3001000 {
>>>>> -			compatible = "sophgo,cv1800b-pinctrl";
>>>>> -			reg = <0x03001000 0x1000>,
>>>>> -			      <0x05027000 0x1000>;
>>>>> -			reg-names = "sys", "rtc";
>>>>
>>>>
>>>>> +	cpus: cpus {
>>>>> +		#address-cells = <1>;
>>>>> +		#size-cells = <0>;
>>>>> +		timebase-frequency = <25000000>;
>>>>> +
>>>>> +		cpu0: cpu@0 {
>>>>> +			compatible = "thead,c906", "riscv";
>>>>> +			device_type = "cpu";
>>>>> +			reg = <0>;
>>>>> +			d-cache-block-size = <64>;
>>>>> +			d-cache-sets = <512>;
>>>>> +			d-cache-size = <65536>;
>>>>> +			i-cache-block-size = <64>;
>>>>> +			i-cache-sets = <128>;
>>>>> +			i-cache-size = <32768>;
>>>>> +			mmu-type = "riscv,sv39";
>>>>> +			riscv,isa = "rv64imafdc";
>>>>> +			riscv,isa-base = "rv64i";
>>>>> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
>>>>> +					       "zifencei", "zihpm";
>>>>> +
>>>>> +			cpu0_intc: interrupt-controller {
>>>>> +				compatible = "riscv,cpu-intc";
>>>>> +				interrupt-controller;
>>>>> +				#interrupt-cells = <1>;
>>>>> +			};
>>>>>  		};
>>>>>  	};
>>>>>  };
>>>>
>>>> Make all soc definition include the common cpu file. 
>>>> Not just copy it.
>>>
>>> I was acting according to Krzysztof's suggestion:
>>> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
>>>
>>> Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core + interrupt
>>> controllers into it. Would it make sense?
>>
>>
>> I don't understand the original suggestion.
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
> include the latter in 3 other SoC-specific .dtsis. In v2 I've just
> duplicated the above snippet 3 times (refer to diffstat above).
> 
> What are your thoughts? In Renesas everything is duplicated, I believe.
> Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dtsi). 

If it represents some shared design/part, then it feels good.
Best regards,
Krzysztof

