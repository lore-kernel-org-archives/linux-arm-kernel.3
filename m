Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D55FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TF/F6lXdjR8IB4UYkLtUXrENiAwln8Gi9GSzblYrCw=; b=3aimeycaOEaOao6RFUjYBOK4DJ
	n1OS2j/VzgyAuflpL/0M6DwLUcdDyfW7ItsO2Y03cNhbzhLF9ekIGXstTva/ahtwRp+UcJ++ywLG0
	hi7lxDvogN7l7Nkunr+HJ/HZspZgt047lpaPRF7wR8EIxdCt1GlYYOZQfe9xrE7ZD2bqXUPQwHwGJ
	ZD7oFcJb2H4xaSLro3DJhkHfQd8I8apyDy3kURAs3cseqNXBpozpyjQ6RpGgwnJ8shB8VeYlOhXH4
	Un8IlyF2nj2GG1mDNgsImZBfjbU0xYXEFLZWF1iIy5hVgXQMRHNOTweLM157EUTMnaEvq/UCmCzDS
	IVLJuAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgct-0000000B1Z4-3nhx;
	Thu, 13 Mar 2025 11:21:23 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgVz-0000000B0Gv-3iLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:14:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DBEATZ1856319
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 06:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741864450;
	bh=/TF/F6lXdjR8IB4UYkLtUXrENiAwln8Gi9GSzblYrCw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MJXz7tr9nyecpy7QjTkOLn6IkrbZKqEAzsHPRXduyv7sFMykNvgyjwzP7o7tpEFu9
	 bcle+02bf266ZgS0wooko5Stcm49XrXP2lQ/8qy9LoVYoXwl+jCBi7uxIh17tV1RpU
	 DnYE10eJD+cS8qLmsGhRYcKvLQtMNa9Tm9uaBJhA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DBEAu7041226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 06:14:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 06:14:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 06:14:10 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DBE60E053638;
	Thu, 13 Mar 2025 06:14:07 -0500
Message-ID: <8e58b093-1c64-45b9-a9d3-9835a3bbc4fd@ti.com>
Date: Thu, 13 Mar 2025 16:44:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: misc: bist: Add BIST dt-binding for TI
 K3 devices
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20241128140825.263216-1-n-francis@ti.com>
 <20241128140825.263216-2-n-francis@ti.com>
 <ho7ktcnbtl7mvamfthqho23co2fc4z7bgjha7pu4wivxm6ndhu@tfbpveonhckz>
 <837d329b-bcdd-4c3b-b508-e916b110ce25@ti.com>
 <e57dfc3e-b702-4803-b776-20c6dbd98fef@kernel.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <e57dfc3e-b702-4803-b776-20c6dbd98fef@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_041416_063473_87797B0B 
X-CRM114-Status: GOOD (  20.95  )
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

Hi Krzysztof

On 29/11/24 14:45, Krzysztof Kozlowski wrote:
> On 29/11/2024 08:43, Neha Malcom Francis wrote:
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  ti,bist-instance:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      the BIST instance in the SoC represented as an integer
>>>
>>> No instance indices are allowed. Drop.
>>>
>>
>> Question on this, this is not a property that is driven by software but rather 
>> indicates which register sequences have to be picked up for triggering this test 
>> from this instance. So I don't see how I can workaround this without getting 
>> this number. Or maybe call it ID rather than instance?
> 
> I don't understand how the device operates, so what is exactly behind
> some sequences of registers for triggering this test. You described
> property as index or ID of one instance of the block. That's not what we
> want in the binding. That's said maybe other, different hardware
> characteristic is behind, who knows. Or maybe it's about callers... or
> maybe that's not hardware property at all, but runtime OS, who knows.
> 

Sorry for such a late reply, but I was hoping to get more details on
this "ID" and never got back to the thread...

The best way I can describe is this device (BIST) runs a safety
diagnostic test on a bunch of processors/blocks (let's call them
targets). There's a mapping between the instance of this device and the
targets it will run the test. This ID was essentially letting the BIST
driver know which are these targets.

Should I perhaps trigger it the other way around; a target driver asks
for it's safety test to be run by pointing to the BIST instance? However
the issue with this approach is, the architecture of this safety test
device is that once triggered, it will run the test on all the targets
it controls and that should be reflected in the software arch as well right?

Yet another way would be the BIST points out the targets it controls via
their phandles in its node... but this approach would trigger the probe
of these targets before the test runs on them. And in hardware, the test
must run only one before the device is used, else we see indefinite
behavior.


> Best regards,
> Krzysztof

-- 
Thanking You
Neha Malcom Francis

