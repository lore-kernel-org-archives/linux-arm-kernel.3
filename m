Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F526C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0lMDpw6GGwnZ5U3YF/IzgmlQ4HTA5U+5tATXwgR3Qs=; b=0We+DQKKv8W6ucxcIeXYTYukR+
	cq89Ii6j67PkyF31snAO7q1wEluEfkaYg7fqDTCnYSVgphE1LA+or1cLfaIhhv32soOEcwsOCZFx4
	apFVr5jdEE10Zp+UXtWiAV80vocnaSAmNMBKFh/57TfheJtxe/NklZi4q86CWoiEd4mU2ma+zTA8I
	qHI6fdIFDiJh7OV+67xmDMXUeh6+h1nJBOWxf20cSLTPTkrhGSBosbdtaRH84uoGdTj0LPIW4LgNi
	mLmQ5552HzIkYUFyiDYU+d3R5JV6nFlJIe/fKJ5+pHp6BvxfLL9DCbvDhtMI/PljwAasgzbolDwS3
	jRwDtPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChKP-0000000G6Vn-2JfC;
	Wed, 07 May 2025 16:09:01 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgJP-0000000FtGS-24Wh;
	Wed, 07 May 2025 15:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=k0lMDpw6GGwnZ5U3YF/IzgmlQ4HTA5U+5tATXwgR3Qs=;
	b=IifXHXyregvZXX/1E3gfFkBqW6jExUqOo4AyVDKpGl62oV49Y1WVapywG1Eym0
	nh3fbwhoVuV5m0FpFuusIf+fWEg+VyLi5S3XICInGT+YLkcZ4FEbGUy4GUHrHfJI
	x02Q3cH64Wkz4T89nBMZWefke0sznXDFCS67wN0KFfCcE=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wA39PQrdhto7adUFA--.13565S2;
	Wed, 07 May 2025 23:03:08 +0800 (CST)
Message-ID: <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
Date: Wed, 7 May 2025 23:03:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250506174110.63ayeqc4scmwjj6e@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA39PQrdhto7adUFA--.13565S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4UKFWrCw4Utw4fuFW7Jwb_yoW5Xr4UpF
	W3XF4rAFWaqr15u3ZrJa1kKry5GasrKFy5Wws8GrW3CF9xK3yUGFy2kF4rCa4xJr4kKFyj
	vryaq3ySk3ZIyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPxhJUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwVGo2gbdD5DtQAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_080355_906156_726C171D 
X-CRM114-Status: GOOD (  16.71  )
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



On 2025/5/7 01:41, Pali Rohár wrote:
> On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
>> The Aardvark PCIe controller enforces a fixed 512B payload size via
>> PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
>> core negotiations.
>>
>> Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
>> PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
>> during device initialization, leveraging root port configurations and
>> device-specific capabilities.
>>
>> Aligning Aardvark with the unified MPS framework ensures consistency,
>> avoids artificial constraints, and allows the hardware to operate at
>> its maximum supported payload size while adhering to PCIe specifications.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pci-aardvark.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
>> index a29796cce420..d8852892994a 100644
>> --- a/drivers/pci/controller/pci-aardvark.c
>> +++ b/drivers/pci/controller/pci-aardvark.c
>> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
>>   	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>   	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>>   	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
>> -	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>>   	reg &= ~PCI_EXP_DEVCTL_READRQ;
>> -	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>>   	reg |= PCI_EXP_DEVCTL_READRQ_512B;
>>   	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>>   
>> -- 
>> 2.25.1
>>
> 
> Please do not remove this code. It is required part of the
> initialization of the aardvark PCI controller at the specific phase,
> as defined in the Armada 3700 Functional Specification.
> 
> There were reported more issues with those Armada PCIe controllers for
> which were already sent patches to mailing list in last 5 years. But
> unfortunately not all fixes were taken / applied yet.

Hi Pali,

I replied to you in version v2.

Is the maximum MPS supported by Armada 3700 512 bytes? What are the 
default values of DevCap.MPS and DevCtl.MPS?

Because the default value of DevCtl.MPS is not 512 bytes, it needs to be 
configured here, right?

If it's my guess, RK3588 also has the same requirements as you, just 
like the first patch I submitted.

Please take a look at the communication history:
https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/

Please test it using patch 1/3 of this series. If there are any 
problems, please let me know.


Best regards,
Hans


