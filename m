Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D34CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cf4oXxiFdVycZSssVBNQAVii0RaKh03vtvd/RXvabkM=; b=gQLs7CHCQUxvhnpsMTMx41mo6o
	FDj4vSIPcXtJov+29IulfHHoIXGfrW5KzYobrAiYldnBo+Xb0IMt9S2GFM9UXvN03nxbQREopAFRS
	jIlmLyKkKJOmoDhjGpQsaWty6yspeptEZURYDnTBd/InMcSiTDMsxSaQ26Sf3br3S/92wUYj06kt7
	bE/Cvj/hCvA6OSLiqcMmCv0O7x8eq1pxYm6V2T/29rZsUE0Wp2ELU4RoapLd0v9KKq6q2r6i5G1d+
	H/Av9jG0OSB1SjAyZAfLrmY+5KX8Y7BFzE1y9w5DlMP+OX7iJCnaGz46nCdBwpIRUhaVcCt4c8DIH
	Ger3CPBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo2z-0000000EjbU-1FpJ;
	Wed, 20 Aug 2025 19:00:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokyw-0000000EIKb-2uHO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:44:12 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFOO56027241;
	Wed, 20 Aug 2025 17:43:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cf4oXxiFdVycZSssVBNQAVii0RaKh03vtvd/RXvabkM=; b=IS2+UeADT352MV7r
	YeAWrAb9vz4yjiu6QM5V+99hO79K/c9+/xPzY6G8grVpWk9akS/zGoY0WjDAOG6r
	II0Lzdb0BeuHdxQR+e/B298KGFM1jM3L6kuIQKRkFi+KyRjU7ogj1sRw0wrhQckW
	Ke3ondnGka3YUqB2ZW8cx2keO5HgnbcFy5UkVbYN01tnbk4nu5NsFZrkHjsji1SF
	7G0Vq5srAKxEutO2j2t7RJ1Wx0043jKqaSqNPK4l4QQ1wifMirYApNJPi/JoyhLs
	eEEN25iYgR1y4Y42IL9rniD3TqSlXKMMhB5W/udHgeU+6kbbF1b9NSEFr3DLT0r2
	Ggciig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n7w5tgt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 17:43:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EC3E94002D;
	Wed, 20 Aug 2025 17:42:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27C247266C1;
	Wed, 20 Aug 2025 17:42:33 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 17:42:32 +0200
Message-ID: <8c934d9c-9837-4d24-b2cc-f72533131ece@foss.st.com>
Date: Wed, 20 Aug 2025 17:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v1] irqchip: gic-v2m: Handle Multiple MSI base IRQ
 Alignment
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <mani@kernel.org>
References: <20250811103942.4144-1-christian.bruel@foss.st.com>
 <87ikikmwds.wl-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <87ikikmwds.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_084411_382013_E116042B 
X-CRM114-Status: GOOD (  32.13  )
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



On 8/18/25 18:23, Marc Zyngier wrote:
> On Mon, 11 Aug 2025 11:39:42 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>> The PCI Local Bus Specification (section 6.8.3.4 in Rev 3) permits
>> modifying the low-order bits of the DATA register to encode the interrupt
>> number. These bits must be reserved, but the base SPI may not be aligned to
>> the requested number of SPIs.
> 
> The PCI spec knows nothing of SPIs.

OK, admittedly unclear. I was referring to the base SPI from the GICV2M 
register and the MSI Message DATA register together. Need to rephrase.

> 
>> For example, with an initial MSI_TYPER base SPI of 0x16A and allocating a
>> multiple MSI of size 8, the offset returned is 8, resulting in an MSI DATA
>> base of 0x172.
>> This causes the endpoint device to send interrupt 3 wrong interrupt number:
>>
> 
> Please use the correct terminology: an interrupt is a signal delivered
> to the CPU. A *message* is what the device sends, which the GIC turns
> into an interrupt. Here, you are using the same word for two different
> things.

OK. by 'interrupt number' I reused the vocabulary used by 
dw_pcie_ep_raise_msi_irq() when writing the message. Which is a shortcut 
for the "MSI interrupt number" identifier. I will clarify.

> 
> The problem is that the device encodes a delta from a base message,
> that the delta is encoded with log2(nr_vectors) bits, OR'ing the
> vector number with the base message. If the base message is not
> correctly aligned, shit happens.
> 
>> 1st MSI = 0x172 | 0x0 = 0x172
>> 2nd MSI = 0x172 | 0x1 = 0x173
>> 3rd MSI = 0x172 | 0x2 = 0x172 wrongly triggers the 1st MSI
>> ...
>>
>> To fix this, use bitmap_find_next_zero_area_off() instead of
>> bitmap_find_free_region() applying an initial offset of
>> base_spi - rounded(base_spi, nr_irqs) to accommodate the required alignment
>> for the first MSI.
>>
>> With the above case, the returned bitmap offset is 6 which results in the
>> correct interrupts number encoding:
>>
>> 1st MSI = 0x170 | 0x0 = 0x170
>> 2nd MSI = 0x170 | 0x1 = 0x171
>> 3rd MSI = 0x170 | 0x2 = 0x172
>> ...
> 
> Please rephrase this commit message so that it actually makes sense.
> We shouldn't need examples if the commit message was correctly
> written.

OK

> 
>>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>> Changes in v1:
>>     (Marc Zyngier)
>>   - Replace the incorrect usage of msi_attrib.multiple with nr_irqs
>>   - Reworked changelog
>> ---
>>   drivers/irqchip/irq-gic-v2m.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
>> index 24ef5af569fe..2d5cf36340b1 100644
>> --- a/drivers/irqchip/irq-gic-v2m.c
>> +++ b/drivers/irqchip/irq-gic-v2m.c
>> @@ -153,14 +153,18 @@ static int gicv2m_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>   {
>>   	msi_alloc_info_t *info = args;
>>   	struct v2m_data *v2m = NULL, *tmp;
>> -	int hwirq, offset, i, err = 0;
>> +	int hwirq, i, err = 0;
>> +	unsigned long align_off, offset;
> 
> Move the definition of align_off inside the loop.
> 
>> +	unsigned long align_mask = nr_irqs - 1;
>>   
>>   	spin_lock(&v2m_lock);
>>   	list_for_each_entry(tmp, &v2m_nodes, entry) {
>> -		offset = bitmap_find_free_region(tmp->bm, tmp->nr_spis,
>> -						 get_count_order(nr_irqs));
>> -		if (offset >= 0) {
>> +		align_off = tmp->spi_start - (tmp->spi_start & ~align_mask);
>> +		offset = bitmap_find_next_zero_area_off(tmp->bm, tmp->nr_spis, 0,
>> +							nr_irqs, align_mask, align_off);
>> +		if (offset < tmp->nr_spis) {
>>   			v2m = tmp;
>> +			bitmap_set(v2m->bm, offset, nr_irqs);
>>   			break;
>>   		}
>>   	}
> 
> Isn't the GICv3 MBI driver affected by the same issue?

I’m not sure. From a brief look at the code, it seems that the GICv3 
obtains spi_start from the Device Tree (mbi-ranges), not from the hardware.

I noticed one platform that looks suspicious:
rockchip/rk3568-lubancat-2.dts with mbi-ranges = <94 31>, <229 31>, <289 
31>;
For this platform, spi_start might not be aligned for multiple MSIs. 
Could it be a latent issue ?

We can apply a similar fix in mbi_irq_domain_alloc(), but I would 
appreciate a Tested-By, as unable to test myself...

thank you

Christian

> 
> 	M.
> 


