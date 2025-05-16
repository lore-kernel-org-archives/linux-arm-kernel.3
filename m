Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B3C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 22:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciUcMocgfF2Sg88n3LV1vyv2J5+DjoDSa+DiepLm+Vs=; b=kAewwRgZVNrLcXjppTb6z9YO/F
	kbMl67/e4VbQ2FnM4feCjm3ajRxo9wWSWt64BVOChZAYzXlaXrjolHHYTZSruNDpX5GoLKITlGr+B
	p3T9qvHsoYQN6U03YOoyEHDb54zXZvSH6BHIRdMAA573sojKarLo0IaS6OeKd5Uc5P5BCITc7Eexq
	C1SQJ3Mp44Q2mtihiL9J8kClFA6vs3iv4m+EC3+2f8lyOUzZZJqecmEsgueNLwDGUqcgrD9DDd+ep
	gNABCUll1XRQ+bqUlz/GWR7cS1uV6yQyK2WqQf4T+UOpGjuOQ1RQABRlMVYTFm+SJQao/4H+wgPtS
	7ijLpSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3eY-00000004l84-2R03;
	Fri, 16 May 2025 22:35:42 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3cN-00000004kuq-3hy3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 22:33:29 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GMXILt418764;
	Fri, 16 May 2025 17:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747434799;
	bh=ciUcMocgfF2Sg88n3LV1vyv2J5+DjoDSa+DiepLm+Vs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QJhrTkSqB/gMOB68unIrWuVebnxtm6Icu8tvF/JGjQ8yX/TJgh0MMUUkr4XEpWjC/
	 04LN0pSPksEWdp0AJGsFDjwr87OMj0Xl+D7WRRhGdQd1wZyj0mOelom8CP75xrE6t2
	 aW6yIiDaaWIUB9mBGjxAv8Okpm8Er/i4AUWk3AOw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GMXIDa201975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 17:33:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 17:33:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 17:33:17 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GMXHhF086916;
	Fri, 16 May 2025 17:33:17 -0500
Message-ID: <29e4e325-dac9-4454-9d5f-9521cc3d1865@ti.com>
Date: Fri, 16 May 2025 17:33:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: soc: ti: pruss: Add documentation for
 PRU UART support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250513215934.933807-1-jm@ti.com>
 <20250513215934.933807-3-jm@ti.com>
 <3f989f5c-312c-4fac-8cc0-f387de84925a@kernel.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <3f989f5c-312c-4fac-8cc0-f387de84925a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_153328_094355_58C62EFA 
X-CRM114-Status: GOOD (  15.11  )
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

On 5/14/25 7:35 AM, Krzysztof Kozlowski wrote:
> On 13/05/2025 23:59, Judith Mendez wrote:
>> Add documentation for PRU UART node which is for PRU serial UART
>> based-off the industry standard TL16C550 asynchronous communications
>> element.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
> 
> Nothing in cover letter explains dependency and this the most important
> part of cover letter. Otherwise how maintainers are supposed to guess
> what they can take and what cannot?
> 
> Squash the patch with previous in such case.

Sure can do.

> 
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> index 927b3200e29e..54397297cbf5 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> @@ -324,6 +324,13 @@ patternProperties:
>>       $ref: /schemas/net/ti,davinci-mdio.yaml#
>>       type: object
>>   
>> +  serial@[a-f0-9]+$:
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

Will fix this and first patch as well.

Thanks

~ Judith


