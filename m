Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C575C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13DS2/TB/IXIH8xoTGEcQtgWmxhNupVcmk4y3r8tsVk=; b=26FRR5lT0yAx5i2Jak7Z6HRhz7
	5dOxUKMvlyC1f0R+J5/8gPTSh2rzoJHj5bAddAQsx3mhWi4qrItBHGIJXHgiOENAg8UmjxSh6qNBJ
	RKdkyLy6zSZjE/NHBpqG7SDlI5r3SfZTjSujDDma/uKus+rxN3YaUa1B8+9EEcKws0w0G6Uvl189J
	VwqIRwHi981/2aPUGnUL5vv5uo5PPNdHNiPt8ykx64BUEu7Sc6iXpEmw0AAPvUI4K4SBPEAZFN8Zd
	jG7c7dcNAN9qA0leYMrudFEigtdg+fqaKskQ43NZldPLpb6XRdCF/yaTAAGH+Wx0nJpixfviD9+ED
	Jx/XaO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhyT-00000003crU-0E8u;
	Mon, 10 Mar 2025 18:35:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgnL-00000003U6L-3gbf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:20:05 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id B693E2038F31;
	Mon, 10 Mar 2025 10:20:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B693E2038F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741627203;
	bh=13DS2/TB/IXIH8xoTGEcQtgWmxhNupVcmk4y3r8tsVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DCvJlH7lbXZNt/E1m1ad8ZjehpHPz1EJUOHWNCbySluNx0imTgB0IvFntVbtpwLYj
	 5U4GwnENiBtd6A89KwSCOFeva6PjIT8utJ1CXa7p1OlsNSKqDuXfP2bHCkSiQ444ZW
	 JquC4aUWaAMFvwW2v15oYkJg5ul0DQ4IvSj6xERw=
Message-ID: <ce6f5bb0-545f-4d9f-a792-29a2f1520ba8@linux.microsoft.com>
Date: Mon, 10 Mar 2025 10:20:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 06/11] arm64, x86: hyperv: Report the VTL
 the system boots in
To: Wei Liu <wei.liu@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
 lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, will@kernel.org, yuzenghui@huawei.com,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-7-romank@linux.microsoft.com>
 <Z84yyAqkqJ2ZyAd-@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
 <2342dda1-2976-4506-ab68-640739a1bd5b@linux.microsoft.com>
 <Z88Y-R7BnXa4Xi3I@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <Z88Y-R7BnXa4Xi3I@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_102003_950298_BAE977BB 
X-CRM114-Status: GOOD (  11.74  )
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



On 3/10/2025 9:53 AM, Wei Liu wrote:
> On Mon, Mar 10, 2025 at 09:42:15AM -0700, Roman Kisel wrote:

[...]

>>
>>> Please be consistent across different architectures.
>>>
>>
>> In the earlier versions of the patch series, I had that piece
>> from the above mirrored in the arm64, and there was advice on
>> removing the function as it contained just one statement.
>> I'll revisit the approach, thanks for your help!
> 
> As long as the output is consistent across different architectures, I'm
> good.

I should add a comment most likely to save people some time grepping
the code as the line does look like should always print that. IOW
not printing for VTL0 is obscured by the preprocessor/#define cruft.

> 
> Wei.
> 
>>
>>>>    	x86_platform.realmode_reserve = x86_init_noop;
>>>>    	x86_platform.realmode_init = x86_init_noop;
>>>> -- 
>>>> 2.43.0
>>>>
>>>>
>>
>> -- 
>> Thank you,
>> Roman
>>

-- 
Thank you,
Roman


