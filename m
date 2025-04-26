Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68DCC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NTP26rZSO4aLxowU1tMWp58BMiXt/URHc+KIhHuxrE=; b=1HDhrTIK23sJsOXd/4fMjFVPio
	x5qCrYc430lnlscGZZLwPAEV0kSoLmh14HeLI2T7OIs+r8GWI06voVNsZiCxpXcmHNBRf/CuyHa+H
	/10SpA1KnjzFEWHXoQQOFrYrDZ1VGPxcCjfcuAXRrO0p0p+ad8XtPtJ7Yg0OBp7JgHtnUHM1JE0pX
	RvSHoJF806nzauNZL0vzeWS1BDoMJw0+Z1ula6ToVR62gY7KdsesCfilIvMcFSYWfl/OsPIfRCDJf
	WwAPkEDvqtn7WW325X0GDat4vt1080D1UlMG1Ndj02j9FJ/DtSpZbG0tgv9APtJw11K7h1JIU6JLv
	kuSAJNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8h5P-00000002Cej-2thA;
	Sat, 26 Apr 2025 15:04:59 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8h3W-00000002CRa-2CYl;
	Sat, 26 Apr 2025 15:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=2NTP26rZSO4aLxowU1tMWp58BMiXt/URHc+KIhHuxrE=;
	b=MTNfI1bjj/6sOwjhpxl6bkmPC/+LTUKOPSiUAIeVV8nKWRz27uFqb1sJ+lDGtQ
	63MoHFbayfTFrFSrFK+NANLTRI56wf+0T1ppXgIdKpVkRgIFTswtZJ8DfmcNUM85
	eMNUYZOx0YDL/JumkNNFBNzS8YHXDrsFhuJdclLcPClrM=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBXbM5v9QxolMNQCw--.59638S2;
	Sat, 26 Apr 2025 23:02:08 +0800 (CST)
Message-ID: <5e2844cc-8359-4b87-a8ce-eb5ebb85f8ff@163.com>
Date: Sat, 26 Apr 2025 23:02:08 +0800
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250425181345.bybgcht5tweyg43k@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXbM5v9QxolMNQCw--.59638S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryUGr4UtrWfAw1rGF18Grg_yoW8Wr4xpa
	13XFs3JF4Fqr15uF17Ja10gr1fXasIkFy5Xws8GFW3Za4aqw1UGFy2krs0kasrXr4v9F17
	Za42v3ySyanxtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmYL9UUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDxM6o2gLzK+LogABst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_080302_958063_69DE318A 
X-CRM114-Status: GOOD (  10.16  )
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



On 2025/4/26 02:13, Pali Rohár wrote:
> On Friday 25 April 2025 17:57:08 Hans Zhang wrote:
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

Hi Pali,

This series of patches is discussing the initialization of DevCtl.MPS by 
the Root Port. Please look at the first patch I submitted. If there is a 
reasonable method in the end, DevCtl.MPS will also be configured 
successfully. The PCIe maintainer will give the review opinions. Please 
rest assured that it will not affect the functions of the aardvark PCI 
controller.

Rockchip's RK3588 also has the same problem.


https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/

Best regards,
Hans


