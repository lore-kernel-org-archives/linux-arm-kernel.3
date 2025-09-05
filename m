Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992E7CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 05:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6alpJTsdiL+3pTmNUIBFVveDiDnMtePODNHGXEbcrY0=; b=yEEl2Yt4+ow8s5U8vuJS4C2urK
	kb9mObscj1ydYciXDJyUjwSe3mFv+QDVvUbHysi6om2Hol6+w41nwBLvCaV9FFci0r22gq0Ua/92R
	dstW+p23hQTJzr8QfyHy+d8+hpSd7TnFByviKDNiS3MlbfeB5aim4DUUlqzA6RbbSoN9ORYGXFcG2
	nFAoHrr0dSOPusV2Z3bsUJ5SM0e1//jfya2uyZjRYABkekw/KWsMN14E5O+di+rC9r88vA30x5s0X
	XQUwsk+6LzsSfOBw0TFace6Mg1eIoiMn9GuldP0fWXAhf+nx9DaqM03hz3NN4rk9NFgm0W5Hw/EJj
	/tODDwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOYo-0000000GrOE-1yFm;
	Fri, 05 Sep 2025 05:00:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOW3-0000000GqpY-2FgN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:57:41 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5854vZBA3175159;
	Thu, 4 Sep 2025 23:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757048255;
	bh=6alpJTsdiL+3pTmNUIBFVveDiDnMtePODNHGXEbcrY0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mlQVVkhIUVdgS4R5Yc/CrCNR08h3M2sxZYI4vNXDniUSMK4p+yF+dT+4qmFXfcRov
	 VYjxxdMgL02v0lQeiWO/kRnuxa0H/yG2ln17Zyb2m/eUjkaDuVrAKwOv3XVxgVcdjm
	 veW4J4SLtraYzt6uFQW3OHDCefM0zFsYY5MeVOr8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5854vZo4672405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 23:57:35 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 23:57:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 23:57:35 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5854vUAT190793;
	Thu, 4 Sep 2025 23:57:31 -0500
Message-ID: <8f0dc883-7bab-4ad8-8db2-6c8f8377fdb3@ti.com>
Date: Fri, 5 Sep 2025 10:27:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
 <20250902071917.1616729-4-a-kaur@ti.com>
 <b946af38-abf9-4b34-bf44-3ba9bc64bff7@ti.com>
 <b0ccb51f-14f4-43c9-9646-296d6e9d559c@ti.com>
 <f2e60ec2-5a1f-4cff-a8ee-c2555d835946@ti.com>
 <1a20e784-d2d7-46d7-b705-67e460b6ae33@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <1a20e784-d2d7-46d7-b705-67e460b6ae33@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_215739_681022_6B93A0D1 
X-CRM114-Status: GOOD (  12.05  )
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


On 9/4/2025 7:16 PM, Akashdeep Kaur wrote:
> Hi Udit,
>
> On 04/09/25 18:06, Kumar, Udit wrote:
>>
>
> ...
>
>>> ...
>>>>>   #define PULLTYPESEL_SHIFT    (17)
>>>>>   #define RXACTIVE_SHIFT        (18)
>>>>> +#define DRV_STR_SHIFT           (19)
>>>>
>>>> referring to above TRM mentioned in commit message
>>>>
>>>> Bit 20-19 are for DRV_STR, and description says
>>>>
>>>> 0 - Default
>>>> 1 - Reserved
>>>> 2 - Reserved
>>>> 3 - Reserved
>>>>
>>>> Not sure, is there some additional document to be referred for 
>>>> PIN_DRIVE_STRENGTH
>>>
>>> This information will be updated in TRM in coming cycles.
>>
>>
>> Sorry ,
>>
>> can not ack before TRM update
>
> The information can be found at 
> https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf in Table 14-8769. 
> Description Of The Pad Configuration Register Bit


Then please give correct reference in commit message



>
>>
>>
>>
>>>>
>>>>
>>>>> +#define DS_ISO_OVERRIDE_SHIFT (22)
>>>>> +#define DS_ISO_BYPASS_EN_SHIFT  (23)
>>>>
>
> ...
>
>>>>
>>>>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>>>>   #define PIN_GPIO_RANGE_IOPAD    (PIN_INPUT | 7)
>>>
>>> Regards,
>>> Akashdeep Kaur
>
> Thanks,
> Akashdeep Kaur
>

