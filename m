Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F60DC71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtLHyzIXT1AKmPX6hD2tyAPsnEPd735Ph5uIX9qO/h4=; b=Yzh1BcsbbTEZDBSXsTGDonuujP
	8kx6njOHgyDe0+OOeRDp+H+6L6YuGKVwZu2N1ZIP6z6FeslSCjam0HvH5+w6jFk6IJywXHRlrJj9h
	pYqgqtSm0dhUXGqJwVQ1bEtbXDk509f03FUFqW/Bv6tXkO5O2GtpOnFaslSz2Pe4WlO8C8LvHGZ6s
	maGxCH0OqpKqPj5f8WT7gTACHWdpmbbasCm7Ca8XsYS3Qh21InIEoIX2icPyq6gPwGG9eW8g+PiWg
	RRgE0OoJie3Zg4YNS+91fmlY521XepSpH5ac1TGLEnP1GlsD9x1oYFGyxgJK2lADsLk6TaS6VOBnp
	qE0fBUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpR-0000000DMJa-1gex;
	Thu, 12 Jun 2025 13:18:49 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPezT-0000000Cwx0-1kLq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 10:17:00 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CAGt8R1639154;
	Thu, 12 Jun 2025 05:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749723415;
	bh=xtLHyzIXT1AKmPX6hD2tyAPsnEPd735Ph5uIX9qO/h4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VFdCXSsf0KSKsQa22pRTYSnZ1S4x/nh8NF14mSgUoGcU9dNoby7E8Bn0QM52seN29
	 enIuIrYqHHmGuraGByLDM0hgOwjHsE/tGE1sbSYnYiNbiircAOBbAh15P3V4yJhb01
	 uNukUwu5asUVlNUiCgsLcsgX9Tm38dtUYQHmprEM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CAGtGX1734427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 05:16:55 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 05:16:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 05:16:55 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CAGpPr1835014;
	Thu, 12 Jun 2025 05:16:51 -0500
Message-ID: <f6a57a82-c534-4439-a337-8592c2e121c5@ti.com>
Date: Thu, 12 Jun 2025 15:46:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>, Hrushikesh Salunke <h-salunke@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
 <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
 <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_031659_543353_068CF827 
X-CRM114-Status: GOOD (  12.03  )
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



On 11/06/25 14:17, Hrushikesh Salunke wrote:
> 
> 
> On 11/06/25 14:14, Vignesh Raghavendra wrote:
>>
>>
>> On 10/06/25 11:19, Hrushikesh Salunke wrote:
>>> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
>>> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
>>> functional at all stages of PCIe boot process. Thus add the
>>> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
>>>
>>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>>> ---
>>> This patch is based on commit
>>> 475c850a7fdd Add linux-next specific files for 20250606
>>>
>>> Changes since v1
>>> As per feedback from Nishanth, changed the position of "bootph-all"
>>> tag, according to ordering rules for device tree properties.
>>>
>>> v1 : 
>>> https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/
>>>
>>>   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso 
>>> b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>> index 432751774853..a7e8d4ea98ac 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>>>           max-functions = /bits/ 8 <1>;
>>>           phys = <&serdes0_pcie_link>;
>>>           phy-names = "pcie-phy";
>>> +        bootph-all;
>>>           ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>>>       };
>>>   };
>>
>> Are the patches for PCIe boot support merged to U-Boot or such other
>> bootloader repo?
>> No, they are not in the U-Boot yet. I will be posting patches for PCIe
> boot support for U-Boot this week.
> 

I have posted Patch series for the PCIe boot support in Uboot.

1.https://patchwork.ozlabs.org/project/uboot/patch/20250612084910.3457060-1-h-salunke@ti.com/
2. 
https://patchwork.ozlabs.org/project/uboot/cover/20250612085023.3457117-1-h-salunke@ti.com/
3. 
https://patchwork.ozlabs.org/project/uboot/cover/20250612085534.3457522-1-h-salunke@ti.com/


Regards,
Hrushikesh.

