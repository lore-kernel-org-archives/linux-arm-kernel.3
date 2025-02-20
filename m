Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E09C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNJT56BxP7UvWA0Xz758yN9Ks+B/eGQRDTpNl6/uydA=; b=xmLeBoH0j0UyUvKuF9TYp5L3TF
	sultAkvbJQETxqAa8kH6/sUr2sGnHkIBNqUihBudLYfwxJAmeBCn5rJAe50chWhOwYhz2rbCrVNjh
	PGXkgvAZQbdeb4565V9jy05FjVSGyeFhu07PZ+9WHetSGQcEPfsDeDoSiJCJF0bYM0KAC+pLCaAVK
	8hQyl1IFtQbrWuMkQppY13JG/XvGCXjbuGke0pPE3oH3uyFiqs/9ZgReHA2FqiZh+8r7UCLitrbm2
	9Yy6ipHXFqRu6uY9WTR67Gih5P6moUT3RTIXVBUZipFGZmXvmTzdJv4fDukrjZjZu/Y61Elp09Kz6
	YouPFe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9fN-00000001w9s-3VAD;
	Thu, 20 Feb 2025 16:44:49 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9ca-00000001vHd-22Lr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:41:57 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7A0F8203D5E9;
	Thu, 20 Feb 2025 08:41:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A0F8203D5E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740069715;
	bh=pNJT56BxP7UvWA0Xz758yN9Ks+B/eGQRDTpNl6/uydA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RfNgWwSKvEiPibsl6QYn1+eHkT30Nn1lw5OPsw1d6PPbcISNOFjUL/xQSqvKSFf8o
	 yoOIzOPYQSxDpQlLZwzRdyB7IKxJeSJ80SjCCl6Rmtksk16rj7gF1Vbsd9EZG8Perr
	 ZiNK0h99Ko8rPXUvLfCrhbWuuKMw7GXCc7mIDVdc=
Message-ID: <13059366-bf72-4e84-ab6c-032b735edaec@linux.microsoft.com>
Date: Thu, 20 Feb 2025 08:41:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 6/6] PCI: hv: Get vPCI MSI IRQ domain from
 DeviceTree
To: Michael Kelley <mhklinux@outlook.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "kw@linux.com" <kw@linux.com>, "kys@microsoft.com" <kys@microsoft.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
 <will@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-7-romank@linux.microsoft.com>
 <SN6PR02MB4157911BEF8664EDE2B62835D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157911BEF8664EDE2B62835D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_084156_554006_256F2DA7 
X-CRM114-Status: GOOD (  11.59  )
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



On 2/19/2025 3:29 PM, Michael Kelley wrote:
> From: Roman Kisel <romank@linux.microsoft.com> Sent: Tuesday, February 11, 2025 5:43 PM

[...]

>>   }
> 
> These changes to rename hv_dev to vmbus_root_device, along with the
> introduction of hv_get_vmbus_root_device(), seem like a separate
> patch from the vPCI changes. The rename is definitely needed because
> "hv_dev" as a symbol is very overloaded. But the rename is "no functional
> change", and it doesn't touch the pci-hyperv.c file. You don't have a
> consumer for hv_get_vmbus_root_device() until the vPCI changes, but
> that seems OK to me to be in the subsequent patch.
> 

Thanks, will split the NFC out! I've asked the ACPI maintainers if a
small change in ACPI would be fine to make the functional part of this
patch more palatable, too.

-- 
Thank you,
Roman


