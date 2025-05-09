Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB1C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Szx3j0XFQEI/UBZs807hBKYHQ3bAc/qN60fFOlHrtI=; b=ZCwTZRNhkG7lzxBCiVRSUs7vYR
	h4+Lrlb73u88DHmcGDg+77YGoYbr8ZwZwW+gJZlU7MhjfC9oYSPGHIa3QmNsRaRIAfVTXmuip9/us
	NzbmQFMcl2bxflvqhjO7QXGOfa3BHemAYPdhrn+Ggc11oh5NkJNLWyJKu7eo6Qqq0xW+8UZElrITg
	LDl/ZO5cHPdzW2zWdQ2RUWHKoMUl2XqAPkdDTM57f3/BY1Cj3QNtnKHfVxcNAhFv4trUMBkJU823w
	wKp2nX1TsO8HUYSj24z0xQlJggA0w0Pm1wydUW/GzPtnWayNgrkC8mA/yGaMgw+VgqGiVoBIeYY1w
	Jk5C7yIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNGJ-00000003f5Z-3ppL;
	Fri, 09 May 2025 12:55:35 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMTS-00000003X1B-26OO;
	Fri, 09 May 2025 12:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=9Szx3j0XFQEI/UBZs807hBKYHQ3bAc/qN60fFOlHrtI=;
	b=WE6X6Oe68i2pgvx5xNscRvtTNl3LlOetrwoJA5hDiunh5b9eEwaidFRfleV8n5
	v+bysff+v0rPSbJOT1Hby7e3FKVCp67ea45gyvg7e2SS/6cmVlmS44czvB2v+aia
	fsKZBlcG59+ToQhiA3BZFRmj7Ad0b8FgffcspENpFqbac=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3_5EM7x1oPsfZAA--.35294S2;
	Fri, 09 May 2025 20:03:27 +0800 (CST)
Message-ID: <78abe899-e529-49e8-9a16-a2657db666e4@163.com>
Date: Fri, 9 May 2025 20:03:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, yue.wang@amlogic.com, neil.armstrong@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
 <oy5wlkvp7nrg65hmbn6cwjcavkeq7emu65tsh4435gxllyb437@7ai23qsmpesy>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <oy5wlkvp7nrg65hmbn6cwjcavkeq7emu65tsh4435gxllyb437@7ai23qsmpesy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_5EM7x1oPsfZAA--.35294S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW8WFWktr1rAF45Kw13twb_yoWrWFykpF
	y3XF1FyFs8Jr13CFnFqa1kKry3tasrKryrXrn8Gry3AF9IqryUGFy2yr4rua47Xr1xCF1j
	yr1YqrWSvF1Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URc_hUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwdIo2gd5xbcqQAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_050506_913454_BB18AC11 
X-CRM114-Status: GOOD (  24.02  )
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



On 2025/5/9 15:08, Manivannan Sadhasivam wrote:
> On Wed, May 07, 2025 at 06:36:20PM +0200, Pali Rohár wrote:
>> On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
>>> On 2025/5/7 23:03, Hans Zhang wrote:
>>>> On 2025/5/7 01:41, Pali Rohár wrote:
>>>>> On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
>>>>>> The Aardvark PCIe controller enforces a fixed 512B payload size via
>>>>>> PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
>>>>>> core negotiations.
>>>>>>
>>>>>> Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
>>>>>> PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
>>>>>> during device initialization, leveraging root port configurations and
>>>>>> device-specific capabilities.
>>>>>>
>>>>>> Aligning Aardvark with the unified MPS framework ensures consistency,
>>>>>> avoids artificial constraints, and allows the hardware to operate at
>>>>>> its maximum supported payload size while adhering to PCIe
>>>>>> specifications.
>>>>>>
>>>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>>>> ---
>>>>>>    drivers/pci/controller/pci-aardvark.c | 2 --
>>>>>>    1 file changed, 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/controller/pci-aardvark.c
>>>>>> b/drivers/pci/controller/pci-aardvark.c
>>>>>> index a29796cce420..d8852892994a 100644
>>>>>> --- a/drivers/pci/controller/pci-aardvark.c
>>>>>> +++ b/drivers/pci/controller/pci-aardvark.c
>>>>>> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
>>>>>> advk_pcie *pcie)
>>>>>>        reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>>>>        reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>>>>>>        reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
>>>>>> -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>>>>>>        reg &= ~PCI_EXP_DEVCTL_READRQ;
>>>>>> -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>>>>>>        reg |= PCI_EXP_DEVCTL_READRQ_512B;
>>>>>>        advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
>>>>>
>>>>> Please do not remove this code. It is required part of the
>>>>> initialization of the aardvark PCI controller at the specific phase,
>>>>> as defined in the Armada 3700 Functional Specification.
>>>>>
>>>>> There were reported more issues with those Armada PCIe controllers for
>>>>> which were already sent patches to mailing list in last 5 years. But
>>>>> unfortunately not all fixes were taken / applied yet.
>>>>
>>>> Hi Pali,
>>>>
>>>> I replied to you in version v2.
>>>>
>>>> Is the maximum MPS supported by Armada 3700 512 bytes?
>>
>> IIRC yes, 512-byte mode is supported. And I think in past I was testing
>> some PCIe endpoint card which required 512-byte long payload and did not
>> worked in 256-byte long mode (not sure if the card was not able to split
>> transaction or something other was broken, it is quite longer time).
>>
>>>> What are the default values of DevCap.MPS and DevCtl.MPS?
>>
>> Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
>> type?
>>
>> Aardvark controller does not have the real HW PCI-to-PCI bridge device.
>> There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
>> create fake kernel PCI device in the hierarchy to make kernel and
>> userspace happy. Yes, this is deviation from the PCIe standard but well,
>> buggy HW is also HW.
>>
>> And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.
>>
> 
> Oh. Then this patch is not going to change the MPS setting of the root bus. But
> that also means that there is a deviation in what the PCI core expects for a
> root port and what is actually programmed in the hw.
> 
> Even in this MPS case, if the PCI core decides to scale down the MPS value of
> the root port, then it won't be changed in the hw and the hw will continue to
> work with 512B? Shouldn't the controller driver change the hw values based on
> the values programmed by PCI core of the emul bridge?
> 
> But until that is fixed, this patch should be dropped.
> 

Dear Mani,

I will drop this patch in the next version.

Best regards,
Hans


