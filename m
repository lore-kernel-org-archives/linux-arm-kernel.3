Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF49C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnX3eQ6ImWFHV3yinCub9dwiAWQ/AdU8d6C5xkRCwOM=; b=xdgHyw97Mii7WTR+d6MLocUsAr
	gxZRfVoC3hGtQipV7iZdzUlyHdgUd6+tWovvw3A7uFuWYVEDB5d4g5SvCq1qMY1uxMjJ2yioPS4Xg
	B8ILQa2D7BpgbMXu54BsDXvaCae/oVQmNE7L0edlY4MDY8fEbU91JKUlWRIF7LZG8PMMvKMtPzYPM
	aCdFsSGA4BmnyQb0lpR79FPb2aibx+s8myk9OB9ns0iIQyaJT6j9es1JEMFN3qzVuh1a23boG3t98
	pNIe0Umk/f182Ovb8BUHp2dr9pT5GnEfGb4u7Z8vsFsD3XkvdWBqWqXyaWZOGOtp/x8p3Ce9a06Me
	nJO1LUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty94w-0000000DL3g-2ECA;
	Fri, 28 Mar 2025 12:44:54 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty93B-0000000DKlz-03uv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:43:07 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SCh0Ol2149260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 07:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743165780;
	bh=vnX3eQ6ImWFHV3yinCub9dwiAWQ/AdU8d6C5xkRCwOM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KutOjeNG6E928QIhhp6BEZu1OUKddC2aamjOjK+7Z3uTxxtq/oCZMZi7GeS8bNcGH
	 SKZXtVdRxuJ9r6MTTqs5rYvpciQPe0ptnxnLP2imOBlcLAK5KWvGrLxqjWKi1g8k/3
	 ptooCMuhlInRQ4sZiQ+jUrxcgb9xXU17ixenjA00=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SCh0mK001229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 07:43:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 07:42:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 07:43:00 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SCguCw001359;
	Fri, 28 Mar 2025 07:42:57 -0500
Message-ID: <71f19095-02c5-4d9a-8c6f-c51fb4ea9b36@ti.com>
Date: Fri, 28 Mar 2025 18:12:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: ti: bist: Add BIST for K3
 devices
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250328111439.374748-1-n-francis@ti.com>
 <20250328111439.374748-2-n-francis@ti.com>
 <fc4d9a33-2d3f-47e2-b1cf-59962cc54bce@kernel.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <fc4d9a33-2d3f-47e2-b1cf-59962cc54bce@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_054305_150456_198A98BA 
X-CRM114-Status: GOOD (  14.13  )
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

On 28/03/25 17:18, Krzysztof Kozlowski wrote:
> On 28/03/2025 12:14, Neha Malcom Francis wrote:
>> +properties:
>> +  compatible:
>> +    const: ti,j784s4-bist
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: cfg
>> +      - const: ctrl_mmr
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ti,bist-under-test:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      the device IDs of the devices under test control of the BIST device, the
> 
> Still not phandle... What is a "device ID"?

I took a shot at working with the phandle, however the test devices may
or may not be present in the devicetree at bootloader stage which is the
only place this BIST driver can execute (I know I shouldn't be bringing
up the driver here but it's crucial to how I can model this property).
HW mandates you run it as early as possible before any other software
executes on the test device.

So now thinking of other possible ways to define the test devices, we
have unique HW identifiers [1] for each of the device which is what I've
used here...

[1]
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/keystone/ti%2Ck3-sci-common.yaml#L31

> 
>> +      number of devices may be more than one. The HW logic will trigger the
>> +      tests on all of these devices at once.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - ti,bist-under-test
>> +
>> +additionalProperties: false
> 
> 
> Best regards,
> Krzysztof

-- 
Thanking You
Neha Malcom Francis

