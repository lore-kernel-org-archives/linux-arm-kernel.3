Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62BA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wfokPUgm;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HgtZflKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=; b=wfokPUgm2YHUL8
	fms7pH6jXw4p3Mk/D4lD+lzSbiPzPXI7eql52qXQx2C5iXLntumAwzTTlnCV4YV659Ht9OcLuvIcy
	Fh5ixDnmGkTZQjIAk1tNn0K4XH3WSeBuUp1rdoYjPRlAkKzqyvFGmxnH/AK7B0LlZcY8GBTzYtHD1
	7yhhWgLfHkdPZPbkIcTJiUkx8x0+SLTgTKMCn3oK4Nw6SYAS/ZDbJgKLm2NvQeZOHr4cPon2eB3Ul
	ZvUaA61atoKL6ewjoVFXW9+14xwLxpBvmIo80Ic8WuaGOGsikk7i7x0vgHdjIHiyKfjlZPCFwWFk9
	n3g9gwqvSo6N48WGtRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAto-00000001lIb-1oa7;
	Tue, 03 Nov 2026 09:33:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAtm-00000001lI7-0hTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:33:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26483275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793698424; x=1794303224; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
        b=HgtZflKLBVVlrnUOuVxWogpFCYHLJHBG4DC/Wn3G5Z4vhW9Tk/Z1hHVIChkCWMsSth
         99qGWWFOBeF7sm3lIXRfq1I9SIHQSalBZysZvHiIqxF3alOfwHFb3BatvziOPxncykUN
         hmiVe4uTQtS3d2oyHInt5yDBSZOGPyHM76neI6JWWfWd2vZmRMQWSF/47fMKgr4P1ChH
         hvueendwBjDDqYrG690VSqTO+JGSU+Woz62J4vSrmU+c71GJYuKW+PU8KOcJb80bm2aN
         j/uJarujDEP+TBrzytEhaOfVhpvhyEKi4Ry0fayGKQYLEfvmmFdphLXnFyxCnDJsWdCq
         tHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698424; x=1794303224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
        b=pC+f8B5ieA60FCUtC6m1xrkzVTKC89F6IYTKr7/vQQVXVh/CD+s/jqRwhuipXv2evY
         C4Kq8glS+RxW3Ti6e2SoL+Muw/dP584mw67ojYFw1aYlsxz1q6yWq7zScxwqRu+pyDEn
         v7RIQNKWdApVEpfJs7ZkWzTBKMwyb/FogD3EJfPX2nkxwZ7Fqc50eIDpgGhYjh6t+jqr
         sYFGIJ9G6xYXnC4hazz3ZoNzrqmArJ3MBILDfCKmrDl9xiv7K7uScqerRvhmK8yN7s0f
         +TOKEfyR1UJ71vAGi7ezeRtW4g8eckm6Lw1fgliM1XytcW0sk8e81KGna/mI7QXJWsTS
         vfow==
X-Forwarded-Encrypted: i=1; AKwUvByB98/rJolCUmFEZFFM2xeG4eKRoQbwm+ydF7sG0+As22dAIu44A4TuvljpyAXB0NNHDXUtkIwAF4Qz/FwaeUkx@lists.infradead.org
X-Gm-Message-State: APuU4Z/GbK8Phdok3AM3VonEglNwtFuSEmvA62AsJN6qbTmnb5wmwj8c
	8Z+RjFUOOmXQxXfEjuK0y/TQDevoleb3Ts7ETmStJt/dzS7F+kb+/i6SrEIwFa5sTfI=
X-Gm-Gg: AYBFou3ntxl14ftCdt7fOXgtRmcjPqvLCod5Yljzw6jzRmltb7uD3tdChLB0lbr6UpK
	1YHoXUsLZoDylsri9rCSM5brcBjtb0robv7L0OYwo16fOqyQmSqxBe9fYbD075DGCg1SSEcezAt
	G0lzDNpuc8MdZevfAsCxtxGBAVxfkw3oU4X4tWUTvemHP0BYSS7qB+rRC4ZNcCBDWoHuRM1zvoR
	NL9/xUMQtHJPCryxDlBUemOTrxES2ONwLmNNBqaCDGxPhRJ7vNbjOxOGLCTLI2uUsZ8tF9HR816
	sVPFVPOBwdujnk9qr+dt4KkgYZLmWOmfmDecpIvsSblByTAH5xb/ziu6sAl0i94zbcaAYzFOEso
	C9ujkjzTMaC44ZpmHj62O6OAZrLW3JFemZAPUjZ5siqRjVltiTw1uVDgTLF0Rd9XtqGRbITHmmH
	wthrdFFUyMUJ1UEbtQ62GxnlJdu2ieBgqg7A8E7G+T8BzwBf2o6zuxSC237fmG8M8ny8vlLggT7
	QT2j3gg9wQoUddfS3nhmiPzW3G7r9dtuQYIZS+BftkWY2GXPG7C5bfWUOz9/88j6Ol50q0RmgRa
	AFeXO+mIOwUZGXpwEMTgMEiRabaFLE5x
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr286221315e9.25.1793698424122;
        Tue, 03 Nov 2026 01:33:44 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm25836221f8f.32.2026.11.03.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:33:43 -0800 (PST)
Message-ID: <5d15b4aa-dfd6-4d01-86db-df748d84aa74@linaro.org>
Date: Tue, 3 Nov 2026 09:33:42 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" ->
 "shouldn't"
To: Ian Rogers <irogers@google.com>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org
References: <20261028183137.537812-1-colin.i.king@gmail.com>
 <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
 <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_013346_252954_BF6E92B6 
X-CRM114-Status: GOOD (  17.47  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 02/11/2026 18:01, Ian Rogers wrote:
> On Mon, Nov 2, 2026 at 2:52 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 28/10/2026 18:31, Colin Ian King wrote:
>>> There is a spelling mistake in a pr_err error message. Fix it.
>>>
>>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>>> ---
>>>    tools/perf/util/cs-etm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>>> index bdcf94813129..65bce2450549 100644
>>> --- a/tools/perf/util/cs-etm.c
>>> +++ b/tools/perf/util/cs-etm.c
>>> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>>>                        continue;
>>>
>>>                if (!intlist__empty(etmq->traceid_list)) {
>>> -                     pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
>>> +                     pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>>>                        return -EINVAL;
>>>                }
>>>
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> I was curious how this passed Sashiko's review. Did Sashiko flag the
> spelling mistake but the fix was missed, or did Sashiko not flag it at
> all?
> 
> Thanks!
> Ian

It reviewed it, but it didn't flag it. What kind of typos is it supposed 
to look for? I haven't seen it flag one before.

I have a spellchecker in my IDE which didn't catch it either because 
should is correct and t is only 1 letter. Maybe there is a setting I can 
tweak.



