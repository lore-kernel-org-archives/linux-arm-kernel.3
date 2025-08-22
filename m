Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9069DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GA92uGphBr4Q50n20UsbkKpDY7geIAZlyZ30qOdmF0=; b=3WQNkoLkyOmuhE1zPc2btUJevb
	WpOXhrPMzfkOfYACSGbYvGmUTAzXpocApGdJI9j7DVU+dho3XlGoR4XLvjd43VRKf7Ftvi8Uobyv9
	KGIz2XBYiyFQO0Lz+zcc9HyUPQu0kb1ngR+KGHPK41Cs1w44pqFF1CzQ1T2Rsk+lBhwHDRX7YT/Sh
	qt6sbi3MVEbc35wdQe7m88zYkCq7ERrpUIXpMb8i/Ckx9ckfeUkuQiKBmJSRUPj+qSpf1PKUbeYVo
	iKueMAR/75q4cDea6WKbICmD0Hsrw6HGa65WrcVxvb4SyKP/uZgfSI1UsB/AJCeF8bdnMq96LX9l0
	NCURbPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphw6-00000004Cq9-3ZtA;
	Sat, 23 Aug 2025 06:41:10 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVcF-00000003FMi-2WLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:31:53 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MHVkJh766696;
	Fri, 22 Aug 2025 12:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755883906;
	bh=8GA92uGphBr4Q50n20UsbkKpDY7geIAZlyZ30qOdmF0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qRX6aCzQJ1aFcMkw34uoaOYnqhaGNDZSwwy3MIn1YN/5rgWHcv6R9O398qK43Vnxq
	 UfZcvVzvuK8z8m8CiS8CfsUrq/WU3rbnY/vpwRhnmJ8ut5LyfWPhOD26XwjIA070xA
	 lPSIS709KXU77ISrozip9hKUu6Rdq1wslnq09p0U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MHVjMQ3073252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 12:31:46 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 12:31:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 12:31:45 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MHViMB4176033;
	Fri, 22 Aug 2025 12:31:45 -0500
Message-ID: <32d4b3c2-4017-4ad2-8527-493b6d3b7ecb@ti.com>
Date: Fri, 22 Aug 2025 12:31:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU
 R5F cluster to Split-mode
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-34-b-padhi@ti.com>
 <9a3f4271-ada2-48aa-b99d-023619ec5e12@ti.com>
 <a076e204-aa71-430e-a762-b8111d23d2e6@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a076e204-aa71-430e-a762-b8111d23d2e6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_103151_732569_32CFC72B 
X-CRM114-Status: GOOD (  23.06  )
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

On 8/22/25 12:26 PM, Beleswar Prasad Padhi wrote:
> Hi Andrew, Nishanth,
> 
> On 8/15/2025 9:18 PM, Andrew Davis wrote:
>> On 8/14/25 5:38 PM, Beleswar Padhi wrote:
>>> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
>>> R5F cluster in the MCU domain which is configured for LockStep mode at
>>> the moment. The necessary support to use MCU R5F cluster in split mode
>>> was added in the bootloader. And the TI IPC firmware for the split
>>> processors is already available public.
>>>
>>> Therefore, Switch this R5F cluster to Split mode by default in all the
>>> boards using TI IPC Firmware config (k3-j7*-ti-ipc-firmware). This
>>> gives out an extra general purpose R5F core free to run any applications
>>> as required. Lockstep mode remains default in the SoC level dtsi, so
>>> downstream board dts which do not use TI IPC Firmware config should not
>>> be impacted by this switch.
>>>
>>> Users who prefer to use the fault-tolerant lockstep mode with TI IPC
>>> firmware config, can do that by setting `ti,cluster-mode` property to 1.
>>
>> What a user prefers and other configuration like that does not belong
>> in devicetree, which should only describe the hardware.
>>
>> Configuration should be done using the normal methods, like kernel
>> cmdline, module params, ioctls, etc.. Maybe we can even set the mode
>> based on some signal in the firmware itself, like in the resource table.
> 
> 
> Agreed with your point.. But that is going to take a long time to implement
> + upstream. I interpreted from [0] that it was okay to enable this split mode
> once we had refactored the firmware related nodes in an overlay? (Since
> people can swap out the dtsi if they don't need the firmware config)
> 
> Nishanth/Andrew,
> Please advise if this patch is okay or should be dropped in the revision...
> 

I would drop this and send it later as part of its own series, it doesn't belong
in this series which should be refactors only, this patch is changing things, no
reason to mixed the two types of patches.

Andrew

> [0]: https://lore.kernel.org/all/20250523114822.jrv73frz2wbzdd6d@falsify/
> 
> Thanks,
> Beleswar
> 
>>
>> Andrew
>>
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 1 +
>>> arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi | 1 +
>>> arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi | 1 +
>>> .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 1 +
>>>   4 files changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
>>> index 8eff7bd2e771..ddf3cd899d0e 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
>>> @@ -94,6 +94,7 @@ &main_timer2 {
>>>     &mcu_r5fss0 {
>>>       status = "okay";
>>> +    ti,cluster-mode = <0>;
>>>   };
>>>     &mcu_r5fss0_core0 {
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
>>> index 5b3fa95aed76..57890a3b38a2 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
>>> @@ -211,6 +211,7 @@ &main_timer15 {
>>>   };
>>>     &mcu_r5fss0 {
>>> +    ti,cluster-mode = <0>;
>>>       status = "okay";
>>>   };
>>>   diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
>>> index 40c9f2b64e7e..7ee8a8615246 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
>>> @@ -179,6 +179,7 @@ &main_timer5 {
>>>   };
>>>     &mcu_r5fss0 {
>>> +    ti,cluster-mode = <0>;
>>>       status = "okay";
>>>   };
>>>   diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
>>> index b5a4496a05bf..e12fa55a4df0 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
>>> @@ -254,6 +254,7 @@ &main_timer9 {
>>>   };
>>>     &mcu_r5fss0 {
>>> +    ti,cluster-mode = <0>;
>>>       status = "okay";
>>>   };
>>


