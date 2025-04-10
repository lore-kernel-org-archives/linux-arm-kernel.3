Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E7C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ5g9/Dd1PSleXQIVwzaLKCRegVo7owIHyrp8FOD2xs=; b=PTajkol2/BMoZXxlR9nOXNdChb
	3PfyfuJKA8p4enU1V1sc892fDsuyOUtx8B9deTIDOcAMIJvnoyafF5P0crhgU1iPfYI4IUld3IVPm
	IZ0m8pbr/qKvPONiEq9H8s/FYVD6W7ymRiXoCL5od0yM7yypEyXi5CbTJwCmgCDHobeRIGQ2tz1Is
	Gr02WlYejtZEIOjgXLYVphCkmJPXIX/qGBOOldVSiYTj4CbZkk6MsujVNFrSrX2LdF9bBhPnDysBQ
	cNGvlSAaqDD0PXk1vtM6K3xROal6EfI4ucYdPzkWTS8HgGe5JlNoWF0+Ta9BrZ18N9Kwq/bCVmksD
	Anr05aAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mgq-00000009cxR-2qFZ;
	Thu, 10 Apr 2025 07:51:12 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m23-00000009TqP-1I3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:09:04 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53A78u1U1199054
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 02:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744268937;
	bh=AJ5g9/Dd1PSleXQIVwzaLKCRegVo7owIHyrp8FOD2xs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rhZA+x/q5M8yvne56uwJC8GvYS8ZlRWLekbC2E51stJEBZAqZ3IKrLC/N5Y0e/XLm
	 T9g5EMlmM11Nd3s+B0yNvJqdp9EgeMa+BLgwCaqp5bPDfRaxqASsaoX701axKFy+U9
	 tIAWqEGnejGBGdLfZnOwbTCBzfAR4SsjgK2ulHkM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53A78uDJ101138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 02:08:56 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 02:08:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 02:08:56 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53A78rVw035873;
	Thu, 10 Apr 2025 02:08:53 -0500
Message-ID: <0f1dc639-20e1-49b2-a813-08b6c8a94744@ti.com>
Date: Thu, 10 Apr 2025 12:38:52 +0530
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
 <71f19095-02c5-4d9a-8c6f-c51fb4ea9b36@ti.com>
 <26ab079e-9178-4936-9dd9-6aa66916a59a@kernel.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <26ab079e-9178-4936-9dd9-6aa66916a59a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000903_481821_E16612A1 
X-CRM114-Status: GOOD (  17.23  )
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

On 29/03/25 10:08, Krzysztof Kozlowski wrote:
> On 28/03/2025 13:42, Neha Malcom Francis wrote:
>> On 28/03/25 17:18, Krzysztof Kozlowski wrote:
>>> On 28/03/2025 12:14, Neha Malcom Francis wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: ti,j784s4-bist
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: cfg
>>>> +      - const: ctrl_mmr
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  ti,bist-under-test:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description:
>>>> +      the device IDs of the devices under test control of the BIST device, the
>>>
>>> Still not phandle... What is a "device ID"?
>>
>> I took a shot at working with the phandle, however the test devices may
>> or may not be present in the devicetree at bootloader stage which is the
> 
> If the nodes are not in DT, then you should not reference them here.
> Bootloader is supposed to receive all the nodes it is expected to work on.

Understood.

> 
>> only place this BIST driver can execute (I know I shouldn't be bringing
>> up the driver here but it's crucial to how I can model this property).
>> HW mandates you run it as early as possible before any other software
>> executes on the test device.
>>
>> So now thinking of other possible ways to define the test devices, we
>> have unique HW identifiers [1] for each of the device which is what I've
>> used here...
>>
>> [1]
>> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/keystone/ti%2Ck3-sci-common.yaml#L31
> 
> Then do not redefine properties, but use one common definition.

Right, I'll respin the driver and the dt-binding in this direction, thanks!

> 
> 
> Best regards,
> Krzysztof

-- 
Thanking You
Neha Malcom Francis

