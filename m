Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYmqILMx1xlw2m4tQW0RBlUiktKctlRRDbbC0EtpRGc=; b=D8XGmGs4W3vIsDqpSwtcas080L
	rB5cM70Fg0UWlVHwaL2R70bbChz3KiqArmvpHrUxRZMScyDeKZY93MVHQv8vQWT92XHcbbicY5mtU
	eWrBMZPdoj1fYYj35o12zCjfctGln39mAKXA/en8gwc+I5w0GF46qn6jMkZMLp7XtcE/RIKZy7fOq
	kmZorEbYZup/umFWXcYRHZ9gwTqxTz12wRpo7uNxfH2uwekDeFU6YdKzi74PsmttX3p7yPzOfLrmo
	in1Iisjk9zuscWyCtxKR+rcaUjrVznOXrwGyVNuqf/qCSopayjTa6SdFzqdgTxRNKczLxhXboQgE7
	Wvxf+ueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuKp-0000000CqPH-2sXs;
	Wed, 17 Sep 2025 15:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuKo-0000000CqNb-1Vax
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NYmqILMx1xlw2m4tQW0RBlUiktKctlRRDbbC0EtpRGc=; b=QtOpHKPiDKqoOkWRWHaGESMWrM
	BAdKRRSFKO145Ij2zh7PiIJWuU20k6S+TP9LuyCJOlrP5MwqCfkPiNomDgfGWMvBf670pc7mK4G5R
	owiOXKkOhWjDdPSOv6eNvyCqkVV1yRp7e4zl4zwLaey38X49FJAkTJduBWh4yMRpwHXKChTnv5OKw
	aCySY+jq+T83pIehz0r8oTZfz4UepY5yJTRnHhCxbUQHOsEn3m1TF38aW/OGclVcW8bC+w3y3lTtF
	EAJ0LHS1D8UtHSlO7KFYpiypYXwNuqJIw06jvmU8XBulzAX0PWg0PKHOI1sxAmCWI0So7W+/DjhnB
	AhdM0Iuw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuKl-00000007SIy-0zxd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758123877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NYmqILMx1xlw2m4tQW0RBlUiktKctlRRDbbC0EtpRGc=;
	b=Z3QERJsNgEhe/ZhKICfekTWZdya1aW5bi3RAjPaXx6Ekd+P6IknylSUBcj0WmaJHeFvmsR
	KSM/Tikj0JBpZd5O6i60BJQBf6sKwPcSCuu5X2HudkDyzGrgS/9AAXFaStZJYDtatzKwNA
	USux//jh+59QRs1V4Bjs2O0VBxZph+g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758123877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NYmqILMx1xlw2m4tQW0RBlUiktKctlRRDbbC0EtpRGc=;
	b=Z3QERJsNgEhe/ZhKICfekTWZdya1aW5bi3RAjPaXx6Ekd+P6IknylSUBcj0WmaJHeFvmsR
	KSM/Tikj0JBpZd5O6i60BJQBf6sKwPcSCuu5X2HudkDyzGrgS/9AAXFaStZJYDtatzKwNA
	USux//jh+59QRs1V4Bjs2O0VBxZph+g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-Jl_-xmVBMQqZh3L60YsFDw-1; Wed, 17 Sep 2025 11:44:35 -0400
X-MC-Unique: Jl_-xmVBMQqZh3L60YsFDw-1
X-Mimecast-MFC-AGG-ID: Jl_-xmVBMQqZh3L60YsFDw_1758123874
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45df9e11fc6so39877645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758123874; x=1758728674;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYmqILMx1xlw2m4tQW0RBlUiktKctlRRDbbC0EtpRGc=;
        b=wYShNBhFD3jFVm+bT3TXCg2lGli/C5hVqT2pMO3hmtAtXRwLQM7AHP7NXFXOMEUp9d
         3DNtygEbBWzxZRYc7LkACBLmELRohbAc1p8eBEGPEA1nGKwxChPeuSlRlpHF9qjVpXOU
         uyL9Kb/jnx7uD6hQsG6vRMPtBhTPgmA8GwGJ4nWAOGU7n7Y0xlaBElV0l/3FpzUUl44k
         pj3wbqwmQMfSJ3k++UPQRIQBezJJk3To5kIbMuqabTG8tfwtY6nTv5yR14mY3SpEacQz
         qcNtpvG2Jhm9rSMMHlrnctI+tch5WNcSTUqvpr+MHd0sgyBS9FxntNiaq/wK/5pAbImn
         771g==
