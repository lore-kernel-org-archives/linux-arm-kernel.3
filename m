Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF9606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wDhsM1Ce;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hLQe/RRA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00yPyIz5pNBZ/uGIfADGiLvcMOlz91ylxALbeXNOiwE=; b=wDhsM1CeSv19uggXb0YJatH0Jh
	tdGRQO+QTxRXu9k2qK0RhzYt7x3A21n6f1MlXKusqJu095NrsGKDkDmxnw0NY4cQ77cSFP58KTYxC
	kyHZ4SFFCEzlV6mqZ/W80xOloXX8vUtmX//yVgAyBxorfUPRp9DOUXM+cUXr3orj5kSukvjsUkofl
	WJ6/QESfOu9eipiNfCqmlaN5O/gF8VJwTAkRT1d8NZnLXaPqBZSsVlqtmjTJL2WZC6OTGf3AN7zu7
	cg8inR+oHnhgk9IBfTg70ffOKGJ7+3bPeCoZGsitq95isyRIFhSXE0vCDuhrqPjCOtcRGF8012vXj
	4hliTzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSVK-0000000BTfb-0jOL;
	Wed, 21 Oct 2026 09:21:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSVH-0000000BTf3-3dA0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:21:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c263415982eso56280466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 02:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792574458; x=1793179258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00yPyIz5pNBZ/uGIfADGiLvcMOlz91ylxALbeXNOiwE=;
        b=hLQe/RRAs0kqAU+SxuB2nZhydV1ohb/vXz86Tr5A453h0flQenEXRZVW39VD5ndRfR
         szo9Yn9uqaixHCe8IKbQMac0J6eZ8uR6XFr6Bu8SEFIpYFBt6eT5hOVqQK9tzlf2LJBC
         Zc6YFotSBP8u2GapiB3OaHRV7bWdjXTCcClwswoLgx6KvHUnErlLKJHw4JpDeqMRvDfm
         9l4vXFX6YixZNFQJpa94Kle4/j0RvGVkngtBRvLELNxeXwFnLrSxOey7odx1G6uhRg50
         ryGjydghBRrpq4NUtkdSnfUt3K4WMvd29vZw7oEgQeqqotpA57DnFZteYJGfLYMMTk6P
         mqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574458; x=1793179258;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00yPyIz5pNBZ/uGIfADGiLvcMOlz91ylxALbeXNOiwE=;
        b=l8WC5jhMQx7bElA7wqEmcMnKcltRMGFFdhu3YZp9BagdI4Xtcfmg6Ylyk7cTjs15S1
         CgHStE1RKlnnMMplLs4786iz0nspHZuTAJOFcxU+S9kpipHGh2mMx/CTlrm+tYsgEqfj
         6UyMBeVO8rhf8RKhcgI9Z4MvHk6O5vG7iM37X3j0aQIngWZXl9+p3VfXuLjQl1dFxFnN
         oVftjRKyxGtGMvyae/ueuiCCrBUBAgsXn2WDX6YAWOUQPhnzBXUeDOyCfexce2725t3H
         cqGj9gLqj+bTyUO9/DswqkU5KvZZRhirz58Z4XVhEY72/ytJK3ixzE47a79L0aKFq6cR
         zNug==
X-Forwarded-Encrypted: i=1; AKwUvBx+Rg/VSmQJqma7ZpiAJTdK1U6ev9gG58zPm/KCcMxy0p4LZW7VE5BIm3IiD1AcgWwh22nlUYbLmkmoLQq1E4BX@lists.infradead.org
X-Gm-Message-State: AFq9FYKSO3TqY/Ma2OHU1uzYxmwf5q+jv7PdSD+4jyuYNfhApYpyzvmS
	UlmZ/i6iFE77C7unA79bzujTyIhUz60K2xFY12VFdCgyJx3lgyROUW8rY9j7iUEkY0w=
