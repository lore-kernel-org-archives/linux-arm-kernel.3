Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C63CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X64IdBmjHXhS6gvtudLgoG6tBJL+bVjtjgEiJHPyTrg=; b=mhf5DRRChKHhu5frMfS3+yVAO8
	IH2E89ks58eghNBxR+T6elq+GB2qcl5vRJ5ysjkDMQ9qPD6wlhUMduYk68QgjhNHou7egrNiKpx/n
	N4z02YAzwxgnEyVdrErMbzPD//Pv3L0zvtJ8Iu05uxy9zvTGpNti1DnAwMhlp/8fadFnXjx7QDfE6
	Ped8Y0IZwhpV9r0i7MPXyd2RJgrvT73cGMES+valbuoeo/QAX9HbQb8ZdijLJzff+kfOr6sjVVsIA
	qPExC/ve/4PkEam8qubV5QDGvl5ZXweremk/78WmLgCfnFs3ogpLPXmVDYu+JWv1vyEHDQKQQjsXC
	sxebIC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1lq-0000000GQGy-2vAc;
	Thu, 21 Aug 2025 09:39:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozeK-0000000G5tB-3Yey
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:23:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A871168F;
	Thu, 21 Aug 2025 00:23:43 -0700 (PDT)
Received: from [10.57.91.165] (unknown [10.57.91.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C45A3F58B;
	Thu, 21 Aug 2025 00:23:45 -0700 (PDT)
Message-ID: <09873338-574e-43e4-a6ff-590a3c9a9e87@arm.com>
Date: Thu, 21 Aug 2025 09:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 00/18] pkeys-based page table hardening
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Cc: "maz@kernel.org" <maz@kernel.org>, "luto@kernel.org" <luto@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "mbland@motorola.com" <mbland@motorola.com>,
 "david@redhat.com" <david@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "joey.gouly@arm.com"
 <joey.gouly@arm.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "Weiny, Ira" <ira.weiny@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "pierre.langlois@arm.com" <pierre.langlois@arm.com>,
 "jeffxu@chromium.org" <jeffxu@chromium.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jannh@google.com" <jannh@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "will@kernel.org" <will@kernel.org>,
 "qperret@google.com" <qperret@google.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "x86@kernel.org" <x86@kernel.org>
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <4a828975-d412-4a4b-975e-4702572315da@arm.com>
 <5b5455eb-e649-4b20-8aad-6d7f5576a84a@arm.com>
 <3c18d1f1e94d3491410168e37cdf67e9e471649e.camel@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <3c18d1f1e94d3491410168e37cdf67e9e471649e.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_002352_966628_C2BE328D 
X-CRM114-Status: GOOD (  12.65  )
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

On 20/08/2025 18:18, Edgecombe, Rick P wrote:
> On Wed, 2025-08-20 at 18:01 +0200, Kevin Brodsky wrote:
>> Apologies, Thunderbird helpfully decided to wrap around that table...
>> Here's the unmangled table:
>>
>> +-------------------+----------------------------------+------------------+---------------+
>>> Benchmark         | Result Class                     | Without batching | With batching |
>> +===================+==================================+==================+===============+
>>> mmtests/kernbench | real time                        |            0.32% |         0.35% |
>>>                    | system time                      |        (R) 4.18% |     (R) 3.18% |
>>>                    | user time                        |            0.08% |         0.20% |
>> +-------------------+----------------------------------+------------------+---------------+
>>> micromm/fork      | fork: h:0                        |      (R) 221.39% |     (R) 3.35% |
>>>                    | fork: h:1                        |      (R) 282.89% |     (R) 6.99% |
>> +-------------------+----------------------------------+------------------+---------------+
>>> micromm/munmap    | munmap: h:0                      |       (R) 17.37% |        -0.28% |
>>>                    | munmap: h:1                      |      (R) 172.61% |     (R) 8.08% |
>> +-------------------+----------------------------------+------------------+---------------+
>>> micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R) 15.54% |    (R) 12.57% |
> Both this and the previous one have the 95% confidence interval. So it saw a 16%
> speed up with direct map modification. Possible?

Positive numbers mean performance degradation ("(R)" actually stands for
regression), so in that case the protection is adding a 16%/13%
overhead. Here this is mainly due to the added pkey register switching
(+ barrier) happening on every call to vmalloc() and vfree(), which has
a large relative impact since only one page is being allocated/freed.

>>>                    | fix_size_alloc_test: p:4, h:0    |       (R) 39.18% |     (R) 9.13% |
>>>                    | fix_size_alloc_test: p:16, h:0   |       (R) 65.81% |         2.97% |
>>>                    | fix_size_alloc_test: p:64, h:0   |       (R) 83.39% |        -0.49% |
>>>                    | fix_size_alloc_test: p:256, h:0  |       (R) 87.85% |    (I) -2.04% |
>>>                    | fix_size_alloc_test: p:16, h:1   |       (R) 51.21% |         3.77% |
>>>                    | fix_size_alloc_test: p:64, h:1   |       (R) 60.02% |         0.99% |
>>>                    | fix_size_alloc_test: p:256, h:1  |       (R) 63.82% |         1.16% |
>>>                    | random_size_alloc_test: p:1, h:0 |       (R) 77.79% |        -0.51% |
>>>                    | vm_map_ram_test: p:1, h:0        |       (R) 30.67% |    (R) 27.09% |
>> +-------------------+----------------------------------+------------------+---------------+
> Hmm, still surprisingly low to me, but ok. It would be good have x86 and arm
> work the same, but I don't think we have line of sight to x86 currently. And I
> actually never did real benchmarks.

It would certainly be good to get numbers on x86 as well - I'm hoping
that someone with a better understanding of x86 than myself could
implement kpkeys on x86 at some point, so that we can run the same
benchmarks there.

- Kevin

