Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142CEC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQYBdxu34VR0VSrWEORHz7bVPlHkrPo4i9PmBo0cNQk=; b=Gl2nukKlc6FLTwS1ltn6/0Tz9z
	CzR8hJ5/YDAFHjDpFlE+heOcAfGyRBOSQnPdZWUEKf16m+fQVUByV1fb0YnAr9bwDu6KLMAv3dgCp
	J1zGryjdounrA/uxhwA8qDEV30IZr/miCTFWDjdv3qM0UFRRpS8z7Bj61f2NPdXnrvyoP/Jhhxh4O
	M+2PbyN9aufZgI1HTNXB9rQ5IctZgtx5C4Y5kH2EnkJ58e3wD7ikavMeIbaSjeLQ9wlYuJUh22HO5
	4uegTX8Vik3pcC/S2/4nRkbrd2NUFgR0XJZJiMj2CxeLnK1jh+aLLI/o95WH6gq1LWougP6973soI
	n+KxZFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Le9-00000000A9W-3VRX;
	Fri, 25 Apr 2025 16:11:25 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JvW-0000000HQ1o-1VgC;
	Fri, 25 Apr 2025 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=XQYBdxu34VR0VSrWEORHz7bVPlHkrPo4i9PmBo0cNQk=;
	b=KzhEE2qm1q8ynq7e9nb+3UmJpHkBwLvvsVuNDVfC9TNpQr811xVeXyqrM3y6Xc
	YkpjliF9RF3VLsHI0ZKmn5iULR6+VIOGHXlKIeRZ94WGqpI5dzZg3GR8n1T62qD8
	3zhebkc3/wl2bWEkSCnn7tYDCiYQPeFPU7HTs33oCDcMk=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wA3mC0vmgto4FqxCQ--.32274S2;
	Fri, 25 Apr 2025 22:20:32 +0800 (CST)
Message-ID: <a6e097e4-6d57-4db2-a541-ebd9e4a9856b@163.com>
Date: Fri, 25 Apr 2025 22:20:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
To: neil.armstrong@linaro.org, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, heiko@sntech.de, thomas.petazzoni@bootlin.com,
 manivannan.sadhasivam@linaro.org, yue.wang@Amlogic.com
Cc: pali@kernel.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com>
 <e6752451-4492-4ae2-9bad-3865c4945dbe@linaro.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <e6752451-4492-4ae2-9bad-3865c4945dbe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3mC0vmgto4FqxCQ--.32274S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4kXF4UKrW7KrW3CryfWFg_yoW5XrWUpF
	W3uF4SyF48Jr4rWFsFyan5CFWftasIkr9rJr9xGr1xuF9FyFsrJFyayFWF9a4xZr42gFnY
	yr1Fg347C3Z8tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGoGdUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxI6o2gLk-CiIQABsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_072114_783052_1EFD2DAC 
X-CRM114-Status: GOOD (  12.07  )
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



On 2025/4/25 19:59, neil.armstrong@linaro.org wrote:
> On 25/04/2025 11:57, Hans Zhang wrote:
>> With the PCI core now centrally configuring root port MPS to
>> hardware-supported maximums (via 128 << pcie_mpss) during host probing,
>> platform-specific MPS adjustments are redundant. This patch removes the
>> custom the configuration of the max payload logic to align with the
>> standardized initialization flow.
>>
>> By eliminating redundant code, this change prevents conflicts with global
>> PCIe hierarchy tuning policies and reduces maintenance overhead. The 
>> Meson
>> driver now fully relies on the core PCI framework for MPS configuration,
>> ensuring consistency across the PCIe topology while preserving
>> hardware-specific MRRS handling.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>>   drivers/pci/controller/pci-aardvark.c  |  2 --
>>   2 files changed, 19 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-meson.c 
>> b/drivers/pci/controller/dwc/pci-meson.c
>> index db9482a113e9..126f38ed453d 100644
>> --- a/drivers/pci/controller/dwc/pci-meson.c
>> +++ b/drivers/pci/controller/dwc/pci-meson.c
>> @@ -261,22 +261,6 @@ static int meson_size_to_payload(struct 
>> meson_pcie *mp, int size)
>>       return fls(size) - 8;
>>   }
>> -static void meson_set_max_payload(struct meson_pcie *mp, int size)
>> -{
>> -    struct dw_pcie *pci = &mp->pci;
>> -    u32 val;
>> -    u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> -    int max_payload_size = meson_size_to_payload(mp, size);
>> -
>> -    val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
>> -    val &= ~PCI_EXP_DEVCTL_PAYLOAD;
>> -    dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
>> -
>> -    val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
>> -    val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
>> -    dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
>> -}
>> -
>>   static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
>>   {
>>       struct dw_pcie *pci = &mp->pci;
>> @@ -381,7 +365,6 @@ static int meson_pcie_host_init(struct dw_pcie_rp 
>> *pp)
>>       pp->bridge->ops = &meson_pci_ops;
>> -    meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
>>       meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
> 
> Seems you can also remove meson_set_max_rd_req_size() since it's
> done by pcie_write_mrrs()


Dear neil,

Thank you very much for your reply and reminder.

I want to wait for the result of the first patch discussion, and then 
see if we need to remove meson_set_max_rd_req_size().

Best regards,
Hans


