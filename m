Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B14C02190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSGkWu65yEoaHuxGUcpxziv7ZMF+40MXFV91JBqaG/E=; b=t1Zd1lCqJEfO1ifZYdznKXmgrB
	8+PariJgMijPpzHjh70SKGibBa1JoZH+usl+mSS0wSwaLoDoFgct/BciwQ1+FIGHZSNMPz3DNq8y5
	b6/bqezmCSnCbqcPYlBI/keLIxzW/tRj3qIPCBeR4AILR7a2idIcg1H+iMLTCR5ddt3Laopu10iku
	WFW7kzu/uADEzzvmVcsc3M7GB+z6qX0KTtmsS569HpHJPQdA9xcKds7IYLP3/aAi8S1qxA3pEQbat
	K/J9Rkn0nNLrG00D5YOGy/yVIxFpUMYHYOL6iVA6wiieLIMMfWvVDW9iMGFywnZS4YntT+mTA2+lu
	S2Y1a1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7IS-00000006wW2-3Sqk;
	Wed, 29 Jan 2025 12:35:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7H9-00000006wTp-1OSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97C1D5C5896;
	Wed, 29 Jan 2025 12:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4A4C4CED3;
	Wed, 29 Jan 2025 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738154074;
	bh=/xCPOxS9MHed4/6koZ+OlF34MW+zuUIEreZew4rYwzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kF0lSQlbNkE71DP4ddlRlCkt+bRPjgErAEy6Idr8ApcO6ssMHfZnofRnQ10PxqJfN
	 pxesURtVOVWPRE28EMphRzRZgSqB+gu8Le9BvcGeoApg6PnFNU/E0v7sOhGB+ZEn4e
	 Mx4CCgnBhi60+H0N3Hmn2sRCqV/RmvhdhfFxb6upuQobrH5996YhrxGBGUOWmDS2I6
	 sCnob4CJZwq4lHgmuO+YGgaTrKcNNXqHafT8jorlIodGqiyZ7PZTW3NMuunKOyrTCZ
	 K3W0BJewMjwrPyMK6gOqgN2ZbMzwbZWd9CdS1HjYT+o5amYHE/Oz/4tJl0TY3dKFmZ
	 BgChaTEK+KTrQ==
Message-ID: <7bef8677-b002-46bc-822a-16fc975d41b1@kernel.org>
Date: Wed, 29 Jan 2025 13:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
 <fa163bab-1461-479d-b149-4e018935ac57@kernel.org>
 <kxdipj2oktcyivl7o7mtyyacqm437jm7dpjihi7e7hcrmll6xb@5dywwnt5wpz5>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <kxdipj2oktcyivl7o7mtyyacqm437jm7dpjihi7e7hcrmll6xb@5dywwnt5wpz5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_043435_481246_310E0F42 
X-CRM114-Status: GOOD (  30.63  )
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

On 29/01/2025 13:19, Uwe Kleine-König wrote:
> Hello Krzysztof,
> 
> On Wed, Jan 29, 2025 at 10:27:22AM +0100, Krzysztof Kozlowski wrote:
>> On 28/01/2025 18:29, Uwe Kleine-König wrote:
>>> This dts is enough to make the board boot to Linux with the rootfs on
>>> a micro SD card.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>> ---
>>> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
>>> new file mode 100644
>>> index 000000000000..d1f23a57a94d
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
>>> @@ -0,0 +1,90 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright (C) 2017, Intel Corporation
>>> + *
>>> + * based on socfpga_cyclone5_de0_nano_soc.dts
>>> + */
>>> +/dts-v1/;
>>> +
>>> +#include "socfpga_cyclone5.dtsi"
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +/ {
>>> +	model = "Terasic DE10-Nano";
>>> +	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
>>
>> Incorrect compatible. It's not cyclone5 board. cyclone5 is the SoC.
> 
> OK, adding "terasic,de10-nano".
> 
>> There is no altr,socfpga
> 
> What does that mean?
> `git grep \"altr,socfpga\" linus/master:arch/arm/boot` gives me 15
> matches from other boards with socfpga SoCs. If you give me a bit more
> verbose description for the problem you're pointing out here, I can work
> on that.

My bad, some poor git grep result. There is such compatible, so it is fine.

> 
>> This wasn't ever tested with bindings.
> 
> I tried
> 
> 	dt-validate -m -u Documentation/devicetree/bindings -p ~/work/kbuild/arm/Documentation/devicetree/bindings/processed-schema.json ~/work/kbuild/arm/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb

That's unusual way of running the check, but of course might work.

> 
> which emitted a bunch of warnings and after processing some of them I
> gave up because they were all triggered by the soc.dtsi file. I started

These are fine, but you introduce issues purely here.

> another try comparing the output for "my" socfpga_cyclone5_de10nano.dts
> with one for a file that only has the includes and the machine
> compatible. (Which generates 124 lines and 123 lines respectively.)
> 
> I'll work on the diff between the two for the next revision. Or would
> you recommend a different approach?
> 
>>> +	chosen {
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +
>>> +	memory@0 {
>>> +		/* 1 GiB */
>>> +		device_type = "memory";
>>> +		reg = <0x0 0x40000000>;
>>> +	};
>>> +
>>> +	soc {
>>> +		fpga_axi: axi_h2f_lw_bridge@ff200000 {
>>
>> Follow DTS coding style. You just sent us something from downstream.
> 
> Indeed this is from downstream. Looking at the matching dt-validate
> output I guess just "axi@ff200000" would be appropriate?!

bus@

> 
>>> +			compatible = "simple-bus";
>>> +			reg = <0xff200000 0x00200000>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>
>> ranges would be after reg, but they are pointless here, no?
> 
> I thought it's "compatible", "reg" at the start, "status" at the end and
> the rest in-between in alphabetic order. What is the right ordering?

DTS coding style could be clearer here. It exactly says what is the
first, what is the second and what is the third.

> 
>> Where is the child?
> 
> I intend to add children using dt-overlays. I have a prototype here, but
> that's still to embarrassing to show.

The entire bus is in such case a bit confusing. If you have nothing
connected here in the base board, does it really exist in FPGA bitstream?



Best regards,
Krzysztof

