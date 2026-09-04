Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EA6C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cG41PpS8GZOJXnrpQvgowAbf+PCE6ncyCVypBTIBtU=; b=4iMV6yZ7D4skrnsJU5TDB1Ik6B
	N58VG2trP4a3EEBK3Td9s1X8mrRQWXonldMWg/v/rDAAwXQcf07I/c5fO9QasOpIYHSJ+3+XQx49o
	DlM2pbmyvAHvd82/O/ORtuTshfiTgHA3Nj8z51rhydgdZOSqPdjTHwX7DRV5QImRvaHKKeev9EV9L
	4ikDt2h88bHFQIuUyH/LDfQ9yVvT0OE8SDLbUzr7uVRLRcSD60tSu98/dM/DXHvPImI9wNojeNqx3
	mq6nTqTQad6zlMt0huQp1Hh7Ey2PCI5NV3F08lP5PRa4GMYW7zIs7PsO83GpcQ6ZjsDAGQ+7qktce
	bYTexTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2az1-00000003Hx7-0eYP;
	Fri, 04 Sep 2026 20:57:59 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ayy-00000003Hwl-3pxt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 20:57:58 +0000
Message-ID: <859274b6-2863-4a6c-ad2c-bbb93b4c7f2b@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788555473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cG41PpS8GZOJXnrpQvgowAbf+PCE6ncyCVypBTIBtU=;
	b=35ve1kC0qvwCUrnDRVyTPjyaKPXXSLHYcmxuzog89DZwj7kaA1AWjilWt6qQxDq+TtRiN1
	hE8FgmNAP2ZtEO9EEg2NQmGM8qEihSuJIrA1mKGqnK6cdyBndoqpDO1g5QFj2vSXsk2Cyq
	xWDr1r3OpsGvbfDuJMSoWM6zpz/e/Bc=
Date: Fri, 4 Sep 2026 22:57:47 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] arm64: dts: apple: Add minimal MacBook Neo device
 tree
To: Sven Peter <sven@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-6-0c25401d165d@cyberchaos.dev>
 <027b6019-9a2c-4f3a-8c64-c9836857b471@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <027b6019-9a2c-4f3a-8c64-c9836857b471@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_135757_146245_4289D423 
X-CRM114-Status: GOOD (  15.61  )
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

On 9/4/26 22:34, Sven Peter wrote:
> Hi,
>
>
> On 04.09.26 21:49, Yureka Lilian wrote:
>> Added a device tree for the MacBook Neo, which uses the t8140 SoC
>> (A18 Pro) also found in the iPhone 16 Pro.
>>
>> The device tree has a minimal set of devices limited to CPU cores,
>> interrupt controller, watchdog, serial and framebuffer.
>>
>> Using the macOS 26.6.2 iBoot/firmware, the machine reliably boots
>> on a single core using the stock kernel.
>> Booting with smp requires avoiding the wfi and wfit instructions
>> in the idle loop and `delay()` respectively, since those instructions
>> cause a loss of architectural state on the secondary cores.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>
> [...]
>
>> +
>> +    memory@800000000 {
>
> this doesn't fit the reg you use below.
>
>> +        device_type = "memory";
>> +        reg = <0x100 0 0x2 0>; /* To be filled by loader */
>> +    };
>
> [....]
>
>> +
>> +        aic: interrupt-controller@301000000 {
>> +            compatible = "apple,t8140-aic3", "apple,t8122-aic3";
>> +            #interrupt-cells = <3>;
>> +            interrupt-controller;
>> +            reg = <0x00000003 0x01000000 0x00000000 0x1cc000>,
>> +                  <0x00000003 0x01040000 0x00000000 0x4000>;
>
> please be consistent and use 0x3 and 0x0 here like for the rest.
>
>
>
> Sven


Thanks for the review!

I've applied the suggestions to my branch.


- Yureka


