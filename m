Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC35107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0DpKTN4PvH+Dvh4/uxnkl1rNoX6VwmuHBu5SZYEtE8=; b=uT2nAYI2aGzFbCmYkzaSTt4tZg
	DKbKxyvRu1wux+d131t8f6s4xTlX1LHkUtGMEXNLiVTc5twYj26qvqDrBNLbv4XWy5/xQTwEemEbr
	Bp9hUge9/brwE6EawM2WwulzJ+5GDigiFOyBVt86tkn5jI48W2R3igiHYQZuMjseS9qIxPMN6U7kH
	1wt8PS3SOKBhB7/t99eWnreTF2BJfr07cTcOBnK4TZP6C4Y/JHkgEfe0R1EgPZDgYxDl7Jc7DVZfO
	apeswH8n+SUps6/EeILZoXEDMjv0A21I6ARInoVinK/GJ4Q73ngl/E+0K7LyjOpMD3G5teQ3VWfUU
	ORH5K3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oT-00000000hYq-2AKZ;
	Fri, 13 Mar 2026 16:56:37 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oM-00000000hSq-0Pyr;
	Fri, 13 Mar 2026 16:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=q0DpKTN4PvH+Dvh4/uxnkl1rNoX6VwmuHBu5SZYEtE8=;
	b=Wo53AdgGBjt+gydVUW2mUdbTMrbHIQuEJyOJvYJ+H6YZwglc8W+3+awCF2zMIG
	M7E/+2uYLDjp68O2wbnh2ABatIphbt/csPcrLNTC7vBDR1vora8jaFMDWSWaHdJy
	0W588sHhrbqU6UCeHIaF1UBu6S8qZzfPAkvEvqWC1LX4I=
Received: from [IPV6:240e:b8f:927e:1000:ce47:698d:adec:5bb5] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnSkZpQbRpcaQ8Aw--.32207S2;
	Sat, 14 Mar 2026 00:55:07 +0800 (CST)
Message-ID: <f7e6c82e-5300-447a-b007-917ea0a5b6f2@163.com>
Date: Sat, 14 Mar 2026 00:55:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] PCI: of: Remove max-link-speed generation
 validation
To: Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org,
 jingoohan1@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
 bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
 jim2101024@gmail.com
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312163652.113228-1-18255117159@163.com>
 <20260312163652.113228-6-18255117159@163.com>
 <44e74dff-c321-7cfe-e304-a21644ac7787@rock-chips.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <44e74dff-c321-7cfe-e304-a21644ac7787@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnSkZpQbRpcaQ8Aw--.32207S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4fCFy3Cr4xZw17XF18Krg_yoW5GFyxpa
	y7Ar1Y9F1UJr45Wr1xXF4rZFy2gFnYgrWktryrG3ZruwnxZrs3tFy2qF15Xr929rZ5ZF17
	X3WagF4UCa90yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7PEfUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:ce47:698d:adec:5bb5]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AvxlWm0QWv-lQAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095630_975035_E4C3A6ED 
X-CRM114-Status: GOOD (  17.66  )
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



On 2026/3/13 15:04, Shawn Lin wrote:
> Hi Hans
> 
> 在 2026/03/13 星期五 0:36, Hans Zhang 写道:
>> The of_pci_get_max_link_speed() function currently validates the
>> "max-link-speed" DT property to be in the range 1..4 (Gen1..Gen4).
>> This imposes a maintenance burden because each new PCIe generation
>> would require updating this validation.
>>
>> Remove the range check so the function returns the raw property value
>> (or a negative error code if the property is missing or malformed).
>> Callers must now validate the returned speed against the range they
>> support. A subsequent patch adds such validation to the DWC driver,
>> which is the primary user of this function.
>>
>> Removing the validation from this common function allows future PCIe
>> generations to be supported without modifying drivers/pci/of.c.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/of.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 9f8eb5df279e..fbb779a94202 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -875,8 +875,9 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
>>    * of_pci_get_max_link_speed - Find the maximum link speed of the 
>> given device node.
>>    * @node: Device tree node with the maximum link speed information.
>>    *
>> - * This function will try to find the limitation of link speed by 
>> finding
>> - * a property called "max-link-speed" of the given device node.
>> + * This function will try to read the "max-link-speed" property of 
>> the given
>> + * device tree node. It does NOT validate the value of the property 
>> (e.g.,
>> + * range checks for PCIe generations).
>>    *
>>    * Return:
>>    * * > 0    - On success, a maximum link speed.
> 
> Thanks for the patch. However, after applying it, I noticed this part
> still seems off. There is a detailed comment in the file saying this
> function checks if the max-link-speed is invalid, just a few lines below
> your change. Could you please take another look at that comment and
> adjust them?

Hi Shawn,

Thanks. Will change.

Best regards,
Hans


> 
>> @@ -889,10 +890,11 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
>>   int of_pci_get_max_link_speed(struct device_node *node)
>>   {
>>       u32 max_link_speed;
>> +    int ret;
>> -    if (of_property_read_u32(node, "max-link-speed", &max_link_speed) ||
>> -        max_link_speed == 0 || max_link_speed > 4)
>> -        return -EINVAL;
>> +    ret = of_property_read_u32(node, "max-link-speed", &max_link_speed);
>> +    if (ret)
>> +        return ret;
>>       return max_link_speed;
>>   }
>>


