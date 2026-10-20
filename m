Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDEB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+xNd6Fy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK19SV3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=; b=4+xNd6Fy6+MWcjWIS+Pc21bnbH
	ZMhf3RmGQtfqOD2/hjDZLJOHUdHVGR8wUP3Ihuxq11IsQAIJKQRocxlXnZ9YW114basKhpYW2xFu+
	f36P32dCkaNPbf384On1a+alCkqWc+5ueuxgwV6/Mdx13Kia6OMUOzIfKMSUZDTXqTBQxOgbWwU4n
	FRRg/IRcoa4ilDCZg5tzzOw2pumz0pXS59T91A1D/75HVqa7Z/5MANwPT5CcsWeEr+rsTd188Irp+
	Y096FET2rS2Zkut5/QCrRmwxgyIiWrzZGg17JywriyILt66VjbAyVlzYoGCHTYHdMjIbufEQYQG7/
	C/xBbTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGbq-0000000Acmh-2jbM;
	Tue, 20 Oct 2026 20:38:58 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGbn-0000000AcmK-31Te
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 20:38:57 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1513425e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528734; x=1793133534; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
        b=eK19SV3/PmELuIQYjjEVYUvZvVPZ+z+bKFP4CkPfcKgqT8yPEMKnXeWfDE0mV6bFxo
         lukvjQ8WRk5r9C5ISEFi/hgVRF8G1VlLF5fguha7hU4xw8UyQKL6jU3Ap3GRGKeMeJYs
         8MMNiGb7cycMVKdM2pDpgquaydT1U7gzvGZrVBsPZ+jVofF/y9E3BGqh8qpM82/lnkkc
         ATAt50ZNvfwzNpahqtPoUwIKZrUOYlOw0B5pwec2DJwjuACQbGG2vNo84Vl1tFvlu6p1
         ZepEzE7I5vlAuflo1wbd2TSusQfjZFQawhwmHmhtl68wYPgzrMzu17nwBHRcMyZDTtfN
         YDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528734; x=1793133534;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
        b=n/IeUSxOf4rz8ps6LMOF5HsQXxjGDEALkfGfOwGIeVqXypHNMQqdFdPh0Kw5YGUS/e
         oVLB6Xyxw5XNvINOFk7MDe3Xyq88prB/qnKbFun0fctgKnMhVXdYdz1xEJlnQVKaE61k
         tz36cvaHf6HK6yHErfCzRC30WMPJ1wbd/FXd/043LTe1HQJu8tSjFDH+sIVYVsvafx2N
         6TzV9lh/IXq9c2GBhvEjdXYRxsz1GnrGI0HMhKSE49gLpd9Onn/etLCTYdM6VXzjxYq+
         C29QWXZ2S7IJWO42A4vwp61EHv2QAsUlXaUo1vp0DoUJnsAR0AN1O7Xrpsb+mT+CKsE5
         hKIQ==
X-Forwarded-Encrypted: i=1; AKwUvByX7aMdGk2gykJqKb6866WsWxD7pZMsYDg6Rof/rLmOUt2gd+f6zFOuxExHeifLBTOPTsBl6abE9XGncjTUSAfA@lists.infradead.org
X-Gm-Message-State: AFq9FYKbs3dEg04khaWN4eArLbhfd7LNQCbEoe4nPhjQeknX6+n5omKS
	7tF9jUhHc6XsIfqDA4lqaCGbiJng3I18LxBj7rd5hLR9AOAe9bnGbs7k
X-Gm-Gg: AYBFou2G8r9vl73dX3G3WevJh1TsJi1FLsq6+k8O1T9TZZyyFFkuBejeCaJbJXoEQDG
	BBUKGol1Iu4jvrvnRbVQna/pJfwg+z6axQ0XMAYlflAgcO4X2k9nn4qPV99fTnQxE/AkTgtdcQU
	ORDxaT1MJMdgnlDpHBd0xnyDq238728aV7DdrxxmMC1Gla1QR4lVa0jUzkAk45TWkZxzIb37reZ
	u5N+KhG51Tu+7B8j+5EmP/rOkiZULSkCeNXkhihJ/UB90Llruay6sI5DJ3gOid7IK66VFu8W9E8
	GsblTfXjtiIuGyV/8iLrejSMRjgLiqDWPqNBKfWrQu4WwDHZADLIdwbAiC1ix9aaygSCNsbDWDH
	Y/o+wKpTQhn7H7n/G7rKSf8vHo5Na/+dIxjfZienZdV93GFKjtYQKJKhWwlhzFmH5ITSaB0IbeG
	GW8Rx3ph9Z4NuIwBmdRrR5Jwp87ZYrMn9Ji9wuO3EDs/rk9HHyDcrikrtS2CFFrPwFvvXJhmnLz
	keYZs10Vnb/NbZUv3gnAJiOAA==
X-Received: by 2002:a05:6102:2b85:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7cc926fba03mr132043137.28.1792528733875;
        Tue, 20 Oct 2026 13:38:53 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:617a:6625:1f37:5d9f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc92428d7asm405406137.10.2026.10.20.13.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:38:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 17:38:48 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Ian Rogers <irogers@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
CC: James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
 namhyung@kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, vsethi@nvidia.com, rwiley@nvidia.com,
 skelley@nvidia.com, mochs@nvidia.com, rajjoshi@nvidia.com,
 treding@nvidia.com, jonathanh@nvidia.com, john.garry@linux.dev,
 will@kernel.org, mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, ctshao@google.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/6=5D_perf_jevents=3A_Add_NVIDI?=
 =?US-ASCII?Q?A_Tegra410_uncore_PMU_events_and_metrics?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2> <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
Message-ID: <F2F3FF02-67B6-4EBF-BD4B-364C7CD28535@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_133855_804819_E8F48FAB 
X-CRM114-Status: GOOD (  15.21  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On October 20, 2026 5:32:48 PM GMT-03:00, Ian Rogers <irogers@google=2Ecom=
> wrote:
>On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
><acme@kernel=2Eorg> wrote:
>>
>> On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
>> > On 19/10/2026 17:42, Besar Wicaksono wrote:
>> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncor=
e
>> > > PMUs=2E
>>
>> > Reviewed-by: James Clark <james=2Eclark@linaro=2Eorg>
>>
>> Thanks, applied to perf-tools-next, for v7=2E4=2E
>
>Hi Arnaldo,
>
>can we not take these in v7=2E4 as there is unaddressed feedback:
>https://lore=2Ekernel=2Eorg/linux-perf-users/CAP-5=3DfWucvdYefDOL3Vn=3DO=
=3DYUPEXE+tngDDfPLv-T5i3WkCJVA@mail=2Egmail=2Ecom

Sure, will remove until the discussion comes to a conclusion=2E=20

- Arnaldo=20

>
>The specific problem is that the NVidia PMUs have adopted a convention
>not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'=2E rc
>stands for root complex=2E What ends up happening is that aggregation is
>broken as the json is claiming that pmu_name is the PMU's name while
>the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name=2E
>They've wrangled support via the json by claiming these are sys
>events=2E
>
>We can either:
>1) support a new suffix convention of <num>_rc_<num>
>2) push back and ask the driver writers to name their PMU correctly as
>defined in the ABI:
>https://web=2Egit=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit/tree/Documentation/ABI/testing/sysfs-bus-event_source-devices
>
>If we do (1) then it would be nice if the support for that could be
>contained in this patch series=2E In any case these events don't belong
>in sys=2E
>
>Thanks,
>Ian
>
>> - Arnaldo

- Arnaldo 

