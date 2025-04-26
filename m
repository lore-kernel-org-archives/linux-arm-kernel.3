Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUM7vf0vXe7N2oH0oe3DEg8G2pM3KxBEYmjLGlpyeQI=; b=Ew2NXDo0Ei+TyPaQjdrfvtukD2
	cYBOg6wYOy6jlWLdVUOxobcKckRHnKFL6jJXR0osT27Ce5uLKZd3zNQujlmlXi0f8Z1B2VHxwxRuu
	GNf8M+OpgZssZWg+IJ6Ze1hf0uTJa8oo7LQ3OuchaqC1BPeFGAQoTxo3KTiYst6eyKwK4LTrfZjej
	MEqwW/iJnmvgz6ib9jhXYc1qMFAlPYM+r9jAWS8Lup01uZw4j+hGxRJfm2UaKfFe9/jkjzmo+bF9V
	xlkoD6mEL6YyWFo+WH7RBvMPzjMO41+1nFdEnqUl9stwtubhcXg1bnBXwADhylhyXZUPBp+SJCadt
	ZxKlO89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8hNY-00000002DwT-3x07;
	Sat, 26 Apr 2025 15:23:44 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8hLg-00000002Dr0-1G9M;
	Sat, 26 Apr 2025 15:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=vUM7vf0vXe7N2oH0oe3DEg8G2pM3KxBEYmjLGlpyeQI=;
	b=XykLgF22/iL6/iZpwTQ6uMB0pT5VlkDM8hPhc+/Hec6fOqHV/1C9/xveBE9CIU
	S7ZITsIp5u5cX2ute/9ADqyEhp6H5yR2epcbwdWq8/06amgxvZY5fK1fOj0+Abkv
	eE611yM3hVj/g2JXM2zmId9J3jmagbkF+/sGJF9BoIR/g=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCX+C2_+Qxo0RWfCg--.59461S2;
	Sat, 26 Apr 2025 23:20:33 +0800 (CST)
Message-ID: <4e5a60dc-fb0b-413e-9ed9-82f926abd023@163.com>
Date: Sat, 26 Apr 2025 23:20:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, thomas.petazzoni@bootlin.com,
 manivannan.sadhasivam@linaro.org, yue.wang@Amlogic.com,
 neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com>
 <20250425181345.bybgcht5tweyg43k@pali>
 <5e2844cc-8359-4b87-a8ce-eb5ebb85f8ff@163.com>
 <20250426150650.c63x62ugtnwx5nzy@pali>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250426150650.c63x62ugtnwx5nzy@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCX+C2_+Qxo0RWfCg--.59461S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary3JFW8ZF1kKr1xXw4UXFb_yoW8Kr1Upw
	45JFs3JF4qqF15uF1Iqa1vgr1ftasIyr15Wws8GrW7AasIq3srtFy2yr45CasrXwn7CF12
	va42qFWSyFsxtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPR6cUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwo7o2gM8qeGtQABsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_082149_108194_DDA2B210 
X-CRM114-Status: GOOD (  15.62  )
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



On 2025/4/26 23:06, Pali Rohár wrote:
> On Saturday 26 April 2025 23:02:08 Hans Zhang wrote:
>> On 2025/4/26 02:13, Pali Rohár wrote:
>>> On Friday 25 April 2025 17:57:08 Hans Zhang wrote:
>>>> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
>>>> index a29796cce420..d8852892994a 100644
>>>> --- a/drivers/pci/controller/pci-aardvark.c
>>>> +++ b/drivers/pci/controller/pci-aardvark.c
>>>> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
>>>>    	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>>    	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>>>>    	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
>>>> -	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>>>>    	reg &= ~PCI_EXP_DEVCTL_READRQ;
>>>> -	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>>>>    	reg |= PCI_EXP_DEVCTL_READRQ_512B;
>>>>    	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>> Please do not remove this code. It is required part of the
>>> initialization of the aardvark PCI controller at the specific phase,
>>> as defined in the Armada 3700 Functional Specification.
>>
>> Hi Pali,
>>
>> This series of patches is discussing the initialization of DevCtl.MPS by the
>> Root Port. Please look at the first patch I submitted. If there is a
>> reasonable method in the end, DevCtl.MPS will also be configured
>> successfully.
> 
> This does not matter what would be configured in DevCtl.MPS at the end.
> 
>> The PCIe maintainer will give the review opinions. Please rest
>> assured that it will not affect the functions of the aardvark PCI
>> controller.
> 
> This patch is modifying initialization of the aardvark PCIe controller
> and is removing the mandatory step of the controller configuration as
> required and defined in the Armada 3700 Functional Specification.
> It says exactly in which order and which values to which registers has
> to be written.

Hi Pali,

Is the maximum MPS supported by Armada 3700 512 bytes? What are the 
default values of DevCap.MPS and DevCtl.MPS?

Because the default value of DevCtl.MPS is not 512 bytes, it needs to be 
configured here, right?

If it's my guess, RK3588 also has the same requirements as you, just 
like the first patch I submitted.

Best regards,
Hans