X-Forwarded-Encrypted: i=1; AJvYcCX672kjTjk8XSrzCoa2Oweng6BnP/dtqfve1qRsMKaLw56y8kV/5eY+7AnW+0CIyHXrTIFKBZUgmtt/ceoyxsgC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcg5bthhx87JE8lp5D4Ll6y5ESGyKZs+qALT/L52XFcuahe9Av
	V7OlbbJYYnGzI7tjsoh9izhNNYHvt6x4+YEcroKINL3EHrYJTgLE8aDpfhue08n6dJYwrD8ryiP
	wE226SUvTDFCC7LgxYdNGZw7hT+jSQjNb2KQmVpDUmCxOfPB9a6EZMDJ3RLLbT5NYLQFFWA03zH
	45
X-Gm-Gg: ASbGncsQBOFYgHoC/4YSYudgrEBF6AnG+KJmVolvFEEcsWk9rLSika1vMUmuzdRnWJt
	AShAtwpZTVOYN7bzcKZBdF9Hk8yn+1F3wBuooPpGTFqrNXj4nQ8qeaTtda70Rsstdc33BjnB9CT
	6AiMiFd2Ckd4+d2A4ZeDGfXytXnX+XIaLa912neoY4D4NJBhooqc7UHNpl8JQpm0rKatvN92q0k
	KWSM8uWp29pl4VwAZHxvbzs4UiVwgOKL9t5fPq/ZEtO1IoYfe0x2mIk91AoH7woc1kLml/P9KVI
	jGz1G1QTDDpUl9F1LK7dhvJ422MBk5P2NDNRs/p0ibNX4GKGDzj7yUYmktkIPJ9gMYIoEkCAB+U
	wQV8LI9DoWzsafpzO4GDShBWffyIn+blEW8925ZDsQSqvhqTt26LXj2XZW68fH4wd
X-Received: by 2002:a05:600c:548f:b0:45f:2c7c:c1ed with SMTP id 5b1f17b1804b1-46201f8b0f7mr24718575e9.2.1758123874114;
        Wed, 17 Sep 2025 08:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8g1ZaRN7oJUXl7N8nfBOuCnjfDBEtxRyVeyDn4nu6ScGXDtKea6BR0IkCAuJ/wYcffRSBqQ==
X-Received: by 2002:a05:600c:548f:b0:45f:2c7c:c1ed with SMTP id 5b1f17b1804b1-46201f8b0f7mr24718205e9.2.1758123873544;
        Wed, 17 Sep 2025 08:44:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-462c17c9347sm10474045e9.0.2025.09.17.08.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:44:32 -0700 (PDT)
Message-ID: <b532ab38-37a3-46d0-8a14-d7395421130d@redhat.com>
Date: Wed, 17 Sep 2025 17:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Eugen Hristev <eugen.hristev@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
 <10540b3e-09ca-403d-bc20-b9412a7fe28a@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <10540b3e-09ca-403d-bc20-b9412a7fe28a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YetPtSnD28dQgiCaf8e2jXu9PakLDyJTf-1QDNmKmTg_1758123874
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_164439_550503_DBE94ED3 
X-CRM114-Status: GOOD (  34.45  )
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

