Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wv1HOYKi;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pr7qRw68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=; b=Wv1HOYKiuqbnN1
	blTTSLWjEA1s9v3Nk0o5IN1LtfNKRSMpwOjoulw7OPBP+3sqI/UAAwpF6bfs6e+ujjesaE8VJacu3
	SpAUkgUQ1u0hFUoRE07foYrPtaPajG5WUJvetvkaK6FC5uf/kkdgBS+TnrUv6zjW+HCkrlGiommKC
	YGx+e/pRTZ3ie8b+RkW2IPCPwgEdXRT1RbleOWLoqurJKwTTJGZv7H7QanP71HaB8nSdNOQWd/uV8
	F+HrYosTEUTVRe3+HlCiuEhPpQx1TPfOZLPXnzI0dgJaCJqNWXzg6W+PruQV3mVinTF5cgQiEmUdk
	2a5eaYfpcxT9ugTRNZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHH8-0000000270E-28P7;
	Mon, 26 Oct 2026 09:45:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHH5-000000026yg-41O6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:45:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e47347279so768142f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007950; x=1793612750; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
        b=Pr7qRw68asJl92lJYrgNIOPP+H4B1a1Lp0r1rh7cv7JG1zUUTzhzcN36InXmnGEzfk
         14UT+4UbK3ybWhMHVV9HcWYB1qrkSDxWH+alqswXSY06WCOvKnaV1q47qisQvR2Fz1+1
         8erVp3Ehx3S06/KQ7zoNfPUWVCDMEgkkYRdzpTNW2LunN0VVypp8griZ+Dhhxc03jqxD
         aNTk5/ETPnjKr8oCtXcLSeK5CnUUSMIzRJ4+JlI/lF/OMMYJHna+AaDS7Wah+IMif9tv
         rxwN1pEjpwNqcx5hZz3qHs3tY51Pel7qaIP0XxYPq5bmEy4U39G7oQ1lqg9RXP7PozTA
         2b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007950; x=1793612750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
        b=yZqBzap8GoJy0KKSadnc9fwFmG5sQrRCJhgoHgh1zo1Kq9MEoimfY1Y7C2hZsSVeMj
         CMJqKxK3G2YlBoe+Wov890d7L7WS8mjEQCASEk37phMafAilrTXSfl9puiFOmEWyRiN1
         pQmZsgKwluwU0ANtJQRcYB2InXvZKXJBP+VL2RmDZSnnCj+AIHu8c7hp/jG6xbICxOEE
         T+hcTl4cW2NnEBbaIbD8O3nZAIVtM5uVeLaGBoR8qZBjEQapD5zit5E+2dEv+vdZO17k
         MKoHUa6Vx0jsp/sT7iLi3NqtnxKtYLRnHmd0Gq+LV70N0uEmOyIdAjd79g2yM3hewSyo
         BcoQ==
X-Forwarded-Encrypted: i=1; AKwUvByCtG1bFB9+X2Lj9Z5ehjW7YdPQi1nVYGxniPTeWhOq6PQew80palfkkChf5weMuVGHkOP98GxWIbu4OdH0yD3K@lists.infradead.org
X-Gm-Message-State: AFq9FYIusZnf7tIT5O85X8mkpFyoyUTvzH7e+Gnjm+HJ65GXR5oiaUWX
	BYnqDS19yk4DoT4OjK51FzUD7vzcR/XYT6ZuQSVOoN1nEN2UUFCn1oVd4VKRpNaTzOI=
X-Gm-Gg: AYBFou1efXIwEtHgNx/Hesc/PGEjNH1Ivoj9rUjzPOiY5dVi+jgApf8SI+v7RiQurgh
	N6sD5UUu8Sd7jClpWxU7PrYbzFvuJMQQNNtK5rt50rl5o0ZQ9SQdnOEjPpSruuEnSXjX5+bXVI+
	yZDgCSd6cipSbEDsxeI6cQuNdN9RdaZ5wOnGvWXdiCbbcnY2dyXZDPuRaeSOBSBGYVoGoTTcAga
	niSDnqPBfUVJV2rsaR9Z1ZvhZd1Qp3PF/VhAT9AlMt+T/oXgjsTkYNXk0f1tsOJHrwYdWNI8Xll
	BOUW0RbauX6dUpXNKL03CcRur8AMjBB/jeLxX8cBBotzUo4BcfX3pNr7Ixme3hYi6vPVOsJWVvc
	qlhzIGEA13v/aNrlChUaUhtrR8cNxbgkuecwshjLyz9fHCFgJ9nSNneyJHstLvhMAJCuPaR6z1d
	HgKlFA16UfJGCXZkm9KNKeb/VgA9/GZuzJdl9vQzzNhF6rc2BE/TZ8rSLmDX8lE0AV+7H+ji0OQ
	5+Rwu7ravNcSnmjHunOWrnkwkeqMctVQ/x5zgyyQi+20vYsyiT3eXnWZ2W2Ulfoaz8NxIbptrs7
	UHrSJw==
X-Received: by 2002:a05:6000:46c3:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e3eb93719mr6507061f8f.34.1793007949962;
        Mon, 26 Oct 2026 02:45:49 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm15594852f8f.33.2026.10.26.02.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:45:49 -0700 (PDT)
Message-ID: <d3e80414-4f27-44de-b6fe-36d9a675e4d3@linaro.org>
Date: Mon, 26 Oct 2026 09:45:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] coresight: syscfg: Remove unused
 CS_CFG_MATCH_INST_ANY
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_024552_017434_27B9EC9A 
X-CRM114-Status: GOOD (  16.84  )
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
> CS_CFG_MATCH_INST_ANY has been defined since the system configuration was
> introduced but is not used by any configuration, feature or device.
> Remove it.
> 
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   drivers/hwtracing/coresight/coresight-config.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index f04e73b91d9a6..220bc54f8e5e1 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -39,9 +39,6 @@
>    */
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
>   
> -/* flags defining device instance matching - used in config match desc data. */
> -#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> -
>   /*
>    * Limit number of presets in a configuration
>    * This is related to the number of bits (4) we use to select the preset on

Reviewed-by: James Clark <james.clark@linaro.org>


