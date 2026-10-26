Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CN+RS9DH;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dHjzs4ri
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=; b=CN+RS9DHznwegp
	VreYlKB9dnsbzrj5hV103KF6TxW53uRSNa2UkeF2HwqBTnLrjuK3pi1fTY99KuIxFxoG2cwkYdG3P
	shVh4eMZX2G0KqsstWM3Jhss7cTfZlA1J24sLf0lnxjbAiypGcHk2N/nXxlqPY3Dfx7Yo8Io90v8w
	QbkMCNbZo3l4Of/GKRT5lkl8U6rQbj+pPIe79yKUpgoe4gfjHTV7cFiNC3SvOm2iQdWsoyJl/5Kqx
	L8SxHOwLC/9gpNsl6qJo2Tlx02E4MycFjEBr/Zyw/VyFJhMgNM6ocIHaJIQqpRNjMY97RWq+P7Rn/
	pKfEF/zZ6XCPVFcdJV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH90-000000025fR-0UAn;
	Mon, 26 Oct 2026 09:37:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH8y-000000025e1-1OTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:37:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28128955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007446; x=1793612246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
        b=dHjzs4rix55ZIV2Yk5yaePvm4HjpuSRwkCBRH+JudVmYe+y1FFkoEVpC1TJ7bRmB1M
         wwuT1jPh6m0hAHkhT892t6twrcq4vNrvUJ6tgT/uUaA375TuX+c4eIPqvmXYhnIDtTkJ
         7gZZqrODtdMtsUe4gBg5147wpgYT3qfEfvmcuQWbWeHzARugnlOX2mh8eA2Fir3QDKmC
         YP7zDJ4liS1p1KNklfy1OhLWD9zV0vyBeNtEYbTBtAucBZsM1JUv3J0Zi0cfh/NmB4+V
         MEO2Gopwj+84TJZ7ED/xWuX2YBImpTbV4NVj6gYm+X3e4VJeSGj0GnPjjtifRM1VYnF5
         ZsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007446; x=1793612246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
        b=Lqux1+Nmi/TDAUzXzekrIr9M7F0nv5GDp8HuuH//GGF/FF+dr9+EaRMLlwXyzyLgPZ
         bWxuLG5rgV0UqKTbNTQqLImz2C7Gp4rXKWmdNpGM0KrmIH7pM3avWeGpv1hFB9fUSvYG
         a6TYF2/gJTvPkNkz9uSgihaLulO1EqlJ27MkK/H0axHPhNyAxnsgC8izR3NeyKRDieaH
         TlIwhSesIVSM48VtqFJbXfL9c3c1x33KMG06ZImBNkSRUW0+UeGez6SJfLetjWrMqOHI
         dOGQVRh9ED/bq9SjlspGp1ndGxdPEfyzp/syc+5zwPDqcb1VIQLadrMxY8/lafVpENgV
         Egkg==
X-Forwarded-Encrypted: i=1; AKwUvBziImBQz2dGkZ2yRBm8n0p2h9tfT5SL+6xpoBIFFmaGoe4Iy7luMuQyqNa52y944BYti1YpUvbYtQaAAiGfC7rw@lists.infradead.org
X-Gm-Message-State: AFq9FYKKxAnaeRuXGL5FB7xH+n9o69RiyHFA7xAQp03dZHmT7T0tYWcl
	aXkDaYSPVtIyTuQne27gxNiFNEuDggYC4nEj6bN0jnGdOFNmif4UNl9994LxmQNSYSs=
X-Gm-Gg: AYBFou2uhODQX6XVTuOm5PfZUO+2GP12VDobiIPLDp1Muxi2YMX1h8JY6XUb3qVrahM
	31eVvH6DV5xHbrgKmT0T6M4CbvZTgy0sT1k+JZlXJYMR10yYL9N49/dwK2v50AfPkhUmJ+EzMO0
	7AvbP9lpWe+h3yPC6L3bVt+JaDxNLYL8YC2niGS+mCjqmI784JNhCx7q1ql2lVLfJoPmtRQ1W1w
	2l5SFtkUO01k11f6SXxyLrZA9yrXtsKV3pY8bz1J3sSf8XxXLYusvO4az9A/ZCbugS9jlIDbx3T
	4GINvlJYwKmp26j0aKLxJjGgHMEFyxMKM2ZJphbhd0C5ivcaXEtWkPrpYb/VW/EL0OMgiedxtY0
	yyNDMBnbXiYlfFKE8fFVdQFOxMQLWxRy87Wy4EQu60e/feZ671HCPljYt4QXr4M3YJG0TTSCJnm
	2o9+cEWd9cGrMsmVWdeNoNHYgZ8UDCCCi4bZKMX0LRgfkRZzKXblovyhNs9KO7Cs5K47NtNTPbf
	M54ywOu0EcZONfqxIypGzSozrmMgxm5/WIeHYoDVPMQhjoU5CVLabhytGug
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr121663115e9.16.1793007446278;
        Mon, 26 Oct 2026 02:37:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm15638434f8f.21.2026.10.26.02.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:37:25 -0700 (PDT)