X-Gm-Gg: AYBFou3nrtOuKUvPfWdxpbLsHD6j4H1+BhbNCpPg4H50sGJjP7FA1ctOxKSc2bIuUua
	YKccBIHXRfFFVjO6iSRF8NBQJdgyLA2NorCdy5RWlwb1NofV8RHRyz1g+y8HXVdVnzh0/4Xz/tZ
	dxlmkakGWODqH/MCOWZ7X8F1yNzJ+syjzxa0/67wAelPT6FGVMIAPzuKJUFj3GP9nTJiiEw0+yC
	zdoGbvsjYIE5y1+1iDtTCSEjKItc26JqtSj37huT5UW7kSsXn1kT8UbH2LCpitK45FYm7GJP2HF
	OZMiQGuVP4zhYm54aSkqq6vDGg+5woF0oyLz7+WhniKDWdKScw/zXKh64U5gz2L7hwWBAvOvZG5
	6B6NWPHglMHEBzqX2fp+8p2US7SmWWRAhdx43njjajtZm1Md4MbsNRmddEJwEDLnvcqzzM36fvh
	BsfcueQ2yBx6H3QhZv9AWDSAoG+4P5b17ltby9JZSQdYTAiFFZwMqyXZKlg9R7kzmeMoewctAF7
	P3UD8lgmWaovGlGKPKoHV4eOrmd5KCidyjcSLvFM9GXX6UNUQCzNacJayBv92RYjRaUl0XiQic0
	xxAAbA==
X-Received: by 2002:a17:907:d40a:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c46799bdbb7mr118867866b.42.1792574456702;
        Wed, 21 Oct 2026 02:20:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa974sm57756566b.43.2026.10.21.02.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:20:56 -0700 (PDT)
Message-ID: <0621ac72-950b-4bb7-9bc9-5547a2ce90cf@linaro.org>
Date: Wed, 21 Oct 2026 10:20:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v2 04/14] perf cs-etm: Use per-CPU queues for per-thread
 mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-4-00c4fd0701b4@linaro.org>
 <20260826190645.GL8904@e132581.arm.com>
