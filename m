Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A66C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caFA4fxDoTMu0I8FRBkb5DIOVgz3RZKIQwz2VG4xSvA=; b=361hRZxbe62FoI3do44qEoc2Nc
	nU8CgHU9OADMnuiHnsKG7Riukd2Y3liePv6Rz2R7cJtZZi9/CUXLhFGaXQR0KvfrUrtvx2d3t5f8G
	ZpRVoJXQWl4hYzKDCYDnhbj4OEFm5eJhji+FIi0Vbi5TuzbNxLcLPsHEZL+xPYcAcIgwjxSyRSaTQ
	rfFJZvJae/d/tVTVRcYSrB8hP0W8pzHSK55JNvEKCzYB5D1dreNvcYE4bPkgIApKyW7RDat1i2C8U
	jqPH51DnhngZAuWvj/NY4dib1YLNrwS3wzkXMwJo5lMuCA+G8DaLoYg5kM7cIS8gEvI8DOuLljlYy
	PFyhZ+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlJs-00000002wNL-0Te6;
	Tue, 11 Feb 2025 08:08:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlIS-00000002wAc-0BCr;
	Tue, 11 Feb 2025 08:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E760C5C0438;
	Tue, 11 Feb 2025 08:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127E7C4CEDD;
	Tue, 11 Feb 2025 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261227;
	bh=EKdk/i/PYM3yiBMGtdjRxRYsmQllHsBKgApCUH0Smd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l+0qzL21BjGqGYnXkrT7a4kpupAYugKqawqCcjoPR0JzONwH69+uV7qKtyBZcoFNm
	 0KgFfE3Q4zOJ2BN/Xz7jr1QbD1agG+qwTBMRifLzqzGPQnPK6vfTPDQlGLn+Cq49Os
	 Phsyd8U9pEDGr3agyh1c2X5nMjzUnmLjcJNeXveEzBSFCF/AnFTrrb3GB5NWu/75TG
	 RyUPT9WpeFbZMZryoJSnGI+dk+JdV2fVninZUie5wUcuQltbd0vqG020ThXLOa5Hpb
	 x512kLXqc93tE7ZIEY5CJgiXBkxKfcN510E0VuLqibwVuYfAlpuPoEQBmKBaKRsKA3
	 ObW//Bo9W3muA==
Message-ID: <bf8f3ea1-6fb5-40d1-a823-b3bc272a2257@kernel.org>
Date: Tue, 11 Feb 2025 09:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
 <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000708_170028_5039D438 
X-CRM114-Status: GOOD (  19.62  )
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

On 10/02/2025 16:01, Alexander Sverdlin wrote:
> Hi Krzysztof!
> 
> On Mon, 2025-02-10 at 09:45 +0100, Krzysztof Kozlowski wrote:
>> On 09/02/2025 23:06, Alexander Sverdlin wrote:
>>> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
>>>
>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++++++++
>>>   1 file changed, 79 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
>>> new file mode 100644
>>> index 000000000000..4e520486cbe5
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
>>> @@ -0,0 +1,79 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +
>>> +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <riscv/sophgo/cv18xx-periph.dtsi>
>>> +#include <riscv/sophgo/cv181x.dtsi>
>>> +
>>> +/ {
> 
> [...]
> 
>>> +	gic: interrupt-controller@1f01000 {
>>
>> MMIO nodes are always in the soc.
> 
> I think I've looked a wrong example (or a counter-example)...
> $ grep -R -P '^\t\tcompatible = "arm,cortex-a15-gic";' *
> arm/boot/dts/intel/axm/axm55xx.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/ti/omap/dra7.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/ti/omap/omap5.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/nvidia/tegra124.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/nvidia/tegra114.dtsi:		compatible = "arm,cortex-a15-gic";

These are all old.

> arm64/boot/dts/nvidia/tegra132.dtsi:		compatible = "arm,cortex-a15-gic";
> arm64/boot/dts/freescale/s32v234.dtsi:		compatible = "arm,cortex-a15-gic";

Well, it happens.

> arm64/boot/dts/apm/apm-storm.dtsi:		compatible = "arm,cortex-a15-gic";
> arm64/boot/dts/apm/apm-shadowcat.dtsi:		compatible = "arm,cortex-a15-gic";

These are strong anti-patterns. Unmaintained.

> 
> But thanks for clarification!
> 
>>> +		compatible = "arm,cortex-a15-gic";
>>> +		interrupt-controller;
>>> +		#interrupt-cells = <3>;
>>> +		reg = <0x01f01000 0x1000>,
>>> +		      <0x01f02000 0x2000>;
>>> +	};
>>> +
>>> +	soc {
>>
>> Override by phandle/label instead of duplicating.
>>
>>> +		ranges;
>>> +
>>> +		pinctrl: pinctrl@3001000 {
>>> +			compatible = "sophgo,sg2000-pinctrl";
>>> +			reg = <0x03001000 0x1000>,
>>> +			      <0x05027000 0x1000>;
>>> +			reg-names = "sys", "rtc";
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +
>>> +&clk {
>>> +	compatible = "sophgo,sg2000-clk";
>>
>>
>> That's discouraged practice. If you need to define compatible, it means
>> the block is not shared between designs and must not be in common DTSI.
> 
> That doesn't come from my series, that's how original cv18xx.dtsi has been

You can change the other file to match real hardware. But if original
cv18xx.dtsi has incorrect or imprecise compatible, I wonder how does it
work....

> designed. Same question as before: do I need to rework it if I will not be able to
> test the changes (I don't even posess the relevant HW). But if not, I have
> to adapt the same pattern into the new sg2000.dtsi.





Best regards,
Krzysztof