Message-ID: <84e1c5ed-cb93-45b6-8cf1-6c6778efe412@linaro.org>
Date: Mon, 26 Oct 2026 09:37:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] coresight: etm4x: Fix event count decoding
To: Amir Ayupov <aaupov@fb.com>, Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_023728_404393_FCCF830B 
X-CRM114-Status: GOOD (  26.83  )
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



On 26/10/2026 05:48, Amir Ayupov wrote:
> From: Leo Yan <leo.yan@arm.com>
> 
> TRCIDR0.NUMEVENT normally encodes the number of events minus one.
>  From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
> means that no events are implemented and NUMEVENT is zero. The sysfs
> event controls currently interpret this combination as one event and
> allow writes to unsupported event fields.
> 
> Decode NUMEVENT after NUMRSPAIR and store the actual number of events
> in nr_event. Use the decoded resource count so that older ETM versions,
> where a zero NUMRSPAIR represents one resource pair, still report at
> least one event. Update both sysfs event controls to use the actual
> count and clear their event fields when no events are implemented.
> 
> Also correct the instruction event enable mask for the single-event
> case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
> event 0 from being enabled.
> 
> This change depends on the recent driver refactoring. With no reported
> failures, it is not intended for stable backporting.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 13 +++++++--
>   .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
>   2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e954..af017bd8a5477 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
>   	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>   	/* RETSTACK, bit[9] Return stack bit */
>   	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> -	/* NUMEVENT, bits[11:10] Number of events field */
> -	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>   	/* QSUPP, bits[16:15] Q element support field */
>   	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
>   	if (caps->q_support)
> @@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
> +	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
> +	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
> +	 */
> +	if (caps->nr_resource)
> +		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
> +	else
> +		caps->nr_event = 0;
> +
>   	/*
>   	 * NUMSSCC, bits[23:20] the number of single-shot
>   	 * comparator control for tracing. Read any status regs as these
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db9e603f97ba8..fb38f0102290a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   	switch (caps->nr_event) {
> -	case 0x0:
> +	case 0:
> +		sysfs_config->eventctrl0 = 0;
> +		break;
> +	case 1:
>   		/* EVENT0, bits[7:0] */
>   		sysfs_config->eventctrl0 = val & 0xFF;
>   		break;
> -	case 0x1:
> -		 /* EVENT1, bits[15:8] */
> +	case 2:
> +		/* EVENT1, bits[15:8] */
>   		sysfs_config->eventctrl0 = val & 0xFFFF;
>   		break;
> -	case 0x2:
> +	case 3:
>   		/* EVENT2, bits[23:16] */
>   		sysfs_config->eventctrl0 = val & 0xFFFFFF;
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* EVENT3, bits[31:24] */
>   		sysfs_config->eventctrl0 = val;
>   		break;
> @@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
>   	/* start by clearing all instruction event enable bits */
>   	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
>   	switch (caps->nr_event) {
> -	case 0x0:
> -		/* generate Event element for event 1 */
> -		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
> +	case 1:
> +		/* generate Event element for event 0 */
> +		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
>   		break;
> -	case 0x1:
> -		/* generate Event element for event 1 and 2 */
> +	case 2:
> +		/* generate Event element for events 0 and 1 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   						   TRCEVENTCTL1R_INSTEN_1);
>   		break;
> -	case 0x2:
> -		/* generate Event element for event 1, 2 and 3 */
> +	case 3:
> +		/* generate Event element for events 0, 1 and 2 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |
>   					     TRCEVENTCTL1R_INSTEN_2);
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* generate Event element for all 4 events */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |

Reviewed-by: James Clark <james.clark@linaro.org>


