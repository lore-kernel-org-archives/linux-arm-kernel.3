Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAA2C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fak+f+kHYzS1+ypKlrkk0dMyzj3faU9pGBD9R0QixDc=; b=pH+1kJs+TAftpCzQeHVHEIhwSX
	qGV3Juw8SJIWd6ft7IHHC/pLGs4DqZcIvGod29c8xZ3Je1dFd9eyqonz7HO0Ub7sgbg3qrEkWAZz1
	U2B7tETppdK6SGoVoatsm+89fJ4zBMC9BURH6LkdaSMG3vj9UGzh4tkx+2pzHPiqhZwDGsT5sOLrU
	K5Eur+DdlWBReF7hxYdJbeGtfAT4SdBjL6NmyOSN9jsw6wmznHdiJexd4o1yAGgmruv2UGI+ua450
	fekCe4BGK9wwP3NDGYMTcjuPYOIQ4KjPzHXw23eV1Arr2D+Xla1FHzor9TdhY7p+78uUHfXgkMig2
	FmSIFttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UAA-00000007LKt-02eU;
	Mon, 28 Apr 2025 19:29:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9U5g-00000007KWC-2ZKR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:24:33 +0000
Received: from [10.137.184.60] (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 864AA211AD01;
	Mon, 28 Apr 2025 12:24:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 864AA211AD01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1745868271;
	bh=fak+f+kHYzS1+ypKlrkk0dMyzj3faU9pGBD9R0QixDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c5/deyEmjVX/7FlQ0FNHaDjnA6mqRGNSfHEiYzB4HTuBiubadDnAWmtlp7N1NP4g7
	 1sWbdlpdDh385PrncF6gy/1MtXwt6smPEIrtWgLe0NiGQpkJ4v6/b0eX9stfd9pZpe
	 TQe5YY7qT1JqkwkgPMaRBOVGpYcxkV5u5GyXdMNo=
Message-ID: <cea3a58f-a251-4100-a614-1576876e5eca@linux.microsoft.com>
Date: Mon, 28 Apr 2025 12:24:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v8 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
To: Michael Kelley <mhklinux@outlook.com>
Cc: "apais@microsoft.com" <apais@microsoft.com>,
 "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "kys@microsoft.com" <kys@microsoft.com>, "lenb@kernel.org"
 <lenb@kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "maz@kernel.org" <maz@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "rafael@kernel.org" <rafael@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "rafael.j.wysocki@intel.com"
 <rafael.j.wysocki@intel.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
 <will@kernel.org>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
References: <20250414224713.1866095-1-romank@linux.microsoft.com>
 <20250414224713.1866095-12-romank@linux.microsoft.com>
 <SN6PR02MB41572F24DCB9247E74876E41D4BC2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41572F24DCB9247E74876E41D4BC2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_122432_703788_D865A025 
X-CRM114-Status: GOOD (  13.40  )
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



On 4/17/2025 8:28 AM, Michael Kelley wrote:
> From: Roman Kisel <romank@linux.microsoft.com> Sent: Monday, April 14, 2025 3:47 PM
[...]

>> +	if (acpi_irq_model != ACPI_IRQ_MODEL_GIC)
>> +		return NULL;
> 
> This causes a build error on arm64 if pci-hyperv.c is built as a
> module because acpi_irq_model is not exported.

Will fix that! Appreciate your reviews very much!

> 
> Michael
> 
>> +	gsi_domain_disp_fn = acpi_get_gsi_dispatcher();
>> +	if (!gsi_domain_disp_fn)
>> +		return NULL;
>> +	return irq_find_matching_fwnode(gsi_domain_disp_fn(0),
>> +				     DOMAIN_BUS_ANY);
>> +}
>> +
>> +#endif
>> +
>>   static int hv_pci_irqchip_init(void)
>>   {
>>   	static struct hv_pci_chip_data *chip_data;
>>   	struct fwnode_handle *fn = NULL;
>> +	struct irq_domain *irq_domain_parent = NULL;
>>   	int ret = -ENOMEM;
>>
>>   	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
>> @@ -907,9 +952,24 @@ static int hv_pci_irqchip_init(void)
>>   	 * way to ensure that all the corresponding devices are also gone and
>>   	 * no interrupts will be generated.
>>   	 */
>> -	hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
>> -							  fn, &hv_pci_domain_ops,
>> -							  chip_data);
>> +#ifdef CONFIG_ACPI
>> +	if (!acpi_disabled)
>> +		irq_domain_parent = hv_pci_acpi_irq_domain_parent();
>> +#endif
>> +#ifdef CONFIG_OF
>> +	if (!irq_domain_parent)
>> +		irq_domain_parent = hv_pci_of_irq_domain_parent();
>> +#endif
>> +	if (!irq_domain_parent) {
>> +		WARN_ONCE(1, "Invalid firmware configuration for VMBus interrupts\n");
>> +		ret = -EINVAL;
>> +		goto free_chip;
>> +	}
>> +
>> +	hv_msi_gic_irq_domain = irq_domain_create_hierarchy(irq_domain_parent, 0,
>> +		HV_PCI_MSI_SPI_NR,
>> +		fn, &hv_pci_domain_ops,
>> +		chip_data);
>>
>>   	if (!hv_msi_gic_irq_domain) {
>>   		pr_err("Failed to create Hyper-V arm64 vPCI MSI IRQ domain\n");
>> --
>> 2.43.0
>>
> 

-- 
Thank you,
Roman


