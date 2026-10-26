Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9B606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZO2w8vV;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D6oUu+79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hzbelKKDEnxgjYmpghnUkffEydiu9Idn1aqDCjEpGss=; b=iZO2w8vVb/ue1y
	Jx+mGpXtjjUA40PF2v/ZnU4Bz1sy8EKvuU4HgiiArmaCYBsoJH8yLSbHuoUqgY5/4L3ssqD1KaqtX
	HRiTiM+vNJVFfuKMgLwoFdiu0PNNpdmBx9DOcQW/hUNHFE7F0GOjNLytsdBaw5RgFVkbe3aTuuUfv
	Ra1/4cvQHQHmTrkILoSpDVh1MlGYSiJC1UwU1mX4HUdn80sfTTVI86YcXaQ1qJsrWGMoxLWzWooOO
	57rGst08GaPaV2IC/dfbBSDo3N1FqJjhJm1EcdM8bNNNg+rLIoZHTNyht+zSCHCEwnui/aiBFVBz2
	IzFiBnoY95aSQYpUxEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHIf-000000027M2-3JzS;
	Mon, 26 Oct 2026 09:47:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHId-000000027Kv-1Ifc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:47:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15272575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008045; x=1793612845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzbelKKDEnxgjYmpghnUkffEydiu9Idn1aqDCjEpGss=;
        b=D6oUu+79QhrTbZ7SzpDJpYdvvxDDwcUcFWnMxnuWA2S256OwvwnhH4hTwrwTSST/8D
         5J3UfsiffrJUcxz7vyquk/S+5SvXQg/cBVDMa7k9GT02qloEP+Fei9UvEKRvIeHZkABb
         Hb9t8hhp6Sca/i3SmW34ueWkRRFOlQqEwp5QSeKzBW9yItiPQrSoqre7yeEJOLBBMRNL
         3iG48MJSZBbPvtgQoF6j7rBHcvUGDXfs0AwAUZGaUwE10g5sVE4Aiw6o/I00t/GiffFt
         dDm+FYOMn6IVbFsyu65JoleoM3PxgrLNRs1sBDLJJaQFYAtl9AAIUKIjD2V1k6WhZ7yj
         0ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008045; x=1793612845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzbelKKDEnxgjYmpghnUkffEydiu9Idn1aqDCjEpGss=;
        b=lUGATeZi6ZkH7PU0eaneWJ6aMeHtqyAPZqSrpo9j4INf+Gpu/vL+9BEt7znO40a81V
         DpGhAE9RVsmdikd572T/z7v99b3Wc9MpDyW1r2aJda/+bfqqOAtC42+30tbGm5t0rGgK
         PqFikyO+Gy08eGchtk5IPySudB2ZVPoNWXwVd8NdzxPE85VtMA2M4QxGXU6DAHq0Gzcr
         ItaeM7nw6sDhPIx3FmSHoGnxeG6o7EqyHjKRjhchVY2pmhdXOKbuYWnerdlIn/m1Ui5/
         gkiVDDLd0/kpQx0EuZWp+ghvBFndTcmO7hzjfdaQS51SKZW0C9XZLJcIeUEukTDa0aaG
         VPPg==
X-Forwarded-Encrypted: i=1; AKwUvByn9Pek8baSJ3/sJ/Qhxmo++T8qsy2XfH7qTVnX6hm7YO46NCKT+YUUqu/MT8ZP4ecVH+kB++WyVeQ9+r3Xb02G@lists.infradead.org
X-Gm-Message-State: AFq9FYIe+OV4os2hEF4xNXoQhJYjZDZljDiBzOhtUXBs3GUwf9wJK4YB
	63rVQp4WsRi9WGbSo13C2rEJgefxNrxJx/6XJg0p8BPnPe1f4NSYJEa6dOdGgQoIA+8=
