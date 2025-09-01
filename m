Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E28CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBhm91W/X6btvvCZjMsTtSPxGaGBYZHao/LH8z03qog=; b=RypB1nBmpEArjR0kNGo4o9TIp+
	7o+U1ShAh4/Mg1ouUWHr5n4s3vJPnY3xxa33vKuW3ZQXbCCcxejC+KECXg/9TCG3MGn9DsbXi2/y8
	U7HOK1nCD1lPxo6V3gMA2U0kzUAnq+cw5sFq7VWxKEoIPv5ljovvL+KsCgmm5F4g49yZMV40/sUKU
	nU1+z1BFRWmInbwA6HKeI5C5rOPsmvyTlpV6cX7cFPgatSMXOxaGr4TioHEr93B3dpa5YukuhzVVe
	Cgu6X0NH791DhA2JSEJg8TlxlG6gBkj27FIsLcVOdLx+UWmb9jODH+KWZsYQsDB0Yd1LIEzQ96J3l
	PNA2x2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VK-0000000DGsF-07cx;
	Mon, 01 Sep 2025 16:35:38 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3li-0000000CXVO-2mXx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:36:19 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581CaFKw2370398;
	Mon, 1 Sep 2025 07:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756730175;
	bh=KBhm91W/X6btvvCZjMsTtSPxGaGBYZHao/LH8z03qog=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FXviXmr1OZDsrkmSPqK01MrRoDoUtP+R3+qDhLBBU0D9eqGOHb81jaik1nXtXkbcv
	 DDGUCD2sFRUOxGVAHhNnG1rqh8S5j0xxex//gkK2iG5yyuEEN3EEl0CDE/nKZrZ9XM
	 OWVdRlFDSmRLYg4WQ06QD3zA9WDMyCf0QZTmbALU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581CaFfp2102724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 07:36:15 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 07:36:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 07:36:15 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581CaBNq2514359;
	Mon, 1 Sep 2025 07:36:11 -0500
Message-ID: <d6ab538c-f3b1-4513-8226-773a13510f86@ti.com>
Date: Mon, 1 Sep 2025 18:06:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining macros
To: Vignesh Raghavendra <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
References: <20250731115631.3263798-1-a-kaur@ti.com>
 <20250731115631.3263798-4-a-kaur@ti.com>
 <39f2bc33-e35c-4de4-9377-cf41f510ecc2@ti.com>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <39f2bc33-e35c-4de4-9377-cf41f510ecc2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_053618_792985_BE38BD31 
X-CRM114-Status: GOOD (  11.43  )
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

Hi Vignesh,

On 13/08/25 20:08, Vignesh Raghavendra wrote:
> 
> 
> On 31/07/25 17:26, Akashdeep Kaur wrote:
>> Add the drive strength, schmitt trigger enable macros to pinctrl file.
...
>> +#define DS_ISO_OVERRIDE_EN_SHIFT (22)
>> +#define DS_ISO_BYPASS_EN_SHIFT  (23)
> 
> These *_SHIFT macros are mostly arranged in ascending order of bit
> position, please follow the same.
Rearranged the newly added macros to mostly fit in ascending order.
> 
> Also, ST_EN_SHIFT is already defined ?
Removed
> 
>>   
>>   /* Schmitt trigger configuration */
>>   #define ST_DISABLE		(0 << ST_EN_SHIFT)
...
>> -#define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
>> -#define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
> 
> No we cannot delete these. There maybe downstream dts files already
> using these macros and thus can cause incompatibilities.
Added these back for backward compatibility
> 
>> +#define PIN_DS_FORCE_ENABLE		    (1 << FORCE_DS_EN_SHIFT)
...
>> +#define WKUP_EN_LEVEL_HIGH	(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>> +#define WKUP_EN		        WKUP_EN_EDGE
> 
> All existing macros in this block have PIN_* suffix. Please align with
> the same.

Added
> 
>>   
>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
> 
> 
> For future versions, please split the changes to 2 patches: one for
> white-space changes only and one for addition of new macros.
Point Noted

Regards,
Akashdeep Kaur


