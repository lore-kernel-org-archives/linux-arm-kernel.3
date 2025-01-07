Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6AAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BlrWE22mFdZZZj4/IslF8OJAVjIT4zaHIADvB+N05s=; b=IhCRMrsJL5a7ECUdSo0KRP6DHq
	764oz1elaFgGE0T5ZZotClMhHsEInHP9p6E05ozkb1TJ5KqcwznXWdlOcpWhzuoAJlkdplJ3NhCEE
	aCVaKBCbWAY4PA8l5HCZ6bXuSS1qLuOFgvygssTIuJf5mv7pIBQklj0rHQHwxmmLIebhesyOkqmfD
	O6wW6xCJIJDgRxuTwCukFXchA3+eFwcu+RRxhXPWQm7r0Fm3xFhp75NR3Baa3nXhMevMgvEaOv1Hd
	5KbnGWvlrUrPWPPQ/IZdvhOEzwZQyYbOLsOXvj+48gz8Y+oFZ+YM/pKx/BTyBjeE/OOmmf/HGSHz1
	7ckYqVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAU5-00000005BP8-2cr1;
	Tue, 07 Jan 2025 14:23:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAOQ-000000059Xw-0EAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:17:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225F81424;
	Tue,  7 Jan 2025 06:17:39 -0800 (PST)
Received: from [10.57.4.77] (unknown [10.57.4.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23D6F3F59E;
	Tue,  7 Jan 2025 06:17:09 -0800 (PST)
Message-ID: <34f9c682-8a72-491e-9dbd-fc9002496d31@arm.com>
Date: Tue, 7 Jan 2025 14:17:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
 <20250103181623.1980433-3-vincenzo.frascino@arm.com>
 <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_061714_183869_06281B19 
X-CRM114-Status: GOOD (  24.72  )
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

Hi Rob,

Happy new year!

On 03/01/2025 22:14, Rob Herring wrote:
> On Fri, Jan 3, 2025 at 12:16 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
>>
>> The Morello architecture is an experimental extension to Armv8.2-A,
>> which extends the AArch64 state with the principles proposed in
>> version 7 of the Capability Hardware Enhanced RISC Instructions
>> (CHERI) ISA.
>>
>> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
>> some functionalities that have conveniently been included in
>> morello.dtsi to avoid duplication.
>>
>> Introduce morello.dtsi.
>>
>> Note: Morello fvp will be introduced with a future patch series.
>>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> ---
>>  arch/arm64/boot/dts/arm/morello.dtsi | 467 +++++++++++++++++++++++++++
>>  1 file changed, 467 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
>> new file mode 100644
>> index 000000000000..0089b4f2eca7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/arm/morello.dtsi
>> @@ -0,0 +1,467 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +/*
>> + * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +       interrupt-parent = <&gic>;
>> +
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       clocks {
> 
> Drop this container node.
>

Will do in v5.

>> +               soc_refclk50mhz: clock-50000000 {
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <50000000>;
>> +                       clock-output-names = "apb_pclk";
>> +               };
>> +
>> +               soc_uartclk: clock-50000000-uart {
> 
> There's little point to having 2 fixed clocks with no s/w controls at
> the same frequency. Drop.
> 

Ok, will use the same reference for both.

>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <50000000>;
>> +                       clock-output-names = "uartclk";
>> +               };
>> +
>> +               soc_refclk85mhz: clock-85000000 {
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <85000000>;
>> +                       clock-output-names = "iofpga:aclk";
>> +               };
>> +
>> +               dpu_aclk: clock-350000000 {
>> +                       /* 77.1 MHz derived from 24 MHz reference clock */
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <350000000>;
>> +                       clock-output-names = "aclk";
>> +               };
>> +
>> +               dpu_pixel_clk: clock-148500000 {
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <148500000>;
>> +                       clock-output-names = "pxclk";
>> +               };
>> +       };
>> +
>> +       cpus {
>> +               #address-cells = <2>;
>> +               #size-cells = <0>;
>> +
>> +               cpu0: cpu@0 {
>> +                       compatible = "arm,neoverse-n1";
> 
> I'm pretty sure the N1 doesn't support CHERI/morello. Perhaps
> "arm,neoverse-n1-morello" if we want to capture what it is derived
> from and since "arm,morello" is taken already.
> 

Thank you for this, is the type of feedback I was looking for. My interpretation
of "compatible" was that it is the common denominator in between in between two
or more elements (hence I used neoverse-n1), but clearly it was a bit off.

Since the CPU core is called Rainier, we could either use "arm,ranier" or
"arm,morello-r0p1" to be in line with the SMBIOS.

What do you think?

[...]

>> +
>> +       pmu {
>> +               compatible = "arm,armv8-pmuv3";
> 
> Missing the CPU specific compatible.
>

I will add it in v5.

[...]

>> +
>> +       soc: soc {
>> +               compatible = "simple-bus";
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               interrupt-parent = <&gic>;
>> +               ranges;
>> +
>> +               dp0: display@2cc00000 {
> 
> Sort nodes by address.
> 

Ok, I will do in v5.

[...]

>> +               pcie_ctlr: pcie@28c0000000 {
>> +                       device_type = "pci";
>> +                       compatible = "pci-host-ecam-generic";
>> +                       reg = <0x28 0xC0000000 0 0x10000000>;
>> +                       ranges = <0x01000000 0x00 0x00000000 0x00 0x6f000000 0x00 0x00800000>,
>> +                                <0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x0f000000>,
>> +                                <0x42000000 0x09 0x00000000 0x09 0x00000000 0x1f 0xc0000000>;
>> +                       bus-range = <0 255>;
> 
> Not needed unless less than this range.
> 

Ok, I will remove it in v5.

[...]

-- 
Regards,
Vincenzo


