Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YtncyKFF;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hrrr0wfv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=; b=YtncyKFFGONINm
	dayByaWNGDFPohbmdq1oYncy2/WWA7dPlh7/MGQ12JkQ7NkjwiT9BEXqqvL9sR7xTYPxOCdfly1Ro
	fP4MsZKDy3EFothRq18phf2CRhBfkV6tfu7fJxxg/PQyVHJ5Romy4YQFiYP6gcPTr6wELah0cjxd3
	n5Zh5Lt7zPs2UmchyhtDssd9xq+2KFK7RO61zcoOhLa9aAA2xop1gPVK8UhxKWhl4IAX/YLq+b5Mg
	/7a72nniQ6wXlCsgRUXgespJOrsduPrUzWVkPCDO91sTAsytwozI2F84UYVRz0tOIFwPAs0cy+Do3
	rSxv5d9it503xCYTmg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH84-000000025NI-3Y5Y;
	Mon, 26 Oct 2026 09:36:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH82-000000025LG-0R3z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:36:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4587045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007388; x=1793612188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
        b=hrrr0wfv1APznndSW2QVvokqADwgB57cFvxAwtMcCUATGqK7qu3fSINnE7x167dVPx
         n6kEuNBj9DfdyhVyeCmo8oBbiiN9o55zppBFscV1CAhfliPHC67AeMvhTzkxcjWRpYnj
         HATMxmfWuTJO4gdCJe9vZDVvzjvXz18c5ZE9hANMuw3j1lZoQ6HTwCqjjId66aZo0nLb
         MRb5WTyg8Y6Cwa5kEibD1t2xuZKQNF9hqe5xa6i+BUBYuWCkgvuBw5BpICMycMjfzfqH
         NXxpI0EWTOyz2NSt1rF/aSxHYwCbPuS1hqvLuSgr4/kTVivx50avyAPL84LMcsIQ9q7L
         1ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007388; x=1793612188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
        b=ytvt+Ue0RmNbIh5cI/oBLZNUSoe4c9/1jmidRa/lvKhBUToo3TLCbj5YmhslMQI+qT
         itdfNAu87fojmE1VZyPTemGPO9MTbgNOCyq8B4t4/7PN3B3sNI0NKUAJZw1FIW+26ktN
         ETkgfujjNjAtLtax+/ygWJp1i74XPjSoAVa9V0f0cun0SZXNVVP7wiFFvKbgGUIJnA9M
         9TWvtXM0nWCruX4FEVQVrCY/v82ASlxEUcfvQxcrwmSlU8M3mLbF2JyaqkdrTUqkDD3O
         cBdmv913kqsWuQXI6WWWEh+rN+EW4LOKTjizJw4JHO3xRVbU4LZEMqXI9gO3bocEKzEO
         G5Zw==
X-Forwarded-Encrypted: i=1; AKwUvBynGAoN+ne9YzOnI+HaHbimtCljf9YHFCoCImWUVMDiv8g3hsBzeqldrYqWvCePLlZcgtBrumV0BEg0UrtM4IRG@lists.infradead.org
X-Gm-Message-State: AFq9FYKOJE2K54oSMnb6xUeQH4zyCvC028lnoa6z027ii3pPcLPQVgL7
	FpNxNgiViKwFsA8SaOBOnEPp9V/Cf6EuItGCEow/ugIH8yieZryqMsCIobh+F6EA3kI=
X-Gm-Gg: AYBFou25YJI/C5AR7HKYB6g/MjbZXGZc/XQcvtSwcdpnGYT0bkrxmie8xXKToyXj2Q2
	OEi0ty9etCjQfdkyfT8eRF2+27O8F4RM5Tymw4JC1OeeLKC6yJ8YQGTfbIobCrN7p2wrSicnR89
	sMMKS17AizigkiUJgM1gQyAm2X/sBQPDAEPmvSIzM/deFEDHD7UnhVoi9dkrnHfGyGiYprGJ5IK
	rLcxS9fNF0jF4Qlb7cIWIgaAsyNHfAGuGOryRkbMYUYmwXPVztRyXXqyLDCb4oFwl3poFDye7LW
	Yzy5G6ShkGc4YejP34cdQuRvdBBZjlpOUD1A6gKUg0fxENLtyRifBx8TzRcZnrNgp5hRhLKYK5Y
	5fbXHhstP3AkfWSJtgqcL93VjQvvJ0qy6PoYxhJu/znHRZmA68ei0ozkX3aTHh6Y88wOp5y90CJ
	c+olzeO3MjK1kYqyb5Z+UHlgUckEmT/SCfi7IMZjYmo73L0SFc2K1i8rRI3pg5kO+rn8hxmGcPH
	paIGjiN2/d5Thzd7M5kDvh44ytheHKDnNM6/uwugCzXYM5alzK4KJVVI1PE
X-Received: by 2002:a05:600c:6749:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a35ad01261mr104560415e9.2.1793007388160;
        Mon, 26 Oct 2026 02:36:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm118131875e9.4.2026.10.26.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:36:27 -0700 (PDT)
Message-ID: <93c294c5-157f-42bb-9940-79082ac37c74@linaro.org>
Date: Mon, 26 Oct 2026 09:36:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>, Daniel Pereira <danielmaraboo@gmail.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025063846.3112301-1-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261025063846.3112301-1-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_023630_202201_ED3AD4AB 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 25/10/2026 06:38, Amir Ayupov wrote:
> On Mon, 12 Oct 2026 22:09:35 -0300 Daniel Pereira <danielmaraboo@gmail.com> wrote:
> 
>> On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
>> [...]
>>> +  perf record -T \
>>> +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
>>> +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
>>> +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
>>> +    -- ./workload
>>
>> The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
>> systems get, while on devicetree systems it comes from the compatible
>> string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
>> after the example, along the lines of:
>>
>>    The CPU PMU name depends on the system; the available PMUs are
>>    listed under /sys/bus/event_source/devices/.
> I'd rather drop PMU specifiers as this is not something this patch
> series focuses on, and examples above avoid them too.

I agree. Making the docs overly verbose makes them less useful. And I 
can't see a use case where a user would get stuck converting this 
example to their own system.

>>
>> I applied the documentation hunks and built htmldocs, no new warnings.
>> With or without the above, for the documentation part:
>>
>> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
>>
>> Thanks,
>> Daniel
> 
> Sent using hkml (https://github.com/sjp38/hackermail)


