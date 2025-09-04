Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D924CAC580
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvh/3eEZ++3Ko3LDIH91uXfAa26Cotcf789oGrJXSt4=; b=aE3Qk5gyNTMWxGUqv1Ka4FQ0fY
	hZSKrrDDmY18RKxlCgv9hZQO+9/hsXPprgJxZDNJTzqmRRQxCN6sp1t6sCTOLTq2fc9qFmI0b7f5I
	oHypb1IbFfMgL6Hh5RIOY2dJODNn6RjhoV9I0+PH8QskSkKz7AtwF+FhjUbZo5V+Xx4FqK1Wn7rgT
	uLL+wF2RX6E8wGuH0Tw/dNUkS/4osBv4P9Wsk2y3NI/4pVJyLUsmnPa5Rx4g9xkqxegQdQucZ248H
	G5WMe0cotwmPmHYJbgo0hQk7xstOsMAJgX1C7zDmDgoCY0QhM6+GOGcKpjD1B8tn7NsO/VtOBDm3L
	6TF1I9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFz8-0000000E0pS-1Zrk;
	Thu, 04 Sep 2025 19:51:06 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9D3-0000000Bc3Y-0pO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:37:02 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584Cau9e3011381;
	Thu, 4 Sep 2025 07:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756989416;
	bh=gvh/3eEZ++3Ko3LDIH91uXfAa26Cotcf789oGrJXSt4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=moQ2N8/Zf4xkfaLe82on02puG2f9bkEoDei5IEdZeZ9yfpuFopmQrf6QzTBS01Ym4
	 iuWYPS80PgYKgudL/UxAg4dGW4QJagLx147SG8EPIwigriVbdZJm2idzf8eKxaIFyU
	 Vtv5VSgOXnh5lI3SIMsCvHMolIk0sx7vCBjlR5sA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584Cau3e115570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 07:36:56 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 07:36:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 07:36:56 -0500
Received: from [10.250.148.210] ([10.250.148.210])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584CapOh2969517;
	Thu, 4 Sep 2025 07:36:51 -0500
Message-ID: <f2e60ec2-5a1f-4cff-a8ee-c2555d835946@ti.com>
Date: Thu, 4 Sep 2025 18:06:50 +0530
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
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <b0ccb51f-14f4-43c9-9646-296d6e9d559c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_053701_369999_827B7881 
X-CRM114-Status: GOOD (  16.83  )
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


On 9/4/2025 5:09 PM, Akashdeep Kaur wrote:
> Hi Udit,
>
> On 04/09/25 14:27, Kumar, Udit wrote:
>> Hello Akashdeep,
>>
>> On 9/2/2025 12:49 PM, Akashdeep Kaur wrote:
>>> Add the drive stregth, schmitt trigger enable macros to pinctrl file.
>>> Add the missing macros for DeepSleep configuration control referenced
>>> from "Table 14-6172. Description Of The Pad Configuration Register 
>>> Bits"
>>> in AM625 TRM[0].
>>> Add some DeepSleep macros to provide combinations that can be used
>>> directly in device tree files example PIN_DS_OUTPUT_LOW that
>>> configures pin to be output and also sets its value to 0.
>>>
>>> [0] https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf
> ...
>>>   #define PULLTYPESEL_SHIFT    (17)
>>>   #define RXACTIVE_SHIFT        (18)
>>> +#define DRV_STR_SHIFT           (19)
>>
>> referring to above TRM mentioned in commit message
>>
>> Bit 20-19 are for DRV_STR, and description says
>>
>> 0 - Default
>> 1 - Reserved
>> 2 - Reserved
>> 3 - Reserved
>>
>> Not sure, is there some additional document to be referred for 
>> PIN_DRIVE_STRENGTH
>
> This information will be updated in TRM in coming cycles.


Sorry ,

can not ack before TRM update



