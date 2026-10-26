Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LGi938Ha;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z503JcEJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kgHqO+fhYKyfCEdeXUZGJLv/oRemT+gvt+GWE9ye3yM=; b=LGi938HaE1fNwR
	fQikk6ktJWK1wQuhKmrk4+M1FO0MrgWa1EuTcn7MnBQZrT9PGRW9suSgFnQyLr/34aMr1E+pgEwy3
	px8mdGfNTP5aK+InV34HjAj+7LNn52gxwIjPOj/0Q0M9ODAr2pEyBZsZM4/otS78YD4YXIhALOklT
	5p2LzErWZzlxNH30lGcgmjqyu96h7Gro7en4qBA55z+6kobwiShNW5JzCDXEtZSCYNeqnecYmW2GM
	Hsi5Xu58Zgpsgd1GyFckBY/qPmw88Pv03dgab26jy1N2/cBnFU8FhHP6QQ4+/WbqsRXADru2FtSUu
	PfC4Jts/5AuJHd9UR+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHL7-000000027oS-1jzx;
	Mon, 26 Oct 2026 09:50:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHL4-000000027kY-16wT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:49:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1686885f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008196; x=1793612996; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgHqO+fhYKyfCEdeXUZGJLv/oRemT+gvt+GWE9ye3yM=;
        b=Z503JcEJjnN8KgevVFAHC5TOVfkI9MNJlVDz05TcxBIyde74ANjcCjBmOr1qrSQd9R
         aKNbNTzEYYCpksejTU2vyDs64mLSjwBcaCYjzJxeAy5H4UwaNo+XEtbwnZux5OQkXV+Q
         58gvosIjG09r0EYN71a8RYybziZjmtBG8bjjC/IuR6JraJi2n+bR7zHNJ9l330RsvHZV
         EFatkxC+C0l0IjexYQpRbmhRdnPIuSmNAbFKWVw1RSp6sYdqoFRABscUJr2YLY3n1elp
         3ozSNWw6VYKnBC2rwVpN4WlYR4kYJB4XVU1L366+T3zrj117mWuEOguZu3hz7dzPCtwl
         qoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008196; x=1793612996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgHqO+fhYKyfCEdeXUZGJLv/oRemT+gvt+GWE9ye3yM=;
        b=S7yfxWpumGIpbTb62k9QMuffEUnVTKY8Se43E9vR2+zZaemAjYvJWIWDs58meHD/yb
         zwft18cLExSSngQ1+OXirjcVn+CtAIg3N/6Sij6FF4eaBAr1eQoN0b8KGgxuobX70tmC
         H1HzNayPXyiQ72pfwDTSe3Qngz53lwPVX86Q1bKxy49u8V2IucZbCkQtS493jmvcgr6z
         7ETAHu4vBXbwiXX9Uo5UmuYbCE0R/G7N5cVbmuBVT7P2fUjfrhlvSDMvylYYO3OkA5mk
         2VLguCRO4VM7gqWrbffjh6+xrnDI22V26nPNZY5LUJvoFBag7lsuEgj+N1A6NZ/HDtuT
         VZaA==
X-Forwarded-Encrypted: i=1; AKwUvByxepfxPVp6F0cgMKzBNxzyPwR7Oumcnn7BJvDgkl2qNC8/tYEoNEYgio6AH2R+jqShBe2HgFobLRhP3VR3OCVA@lists.infradead.org
X-Gm-Message-State: AFq9FYL6aHq+k8IeGNU5hQ3bcKQxcVSZsbqU5O/5wBxegj9lDToZbzIf
	jsIELFiqV7Dp5hAX+eA5XfTBAqfPBp+zNLv85y9vKQg58DPRa3inl06mcwwS2pPa3+k=
X-Gm-Gg: AYBFou261TnmldycAGys5UAK9f40Yw8QA44i4tTeUib4Nq7lZJlrXsNADsyoarQe/I+
	R3rMDQaqtQGpnF4AHF1bo3QEI9tCuOmDs8SVo4MwJtulWWgyzWWIwiyg+8E9HbC9PObGGzGN9zK
	r9yzcyxTquJX+Ss/jf2r5wyBzWAqAde6xUYAer01AFjOXAJwoEhfOMtANWThQK439cIy42e5i2B
	jPWeMrDF13o7EwWN6dtywxmQFLDXU/XYgmx5ZL2qLPUn3VacDQnwRY+BvM7c3ozYmDUKTAU+KMD
	aAGRmPoqirLMg79HSV1ZIpqt2jgBN6vyCkZ6rbz+189jJ5TebFzovw66CuGF5E+JJR4wudjUd6I
	5/uKyPqq580urYGV8w4gur3BeRYM62EPz0D+o/KkK4QVVRqwZz5Y6MVSKppwmmla6eeIIBmgn2l
	ZwI4AX29UOe8y16VZ15dOF1t9/qsq7w+Jq+7QlzbMAFlJtfxYAUGUPRw3g62vXETximBdEW45Uo
	91LwjUVF5gBOzE+JbS80OJVwo9SEPGXzB9J4mFpTApySn6fOf1PKLVSBrHq
