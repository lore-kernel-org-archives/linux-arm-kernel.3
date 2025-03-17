Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E8C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBKO3+sFdf3j+9DusQSeJkY76BUx4yGl9KDAQjeRCo8=; b=YQ8Wip/HCI3q1mx+I40qD8OZwP
	XP68Kq9Ya/FsKxYi4h1FMPXDCH9kOteoQdWqmiWyRXMep4FiV56EIFYKbOSgLz5Xnc8mDO9sE1hqE
	sRMZJjOaAc430EwOkm+zvtGXyyHKqhagX/gTEQ7hwns220RhoyaxG8IStfB3/Mu+FqRSYUkp/krD8
	It6X7m2jm/BGWJjnIrtD4FfVl0oZtP2sEWFPReqe5fIj+ZgSgNztRYLnAEcidzvcXLWuvHFcoPe83
	9e0PKr/MLAUWhCkYadK64RDE8wr3qV+RkG26dR7Ew5bMYSNcZEyaTHBnKH4cPIonnGwgPIKA5L4Qs
	wNK8OEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1J-00000003UqE-1HiY;
	Mon, 17 Mar 2025 17:12:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwE-00000003TCn-2ek3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:07:44 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7BFBB2033444;
	Mon, 17 Mar 2025 10:07:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7BFBB2033444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742231261;
	bh=PBKO3+sFdf3j+9DusQSeJkY76BUx4yGl9KDAQjeRCo8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XSBhoPpsdkLkmTk3qErtq7Cuq1UaChiFkw6kXGiD9sH8+hspF1i5lsiqiYkjwRCBB
	 iVqT5cJe8xu+9gjgWPR9s5bH/kyVP+cnsNNF6iCaun/zsXbZKBgMHGCF5/NSR3KwU5
	 ysZtQjFJVoI5LvU9qesC/3ZFeWH6kGQ7Jq/AFHfI=
Message-ID: <091001a7-7398-4f5f-b9b6-d220a5a226cb@linux.microsoft.com>
Date: Mon, 17 Mar 2025 10:07:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 07/11] dt-bindings: microsoft,vmbus: Add
 interrupt and DMA coherence properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org,
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com,
 hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
 kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, maz@kernel.org,
 mingo@redhat.com, oliver.upton@linux.dev, rafael@kernel.org,
 robh@kernel.org, ssengar@linux.microsoft.com, sudeep.holla@arm.com,
 suzuki.poulose@arm.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, yuzenghui@huawei.com, devicetree@vger.kernel.org,
 kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
 benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-8-romank@linux.microsoft.com>
 <20250316-versed-trogon-of-serendipity-bf7ea7@krzk-bin>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250316-versed-trogon-of-serendipity-bf7ea7@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100742_701501_6696F53D 
X-CRM114-Status: GOOD (  12.91  )
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



On 3/16/2025 10:36 AM, Krzysztof Kozlowski wrote:
> On Fri, Mar 14, 2025 at 05:19:27PM -0700, Roman Kisel wrote:
>>   
>> +  dma-coherent: true
>> +
>> +  interrupts:
> 
>> +    maxItems: 1
>> +    description: |
>> +      This interrupt is used to report a message from the host.
> 
> These could be just two lines:
> 
> items:
>    - description: Interrupt used to report a message from the host.
> 
> (and note that just like we do not use "This" in commit msg, there is
> really no benefit of using it in hardware descruption for simple
> statements)
> 

Appreciate your help very much!! Will fix the formatting.

> Regardless:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

-- 
Thank you,
Roman


