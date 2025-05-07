Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC0C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFAmY2MKwdKHgLamuSXh1FUsHEdiYUg60MVKfaCdvoY=; b=d1Uf21e8mQxbnDqXSnO3VBaFgi
	GxYYtDSR2jcX/uvqw+ytPFuG2EgvunyVcQImlAcDIyE+sG9dBJvuscytCj3ZJR/wc4HHEShcuYOOd
	Y1jgXfOdGSdcL7g5MiU/Th75kq/7hC7uF9R+SOUSdZuIup/8QaRAKylm38A9VNbHYB4RCe1g7kkFx
	VxW1ggCcmaSVmHc+l9+LbapNtIqGPml0VrupyDiQX7bjjX1b5Ka0r/3AdUfwAlrFdZb4pTkPyjCi8
	RQv32Kt83hKhaJRvthggd51wzPolyS4bpbQX/KjbFxoyDn4jFzc4RbiW92BRZul0REEo2UazUHSAB
	KhJZL5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXm-0000000GKF0-3NDG;
	Wed, 07 May 2025 17:26:54 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChwf-0000000GCUn-2IJh;
	Wed, 07 May 2025 16:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=RFAmY2MKwdKHgLamuSXh1FUsHEdiYUg60MVKfaCdvoY=;
	b=U5n41a6szOt5DII0T5tNRMzSMBxAfvlaz7pd1kkkbJQ2ygpLyNRh27HYXcZSTV
	vL8FjA4B20MJ+/DYgoFSxHnELfuqfrOYDHt+LR6BaaIlcLzRs1vHuc9uQrgVItEt
	HkQ4DKQp6KKOhl81obXX6BAhTMMyYo+1zuMMJh3NJO6oU=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCnwFuQjhtonhXNFA--.39420S2;
	Thu, 08 May 2025 00:47:13 +0800 (CST)
Message-ID: <b364eed2-047d-4c74-9f30-45291305bc4b@163.com>
Date: Thu, 8 May 2025 00:47:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Niklas Cassel <cassel@kernel.org>
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
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250507163620.53v5djmhj3ywrge2@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnwFuQjhtonhXNFA--.39420S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryxWFW7uF13Gw1kGr1fXrb_yoWruF4fpF
	W3XF4rAF47Jr15CF1Iq3Wvkry5tasrKry5XrZ8G343AF9Iqa45JFy2yr4rua47Xr4SkF12
	yry5XrWIvFn0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um38nUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOgRGo2gbjGJKowAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_094833_939923_9C2C7B65 
X-CRM114-Status: GOOD (  26.40  )
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



On 2025/5/8 00:36, Pali Rohár wrote:
> On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
>> On 2025/5/7 23:03, Hans Zhang wrote:
>>> On 2025/5/7 01:41, Pali Rohár wrote:
>>>> On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
>>>>> The Aardvark PCIe controller enforces a fixed 512B payload size via
>>>>> PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
>>>>> core negotiations.
>>>>>
>>>>> Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
>>>>> PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
>>>>> during device initialization, leveraging root port configurations and
>>>>> device-specific capabilities.
>>>>>
>>>>> Aligning Aardvark with the unified MPS framework ensures consistency,
>>>>> avoids artificial constraints, and allows the hardware to operate at
>>>>> its maximum supported payload size while adhering to PCIe
>>>>> specifications.
>>>>>
>>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>>> ---
>>>>>    drivers/pci/controller/pci-aardvark.c | 2 --
>>>>>    1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pci/controller/pci-aardvark.c
>>>>> b/drivers/pci/controller/pci-aardvark.c
>>>>> index a29796cce420..d8852892994a 100644
>>>>> --- a/drivers/pci/controller/pci-aardvark.c
>>>>> +++ b/drivers/pci/controller/pci-aardvark.c
>>>>> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
>>>>> advk_pcie *pcie)
>>>>>        reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>>>        reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>>>>>        reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
>>>>> -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>>>>>        reg &= ~PCI_EXP_DEVCTL_READRQ;
>>>>> -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>>>>>        reg |= PCI_EXP_DEVCTL_READRQ_512B;
>>>>>        advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>>>
>>>> Please do not remove this code. It is required part of the
>>>> initialization of the aardvark PCI controller at the specific phase,
>>>> as defined in the Armada 3700 Functional Specification.
>>>>
>>>> There were reported more issues with those Armada PCIe controllers for
>>>> which were already sent patches to mailing list in last 5 years. But
>>>> unfortunately not all fixes were taken / applied yet.
>>>
>>> Hi Pali,
>>>
>>> I replied to you in version v2.
>>>
>>> Is the maximum MPS supported by Armada 3700 512 bytes?
> 
> IIRC yes, 512-byte mode is supported. And I think in past I was testing
> some PCIe endpoint card which required 512-byte long payload and did not
> worked in 256-byte long mode (not sure if the card was not able to split
> transaction or something other was broken, it is quite longer time).
> 
>>> What are the default values of DevCap.MPS and DevCtl.MPS?
> 
> Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
> type?
> 
> Aardvark controller does not have the real HW PCI-to-PCI bridge device.
> There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
> create fake kernel PCI device in the hierarchy to make kernel and
> userspace happy. Yes, this is deviation from the PCIe standard but well,
> buggy HW is also HW.
> 
> And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.
> 
>>> Because the default value of DevCtl.MPS is not 512 bytes, it needs to be
>>> configured here, right?
>>>
>>> If it's my guess, RK3588 also has the same requirements as you, just
>>> like the first patch I submitted.
>>>
>>> Please take a look at the communication history:
>>> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
>> And this:
>> https://patchwork.kernel.org/project/linux-pci/patch/20250425095708.32662-2-18255117159@163.com/
> 
> These changes are referring the to root ports PCI devices, which are not
> applicable for aardvark PCIe controller.
> 
>>>
>>> Please test it using patch 1/3 of this series. If there are any
>>> problems, please let me know.
>>>
>>>
>>> Best regards,
>>> Hans
>>
> 
> Sorry, but I stopped doing any testing of the aardvark driver with the
> mainline kernel after PCI maintainers stopped taking fixes for the
> driver and stopped responding.
> 
> I'm not going to debug same issues again, which I have analyzed,
> prepared fixes, sent patches and see no progress there.
> 
> Seems that there is a status quo, and I'm not going to change it.

Dear Niklas,

Do you have any opinion on Pali's reply? Should patch 3/3 be discarded?

Beat regards,
Hans


