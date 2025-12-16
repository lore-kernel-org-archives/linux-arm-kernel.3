Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E086BD5C0CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RuRVgDnSJ1WklbtVGpQY94ttgAeXmiQnAu2DWxJ2NU=; b=uTVkRs6Qb1Nu5N6INu0n5FGHRG
	pXXnoWduSZAt7DuEMy3idmsOXWPC18HUMOvE/0q6l9jFAWm7sf4aPUj4Rfdbo8KtoQrUzZcQdF/Nv
	UvbTKRl4/1tutAFBWzrUULdRMzyB4HV4ds51BlfM7dALNj5i9d/pSw5/cboSJlL4Xm4UMiVB10o+T
	Qt9deJ0yIHY5n3S4Jhkt8UR99FjUEGPPuvi/rHWjqcW/uiiwf8idv34i/NjUWSy7NacpjpdTZAMCp
	ttc41eXbfovNbd+N/gY0fh8gJbHR3B4FgAKciW4hORQHG75ljrcjJM5q5LtRKz6kVGdogKtOR/Idu
	wja9lMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOx1-00000004o7D-2cV2;
	Tue, 16 Dec 2025 06:54:27 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOwz-00000004o6W-06pX;
	Tue, 16 Dec 2025 06:54:25 +0000
Message-ID: <b74aef93-9138-413a-8327-36c746d67e10@infradead.org>
Date: Mon, 15 Dec 2025 22:54:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
 Trilok Soni <tsoni@quicinc.com>, Kaushal Kumar <kaushalk@qti.qualcomm.com>,
 Shiraz Hashim <shashim@qti.qualcomm.com>,
 Peter Griffin <peter.griffin@linaro.org>, stephen.s.brennan@oracle.com,
 Will McVicker <willmcvicker@google.com>,
 "stefan.schmidt@linaro.org" <stefan.schmidt@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
 <5903a8e1-71c6-4546-ac50-35effa078dda@infradead.org>
 <c3db6ccd-dfc7-4a6a-82b7-3d615f8cab4f@linaro.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c3db6ccd-dfc7-4a6a-82b7-3d615f8cab4f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 12/12/25 11:22 PM, Eugen Hristev wrote:
> 
> 
> On 12/13/25 08:57, Randy Dunlap wrote:
>> Hi,
>>
>> On 12/12/25 10:48 PM, Eugen Hristev wrote:
>>>
>>>
>>> On 11/19/25 17:44, Eugen Hristev wrote:
>>>> meminspect is a mechanism which allows the kernel to mark specific memory
>>>> areas for memory dumping or specific inspection, statistics, usage.
>>>> Once regions are marked, meminspect keeps an internal list with the regions
>>>> in a dedicated table.
>>>
>>> [...]
>>>
>>>
>>>> I will present this version at Plumbers conference in Tokyo on December 13th:
>>>> https://lpc.events/event/19/contributions/2080/
>>>> I am eager to discuss it there face to face.
>>>
>>> Summary of the discussions at LPC talk on Dec 13th:
>>>
>>> One main idea on the static variables annotation was to do some linker
>>> magic, to create a list of variables in the tree, that would be parsed
>>> by some script, the addresses and sizes would be then stored into the
>>> dedicated section at the script level, without having any C code change.
>>> Pros: no C code change, Cons: it would be hidden/masked from the code,
>>> easy to miss out, which might lead to people's variables being annotated
>>> without them knowing
>>>
>>> Another idea was to have variables directly stored in a dedicated
>>> section which would be added to the table.
>>> e.g. static int __attribute(section (...)) nr_irqs;
>>> Pros: no more meminspect section Cons: have to keep all interesting
>>> variables in a separate section, which might not be okay for everyone.
>>>
>>> On dynamic memory, the memblock flag marking did not receive any obvious
>>> NAKs.
>>>
>>> On dynamic memory that is bigger in size than one page, as the table
>>> entries are registered by virtual address, this would be non-contiguous
>>> in physical memory. How is this solved?
>>> -> At the moment it's left for the consumer drivers to handle this
>>> situation. If the region is a VA and the size > PAGE_SIZE, then the
>>> driver needs to handle the way it handles it. Maybe the driver that
>>> parses the entry needs to convert it into multiple contiguous entries,
>>> or just have virtual address is enough. The inspection table does not
>>> enforce or limit the entries to contiguous entries only.
>>>
>>> On the traverse/notifier system, the implementation did not receive any
>>> obvious NAKs
>>>
>>> General comments:
>>>
>>> Trilok Soni from Qualcomm mentioned they will be using this into their
>>> software deliveries in production.
>>>
>>> Someone suggested to have some mechanism to block specific data from
>>> being added to the inspection table as being sensitive non-inspectable
>>> data.
>>> [Eugen]: Still have to figure out how that could be done. Stuff is not
>>> being added to the table by default.
>>>
>>> Another comment was about what use case there is in mind, is this for
>>> servers, or for confidential computing, because each different use case
>>> might have different requirements, like ignoring some regions is an
>>> option in one case, but bloating the table in another case might not be
>>> fine.
>>> [Eugen]: The meminspect scenario should cover all cases and not be too
>>> specific. If it is generic enough and customizable enough to care for
>>> everyone's needs then I consider it being a success. It should not
>>> specialize in neither of these two different cases, but rather be
>>> tailored by each use case to provide the mandatory requirements for that
>>> case.
>>>
>>> Another comment mentioned that this usecase does not apply to many
>>> people due to firmware or specific hardware needed.
>>> [Eugen]: one interesting proposed usecase is to have a pstore
>>> driver/implementation that would traverse the inspection table at panic
>>> handler time, then gather data from there to store in the pstore
>>> (ramoops, mtdoops or whatever backend) and have it available to the
>>> userspace after reboot. This would be a nice use case that does not
>>> require firmware nor specific hardware, just pstore backend support.
>>>
>>> Ending note was whether this implementation is going in a good direction
>>> and what would be the way to having it moving upstream.
>>>
>>> Thanks everyone who attended and came up with ideas and comments.
>>> There are a few comments which I may have missed, so please feel free to
>>> reply to this email to start a discussion thread on the topic you are
>>> interested in.
>>>
>>> Eugen
>>>
>>
>> Maybe you or someone else has already mentioned this. If so, sorry I missed it.
>>
>> How does this compare or contrast to VMCOREINFO?
>>
>> thanks.
> 
> This inspection table could be created in an VMCOREINFO way, the patch
> series here[1] is something that would fit it best .
> 
> The drawbacks are :
> some static variables have to be registered to VMCOREINFO in their file
> of residence. This means including vmcoreinfo header and adding
> functions/code there, and everywhere that would be needed , or , the
> variables have to be un-static'ed , which is a no-go.
> This received more negative opinions on that particular patch series.
> The annotation idea seemed cleaner and simpler, and more generic.
> 
> We could add more and more entries to the vmcoreinfo table, but that
> would mean expanding it a lot, which it would maybe defy its purpose,
> and be getting too big, especially for the cases where custom drivers
> would like to register data.
> 
> How I see it, is that maybe the vmcoreinfo init function, could also
> parse the inspection table and create more entries if that is needed.
> So somehow memory inspection is a superset or generalization , while
> VMCOREINFO is a more particular use case that would fit here.
> 
> Do you think of some better way to integrate the meminspect table into
> VMCOREINFO ?

No, I just wanted to make sure that you or someone had looked into that.
Thanks for your summary.

> [1]
> https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/

-- 
~Randy