Content-Language: en-US
In-Reply-To: <20260826190645.GL8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_022059_953944_770D2082 
X-CRM114-Status: GOOD (  45.67  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26/08/2026 20:06, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:02AM +0100, James Clark wrote:
>> This fixes two problems, firstly per-thread mode didn't support multiple
>> threads well or at all because we always use queue 0 and assumed it was
>> for a single thread. However, Perf attaches to all child threads of one
>> process or allows multiple threads to be specified on the commandline.
>> This meant that trace before a context packet could use the wrong MMAP
>> for decoding, and threads running concurrently wouldn't be interleaved
>> properly.
> 
> If I connect this with patch 03, I understand "a context packet" here as
> the trace synchronization with a timestamp, which is needed to correlate
> with MMAP records.
> 
> What I don't quite understand is how switching to multiple queues fixes
> the "trace before a context packet" case. Wouldn't decoding still need
> to wait until the first timestamp/context information is available?
> 

Context IDs aren't enabled in per-thread mode, we still use the TID 
initially assigned to the queue for mmap lookup. That TID comes from 
"etmq->buffer->tid" which is always correct in per-thread mode. Even if 
we turned on context IDs they might either be cropped in snapshot mode, 
or not exist when we drop the PID_IN_CONTEXTIDR hard requirement.

The commit message is a bit misleading, it should say "trace before a 
trace synchronization *timestamp*".

>> The second problem is that we'd put all HW_IDs into queue 0, so if a
>> thread runs on multiple CPUs then it would receive multiple HW_IDs and
>> trigger the assert that unformatted trace should only have 1 decoder
>> per-CPU:
>>
>>    $ perf record --per-thread -e cs_etm//u -- taskset --cpu-list 0 \
>>       taskset --cpu-list 1 true
>>    $ perf script
>>
>>    perf: util/cs-etm.c:3381: cs_etm__create_queue_decoders: Assertion `decoders == 1' failed.
> 
> Seems the commit log misses to explain how to fix issue.
> 

This issue is gone now, V3 will be based on "perf: cs-etm: HW_ID 
improvements" which doesn't read HW_IDs at all for unformatted mode. 
I'll remove this and the fixes tag.

For information, the fix explanation was:

  "The second problem is that we'd put all HW_IDs into queue 0" ...
   making that queue have multiple decoders ... Fix it by not special
   casing queue 0 in per-thread mode in cs_etm__get_queue(), so each
   HW_ID goes into it's correct per-CPU queue and leaves only 1 decoder"


>> Fixes: 9182f04a85b2 ("perf cs-etm: Pass unformatted flag to decoder")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/util/cs-etm.c | 30 +++++++++++++++++++++++++-----
>>   1 file changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> index d423f1cb408f..ccf886efff95 100644
>> --- a/tools/perf/util/cs-etm.c
>> +++ b/tools/perf/util/cs-etm.c
>> @@ -295,9 +295,6 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
>>   
>>   static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
>>   {
>> -	if (etm->per_thread_decoding)
>> -		return etm->queues.queue_array[0].priv;
>> -
>>   	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
>>   		return NULL;
>>   
>> @@ -1268,7 +1265,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
>>   	queue->priv = etmq;
>>   	etmq->etm = etm;
>>   	etmq->queue_nr = queue_nr;
>> -	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
>> +	queue->cpu = queue_nr;
>>   	etmq->offset = 0;
>>   	etmq->sink_id = SINK_UNSET;
>>   
>> @@ -2160,6 +2157,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
>>    */
>>   static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>>   {
>> +	struct cs_etm_auxtrace *etm = etmq->etm;
>>   	int ret;
>>   
>>   	/* The current block is not finished */
>> @@ -2188,6 +2186,27 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>>   	 */
>>   	cs_etm__flush_all_stack(etmq);
>>   
>> +	/*
>> +	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
>> +	 * different threads. When the TID from the AUX record on a CPU changes,
>> +	 * re-initialize the thread using the AUX record/buffer fragment TID so
>> +	 * we can start decoding even if the context ID packet was cropped or
>> +	 * they're disabled.
>> +	 */
>> +	if (etm->per_thread_decoding) {
>> +		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
>> +							CS_ETM_PER_THREAD_TRACEID);
>> +
>> +		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
>> +			thread__zput(tidq->frontend_thread);
>> +			thread__zput(tidq->decode_thread);
>> +			tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host,
>> +									-1, etmq->buffer->tid);
>> +			tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host,
>> +								      -1, etmq->buffer->tid);
>> +		}
>> +	}
> 
> This works if the auxtrace fragment initially represents trace from that
> TID. However, doesn't this introduce an assumption that an AUX fragment
> contains trace from only one thread?
> 
> It seems this assumption impacts the kernel patch [1], the tool's
> implementatoin imposes the limitation that driver to cannot support
> multiple threads run concurrently with shared sink.

Seems like we've decided to prohibit multiple per-thread events with 
shared sinks, so we can keep the assumption that each fragment only 
contains trace from buffer->tid. This is similar to the assumption in 
the aux sampling patches where we initialise the thread with the TID of 
the sample.

> 
> Would it be better to enable contextidr for per-thread mode and rely on
> Context ID packets to update the thread context? We could then reuse
> cs_etm__etmq_update_thread() / cs_etm__etmq_update_decode_context()
> rather than relying on the AUX fragment TID for this purpose.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/d833aeed-7376-48af-b772-4fe4ac66471d@linaro.org/

This comment is probably a bit stale now given the latest version of [1] 
where a per-thread event can only contain trace from one thread. So the 
context packets aren't useful. I thought the plan was to eventually drop 
the requirement for PID_IN_CONTEXTIDR and rely on timestamps anyway, so 
it doesn't make sense to add it in more places.


