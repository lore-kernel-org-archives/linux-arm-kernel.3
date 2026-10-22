Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C66606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4IZwMfNO;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gdlkqUZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwLOjvHCtgaLp2E9XIBdvGe/pxFGO4huYHU7gKZLKOA=; b=4IZwMfNOCMZJUw9yBQyRURytJo
	S16vMn5r6OzAB5H1tbCvruqEa6/tGLDE51dDF+Sddftyd9wqwCihgwyaGRX/onHytYEm1UK3R+FDC
	2y+BbYTqzC/Dm6FKK3B3rAKlN4TOaXkdm6TXV1PgT/jv6n6pZLlFJcwEB9ubheCaDcy9fq3UOtVQA
	JpdYBdxZYQO2vhpiqQ3XCy8GHTYzTEe/Mibp6jYd8Uy3Y/Le47chYcO/n48qnPIUll+wxLJXj5MPa
	3R6pb8sAQX9ZioRXsl/pnxxHtAkgdQZMcZAQ55W0Z1KHvwHShjClSwJIHIXLI5uMo4p6Uit8u05mk
	G/KGL7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJo9u-0000000Dee8-3vP6;
	Thu, 22 Oct 2026 08:28:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJo9s-0000000Dech-43lJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:28:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so10686885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792657699; x=1793262499; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwLOjvHCtgaLp2E9XIBdvGe/pxFGO4huYHU7gKZLKOA=;
        b=gdlkqUZLPZzQ5hWoAzgjTUAi59OyoJxO0W3rT9+4nZsp11+vWp0Sf2V2t+5wmZwiGO
         MRI2PghBayF2S4ewRwlkqaFI/R9cZziaRJ4pfUvNpUfrSGav2TxFojFdk1YItNbh2Lm2
         H7PTM7TWM5kS+dGw0/DQBcCyP/pMrMCnjo1UFfylr3hRKRPUhHKYDOGWyVcfdWdFGzDV
         N8HNNOrgRxmJ7j+j++puBtcTegUxFTTlUj6Zb9EhOHIRtOm7JL7Iw1tOtG+ZMQD08qCE
         IYYqOB1KtB7Tni0jqaA0LLsy6dGv+Vlxw0uuLPFtDugBEC8NMhNq8wFI5EaXYbk8Ba6S
         uxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657699; x=1793262499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwLOjvHCtgaLp2E9XIBdvGe/pxFGO4huYHU7gKZLKOA=;
        b=DAhGRD6+Z+KkhV0TWATt+4GoKPvNEsoy/E9GdRAjfMmkTXIlbB9weFYwJZtiJwekor
         GJsXAq7TxovO/mJc6hGyA25H9gKDS+VFafVSHnmdXEDtP07RCZiSrzxeopo+WtZX0pLO
         KvusDmtXIC87C754X5wp2W5s6RdgO5kR+MW9BthM/ZPZ39ak4RIxcGtNaIRz7BO9XDr6
         rULpAWubuyP2NN8gC3TjglgHwd17ZG2/sEC11zcgLDEssZAwkI+C+O4DmLJpeIZ8ZRYJ
         MlUVcubH6EXUVDt9COoXIVenWH9i4C6bK05PISSpvUEGLTAc4YWv5coYCdvF5fi0Gz2X
         ldJA==
X-Forwarded-Encrypted: i=1; AKwUvBzjd91U1nVEJC6UOrThDzazi+IWNbsSxq4vANyzKABez5Nk9SHcRlnkXXRZmUQ5nOHSt9ONUCpTDB0MUjZCsKbp@lists.infradead.org
X-Gm-Message-State: AFq9FYIt48Q0CoEu4dwMfCGIvXRv+knn/pg/2ssZJLudIvOfv2ZR7vFM
	i4BaePpwoCTIkNgrP7+475M/uXO9kz0O4ZNWyqTEZD//0/owxiAXw5lUoVN3Xmz06NA=
X-Gm-Gg: AYBFou3U1MkoKe9ZRFhM03iGm9MgOYlG2QkmBUdje7ZQ4quc4NdkZISc8ShIQ8G6E/e
	8V9xpyD/Nt4et2vRjn6rx1guweYKcVXrRfq7FlwpJ17W+PagWKhVOJWW+et7s1jwG90q92CqlLn
	jAU62R0oo/fDoViMjOnbJAizt7N01IQOw1j141OvONc5Kb/4lm5+R/6CWcaxRaiCFVE/wW8q2ee
	ZBROcYe16WsEdaWX+43VDcD6rZvcKHxH1ePECW99ffGE0tYm89riyNEcWhyvSXxakbpHyOBXAH7
	oMrYHKbhaMH34NTnyMwGmUQ4HPOe8pqi5jKBHXqWvRj539JQKm86Tz+bhnLue76rosSQVmUd4q3
	HdiOdcYEsiUSFbxY5XgbxCsc4XGdfqG+yKEVibf87fmXPFan3/Q/Ijr+k9LxAMfPzwK+qUvt/SM
	gdCBMbONudcJUw0db8zL/+I4PrFBqSjZ9e+1ZXa3Wf8oHkYvZJ/li1T78lWZuLzgh3E+YUK2xe2
	svHDJxsjKU4/aAk3YonI0PO7NoLPCXCO6nx9Y0N7mP4K8lD3SAdzgTu5oib
X-Received: by 2002:a05:600c:8b6c:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1fd8a7de3mr103361785e9.1.1792657698735;
        Thu, 22 Oct 2026 01:28:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203963f3fsm62310355e9.2.2026.10.22.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:28:18 -0700 (PDT)
Message-ID: <96e51831-ef50-4d0f-aa5c-74d5e3c8ae9e@linaro.org>
Date: Thu, 22 Oct 2026 09:28:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] perf: cs-etm: HW_ID improvements
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
 <2bc4b058-3a5b-4a9c-a469-eb8c93215594@linaro.org> <atjDCpTIrchbCLt7@x2>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <atjDCpTIrchbCLt7@x2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_012821_084346_1C85B964 
X-CRM114-Status: GOOD (  11.53  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 21/10/2026 14:50, Arnaldo Carvalho de Melo wrote:
> On Wed, Oct 21, 2026 at 09:42:24AM +0100, James Clark wrote:
>> On 02/10/2026 12:15, James Clark wrote:
>>> James Clark (3):
>>>         perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
>>>         perf cs-etm: Free partially created queues
>>>         perf: cs-etm: Respect --no-itrace option
>   
>> Hi Arnaldo,
>   
>> Is it ok to take this one please, Leo has left his review tags.
> 
> Thanks, applied to perf-tools-next, for v7.4.
> 
> - Arnaldo

Thanks!