X-Gm-Gg: AYBFou0oiQNBaWzm6Ahq3e1TPqnFErLfdCTruXI2NOQbxGacx0kirXuOlWL04BdcpMM
	A+GlqgolWzcyJDy1SFQcvrEYnE7JTyLrU1OtLU88wYO/87OTM+BWh8ZqXuZMjjHIaw5ecsFhO9V
	22NKcT4zF8/oeyxykCCKlu/1cyFwulLFYKyo7QSLDerclMF59x4cz5oOaqYUYwt4aRcoWciNF4X
	Lr2/9OsJ9iyrTOZVQ/IUpwDbrkjlG8OMrL2sC8z/yoOAqpsOxUwUEDFV/egLdowr+QPwMaVSt4n
	Mtfd+h3OLp/VV4iblBI1ZeSC2YQiXiUiaut+ni7orjE23YAxcJs086gPSMIN3+VtMXMEGvVF9Mu
	QZKxDNDII+9do52hQ94O2LEU7jVsMraHVoRXp/gwIjGBHX8UVR/LeSBmSVWuXrRCYrN4x3GkP8P
	EeMxZFk7DAVc6zwE59BOzy7PAxt1p5EIOCv/eDgjBMVllgFzuI7zH2PSlXaeoNqs96Z5+yyQ2lp
	3JAhPStDBnno7gq/HinHKXk0oaapcj3kL6B21aC1yTld2cAixj+o7EAVDlD
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr113068865e9.19.1793008045005;
        Mon, 26 Oct 2026 02:47:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb40733sm12061897f8f.0.2026.10.26.02.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:47:24 -0700 (PDT)
Message-ID: <f5060f7e-71cb-4e9b-a757-51943070b083@linaro.org>
Date: Mon, 26 Oct 2026 09:47:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
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
 <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_024727_388427_54B1326B 
X-CRM114-Status: GOOD (  24.29  )
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
> Drivers outside the PMU driver may need to know whether the local CPU's
> PMU implements a common event before relying on it, for example a trace
> unit driver checking that the PMU counts its external outputs as
> TRCEXTOUTn.
> 
> Add pmuv3_event_implemented() to the arm64 asm/arm_pmuv3.h, next to
> read_pmceid0() and read_pmceid1(). It reads PMCEID0/1 on the calling CPU:
> events 0x0000-0x003f are reported in bits [31:0], and the common events
> from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits [63:32] from PMUv3p1. Move
> ARMV8_PMUV3_EXT_COMMON_EVENT_BASE next to the event numbers in
> linux/perf/arm_pmuv3.h so it is available without CONFIG_ARM_PMU.
> 
> Suggested-by: James Clark <james.clark@linaro.org>
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   arch/arm64/include/asm/arm_pmuv3.h | 19 +++++++++++++++++++
>   include/linux/perf/arm_pmu.h       |  1 -
>   include/linux/perf/arm_pmuv3.h     |  3 +++
>   3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 8a777dec8d88a..acd62c4f16743 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -173,6 +173,25 @@ static inline bool pmuv3_implemented(int pmuver)
>   		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>   }
>   
> +/*
> + * Whether this CPU's PMU implements a common event, as reported by
> + * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 events
> + * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
> + * Must run on the CPU whose PMU is queried.
> + */
> +static inline bool pmuv3_event_implemented(u16 event)
> +{
> +	bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
> +	u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
> +	u64 pmceid;
> +
> +	if (id >= 64 || !pmuv3_implemented(read_pmuver()))
> +		return false;
> +
> +	pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
> +	return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
> +}
> +
>   static inline bool is_pmuv3p4(int pmuver)
>   {
>   	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 02d2c7f45b527..792283d29d7b5 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -124,7 +124,6 @@ struct arm_pmu {
>   	u64		reg_brbidr;
>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
>   	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> -#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
>   	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
>   
>   	/* Only to be used by ACPI probing code */
> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
> index d698efba28a27..c21f185a283d6 100644
> --- a/include/linux/perf/arm_pmuv3.h
> +++ b/include/linux/perf/arm_pmuv3.h
> @@ -78,6 +78,9 @@
>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND			0x003E
>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT				0x003F
>   
> +/* Base of the common events reported in PMCEID{0,1}[63:32] from PMUv3p1 */
> +#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE			0x4000
> +
>   /* Statistical profiling extension microarchitectural events */
>   #define ARMV8_SPE_PERFCTR_SAMPLE_POP				0x4000
>   #define ARMV8_SPE_PERFCTR_SAMPLE_FEED				0x4001

Reviewed-by: James Clark <james.clark@linaro.org>


