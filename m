Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D1DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aak4bhl7i7wNtq2KK490ptM/CCcwRR/GDiQ+3JaJM8M=; b=h8f8lHFUlV+9dRvYD+0SNzligY
	II7pW6px5AftSi3yU8YKm/uwqoXFnrLJaUmUYn99qcHcSwvMLv1Cyy98ThTigJ07Bni6/y+Mcck+5
	dChBgDYlMAxlFBMFJ/oQ7010Jm1hd7jcQmmk5dnVFWP9MKfuC9ZcOx+2Byjeqsz7bOf5JFDc9S6Hx
	KCL5OyzHi0pCrX2gaQJeACUrVV6eachtDRNj0UyztHpbJ5RytAoPCR4avPTabdVEAk5H5sMfJKV8c
	dZ4Rkmg9TS6V6FIChqo74XODNNV/AJ6Fz9wPvOgdxnps1l4bV7nra5hrY+U+5tzeO23LLlN+A/yFo
	TnvTs8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChOG-0000000G7Hm-0b5P;
	Wed, 07 May 2025 16:13:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgNT-0000000Ftxa-3cga;
	Wed, 07 May 2025 15:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Aak4bhl7i7wNtq2KK490ptM/CCcwRR/GDiQ+3JaJM8M=; b=Lbr112MEAgHxThbyXpRqHWTH3t
	yCNS2Pl0iKjZmY1qpLzcW/PilQP9TRwmORdByTmTdUj+437HOE84/Jucz7ZcMWcBwO8lGcSYAX5Fb
	ORsnHpAMtcf3tXMwcc76dN6gWfYU38J0Mv8WPBoVRvVO5GqgqpTKMSqa1PrEHxOGV/JtMT0mPjYQz
	GWViaG9AMy16MsyZgu/89ACvIQy8latNjihndtnzuOWvk4AbTj3lF1sL9gOi5jbYRVNDGwWxjDkjT
	7ng8SCcVBG9G2LS8rXedCxrXkpE4AejcNiQTogJLfZJ08doqomTYEGLPt1sGPmZTe+iZzGz0XMz+G
	qqmxTVNA==;
Received: from m16.mail.163.com ([117.135.210.3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCgNP-0000000Fruo-30hd;
	Wed, 07 May 2025 15:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=Aak4bhl7i7wNtq2KK490ptM/CCcwRR/GDiQ+3JaJM8M=;
	b=iZbyWhy0qCtoFQqwnzANJzhS41G7lBZ5OIu7giRsfv1/lfwgSi+kogsMPKGqIb
	zwUNGs4RUA+qijCGO+txyFwzDZ2kF+N2oP51+PWl7EwSVAyUYQZAtgO+546rhhnP
	sp0M+yLFIqxzMr7/JAu+5zujfjYUUBX0qS4X/41Mjs9L4=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXGekLdxto_mATFA--.15890S2;
	Wed, 07 May 2025 23:06:52 +0800 (CST)
Message-ID: <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
Date: Wed, 7 May 2025 23:06:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
From: Hans Zhang <18255117159@163.com>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, yue.wang@Amlogic.com,
 neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
Content-Language: en-US
In-Reply-To: <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXGekLdxto_mATFA--.15890S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1DZw1xCw45tw43Cw43Awb_yoW5Ary8pF
	W3XF4rAFWaqr15C3W7Xa1vgryYgasFkFy5W398G343AF9Igw1UGFy2kF4rua47Jr4IkF4j
	vry3t3ySv3WYyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBSoXUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDx9Go2gbdD5DvQABsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_160804_332037_E77E6C0D 
X-CRM114-Status: GOOD (  19.11  )
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



On 2025/5/7 23:03, Hans Zhang wrote:
> 
> 
> On 2025/5/7 01:41, Pali Rohár wrote:
>> On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
>>> The Aardvark PCIe controller enforces a fixed 512B payload size via
>>> PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
>>> core negotiations.
>>>
>>> Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
>>> PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
>>> during device initialization, leveraging root port configurations and
>>> device-specific capabilities.
>>>
>>> Aligning Aardvark with the unified MPS framework ensures consistency,
>>> avoids artificial constraints, and allows the hardware to operate at
>>> its maximum supported payload size while adhering to PCIe 
>>> specifications.
>>>
>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>> ---
>>>   drivers/pci/controller/pci-aardvark.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/pci-aardvark.c 
>>> b/drivers/pci/controller/pci-aardvark.c
>>> index a29796cce420..d8852892994a 100644
>>> --- a/drivers/pci/controller/pci-aardvark.c
>>> +++ b/drivers/pci/controller/pci-aardvark.c
>>> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie 
>>> *pcie)
>>>       reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>       reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>>>       reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
>>> -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>>>       reg &= ~PCI_EXP_DEVCTL_READRQ;
>>> -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>>>       reg |= PCI_EXP_DEVCTL_READRQ_512B;
>>>       advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>> -- 
>>> 2.25.1
>>>
>>
>> Please do not remove this code. It is required part of the
>> initialization of the aardvark PCI controller at the specific phase,
>> as defined in the Armada 3700 Functional Specification.
>>
>> There were reported more issues with those Armada PCIe controllers for
>> which were already sent patches to mailing list in last 5 years. But
>> unfortunately not all fixes were taken / applied yet.
> 
> Hi Pali,
> 
> I replied to you in version v2.
> 
> Is the maximum MPS supported by Armada 3700 512 bytes? What are the 
> default values of DevCap.MPS and DevCtl.MPS?
> 
> Because the default value of DevCtl.MPS is not 512 bytes, it needs to be 
> configured here, right?
> 
> If it's my guess, RK3588 also has the same requirements as you, just 
> like the first patch I submitted.
> 
> Please take a look at the communication history:
> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
And this:
https://patchwork.kernel.org/project/linux-pci/patch/20250425095708.32662-2-18255117159@163.com/

> 
> Please test it using patch 1/3 of this series. If there are any 
> problems, please let me know.
> 
> 
> Best regards,
> Hans


