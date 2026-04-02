Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5540ACC6B01
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 04:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6sBwsFb445Pp7249L79ufDRpJqZshHczUisxFI3JEo=; b=cQO4F6Cvr1ZfocEpOycoaoFtpg
	xBY9zUFP8bN2pQCEcKYo7MovS4z9EZrnH3I9ASHgqiASyzk8dxGjF+UJrswI74kaNw4A7po4sv/LA
	ExlFWm4XgqX/WAn9rzVxxHhoeT8Y1kzPNXwCUe9hdL5n+qks5ZbxQKLFluf2CCquvS5iwy8RSvo7P
	XlJpVZqqEuIhq8Sd0vg7qaj0Xvyy6hDhxX+YQIYNmUKys7w2v8+hjFZSR38fMGkj9LswQeuOh1I0Z
	oDQIIpesqcmOBdL3LsXL3EvAAZqtvIQzADNoBuUDAXfGa0kHD6LOpK9XEp+bFh2Wx0XHZLJr4eUjN
	LoR4BIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89FQ-0000000GhTn-0Qp8;
	Thu, 02 Apr 2026 04:01:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89FM-0000000GhTM-44i3;
	Thu, 02 Apr 2026 04:01:34 +0000
Received: from [10.95.66.83] (unknown [167.220.238.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id A6ED220B710C;
	Wed,  1 Apr 2026 21:01:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A6ED220B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775102490;
	bh=T6sBwsFb445Pp7249L79ufDRpJqZshHczUisxFI3JEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eAnUARNlHoU7VXFylRE5DLFJrHd/bTFZfsva8Frd/0OaQNP+H5HBfDGUsKXcWK4j9
	 DCORtz3WkyAFjVZSBnLcBSqP1locZaGVeOkTYl3BxmW0xAd4W4kkTI8UTh5/aLonrY
	 7Rk51EmzcAbubl0WKZf4Ni57dSE1fX82drzW4uFo=
Message-ID: <b093e70f-1ee2-4ba1-a934-581326a7abe8@linux.microsoft.com>
Date: Thu, 2 Apr 2026 09:31:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Drivers: hv: Add ARM64 support in mshv_vtl
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <SN6PR02MB4157DFC7B7CE94500C89664BD441A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <a8f856a0-49a8-4041-9036-4e9ade79532b@linux.microsoft.com>
 <SN6PR02MB4157E4E088F39106979BE4EDD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157E4E088F39106979BE4EDD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_210133_046944_C814BCBE 
X-CRM114-Status: GOOD (  18.66  )
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



On 4/1/2026 10:24 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Tuesday, March 17, 2026 9:23 PM
>>
>> On 3/18/2026 3:33 AM, Michael Kelley wrote:
>>> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>>>
>>>> The series intends to add support for ARM64 to mshv_vtl driver.
> 
> No need to be tentative. :-)  Just write as:
> 
> "The series adds support for ARM64 to the mshv_vtl driver."
> 
>>>> For this, common Hyper-V code is refactored, necessary support is added,
>>>> mshv_vtl_main.c is refactored and then finally support is added in
>>>> Kconfig.
>>>>
>>>> Based on commit 1f318b96cc84 ("Linux 7.0-rc3")
>>>
>>> There's now an online LLM-based tool that is automatically reviewing
>>> kernel patches. For this patch set, the results are here:
>>>
>>> https://sashiko.dev/#/patchset/20260316121241.910764-1-namjain%40linux.microsoft.com
>>>
>>> It has flagged several things that are worth checking, but I haven't
>>> reviewed them to see if they are actually valid.
>>>
>>> FWIW, the announcement about sashiko.dev is here:
>>>
>>> https://lore.kernel.org/lkml/7ia4o6kmpj5s.fsf@castle.c.googlers.com/
>>>
>>> Michael
>>
>>
>> Thanks for sharing Michael,
>> I'll check it out and do the needful.
>>
> 
> I've done a full review of this patch set and provided comments in the
> individual patches. Some of my comments reference the Sashiko AI
> comments, but there are still some Sashiko AI comments to consider
> that I haven't referenced.
> 
> FWIW, the Sashiko AI comments are quite good -- it found some things
> here that I missed on my own, and in my earlier reviews of the original VTL
> code. :-(
> 
> Michael


Thank you so much Michael for reviewing these. I was also trying to 
address review comments from Sashiko, and noticed some of them were 
false positives in the sense that these were existing issues and not 
introduced by arm64 changes. I thought of keeping them separate from the 
scope of this series for future.

I'll review your comments and address them.

Regards,
Naman

