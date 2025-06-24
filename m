Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3BEC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UndgjPOX1TCSZCvOeL9kzhOH9nzk/4CegsNiR3QXeQ=; b=kY7CEaJu+JKXI790zQhVdjpkn+
	14MSWHnDX8jtzfErV77tbpUeTO4U4f5B8KJ7ugAkEBtY9/hswGDmyOQNr3VMhip2E3awUX9HUhhws
	oge3YYAsDshEqBQqXH0y6CbK/vJIMUrwaPcXgSa4SkD+y6n2RlSpzf1+FmSI9rGwqunGFSsghXcVF
	o9z9PpxpmEe28v7ciw1oH3SlmTfbPTe07Ax1l3L/fK1H4nDxUuJQgK6qE0hCbry3pjaFtuuocEJXP
	IsowUhfrl7qSKfCe7gKVCVrli1iynJb+01ERujFhsBavNGHc0ssWuYNC99q9gLP/yfqgwDTRT+6Fu
	wYkagxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1y5-00000005Rh0-2dgd;
	Tue, 24 Jun 2025 11:37:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU14H-00000005Kgw-36pZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:39:59 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OAdrQc1138040;
	Tue, 24 Jun 2025 05:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750761593;
	bh=1UndgjPOX1TCSZCvOeL9kzhOH9nzk/4CegsNiR3QXeQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IAttkQBDiEJkOHEDXHW7005DUZQuTbMFNZRmHM/51KZe3O/UWLyeI6xH4ipGx5q/t
	 WDGQwOiybs4H2rRBnLYoUAK5H4LaAM6MzcinXU6ykw1sAxcTNe39nQ666dUOUM2nYN
	 92UEYeue8BTdelqz0Qp6gvm/Z7gdGaOWpzCfUnPc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OAdrwh4136188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 05:39:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 05:39:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 05:39:52 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OAdl6T1625959;
	Tue, 24 Jun 2025 05:39:48 -0500
Message-ID: <c4362d9e-62a4-4c28-b1cd-c338467f92ae@ti.com>
Date: Tue, 24 Jun 2025 16:09:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/6] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-3-p-bhagat@ti.com>
 <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_033957_881066_07185007 
X-CRM114-Status: GOOD (  18.05  )
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

Hi Krzysztof,

Thanks for the review.

On 23/06/25 19:55, Krzysztof Kozlowski wrote:
> On 23/06/2025 16:12, Paresh Bhagat wrote:
>> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
>> targeted for applications needing high-performance Digital Signal
>> Processing. It is used in applications like automotive audio systems,
>> professional sound equipment, radar and radio for aerospace, sonar in
>> marine devices, and ultrasound in medical imaging. It also supports
>> precise signal analysis in test and measurement tools.
> Drop all marketing stuff.
>
>> Some highlights of AM62D2 SoC are:
> This is not a product brochure.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


Will fix this in next version. Thanks
>
>
>
>> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>>    core variants are provided in the same package to allow HW compatible
>>    designs.
>> * One Device manager Cortex-R5F for system power and resource management,
>>    and one Cortex-R5F for Functional Safety or general-purpose usage.
>> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>>    single core C7x.
>> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>>    which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
>>    and TDM Audio inputs and outputs.
>> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>>    external ports with TSN capable to enable audio networking features such
>>    as, Ethernet Audio Video Bridging (eAVB) and Dante.
>> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>>    controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>>    peripherals.
>> * Dedicated Centralized Hardware Security Module with support for secure
>>    boot, debug security and crypto acceleration and trusted execution
>>    environment.
>> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
>> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.

I will refine the first two paragraphs to be very concise.


>>
>> This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
>> variants. While the AM62A and AM62D are largely similar, the AM62D is
>> specifically targeted for general-purpose DSP applications, whereas the
>> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
>> does not include multimedia components such as the video encoder/decoder,
>> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
>> processing, or the display subsystem. Additionally, the AM62D has a
>> different pin configuration compared to the AM62A, which impacts
>> embedded software development.


This section is important as it clarifies the difference between AM62a 
and AM62d, as we are reusing AM62a dtsi files for AM62d. Let me know if 
you need a shorter version.


>>
>> This adds dt bindings for TI's AM62D2 family of devices.
>>
>> More details about the SoCs can be found in the Technical Reference Manual:
>> https://www.ti.com/lit/pdf/sprujd4
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>
> And what happened with the previous comments?


Yep there were some indentation problems earlier, which is fixed in this 
version. There was also an ack from Conor Dooley in v3. I will include that.


>
> Reach internally TI so they will coach you how to send patches upstream.
>
> Best regards,
> Krzysztof