>>
>>
>>> +#define DS_ISO_OVERRIDE_SHIFT   (22)
>>> +#define DS_ISO_BYPASS_EN_SHIFT  (23)
>>
>> Please follow same convention as for rest of bit fields
>
> Updated.
>
>>
>> DS_ISO_OVERRIDE_SHIFT  to ISO_OVR_SHIFT and
>> DS_ISO_BYPASS_EN_SHIFT to ISO_BYP_SHIFT
>>
>>
>>
>>>   #define DEBOUNCE_SHIFT        (11)
>>>   #define FORCE_DS_EN_SHIFT    (15)
>>>   #define DS_EN_SHIFT        (24)
>>> @@ -19,6 +24,7 @@
>>>   #define DS_OUT_VAL_SHIFT    (26)
>>>   #define DS_PULLUD_EN_SHIFT    (27)
>>>   #define DS_PULLTYPE_SEL_SHIFT    (28)
>>> +#define WKUP_EN_SHIFT           (29)
>>>   /* Schmitt trigger configuration */
>>>   #define ST_DISABLE        (0 << ST_EN_SHIFT)
>>> @@ -33,6 +39,26 @@
>>>   #define INPUT_EN        (1 << RXACTIVE_SHIFT)
>>>   #define INPUT_DISABLE        (0 << RXACTIVE_SHIFT)
>>> +#define DS_PULL_DISABLE         (1 << DS_PULLUD_EN_SHIFT)
>>> +#define DS_PULL_ENABLE          (0 << DS_PULLUD_EN_SHIFT)
>>
>> what is purpose of shifting zero,
> This is added for consistency across the entire file.
>>
>>
>>> +
>>> +#define DS_PULL_UP              (1 << DS_PULLTYPE_SEL_SHIFT | 
> ...
>>> +#define PIN_DS_OUT_DISABLE DS_INPUT_EN
>>>   #define PIN_DS_OUT_VALUE_ZERO        (0 << DS_OUT_VAL_SHIFT)
>>>   #define PIN_DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
>>>   #define PIN_DS_PULLUD_ENABLE        (0 << DS_PULLUD_EN_SHIFT)
>>>   #define PIN_DS_PULLUD_DISABLE        (1 << DS_PULLUD_EN_SHIFT)
>>>   #define PIN_DS_PULL_DOWN        (0 << DS_PULLTYPE_SEL_SHIFT)
>>>   #define PIN_DS_PULL_UP            (1 << DS_PULLTYPE_SEL_SHIFT)
>>> +#define PIN_DS_ISO_BYPASS               (1 << DS_ISO_BYPASS_EN_SHIFT)
>>> +#define PIN_DS_ISO_BYPASS_DISABLE       (0 << DS_ISO_BYPASS_EN_SHIFT)
>>> +
>>> +#define DS_STATE_VAL                    (1 << DS_EN_SHIFT)
>>> +#define ACTIVE_STATE_VAL                (0 << DS_EN_SHIFT)
>>> +
>>
>> Please do not mix PIN_x #define with other internal defines
>
> Moved these to appropriate location.
>
>>
>>> +#define PIN_DS_OUTPUT_LOW (DS_STATE_VAL | DS_INPUT_DISABLE | 
>>> DS_OUT_VALUE_ZERO)
>>> +#define PIN_DS_OUTPUT_HIGH              (DS_STATE_VAL | 
>>> DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
>>> +#define PIN_DS_INPUT                    (DS_STATE_VAL | DS_INPUT_EN 
>>> | DS_PULL_DISABLE)
>>> +#define PIN_DS_INPUT_PULLUP             (DS_STATE_VAL | DS_INPUT_EN 
>>> | DS_PULL_UP)
>>> +#define PIN_DS_INPUT_PULLDOWN           (DS_STATE_VAL | DS_INPUT_EN 
>>> | DS_PULL_DOWN)
>>> +
>>> +#define PIN_WKUP_EN_EDGE                (WKUP_ENABLE | WKUP_ON_EDGE)
>>> +#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | 
>>> WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
>>> +#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | 
>>> WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>>> +#define PIN_WKUP_EN                     WKUP_EN_EDGE
>>
>> what is difference between PIN_WKUP_EN_EDGE and PIN_WKUP_EN
> Combined the macros to have default wakeup on edge
>>
>>
>>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>>   #define PIN_GPIO_RANGE_IOPAD    (PIN_INPUT | 7)
>
> Regards,
> Akashdeep Kaur

