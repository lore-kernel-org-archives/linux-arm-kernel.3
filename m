Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB703CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvegV1zH8Pm8zagK+KRhg5cfI8kiWJq/medlBOhtErU=; b=dFM7P4xbMOHFrjvAd/PHssG8iz
	usjYsYc0fjzND6QXtFWvKp/fT3/sqWjWFZHN9ysZHgJPOuIsHV+/an/QYjxEA/BVN0XdS1lx2EiO4
	TuKahbpoHyrRfVMT0/TwZGtbXQfMtKwnfhFS7xYAW1Dioviq6p9ffglum8m/M/PtjT8HLmA/VDMDF
	0hiWdx4TRmSH1cPRdkhMMbOHERXGHfaTqJtNDycYfSV/qaZukxAkupp+8r3jrsuVpq1ZV+k75+O5B
	MMLPyPmuZv5pqgTaj13QrR17UGDnsdYEF5j2WdVmZSlS5XAR3F365bx2D7cCRfuZYpaqDzuql10gQ
	DvPaufow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA52-0000000Buiw-44RM;
	Thu, 04 Sep 2025 13:32:48 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8Bz-0000000BFc1-0esz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:31:52 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584BVmlt3001597;
	Thu, 4 Sep 2025 06:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756985508;
	bh=NvegV1zH8Pm8zagK+KRhg5cfI8kiWJq/medlBOhtErU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a9vi+5949lMcJ6oo6WuLcXO9OrgPQaRY56bFvPalciMZ5rk9bbw4dxAfho4y4EXv4
	 OIzkqtCDU4rZ6j40OOqCwL0StcUBI9rVLhdJEU5TvPpxePQcx/si8hsS+Lts4e+0x4
	 Sa9kUL27PFf1YWV4kGkbcbyCCGlfrr6WcF7mYVOI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584BVmch138335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 06:31:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 06:31:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 06:31:47 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584BVhNb3188138;
	Thu, 4 Sep 2025 06:31:44 -0500
Message-ID: <61954361-6aad-4761-967e-629cd288e33d@ti.com>
Date: Thu, 4 Sep 2025 17:01:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: Sebin Francis <sebin.francis@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
 <20250902071917.1616729-4-a-kaur@ti.com>
 <c5dd1c02-8538-4b9f-a453-d18e7a30ae30@ti.com>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <c5dd1c02-8538-4b9f-a453-d18e7a30ae30@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_043151_295590_813508DD 
X-CRM114-Status: GOOD (  14.33  )
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

Hi Sebin,

On 04/09/25 11:32, Sebin Francis wrote:
> Hi Akash,
> 
> On 02/09/25 12:49, Akashdeep Kaur wrote:
>> Add the drive stregth, schmitt trigger enable macros to pinctrl file.
>> Add the missing macros for DeepSleep configuration control referenced
>> from "Table 14-6172. Description Of The Pad Configuration Register Bits"
>> in AM625 TRM[0].
>> Add some DeepSleep macros to provide combinations that can be used
>> directly in device tree files example PIN_DS_OUTPUT_LOW that
>> configures pin to be output and also sets its value to 0.
>>
>> [0] https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf
>>
>> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
...

>> +#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
>> +#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
>> +#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
>> +
>> +#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)
> 
> This can be moved below WKUP_ENABLE macro to be consistent
Moved. Thanks
> 
>> +
>>   /* Only these macros are expected be used directly in device tree 
>> files */
>>   #define PIN_OUTPUT        (INPUT_DISABLE | PULL_DISABLE)
>>   #define PIN_OUTPUT_PULLUP    (INPUT_DISABLE | PULL_UP)
...
> ...
>> +#define DS_STATE_VAL                    (1 << DS_EN_SHIFT)
>> +#define ACTIVE_STATE_VAL                (0 << DS_EN_SHIFT)
> 
> These can be moved to the top before PIN_* and can be renamed to 
> DS_STATE_EN and DS_STATE_DIS
Moved and renamed.>> +
>> +#define PIN_DS_OUTPUT_LOW               (DS_STATE_VAL | 
>> DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
...
>> +#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL 
>> | WKUP_LEVEL_HIGH)
>> +#define PIN_WKUP_EN                     WKUP_EN_EDGE
> 
> As EDGE wake is used commonly we can use the PIN_WKUP_EN_EDGE in this case
That's a good idea. Changed.
> 
>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>   #define PIN_GPIO_RANGE_IOPAD    (PIN_INPUT | 7)
> 
> Thanks
> Sebin

Regards,
Akashdeep Kaur

