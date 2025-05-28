Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D760C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElKpeHpcjk6pVBF1ETZIWToTi0hyKl/CS1BZExF2nEw=; b=IEzo4zHCfTt23moD90r13FX6q1
	GKM38L3FBksqaAbzH4rCdwXpviUB35OUDGVdf8HaGC3yH6kzXTmKvXn6oujHbQdwDG4hXvJRkp5/P
	Im/ki6LdDTyFjroBEDmqSKLLZAzZOAiAMWbyPjH0Cu9eaEoCw1ab/Zdpnnqlq+uoCSSDJFXfp1F36
	2v8q2m4du9L2i7lIli3R3IDzrq2WK7WFsVye/BvzGxnT1z3x6f8mMXs+Crz50yibH8xYkg63TI580
	K+hmFh49iJi4naOQKMI3sKpxyZIPkCSAC7gLnb/9L1I8sfK48HC/PoqymHxfWS78WHcZc6cJq5vZq
	iIqX5Rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBCh-0000000CQpa-0TzX;
	Wed, 28 May 2025 07:27:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBAU-0000000CQSS-3fnx;
	Wed, 28 May 2025 07:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E96FC44432;
	Wed, 28 May 2025 07:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5639FC4CEE7;
	Wed, 28 May 2025 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748417141;
	bh=4oYNcof0NvsL8+KTpTf/6kMf6BWKIsxqMPsWFf9O4mA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A3xfTqv/aRqe3q/tUZrThHNI+nMFY318R4H/TLQCQ9vWKOB/H/bnAVOoN3AsHO5tG
	 9PbV2nLbbxG5BKqFdgkleiVdySiRtW09ifX5uJQhaWh8eM7A4qM1yN3irbHJ2mTYES
	 lCXkU0EI+H5mmhW+yGZsiX13kAVn/o+ncr+hcNUi0bLSJuwwgNr37JpWrPadwVtc8t
	 TXqhrAXQoGH1av837RuoHqTI15rQHFTP4hKcat63hjdXpoylWWdAVWR4uRUsIa7ymx
	 yJGv3L5MVaGO0qEGAN0e055fXDqTeq+mWcoN/Dx9T1EhzG5cem9dvuiUsV9qlncR6+
	 9sUiEPKftXiYA==
Message-ID: <441dd5c3-fd51-4471-86ad-337c646b1571@kernel.org>
Date: Wed, 28 May 2025 09:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] PCI: exynos: Add support for Tesla FSD SoC
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
 robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
 m.szyprowski@samsung.com, jh80.chung@samsung.com
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193300epcas5p17e954bb18de9169d65e00501b1dcd046@epcas5p1.samsung.com>
 <20250518193152.63476-10-shradha.t@samsung.com>
 <20250521-competent-honeybee-of-will-3f3ae1@kuoka>
 <0e2801dbcef4$78fe5ec0$6afb1c40$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0e2801dbcef4$78fe5ec0$6afb1c40$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_002542_959060_A7CB6E2F 
X-CRM114-Status: GOOD (  18.55  )
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

On 27/05/2025 12:45, Shradha Todi wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 21 May 2025 15:18
>> To: Shradha Todi <shradha.t@samsung.com>
>> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.or;
>> linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; manivannan.sadhasivam@linaro.org; lpieralisi@kernel.org;
>> kw@linux.com; robh@kernel.org; bhelgaas@google.com; jingoohan1@gmail.com; krzk+dt@kernel.org; conor+dt@kernel.org;
>> alim.akhtar@samsung.com; vkoul@kernel.org; kishon@kernel.org; arnd@arndb.de; m.szyprowski@samsung.com;
>> jh80.chung@samsung.com
>> Subject: Re: [PATCH 09/10] PCI: exynos: Add support for Tesla FSD SoC
>>
>> On Mon, May 19, 2025 at 01:01:51AM GMT, Shradha Todi wrote:
>>>  static int exynos_pcie_probe(struct platform_device *pdev)  {
>>>  	struct device *dev = &pdev->dev;
>>> @@ -355,6 +578,26 @@ static int exynos_pcie_probe(struct platform_device *pdev)
>>>  	if (IS_ERR(ep->phy))
>>>  		return PTR_ERR(ep->phy);
>>>
>>> +	if (ep->pdata->soc_variant == FSD) {
>>> +		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		ep->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
>>> +				"samsung,syscon-pcie");
>>> +		if (IS_ERR(ep->sysreg)) {
>>> +			dev_err(dev, "sysreg regmap lookup failed.\n");
>>> +			return PTR_ERR(ep->sysreg);
>>> +		}
>>> +
>>> +		ret = of_property_read_u32_index(dev->of_node, "samsung,syscon-pcie", 1,
>>> +						 &ep->sysreg_offset);
>>> +		if (ret) {
>>> +			dev_err(dev, "couldn't get the register offset for syscon!\n");
>>
>> So all MMIO will go via syscon? I am pretty close to NAKing all this, but let's be sure that I got it right - please post your complete DTS
>> for upstream. That's a requirement from me for any samsung drivers - I don't want to support fake, broken downstream solutions
>> (based on multiple past submissions).
>>
> 
> By all MMIO do you mean DBI read/write? The FSD hardware architecture is such that the DBI/ATU/DMA address is at the same offset.
> The syscon register holds the upper bits of the actual address differentiating between these 3 spaces. This kind of implementation was done
> to reduce address space for PCI DWC controller. So yes, each DBI/ATU register read/write will have syscon write before it to switch address space.

Wrap your replies correctly to fit mailing list.

No, I meant your binding does not define any MMIO at all. I see you use
for example elbi_base which is mapped from "elbi" reg entry, but you do
not have it in your binding.

Maybe just binding is heavily incomplete and that confused me.

Best regards,
Krzysztof

