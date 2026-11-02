Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4A60A2606
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ftOYcfP+;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DeVgKUfN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=; b=ftOYcfP+yriVBh
	zlu97KP8fo4Is/L/CwwIlEra7PXsyGF95I8GgrGRDo7Sh9HfdFtuB3FKtfVD4VS3WmMGS3q5EoUzN
	yFPcj29hkrjHKe5tshMinLtC4t0yWLsR/PZDCtu/Qe+JCW+sdlPs1AHTsh4j+sFilAwSz11br9jIL
	kzf+CPiBxsrhJex5zc00uPraV4BI4U2xzJd8gIKZQ5pQEqbR5/ClFIKPbmzGXbwKfZi/Vz2i1166r
	uOjlb4dBobTneFkoHk3apsXPWAUJkeKESiFJBtlyxStaVJFKRvfR0nwfuKX6sXVrQJJ+nxPzsRVoL
	sGTbclulKAArtJtFfDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpek-0000000GE4f-10KE;
	Mon, 02 Nov 2026 10:52:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpei-0000000GE47-0pEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:52:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so23997765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793616766; x=1794221566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
        b=DeVgKUfNunmsR3Ay+NmrN+klLmBx2bx5ODo7yTdz++KKPBzrASv8Zs0rGQav9zcIJl
         7vz/lt045RKc8e6KINwUjAmUSYa2UPngfrJKQcNFVBtmD+bwkuFonp4MIX0VUsNMkla6
         I1gIc/yA1RWgHgsO+HMcybIdcps0ymzTp49sjjSKJpd7nMTFIz3hIJWgIQE+sGdU/UI1
         0+lgJwW1pY31MoEhSSJNPryYD3q4/5zxchKZe/WQW4n3XADbJEa1h07YMEogeIkRO9Ef
         kYOk4b+lVx/MnoOleFxPQVua2mwMHtPA9Tyi3qHx2NE3Qf8BpzWAQNgc3UW6ttaaLw24
         hLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616766; x=1794221566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
        b=Vb6BtWiY0eqWMYdDkZ+3C7TnG4nxzneKyQaX2vod82ewSE+XOmpgZIduGqh6T4TywW
         cBtrw2IWU4flixyF3adN2Euwp6M+KXMJVRdf66XBD00zSwXKhUV2oKh6JOLkcHSXldjm
         4RqCaA063fnwfX6dXt7duFOSYYuYcDqVVXCmPu6z254DHDnH3AA4KtbAM7al+r+4Z/lu
         GyKdc8EiFp3GJnWOWI76hdQzwfidnWr5a8Jl7p1P9tDBwxqdmn8u66VcapKFE/kj6YeC
         V6VPAWd5xywTFoG8/K9bgCkvnAq/S12V5qhbi4HpiVf3ZVYKHjNVfeCqgu17WibRrWT8
         k8hg==
X-Forwarded-Encrypted: i=1; AKwUvByXQGkbaDaNthalBAQWLaCFnBfQ6VpicP89xq0TCOzuGn4ZzuFJRvL7irhJqOQRsWwGQwqsxELS3+tdyNCTqPiS@lists.infradead.org
X-Gm-Message-State: AFq9FYJSmBnB6aSjm+Tbp9SYhre4YGk9KnOW8j0nnCOYVWaG+qQCYuRb
	RyfqVWaUWmcEOm37Ll+V0z9Fr0TLMFa4DZjRlFE3Rws1UR79MXi+RRhBe3VJbOvaGHY=
X-Gm-Gg: AYBFou3CsUDFZGJwNIQjcC290J95dY6WcEIkM/Rpy02w9fpTAcziIYwGKWmcuKI8k2Q
	S0CZ9RDXAZ9G1sg8tBC2U+V6cj8HhDPzJAqFejeWCg9w1PzMbLbd/z3jzDPJIYyw0TV0y8WU4qm
	ImckXFgO2ollVwVt/ALzBdpWmYOV6HYfmeBK5ZlAdf8vDb5jO0sOWeqnze2zHz/OoT+6E1pm8A6
	DCE2BMV7vvAk5ocy+t5y4XiYWeGTypApGtvZ2jxl7hV6kaHph9rfDTehfQqluD1FnRg2Fo3d2Em
	sVm2Pq+4d6deKtensP6uVawEsA8LpPqVunbOEjpNdoH8mBYNu1xggChnM5D2jAyEab7LvCS0VqO
	0lJTLjUV5alr96gLfn7aNIJNxzFNON9ZhuEMYt6sDJrnoVBl4C8A+hkm6TKf3sULbt/pk+RsyG+
	VnP3G+0FfcORXyr7dj14el2YqD02y15PVyqBtw8jAB1LyPwFEa0a7RirVEnQTXGv1AW+ED0xK1k
	DjAsoejX0cKiCX7ybCIPwHsb9IHqHdGovGe9dgd5GmNaz0NxrHOldEo5FmodXFMlAyvRT6ugSPN
	CrDIehU2W1lSwWcBGo0Bm/ppOUPRf2UQnk0oGCQiqK9qQs6IhoanPg==
X-Received: by 2002:a05:600c:a103:b0:4ae:63e9:36a9 with SMTP id 5b1f17b1804b1-4ae63e93a86mr89899655e9.14.1793616766051;
        Mon, 02 Nov 2026 02:52:46 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm309082755e9.12.2026.11.02.02.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:52:45 -0800 (PST)
Message-ID: <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
Date: Mon, 2 Nov 2026 10:52:44 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" ->
 "shouldn't"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org
References: <20261028183137.537812-1-colin.i.king@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261028183137.537812-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_025248_284931_1FA873B0 
X-CRM114-Status: GOOD (  15.63  )
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



On 28/10/2026 18:31, Colin Ian King wrote:
> There is a spelling mistake in a pr_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/perf/util/cs-etm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index bdcf94813129..65bce2450549 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>   			continue;
>   
>   		if (!intlist__empty(etmq->traceid_list)) {
> -			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
> +			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>   			return -EINVAL;
>   		}
>   

Reviewed-by: James Clark <james.clark@linaro.org>


