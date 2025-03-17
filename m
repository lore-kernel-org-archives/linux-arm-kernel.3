Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB1DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMfowKBMnXKcm1mHwfTnIc3m4wrvseXvS07OkG54pgY=; b=oaFgs0JD5z0tt4X8AsdbeXr1DU
	56/q7MFhnQB54f0tv2jWF24ijuXoLktsNtcRZqWjC0HItzVJpyx47W50gTu04D3eXuLdpXOA27gpB
	ypudvUMw7e3RwmAtDD9hClrJCLCmXVVKiMvC7TRjkOy9t7N0ASV2IFroZ9p5dW4adMkx7JFcXnHAn
	5vyCPVsuQ6LkGtBmqcYasv71LbO28e8/meFvjry6UIucnrxDEIIKInK87UKsPOvsRpOFD9Eb148mI
	wtiNcS7KvJdunx7Q4h/4LoBp6NPsknz2l+hFm6FCJcAzwbm4gtTVn4SlS6YvAYf3Bu+Y52GOYhdXH
	czwBw1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFHj-00000003hbO-2Kt7;
	Mon, 17 Mar 2025 18:33:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEGc-00000003YuW-1wsI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YMfowKBMnXKcm1mHwfTnIc3m4wrvseXvS07OkG54pgY=; b=EziF/7sc0UBdNnRI11fgtOGLev
	/oDkxrtafbxUYvtYdyp3MrNAlyNOzDdXnJwc8k44OukChVMUq5H10QM4heIXGP7Q/as2GS1joYSr+
	mH4lPjFx4xr0oSBEvKDOryOXdeMM7V3HCuC163kM3wDGRGPe6JQAlq1d8/xFas30m2XxY/pjP6mBF
	srwECdN2XvjLOUC7ccKVDgaVuf51qIL13HImof1TdzDAj2qUb2eNfLm1XyAtVNF2Zj5CvmRvk8+ob
	hV2Sm4qASUAULIj5k0rM+6xfZ7A3GSXmPd3CZJIqhsHkCI4ODj4gKWtXEqHsFcsyaSdf2nRt1fa5J
	h1IYu+oQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEGZ-00000003WBC-0rue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:28:45 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 55E892033444;
	Mon, 17 Mar 2025 10:28:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 55E892033444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742232518;
	bh=YMfowKBMnXKcm1mHwfTnIc3m4wrvseXvS07OkG54pgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qW//4OF7eJr0KsFfmdhpzFvcdq0RAq9/HGXEIVUGIiz0XlLXWifohTbu+e6MEtFZG
	 k/KtMNYFCdC8M3ybw+MkjaOtxWZOJDsFbqgALENs2EiKm0gd6js37TYj0kU3wDxAFC
	 w03VOm4OQbzyTqPvS78AfTHSYqjGmXqnza+N3+wk=
Message-ID: <238beef1-16d3-4c72-ac7f-7d578ab8fc3d@linux.microsoft.com>
Date: Mon, 17 Mar 2025 10:28:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 01/11] arm64: kvm, smccc: Introduce and use
 API for detecting hypervisor presence
To: Arnd Bergmann <arnd@arndb.de>
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com, bhelgaas@google.com, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Joey Gouly <joey.gouly@arm.com>, krzk+dt@kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 ssengar@linux.microsoft.com, Sudeep Holla <sudeep.holla@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-2-romank@linux.microsoft.com>
 <96bc4caf-b79a-4111-bafa-a7662260f4be@linux.microsoft.com>
 <50ec2615-97cf-423d-bfe6-f65092a14348@app.fastmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <50ec2615-97cf-423d-bfe6-f65092a14348@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_172843_566378_C01F668C 
X-CRM114-Status: GOOD (  14.68  )
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



On 3/15/2025 6:12 AM, Arnd Bergmann wrote:
> On Sat, Mar 15, 2025, at 01:27, Roman Kisel wrote:
>> On 3/14/2025 5:19 PM, Roman Kisel wrote:
>>
>> While the change is Acked, here is the caveat maybe.
>>
>> This patch produces warnings wtih sparse and CHECK_ENDING.
>> That said, the kernel build produces a whole lot more other warnings
>> from building with sparse by itself and/or with CHECK_ENDING.
>>
>> I am not sure how to proceed with that, thinking I should
>> not add warnings yet at the same time there are many others.
>> Not certain if folks take these signals as fyi or blockers.
> 
> It would be best not to add warnigns. There is slow progress on
> fixing all the endianess warnings and I hope this can eventually
> complete, so even if there are many existing ones please try to
> keep new code clean.
> 

Will fix the warnings, appreciate providing the guidance!

>       Arnd

-- 
Thank you,
Roman