On 17.09.25 17:32, Eugen Hristev wrote:
> 
> 
> On 9/17/25 18:18, David Hildenbrand wrote:
>> On 17.09.25 17:02, Eugen Hristev wrote:
>>>
>>>
>>> On 9/17/25 17:46, David Hildenbrand wrote:
>>>> On 17.09.25 16:10, Thomas Gleixner wrote:
>>>>> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>>>>>> On 17.09.25 07:43, Eugen Hristev wrote:
>>>>>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>>>>>> I pointed you to a solution for that and just because David does not
>>>>>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>>>>>> their carefully localized variables.
>>>>>>
>>>>>> It would have been great if we could have had that discussion in the
>>>>>> previous thread.
>>>>>
>>>>> Sorry. I was busy with other stuff and did not pay attention to that
>>>>> discussion.
>>>>
>>>> I understand, I'm busy with too much stuff such that sometimes it might
>>>> be good to interrupt me earlier: "David, nooo, you're all wrong"
>>>>
>>>>>
>>>>>> Some other subsystem wants to have access to this information. I agree
>>>>>> that exposing these variables as r/w globally is not ideal.
>>>>>
>>>>> It's a nono in this case. We had bugs (long ago) where people fiddled
>>>>> with this stuff (I assume accidentally for my mental sanity sake) and
>>>>> caused really nasty to debug issues. C is a horrible language to
>>>>> encapsulate stuff properly as we all know.
>>>>
>>>> Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs
>>>> and relies on sparse IIRC.
>>>>
>>>>>
>>>>>> I raised the alternative of exposing areas or other information through
>>>>>> simple helper functions that kmemdump can just use to compose whatever
>>>>>> it needs to compose.
>>>>>>
>>>>>> Do we really need that .section thingy?
>>>>>
>>>>> The section thing is simple and straight forward as it just puts the
>>>>> annotated stuff into the section along with size and id and I definitely
>>>>> find that more palatable, than sprinkling random functions all over the
>>>>> place to register stuff.
>>>>>
>>>>> Sure, you can achieve the same thing with an accessor function. In case
>>>>> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
>>>>
>>>> Right, the challenge really is that we want the memory range covered by
>>>> that address, otherwise it would be easy.
>>>>
>>>>> do not expose the information already for real functional reasons adding
>>>>> such helpers just for this coredump muck is really worse than having a
>>>>> clearly descriptive and obvious annotation which results in the section
>>>>> build.
>>>>
>>>> Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.
>>>>
>>>> Guess it would all feel less "kmemdump" specific if we would just have a
>>>> generic way to tag/describe certain physical memory areas and kmemdump
>>>> would simply make use of that.
>>>
>>> The idea was to make "kmemdump" exactly this generic way to tag/describe
>>> the memory.
>>
>> That's probably where I got lost, after reading the cover letter
>> assuming that this is primarily to program kmemdump backends, which I
>> understood to just special hw/firmware areas, whereby kinfo acts as a
>> filter.
> 
> If there is a mechanism to tag all this memory, or regions, into a
> specific section, what we would do with it next ?
> It would have a purpose to be parsed and reused by different drivers,
> that would be able to actually use it.
> So there has a to be some kind of middleman, that holds onto this list
> of regions, manages it (unique id, add/remove), and allows certain
> drivers to use it.

Right, just someone that maintains the list and possibly allows 
traversing the list and possibly getting notifications on add/remove.

> Now it would be interesting to have different kind of drivers connect to
> it (or backends how I called them).
> One of these programs an internal table for the firmware to use.
> Another , writes information into a dedicated reserved-memory for the
> bootloader to use on the next soft reboot (memory preserved).
> I called this middleman kmemdump. But it can be named differently, and
> it can reside in different places in the kernel.
> But what I would like to avoid is to just tag all this memory and have
> any kind of driver connect to the table. That works, but it's quite
> loose on having control over the table. E.g. no kmemdump, tag all the
> memory to sections, and have specific drivers (that would reside where?)
> walk it.

Yeah, you want just some simple "registry" with traversal+notification.

> 
>>
>>> If we would call it differently , simply dump , would it be better ?
>>> e.g. include linux/dump.h
>>> and then DUMP(var, size) ?
>>>
>>> could we call it maybe MARK ? or TAG ?
>>> TAG_MEM(area, size)

Just because I thought about it again, "named memory" could be an 
alternative to "tagged memory".

-- 
Cheers

David / dhildenb