X-Received: by 2002:a5d:6f08:0:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e3eba1207mr11656985f8f.51.1793008196231;
        Mon, 26 Oct 2026 02:49:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm10525562f8f.40.2026.10.26.02.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:49:55 -0700 (PDT)
Message-ID: <c445cac0-a124-4499-b99e-21fba1e8bd1f@linaro.org>
Date: Mon, 26 Oct 2026 09:49:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] coresight: etm4x: Report whether the PMU counts
 the external outputs
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
 <a433810b85a9b768489d7b7b3ceb50324a2cd336.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a433810b85a9b768489d7b7b3ceb50324a2cd336.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_024958_351702_C2D531D9 
X-CRM114-Status: GOOD (  31.10  )
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
> Some CPUs count the trace unit's external outputs as the PMU common
> events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
> PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
> have no such events, and a feature relying on them would silently do
> nothing there.
> 
> Detect at probe, on the trace unit's CPU, whether the PMU counts every
> external output: the trace unit has an external output for each of its
> events (caps.nr_event), and pmuv3_event_implemented() reports whether
> the PMU implements TRCEXTOUTn. Only check ETE: per its specification, an
> implemented TRCEXTOUTn event counts external output n, while whether that
> output is also an external input is IMPLEMENTATION DEFINED.
> 
> Add a CS_CFG_MATCH_CAP_TRCEXTOUT capability match flag, set it on those
> trace units, and show it in the feature's configfs 'matches' attribute.
> With capabilities matched separately from the device class, a feature
> that requires it only loads on those trace units.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../hwtracing/coresight/coresight-config.h    |  2 ++
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |  6 ++++-
>   .../coresight/coresight-etm4x-core.c          | 26 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm4x.h |  3 +++
>   .../coresight/coresight-syscfg-configfs.c     |  3 +++
>   5 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index 220bc54f8e5e1..4cf53230854d0 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -38,6 +38,8 @@
>    * a device that matches one of its classes and has all of its capabilities.
>    */
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
> +/* the PMU counts the trace unit's external outputs as TRCEXTOUTn */
> +#define CS_CFG_MATCH_CAP_TRCEXTOUT	BIT(8)
>   
>   /*
>    * Limit number of presets in a configuration
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index 52cb036bb04b9..9e4dc5950c13d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -176,9 +176,13 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>   
>   int etm4_cscfg_register(struct coresight_device *csdev)
>   {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>   
>   	ops.load_feat = &etm4_cfg_load_feature;
> +	if (drvdata->caps.trcextout)
> +		match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;
>   
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> +	return cscfg_register_csdev(csdev, match_flags, &ops);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index af017bd8a5477..cb5fbb0279b88 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -30,6 +30,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/perf_event.h>
>   #include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/property.h>
> @@ -1399,6 +1400,29 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_caps *caps)
>   	}
>   }
>   
> +/*
> + * Whether the PMU counts each external output of this trace unit as
> + * TRCEXTOUTn. The trace unit has an external output for each of its events.
> + * Only ETE is checked: per its specification, an implemented TRCEXTOUTn event
> + * counts external output n.
> + *
> + * Must run on the CPU that owns the trace unit.
> + */
> +static bool etm4_pmu_counts_extout(struct etmv4_drvdata *drvdata)
> +{
> +	int n;
> +
> +	if (!etm4x_is_ete(drvdata) || !drvdata->caps.nr_event)
> +		return false;
> +
> +	for (n = 0; n < drvdata->caps.nr_event; n++) {
> +		if (!pmuv3_event_implemented(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void etm4_init_arch_data(void *info)
>   {
>   	u32 etmidr0;
> @@ -1562,6 +1586,8 @@ static void etm4_init_arch_data(void *info)
>   	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>   	caps->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
>   
> +	caps->trcextout = etm4_pmu_counts_extout(drvdata);
> +
>   	coresight_clear_self_claim_tag_unlocked(csa);
>   	etm4_cs_lock(drvdata, csa);
>   	cpu_detect_trace_filtering(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 5417280cdb274..33994ad4b2641 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -868,6 +868,8 @@ enum etm_impdef_type {
>    * @lpoverride:	If the implementation can support low-power state over.
>    * @skip_power_up: Indicates if an implementation can skip powering up
>    *		   the trace unit.
> + * @trcextout:	The trace unit is an ETE whose PMU counts its external
> + *		outputs as TRCEXTOUTn.
>    */
>   struct etmv4_caps {
>   	u8	nr_pe;
> @@ -907,6 +909,7 @@ struct etmv4_caps {
>   	bool	atbtrig : 1;
>   	bool	lpoverride : 1;
>   	bool	skip_power_up : 1;
> +	bool	trcextout : 1;
>   };
>   
>   /**
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> index 2b40e556be872..7b3800138f625 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> @@ -250,6 +250,9 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
>   	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
>   		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
>   
> +	if (match_flags & CS_CFG_MATCH_CAP_TRCEXTOUT)
> +		used += scnprintf(page + used, PAGE_SIZE - used, "TRCEXTOUT ");
> +
>   	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
>   	return used;
>   }

Reviewed-by: James Clark <james.clark@linaro.org>


