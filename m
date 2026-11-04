Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79D606D316
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fb+2NLLI;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ubSelTlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=; b=fb+2NLLIPDpV/n
	5sDzNCE0xE6VHuDyFJtGUrKnpY3FfyOWYeEWQAoTtRbfLF5/jQieVncAB1OdasZGObOqfqT/7HDWH
	AVkcQIjQRRSQtfDQZ1hw9na+uwXUKcS2e+uOEBKuDHdYXXheMPOqMVmhoOzBxrB32VS1IbqeMLrpu
	XAhu59xGvBDgJQ7Q1nX5kRyw4a60f7bEjQBUbLE5+9/YjXze/zjll2qHO9wYnfOUOmDSq9IKQQ3Ju
	yKZoO0ZJOeNxWqokiXtecE66JNoXnZm9GNjGWMqeRjcI126c5/nIe0hMoZ8A2yLQ/C9yVEYHgjBJR
	MGHRlDE7f9lzVv4oiAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfCJ-00000006JxC-2R3q;
	Wed, 04 Nov 2026 17:54:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfCE-00000006JsS-0lDk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:54:54 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4cdc606b47so149215066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 09:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793814888; x=1794419688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
        b=ubSelTlWvsheSFy3FTrfHLCU+l5WGW1dvOXvcwYQgFBfmWgPIM588CXgpHZKA9khp5
         LKTVcjJALia1lVroFTrFqxXhG+q/YnxDalBhTigsH1uhLpS54PI6Oe84eyqK4rohaz5t
         w9/67s/3Z+zIVtz+D1DhBmfVwKU6Mzbzi1btdHyNdWkXKq7WqTSJmu494mNu1U7c9DRO
         lBT2FpccVMhpkHhC+6WRN4NMxB7qFk6rIodaLSqAFZCoCt+hsyGnGkzlsYXX9S1/LHMD
         Gau0g+jdJO/rMql9vOpIXapUnmIxP4QbxCetIjGf3OnkjVsLfDRXev0S67rqUthqRPoe
         HZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814888; x=1794419688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
        b=Ul+wxSlG2WtxAhxXUMvuTB9cM3a08qvigU9WAagKUHxPojRIcMWszv0fLNRLxQLRti
         nhdw827fRxkg6RccT1/146CnMA/HeeH5hoU4M5qrbDt4433eXc6joyOtgUyOUjJ8uA/B
         sSyDXBN958zm15Fa5JdNQPuCLPUIyV1TIDcW8RkL+DUx11NrBJrbihwKsbRSUeHg39FY
         0g6ql9n3tsRR1da5wQbo4h3RmaMceE5RpWKKvZjX9m5dGhg7ToOPHz8+77NRe+HzD8cE
         0x24fC92WRqC7pWR3uSFSNa7FeAOIawH32wNObeWxE+t7bY34yYhqQ/qnGVZBUiwU2ZD
         uQoA==
X-Forwarded-Encrypted: i=1; AKwUvBzHQz41HrC3nKLuorvZCxWToPqv7ruUcp1dWnyLl8fkvnw2dJ+sy3GN2NGwYmtZ4fW3lpZYriKREpqQTuj2wEOU@lists.infradead.org
X-Gm-Message-State: APuU4Z87ovZ3KfqRmbKo5kX9ECL9GmalJBOtmTaZlJhLcNwDjz5ksED5
	XoLkIDJyYj96fYARnLWg0lY2XEjx1zF5siKljBaDCvtxxn5BqTOi4LLI5eYJ7jLy2+pLQvNR19N
	egsJ2q30=
X-Gm-Gg: AYBFou03plaJWfJHMzFFmbT3NRo1eZiKUqaBtHejALjqwDWf1iK0EvYojzi3RbhBQLH
	KZxTf9UrLz4++PLph4WqunqZwW8pT7idjce3Ora74TYBRjJtGkAo5eo4n6BYZD1iIeHk+vlc8Yg
	6sOVgjAISuomttHWA8af5mvCcbiG5TKYvyYpufXpWO2T9LslcdNQt5CMujIGp0HKDTeS8yxJOn5
	9dttpxXX1QnK5JArwsRQ0gUQtloSxxs69g1IkbVSckRjs7KdpN+T+tKhBU1ODwZl9zjNKlGV6WK
	CeoY3F+NynTY1u/VPOdID95zLIAYEktfCK5Fa3gX2muDsoXSakpZzl+WlEIVKJ73q7n4na7SLzW
	VlX33j9KQAel5xK19bdxhybU08owqzggp8oxKfk5iHNS88yRiVN4WsFS/WqaNJpsvbS9CN5Wqxt
	Eq/OFg+etUbzSgWKbK3JuAnIjLbdI4zB1h+1wTGgMnHHPgn0eY5+o9iFkHNVMODmhwVj2JTXlVe
	jRw23HCI7sgB3X/TzKOLiRKYKdi1a/kBnDqT779JotJYvBGxKxAW1hicVfrej04bgrbCmY+x06/
	Ae/PwxEVTWqWoX7w0687pPr1edlHUa1G
X-Received: by 2002:a17:906:99cd:b0:c41:731c:534 with SMTP id a640c23a62f3a-c4ca7a86e67mr1494767166b.24.1793814887972;
        Wed, 04 Nov 2026 09:54:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e711sm92156066b.14.2026.11.04.09.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:54:47 -0800 (PST)
Message-ID: <c7c04e5f-2c65-4914-be41-f28365c47d94@linaro.org>
Date: Wed, 4 Nov 2026 17:54:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
 disassembly test
To: Leo Yan <leo.yan@arm.com>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
 <20261104163657.GJ9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104163657.GJ9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_095450_347414_6DA01F7F 
X-CRM114-Status: GOOD (  16.02  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 04/11/2026 16:36, Leo Yan wrote:
> On Mon, Nov 02, 2026 at 12:15:19PM +0000, James Clark wrote:
>> When we increase the default timestamp interval in a later commit, less
>> trace will be recorded. At the moment the amount of trace overflows the
>> 64K buffer, so the exit snapshot trace is what happened at the end of
>> the process rather than the beginning. With the new default interval,
>> the entire execution will be contained in one buffer and the first few
>> samples are always various instruction and data faults. These go to the
>> kernel so don't result in ranges that can be disassembled.
>>
>> Increase the window to 6 samples to ensure something with a branch can
>> be disassembled even with the fault samples.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> I don't mind to set even a bigger sample number (like 50). I did test
> and 50 samples just add 0.5s run time.
> 
> Either is fine:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

I quite like keeping it small because it's more likely to catch a 
regression in the decoding. But we can increase it if there is some 
other reason in the future.

