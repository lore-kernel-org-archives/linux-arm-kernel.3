Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A465C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 21:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYiqT5jddIJjKfv2s/zeQhMm81+sjONX7rRhWau6sX8=; b=C1o8qh1q0alRCL3k7RjekZcxr/
	ao1oa2IfNoGgcMty39cTrB5DNvYldEo1se/qc3LKuC/IgsyKlLXQuub3If/LnNfHRmOIf7TmpGMew
	0ndaHFmeiK2i/qm/hQexp5GFOk5SH4tZQKPFSW/wW6dhmhkmJe5fyhGfhqKDAdKRkvkJoMMMJVIdc
	IIcHGVYO4m3851/fs8+HhlVOwTZ74j9ZI0wUzHq0eazEmeAPjQ8DZDYmkvz/KfCjwyvBD3llNbnDz
	DRpxn/CjjiiR/5S+k9N8UmDy3K+6EY2Dbd7B95edfmTtMg+m3QezD6eJVWZPTpeATOd24bn1DMlpY
	STqdjAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfgp-0000000FdID-3Ui5;
	Fri, 07 Mar 2025 21:57:07 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqffD-0000000FcxW-07UN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:55:28 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id E30EB2038F3B;
	Fri,  7 Mar 2025 13:55:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E30EB2038F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741384524;
	bh=BYiqT5jddIJjKfv2s/zeQhMm81+sjONX7rRhWau6sX8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=SnZFHeoT4mDZsn5Rlyo65kO8j7OrCyFjXp+yUsoaUMwBj04Pv8Hr4YbS0zY1M5JBI
	 KzbKWXQF8/IhMnTVs9LQmBaZigJf+/bNz8HHHuNKFlreUORpgb5AXo51iKtcbOmmA6
	 dV2IMIxGY2uY01fbJKBPdec4cij7cYKcHmJG8rSE=
Message-ID: <9cd97b0e-dfd3-4923-961e-00ba09eb6cef@linux.microsoft.com>
Date: Fri, 7 Mar 2025 13:55:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Michael Kelley <mhklinux@outlook.com>, eahariha@linux.microsoft.com,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "apais@linux.microsoft.com" <apais@linux.microsoft.com>,
 "Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "muislam@microsoft.com" <muislam@microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
Subject: Re: [PATCH v5 03/10] arm64/hyperv: Add some missing functions to
 arm64
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-4-git-send-email-nunodasneves@linux.microsoft.com>
 <5f3d660d-fe2e-4ac1-94a7-66d6c8ffe579@linux.microsoft.com>
 <2fee888a-4f81-40aa-9545-617a49a7fb30@linux.microsoft.com>
 <SN6PR02MB41579F4147561B96A2C1C057D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <7f689725-f676-4465-974d-ca2477d445f7@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <7f689725-f676-4465-974d-ca2477d445f7@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_135527_146374_50A90A2B 
X-CRM114-Status: GOOD (  19.25  )
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

On 3/7/2025 1:36 PM, Nuno Das Neves wrote:
> On 3/6/2025 11:05 AM, Michael Kelley wrote:
>> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, February 27, 2025 4:21 PM
>>>
>>> On 2/26/2025 9:56 PM, Easwar Hariharan wrote:
>>>> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>>>>> These non-nested msr and fast hypercall functions are present in x86,
>>>>> but they must be available in both architetures for the root partition
>>>>
>>>> nit: *architectures*
>>>>
>>>>
>>> Thanks!
>>>
>>>>> driver code.
>>>>>
>>>>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>>>>> ---
>>>>>  arch/arm64/hyperv/hv_core.c       | 17 +++++++++++++++++
>>>>>  arch/arm64/include/asm/mshyperv.h | 12 ++++++++++++
>>>>>  include/asm-generic/mshyperv.h    |  2 ++
>>>>>  3 files changed, 31 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
>>>>> index 69004f619c57..e33a9e3c366a 100644
>>>>> --- a/arch/arm64/hyperv/hv_core.c
>>>>> +++ b/arch/arm64/hyperv/hv_core.c
>>>>> @@ -53,6 +53,23 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(hv_do_fast_hypercall8);
>>>>>
>>>>> +/*
>>>>> + * hv_do_fast_hypercall16 -- Invoke the specified hypercall
>>>>> + * with arguments in registers instead of physical memory.
>>>>> + * Avoids the overhead of virt_to_phys for simple hypercalls.
>>>>> + */
>>>>> +u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
>>>>> +{
>>>>> +	struct arm_smccc_res	res;
>>>>> +	u64			control;
>>>>> +
>>>>> +	control = (u64)code | HV_HYPERCALL_FAST_BIT;
>>>>> +
>>>>> +	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
>>>>> +	return res.a0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
>>>>> +
>>>>
>>>> I'd like this to have been in arch/arm64/include/asm/mshyperv.h like its x86
>>>> counterpart, but that's just my personal liking of symmetry. I see why it's here
>>>> with its slow and 8-byte brethren.
>>>>
>>> Good point, I don't see a good reason this can't be in the header.
>>
>> I was trying to remember if there was some reason I originally put
>> hv_do_hypercall() and hv_do_fast_hypercall8() in the .c file instead of
>> the header like on x86. But I don't remember a reason. During
>> development, the code changed several times, and there might have
>> been a reason that didn't persistent in the version that was finally
>> accepted upstream.
>>
>> My only comment is that hv_do_hypercall() and the 8 and 16 "fast"
>> versions should probably stay together one place on the arm64 side,
>> even if it doesn't match x86.
>>
> 
> I think I'll just keep them together here for now then. They
> could be moved to the header in future if it seems worth doing.
> 

I was really hoping the answer here would be to move all of them together to the header,
but oh well.

<snip>

