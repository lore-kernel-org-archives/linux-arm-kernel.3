Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE3FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L11aX+BB+qM1JXGrNxK4IIqPwXoq5+CWXGVYROLmJgs=; b=q1v/EJdFlVaznDsoGwUS17d3ep
	Oy/CKM/0INX0Thk6f++LPsd/TkWYabnR5bmxVjaPJfTarTDuFEL/7u706zI84tBOdGpKP75uHkfni
	lfj6sBl5I08+xi3l9OW3LEcRoB70pBvPxQhBmV4VsWnIgDu6ASh0dYWWMbiSWu2EuA2KnHxIgOchB
	jApdrNe6WRhTl3nfygLRVpJYUUPuUiwRlELa1d3/iMcwLNIlM8ZmrqgizlMthPSRbg/VwEfw3FeaP
	U+bEJDo3tKipXVd1Qh4n5x2SEwQ69DRzTkrG1/ZgP/9Ht4MMFGdZdKr/STw05eXVx8GSizY1Sz6HO
	/FGv6u1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCx7-0000000CzkS-299d;
	Thu, 04 Sep 2025 16:36:49 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAI1-0000000ByiC-2Dg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:46:15 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584Dk96T3479535;
	Thu, 4 Sep 2025 08:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756993569;
	bh=L11aX+BB+qM1JXGrNxK4IIqPwXoq5+CWXGVYROLmJgs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QOADzU6hJGtS5drCUoNri8iBhZtuPVU7uXlMr5bZNUffj1der76zgwHFprUaLQE8B
	 HRKhuqlMM4k0ORwqSHpD6mpdaszF1WD/LXq9V8YqqA6OyaAdF311LZEliRmjnyeQ7C
	 0U0cYdotWlPbR1QBie/HTQOyzBuIIENZ3CzJYet4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584Dk93h3846174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 08:46:09 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 08:46:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 08:46:09 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584Dk4DQ3342464;
	Thu, 4 Sep 2025 08:46:05 -0500
Message-ID: <1a20e784-d2d7-46d7-b705-67e460b6ae33@ti.com>
Date: Thu, 4 Sep 2025 19:16:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: "Kumar, Udit" <u-kumar1@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
 <20250902071917.1616729-4-a-kaur@ti.com>
 <b946af38-abf9-4b34-bf44-3ba9bc64bff7@ti.com>
 <b0ccb51f-14f4-43c9-9646-296d6e9d559c@ti.com>
 <f2e60ec2-5a1f-4cff-a8ee-c2555d835946@ti.com>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <f2e60ec2-5a1f-4cff-a8ee-c2555d835946@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064613_721267_2D0D8707 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

Hi Udit,

On 04/09/25 18:06, Kumar, Udit wrote:
> 

...

>> ...
>>>>   #define PULLTYPESEL_SHIFT    (17)
>>>>   #define RXACTIVE_SHIFT        (18)
>>>> +#define DRV_STR_SHIFT           (19)
>>>
>>> referring to above TRM mentioned in commit message
>>>
>>> Bit 20-19 are for DRV_STR, and description says
>>>
>>> 0 - Default
>>> 1 - Reserved
>>> 2 - Reserved
>>> 3 - Reserved
>>>
>>> Not sure, is there some additional document to be referred for 
>>> PIN_DRIVE_STRENGTH
>>
>> This information will be updated in TRM in coming cycles.
> 
> 
> Sorry ,
> 
> can not ack before TRM update

The information can be found at 
https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf in Table 14-8769. 
Description Of The Pad Configuration Register Bit

> 
> 
> 
>>>
>>>
>>>> +#define DS_ISO_OVERRIDE_SHIFT   (22)
>>>> +#define DS_ISO_BYPASS_EN_SHIFT  (23)
>>>

...

>>>
>>>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>>>   #define PIN_GPIO_RANGE_IOPAD    (PIN_INPUT | 7)
>>
>> Regards,
>> Akashdeep Kaur

Thanks,
Akashdeep Kaur


