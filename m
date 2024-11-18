Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA80AD49221
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7YZ1V/wt6sfGlYb1cY9Gu11THB0EJv/Pqcw76g6qW8=; b=M/E2Dm/yZXhipI
	qokC19+oej0/1OJBBbKLCtzHipOoJ5AB0NTcIcaRSjkiIWYEXiUOVfKj+2xec45mkladyUkRr6hUn
	DZrpAMdqNquEav/fMhq+BLmXYUdmVn8mKABpDrb4xabKW6vcus5ClNzqlLXS4aMf0m8l5w0WnA1Si
	2UeOrZr3WP0tAhS2vmMZWJYN/qGRc384fOzuQUOz4S+LxJDF7s7Y0fnLucbSt+034DwfZcwR3XCpS
	kWTgk6aGHm4Lr9XLDeWtfrk94O9wjWrRp+4Vn/Dywwh6BwKBRN3fh5STedzjJL2hqfoPgxRRH1nPP
	lynkdqJvfbTCCtpYRrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2J3-00000009guH-0cPo;
	Mon, 18 Nov 2024 14:00:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2Ah-00000009fbN-3VFp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3885CA402C8;
	Mon, 18 Nov 2024 13:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFF0C4CECC;
	Mon, 18 Nov 2024 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731937926;
	bh=YFX7I8wUNcuEKdhfwHfjShYobpEFUbIfJpwAe9tNUns=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ql/x06U45naLOMC2dU7/ZCckVoQ8GoJI2VkRdkS67FLhGzh48v97p3DBJ0ZmoYH3H
	 rbWSxjJSiVok7TYotbwJTeGY55BL8utVySnrqNvn5uAJenApRRPYgP5pOOWpC7LDTn
	 QAT3s+EShAIYHJMJP+MX7yJ7+gv2bVmCDob+AkgFZhmMLSeNr/ZrHFBXQm9JHV44Jf
	 1cmm51jK9JwiRGHuxFJJtW4rPdE0puJVPt1WeEudxvyEoVgX+Pqv9YF4o/huDO3A33
	 mcaiKZFacpnXQX9FLfAYIkOAL9pbaK9i8AvI2CAqpkc0WPcGSY80L6gkgaslIad51T
	 9p2WYLXao+Bzg==
Message-ID: <6e11c85a-5883-4a28-b5bd-98da28f20425@kernel.org>
Date: Mon, 18 Nov 2024 15:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
From: Roger Quadros <rogerq@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
 <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
Content-Language: en-US
In-Reply-To: <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_055207_944377_3DA33371 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 18/11/2024 15:33, Roger Quadros wrote:
> Hi,
> 
> On 13/11/2024 13:09, MD Danish Anwar wrote:
>> The ICSSG module has 7 clocks for each instance.
>>
>> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
>> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
>> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
>>
>> Add these clocks to the dt binding of ICSSG.
>>
>> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> index 3cb1471cc6b6..927b3200e29e 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> @@ -92,6 +92,16 @@ properties:
>>      description: |
>>        This property is as per sci-pm-domain.txt.
>>  
>> +  clocks:
>> +    items:
>> +      - description: ICSSG_CORE Clock
>> +      - description: ICSSG_IEP Clock
>> +      - description: ICSSG_RGMII_MHZ_250 Clock
>> +      - description: ICSSG_RGMII_MHZ_50 Clock
>> +      - description: ICSSG_RGMII_MHZ_5 Clock
>> +      - description: ICSSG_UART Clock
>> +      - description: ICSSG_ICLK Clock
>> +
> 
> There are actually many more clocks [1]
> What is the purpose of adding all these clocks in the DT if driver doesn't
> use them?
> 
> Only CORE and IEP clocks parent can be configured via clock muxes.
> Those are already defined in the icssg?_cfg nodes.

Actually those clock muxes are internal to ICSSG.
We still need to be able to set clock parents of CORE and IEP clock.

So pruss block needs at most 2 clocks like you had in v2 of this patch?

> 
> [1] - https://software-dl.ti.com/tisci/esd/22_01_02/5_soc_doc/am64x/clocks.html
> 
>>  patternProperties:
>>  
>>    memories@[a-f0-9]+$:
> 

-- 
cheers,
-roger


