Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD17E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLtTms1oagCCMUbZu1+NlcnSpCszvP6VSl8saVCxzMk=; b=SGtKrXnWsZ9M0xPu3coPik5rmq
	JMrV76XLVzZT78wZwmm7kSlEHA5EawPzhZnPV5q3f6FFrs41X+SpCMv58XdSG/2LpM1SUgKlhL62/
	J52i4m/tGzje7cbuvBnd9mdE3OTWZuG7KEKup60GLKgZGtep5Geucau5w2a5XIjorK9wGyqJu4kEZ
	tvOt7qAV9uiG7ZM+dNAQaIlRNVB9Zvqu68fvyt4d7AY580ofYdXu1Qwug0ENZ576OOlyoF4n0Edd2
	Smq1xOdktwljcEEw3mapfX/76UGepnay6Pgnn/ILfA0gzx5i3DFKT8dARVkV0C77ev1Xk7JGOyMGd
	xSqwioUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8IL-00000004g70-04an;
	Tue, 07 Jan 2025 12:02:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV80s-00000004c9N-2lWc;
	Tue, 07 Jan 2025 11:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736250285;
	bh=nvqMeuDTfZgH1m0kgkeC9rUI30xVUZ5If34vfsgD108=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFuOI6mN+NcYESN+8h5Lm8qNaeVahsukk+9CT10YTgVzCyd+4f7/sDH9+bQujFO/b
	 fs5W4sudz5V5xsdbHVZB2aXZfYakIjViPDwXxQDntq+r3SMr5lgCMJY3aAG68Onkng
	 hR4jp9m3rHf5NVDvwwimGRzZIIKpUr47Omh+E4zKnB8RWmuWsqYeLW0bEX+YKVdieU
	 t1sz2Xm7HY06OUFJycn91NMyXWp9HThlOqBEbE1XPE0mW1ZIUvwdE5udJp1kqV6HOT
	 wWbEhOBSpLmIVG2HT7DP+qG6PHBHqxO5x2B3AtugpRBdIjba78ySFEieWEj7N/Gdh1
	 EBUiqSVn9+Gag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3965017E1562;
	Tue,  7 Jan 2025 12:44:44 +0100 (CET)
Message-ID: <1a48feae-f55f-4df8-b165-84c1cb2f6658@collabora.com>
Date: Tue, 7 Jan 2025 12:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
To: =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-4-jianjun.wang@mediatek.com>
 <b5ef9501-e07d-4150-9518-dd982518919e@collabora.com>
 <cecd7ebf0ccac9638b8e93b28fcf4df5bb81a794.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cecd7ebf0ccac9638b8e93b28fcf4df5bb81a794.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_034446_853781_9CCB48A7 
X-CRM114-Status: GOOD (  21.31  )
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

Il 07/01/25 03:18, Jianjun Wang (王建军) ha scritto:
> On Fri, 2025-01-03 at 10:16 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 03/01/25 07:00, Jianjun Wang ha scritto:
>>> Disable ASPM L0s support because it does not significantly save
>>> power
>>> but impacts performance.
>>>
>>
>> That may be a good idea but, without numbers to support your
>> statement, it's a bit
>> difficult to say.
>>
>> How much power does ASPM L0s save on MediaTek SoCs, in microwatts?
>> How is the performance impacted, and on which specific device(s) on
>> the PCIe bus?
> 
> It's hard to tell the exact number because it is difficult to measure,
> and the number of entries into the L0s state may vary even in the same
> test scenario.
> 
> However, we have encountered some compatibility issues when connected
> with some PCIe EPs, and disabling the L0s can fix it. I think disabling
> L0s might be the better way, since we usually use L1ss for power-saving
> when the link is idle.
> 

To actually decide, we should know what's actually broken, then.

Is the MediaTek controller broken, or is the device broken?
So, is it a MTK quirk, or a device quirk?

If the problem is actually device-related, then this should be handled as
a device-specific quirk, as not just MediaTek platforms would be affected
by compatibility issues.

If the MediaTek PCIe controller is at fault, instead, I agree about just
disabling L0s at the controller level - but then this shall be mentioned
in the commit message, and should have a Fixes tag as well.

Cheers,
Angelo

> Thanks.
> 
>>
>> Cheers,
>> Angelo
>>
>>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
>>> ---
>>>    drivers/pci/controller/pcie-mediatek-gen3.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
>>> b/drivers/pci/controller/pcie-mediatek-gen3.c
>>> index ed3c0614486c..4bd3b39eebe2 100644
>>> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
>>> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>>> @@ -84,6 +84,9 @@
>>>    #define PCIE_MSI_SET_ENABLE_REG             0x190
>>>    #define PCIE_MSI_SET_ENABLE         GENMASK(PCIE_MSI_SET_NUM - 1,
>>> 0)
>>>
>>> +#define PCIE_LOW_POWER_CTRL_REG              0x194
>>> +#define PCIE_FORCE_DIS_L0S           BIT(8)
>>> +
>>>    #define PCIE_PIPE4_PIE8_REG         0x338
>>>    #define PCIE_K_FINETUNE_MAX         GENMASK(5, 0)
>>>    #define PCIE_K_FINETUNE_ERR         GENMASK(7, 6)
>>> @@ -458,6 +461,14 @@ static int mtk_pcie_startup_port(struct
>>> mtk_gen3_pcie *pcie)
>>>        val &= ~PCIE_INTX_ENABLE;
>>>        writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>>>
>>> +     /*
>>> +      * Disable L0s support because it does not significantly save
>>> power
>>> +      * but impacts performance.
>>> +      */
>>> +     val = readl_relaxed(pcie->base + PCIE_LOW_POWER_CTRL_REG);
>>> +     val |= PCIE_FORCE_DIS_L0S;
>>> +     writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
>>> +
>>>        /* Disable DVFSRC voltage request */
>>>        val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>>>        val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
>>
>>


