Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6FD49C9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdT/aV4KR3LbYKx3nONw0SF43YDOLgj6n8pzzxhiB/w=; b=wTetXrrmogbQi5HtcUMnBea45D
	GQmJWNTMjo1bNFyHw22wrj8+kGCXz2VwOFPHdGjCX2MCr/WTR0f37BjJAnflhZxZy5+eQkQWgTMjb
	qZ2oIB02b2J9KY3z3EizapZyatCxyO5paBWl9IOHeKQNBSJrUt6HHv1qsBeK99SyarnIYVQHRbns7
	07oNtyHqgZZ+qOuym517eJuOz1N/WLGTYDkVKkzngSHzJUsSKb+b3QYAzYun2GRIdYnrYVQU2nIQg
	aTZjM+1Pc14U676c/+zCTxQVl/h0OnEUTXYYaM64PNsnR9YYb9P4Bii+ka/Z9d+5gcXfqqsoWE9yO
	6FEPMJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllmt-00000001KOS-0GJQ;
	Fri, 30 Jan 2026 10:31:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllmq-00000001KO6-0Q7i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA1DD153B;
	Fri, 30 Jan 2026 02:31:27 -0800 (PST)
Received: from [10.33.50.63] (e142021.arm.com [10.33.50.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 636A63F632;
	Fri, 30 Jan 2026 02:31:32 -0800 (PST)
Message-ID: <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
Date: Fri, 30 Jan 2026 11:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
To: Debbie Horsfall <debbie.horsfall@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_023136_230573_91BEF62F 
X-CRM114-Status: GOOD (  39.00  )
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

Hi Debbie,

On 1/30/26 10:58, Debbie Horsfall wrote:
> On 27/01/2026 13:22, Andre Przywara wrote:
>> On Fri, 23 Jan 2026 17:37:47 +0000
>> Debbie Horsfall <debbie.horsfall@arm.com> wrote:
>>
>> Hi Debbie,
>>
>> thanks for taking the time to send this upstream!
>>
> 
> Thank you for reviewing it! I have responded to all of your points and 
> will send a v2 patch set.
> 
> 
>>> Introduce the Zena CSS Fixed Virtual Platform (FVP) dts. This is
>>> currently the only Zena CSS variant, however the common definitions are
>>> included in a common dtsi for extensibility.
>>>
>>> Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
>>> ---
>>>   MAINTAINERS                              |   1 +
>>>   arch/arm64/boot/dts/arm/Makefile         |   1 +
>>>   arch/arm64/boot/dts/arm/zena-css-fvp.dts |  55 ++
>>>   arch/arm64/boot/dts/arm/zena-css.dtsi    | 826 ++++++++++++++++++++ 
>>> +++++++++++
>>>   4 files changed, 883 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 90d88137adf1..d1d2dae6a71e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3727,6 +3727,7 @@ ARM/ZENA CSS PLATFORM
>>>   M:    Debbie Horsfall <debbie.horsfall@arm.com>
>>>   S:    Maintained
>>>   F:    Documentation/devicetree/bindings/arm/arm,zena-css.yaml
>>> +F:    arch/arm64/boot/dts/arm/zena-css*
>>>   ARM/ZYNQ ARCHITECTURE
>>>   M:    Michal Simek <michal.simek@amd.com>
>>> diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/ 
>>> arm/Makefile
>>> index f30ee045dc95..770fb145b4a9 100644
>>> --- a/arch/arm64/boot/dts/arm/Makefile
>>> +++ b/arch/arm64/boot/dts/arm/Makefile
>>> @@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7- 
>>> ca53x2.dtb
>>>   dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
>>>   dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000- 
>>> mps3.dtb
>>>   dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb morello-fvp.dtb
>>> +dtb-$(CONFIG_ARCH_VEXPRESS) += zena-css-fvp.dtb
>>> diff --git a/arch/arm64/boot/dts/arm/zena-css-fvp.dts b/arch/arm64/ 
>>> boot/dts/arm/zena-css-fvp.dts
>>> new file mode 100644
>>> index 000000000000..d3c649e894d1
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
>>> @@ -0,0 +1,55 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +/*
>>> + * Copyright (c) 2025, Arm Limited. All rights reserved.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "zena-css.dtsi"
>>> +
>>> +/ {
>>> +    model = "Zena CSS Fixed Virtual Platform";
>>> +    compatible = "arm,zena-css-fvp", "arm,zena-css";
>>> +
>>> +    chosen {
>>> +        stdout-path = &soc_serial0;
>>> +    };
>>> +};
>>> +
>>> +&soc {
>>> +    virtio@30060000 {
>>> +        compatible = "virtio,mmio";
>>> +        reg = <0x0 0x30060000 0x0 0x10000>;
>>> +        interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
>>> +    };
>>> +
>>> +    virtio@30020000 {
>>
>> I think the nodes should be ordered by their address. Do you make any
>> assumptions about naming of devices (/dev/vda, /dev/vdb) in your setup?
>>
> 
> I will move virtio@30060000 into order. I don't think there are any 
> assumptions on device naming dependent on ordering but I will run all of 
> our tests with them in address order to check.

Thanks, that's good to know. I was afraid there was some cheeky 
assumption about /dev/vda pointing to a certain image or something ...

>>> +        compatible = "virtio,mmio";
>>> +        reg = <0x0 0x30020000 0x0 0x10000>;
>>> +        interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
>>> +    };
>>> +
>>> +    virtio@30030000 {
>>> +        compatible = "virtio,mmio";
>>> +        reg = <0x0 0x30030000 0x0 0x10000>;
>>> +        interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>;
>>> +    };
>>> +
>>> +    virtio@30040000 {
>>> +        compatible = "virtio,mmio";
>>> +        reg = <0x0 0x30040000 0x0 0x10000>;
>>> +        interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
>>> +    };
>>> +
>>> +    virtio@30050000 {
>>> +        compatible = "virtio,mmio";
>>> +        reg = <0x0 0x30050000 0x0 0x10000>;
>>> +        interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
>>> +    };
>>> +
>>
>> Do you know if there is something at 0x30070000? Maybe something that
>> needs explicit enablement on the model command line? In this case we 
>> might
>> want a comment here.
>>
> 
> The memory map documentation says there is no device there.

Good, thanks for checking.

> 
>>> +    virtio@30080000 {
>>> +        compatible = "virtio,mmio";
>>> +        reg = <0x0 0x30080000 0x0 0x10000>;
>>> +        interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
>>> +    };
>>> +};
>>> diff --git a/arch/arm64/boot/dts/arm/zena-css.dtsi b/arch/arm64/boot/ 
>>> dts/arm/zena-css.dtsi
>>> new file mode 100644
>>> index 000000000000..7825e93df0a6
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/arm/zena-css.dtsi
>>> @@ -0,0 +1,826 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +/*
>>> + * Copyright (c) 2025, Arm Limited. All rights reserved.
>>> + */

[ ... ]

>>> +
>>> +    soc: soc {
>>> +        compatible = "simple-bus";
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +        ranges;
>>> +
>>> +        timer@1a810000 {
>>> +            compatible = "arm,armv7-timer-mem";
>>> +            reg = <0x0 0x1a810000 0 0x10000>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +            /* Map child space [0x0..0x30000) to parent @ 0x1a810000 */
>>> +            ranges = <0x0 0x0 0x1a810000 0x00030000>;
>>> +
>>> +            frame@20000 {
>>> +                frame-number = <0>;
>>> +                interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>>> +                reg = <0x20000 0x10000>;
>>> +            };
>>> +        };
>>> +
>>> +        gic: interrupt-controller@20800000 {
>>> +            compatible = "arm,gic-v3";
>>> +            #redistributor-regions = <16>;
>>> +            reg = <0x0 0x20800000 0x0 0x10000>,    /* GICD */
>>> +                <0x0 0x20880000 0x0 0x40000>,    /* 16 * GICR */
>>> +                <0x0 0x208c0000 0x0 0x40000>,
>>
>> Those look as if they are all contiguous, aren't they?
>> Then you wouldn't need the #redistributor-regions property above, and can
>> just go with one big GICR region.
>>
> 
> This is a workaround for the AP GIC Multiview. Is it acceptable?

Ah, right, sorry, I now remember, that's some automotive GIC, and this 
multiview feature causes the GICR_TYPER.Last bit not being correct, right?
In this case this is indeed a workaround, but you should add a comment 
here. Mention the GIC model (GIC-720AE?), and that its multiview feature 
causes the GICR_TYPER.Last bit not being as expected, so each core needs 
to gets its own redist region.

>>> +                <0x0 0x20900000 0x0 0x40000>,
>>> +                <0x0 0x20940000 0x0 0x40000>,
>>> +                <0x0 0x20980000 0x0 0x40000>,
>>> +                <0x0 0x209c0000 0x0 0x40000>,
>>> +                <0x0 0x20a00000 0x0 0x40000>,
>>> +                <0x0 0x20a40000 0x0 0x40000>,
>>> +                <0x0 0x20a80000 0x0 0x40000>,
>>> +                <0x0 0x20ac0000 0x0 0x40000>,
>>> +                <0x0 0x20b00000 0x0 0x40000>,
>>> +                <0x0 0x20b40000 0x0 0x40000>,
>>> +                <0x0 0x20b80000 0x0 0x40000>,
>>> +                <0x0 0x20bc0000 0x0 0x40000>,
>>> +                <0x0 0x20c00000 0x0 0x40000>,
>>> +                <0x0 0x20c40000 0x0 0x40000>;
>>> +            #interrupt-cells = <3>;
>>> +            #address-cells = <2>;
>>> +            #size-cells = <2>;
>>> +            ranges;
>>> +            interrupt-controller;
>>> +            interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +            its1: msi-controller@20840000 {
>>
>> Are there multiple ITSes, and some are just not shown here?
>> If not, please just use "its" as the label name.
>>
> 
> There's only one so I'll rename it.
> 
>>> +                compatible = "arm,gic-v3-its";
>>> +                reg = <0x0 0x20840000 0x0 0x40000>;
>>> +                msi-controller;
>>> +                #msi-cells = <1>;
>>> +            };
>>> +        };
>>> +
>>> +        /* UART is fixed as 24MHz, both UARTCLK and PCLK */
>>> +        soc_serial0: serial@1a400000 {
>>> +            compatible = "arm,pl011", "arm,primecell";
>>> +            reg = <0x0 0x1a400000 0x0 0x10000>;
>>> +            interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&soc_clk24mhz>, <&soc_clk24mhz>;
>>> +            clock-names = "uartclk", "apb_pclk";
>>> +        };
>>> +
>>> +        watchdog@1a420000 {
>>> +            compatible = "arm,sbsa-gwdt";
>>> +            reg = <0x0 0x1a420000 0x0 0x10000>,
>>> +                  <0x0 0x1a430000 0x0 0x10000>;
>>> +            interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>>> +        };
>>> +
>>> +        rtc@300d0000 {
>>> +            compatible = "arm,pl031", "arm,primecell";
>>> +            reg = <0x0 0x300d0000 0x0 0x10000>;
>>> +            interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>>
>> Can you please double check this interrupt ID? The IRQ mapping document
>> just lists some "expansion range" here, but I cannot verify if this is
>> using the SPI offset of 32 or not.
>>
> 
> I have confirmed with our interrupt map.
> 
>>> +            clocks = <&soc_clk24mhz>;
>>> +            clock-names = "apb_pclk";
>>> +        };
>>> +
>>> +    };
>>> +
>>> +    psci {
>>> +        compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
>>
>> You don't need compatibility to the pre 0.2 PSCI standard, so drop the
>> last compatible name.
>>
> 
> I will remove this.
> 
>>> +        method = "smc";
>>> +        cpu_suspend = <0xc4000001>;
>>> +        cpu_off = <0x84000002>;
>>> +        cpu_on = <0xc4000003>;
>>
>> And those three function IDs are only needed for this pre-0.2 name, so 
>> you
>> can remove them.
>>
> 
> I will remove them.
> 
>>> +    };
>>> +
>>> +    sram: sram@104000 {
>>> +        compatible = "mmio-sram";
>>> +        reg = <0x0 0x104000 0x0 0x00001000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges = <0 0x0 0x104000 0x00001000>;
>>> +
>>> +        scmi_shmem_tx: scpshmem-sram-section@0 {
>>> +            compatible = "arm,scmi-shmem";
>>> +            reg = <0x0 0x100>;
>>> +        };
>>> +        scmi_shmem_rx: scpshmem-sram-section@100 {
>>> +            compatible = "arm,scmi-shmem";
>>> +            reg = <0x100 0x100>;
>>> +        };
>>> +    };
>>> +
>>> +    mbox_db_tx: mailbox@40020000 {
>>> +        compatible = "arm,mhuv3";
>>> +        reg = <0x0 0x40020000 0x0 0x30000>;
>>> +        clocks = <&soc_clk24mhz>;
>>> +        #mbox-cells = <3>;
>>> +        interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupt-names = "combined";
>>> +    };
>>> +
>>> +    mbox_db_rx: mailbox@40060000 {
>>> +        compatible = "arm,mhuv3";
>>> +        reg = <0x0 0x40060000 0x0 0x30000>;
>>> +        clocks = <&soc_clk24mhz>;
>>> +        #mbox-cells = <3>;
>>> +        interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupt-names = "combined";
>>> +    };
>>> +
>>> +    firmware {
>>> +        scmi {
>>> +            compatible = "arm,scmi";
>>> +            mbox-names = "tx", "rx";
>>> +            mboxes = <&mbox_db_tx 0 0 0 &mbox_db_rx 0 0 0 
>>> &mbox_db_rx 0 0 2>;
>>
>> What is this third mailbox about? I think this would have to match
>> mbox-names also? I guess this is not needed?
>>
> 
> The team is confirming which mbox names are appropriate. To pass the 
> Devicetree validation the only valid combination of three is: "tx", 
> "tx_reply", "rx". However, the second mbox needs to be rx else the SCMI 
> communication fails. I'll investigate further and make sure the names 
> match.

So do you need just one "tx", but "rx" plus "rx_reply"? Which isn't 
valid in the current binding?
If that's the case, then we would need a patch to relax the binding and 
allowing this combination as well.
Looking into the kernel code it looks like the SCMI driver doesn't use 
mbox-names, but explicitly expects assignments depending on the number 
of mboxes? Somewhat confusing ...

Cheers,
Andre

> 
>> Cheers,
>> Andre
>>
>>> +            shmem = <&scmi_shmem_tx &scmi_shmem_rx>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            scmi_dvfs: protocol@13 {
>>> +                reg = <0x13>;
>>> +                #clock-cells = <1>;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>>
>>
> 
> 


