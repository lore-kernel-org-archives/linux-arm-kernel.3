Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11621C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7HJ7f+PG7orm6PUuCg998Qmjvc4fQBqZVlF/u5gGlM=; b=IKRjJyAiHxgw3ucBZWBqelNnJl
	OQoQZ7Rt2XW0+0m0UzAJyTZG31ME/DQBDRTLb4TjsHBxa3xlGiJFvid3s6aNNfAR2SS2QsIagecpp
	2KHqLylsh85OEsgCpmlYQZ+NWe2xoFBxC1h4OHuZVKfMH3uIkGffQoie5vbk7bsKrrKv1I3c4dP/A
	DwN6HQuX1gOEl/psYfZIFRAxcIInKe60Qa1bjU37IveboIrNJ1SL6WPzRuqvQN9LP5EANPIpYs1za
	tW95XfHsVlN+yl6g3sVo1aBw+2OyjvVApJ0K+25nK0YOUjwqh6CAh/wo3zusyUIP9uV+1+kfcTqF0
	iCicDcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIiu-000000013cQ-2MHP;
	Mon, 31 Mar 2025 17:14:56 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIhB-000000013Vb-15Ih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 17:13:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52VHCvqt3453330
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 31 Mar 2025 12:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743441177;
	bh=O7HJ7f+PG7orm6PUuCg998Qmjvc4fQBqZVlF/u5gGlM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bAmm4YXq0hs6RVOaZD7z+0GzcoqhHnKs9SM7y3CGSDe7RMPQdy8ltm5N1vuCQvRwv
	 p0leKkbwMWYK+87zKs5+WXXEj7Rr2qfsdBKhfh5Hg5ngPvUrvte98TeQxjHLigeLCz
	 Fdk2apTuvfzLwqCAFf4DpTrct4RmnZ5fgk9dAJLw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VHCvWg046850;
	Mon, 31 Mar 2025 12:12:57 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 31
 Mar 2025 12:12:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 31 Mar 2025 12:12:57 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VHCrxj034716;
	Mon, 31 Mar 2025 12:12:54 -0500
Message-ID: <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
Date: Mon, 31 Mar 2025 22:42:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_101309_476921_4AC62C1F 
X-CRM114-Status: GOOD (  19.06  )
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

Thanks Michael,

On 3/31/2025 4:28 PM, Michael Walle wrote:
> Hi Udit,
>
>>> Add the node for the random number generator inside the crypto module.
>>>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>> ---
>>> This was tested on a J722S/AM67A. Also, according to the TRM this is the
>> Could you re-confirm please , after adding this node.  you selected trng
>> offered by Linux
> # cat /sys/devices/virtual/misc/hw_random/rng_current
> 40910000.rng
> # cat /sys/devices/virtual/misc/hw_random/rng_available
> 40910000.rng
> # dd if=/dev/hwrng bs=16 count=1 | hexdump -C
> 1+0 records in
> 1+0 records out
> 00000000  92 f5 44 09 fd 86 6b a2  39 d6 ad f3 e6 ec 03 4a  |..D...k.9......J|
> 00000010
> # dd if=/dev/hwrng bs=16 count=1 | hexdump -C
> 1+0 records in
> 1+0 records out
> 00000000  a3 73 da d2 5b 94 83 2a  75 11 ca b3 99 d3 87 88  |.s..[..*u.......|
> 00000010

Thanks for checking this


>
>>> MCU instance of the SA3UL. But it's defined in -main.dtsi. Is this
>>> correct?
>> Yes this is correct,
>>
>> please refer
>>
>> https://www.ti.com/lit/zip/sprujb3  SPRUJB3A.pdf
>>
>> table 2.1 Main Memory map, this node falls under main domain
> Ok. Not sure, how I came to the conclusion that this is an MCU
> instance.
>
>>> ---
>>>    arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>> index 6e3beb5c2e01..e868e006318e 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>> [..]
>> For completeness , this is ok to add this node but should be kept disabled
> Shouldn't it be "reserved" then, see [1].

yes, should be reserved.

With marking status as reserved.

Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
>> similar to
>>
>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
> j784s4, j721e and j721s2 have them enabled. What is the rule here?

J784s4, j721e and j721s2 SOCs has two TRNG blocks,

example for j721e, one is used by kernel [0] and another by optee [1].


>
> You also disable the hwrng in optee in your evm according to [2]:
> CFG_WITH_SOFTWARE_PRNG=y

We are planning to use this hardware block by secure firmware.

Therefore request not to use by optee as well


>
> -michael

[0] 
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi#L531 


[1] 
https://github.com/OP-TEE/optee_os/blob/master/core/arch/arm/plat-k3/platform_config.h#L67 



> [1] https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html?highlight=reservered#status
> [2] https://docs.u-boot.org/en/latest/board/ti/j722s_evm.html

