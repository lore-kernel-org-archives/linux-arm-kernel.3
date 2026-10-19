Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB09B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BLkSq1cI;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ikOsZqQr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=; b=BLkSq1cI8TWN7l1klpxK3ve0rA
	MVCOML43Uj7Ibyco3uHdN1YAXTOrkP7BCuvsl4UM4pZtvzoeEI7Y0HW41/P2GqWRH+Hn8Yq7v+Bap
	tzYYhlqs9hXJ41lwo2py6kB+ZiQyIQaNyCra3wYCSemFnfxhkHa6Ujz2BsaxoCiW7S81K4gmGMKsE
	KFA0g65Ve59omzklN2sDc3E7dHTtOwcKfOLcOUEu4sliFRahj1xYxU/hhZhYyOtTGFExpjN6l9RVi
	koNWC/Z4wSdJOGUN8pKGyZY3OkDlg+0XGuP0sz7PFRkOgMGPMEV9HFWuy7E5xLvrQ4Oc7AL+p+W8H
	7cOajfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIr51-000000084pV-2SLM;
	Mon, 19 Oct 2026 17:23:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIr4z-000000084pA-0UhN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 17:23:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1447758f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792430599; x=1793035399; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
        b=ikOsZqQrx1rsrOCa63rjzGGLvzf0tE3+7p/NIrMd/bGo7crZbFxWdO8g+15BTuk0Ov
         9zaA/c4m/JY5OE24RIJIEWSUTXg6yHjLGmhMpXRFpET6wQzAsL1JebttjSXgP6oMQJBh
         jRzxE8rarRUiR8FA6KxpiQtWBed5irW3a2dVVM9YbUJ2PEG8l49I3jmZtB4sjW1RG+kY
         DM5SuNze24+m6fbFY2r4Jyr/CV0kUAhimT73anCpEHPzgDqZxw2jGoolFmnG/6xZzN0R
         DOLgzPWCmxfgQs6XGS+B0QxZHz97mJjGvqHqaBPAQ0dpKcRfms4VsqSk6jvIwXVqHQKx
         GMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430599; x=1793035399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
        b=gjzP6RMXbaiLNJMD+AXCW086nOYbTaZSduqGsmY4S5OQFn4TWLHJv1r3ykKbVd7dcD
         NhtiM74JOR42Ez91BnnNEPuFFyRpbHe2rFqr28EUANkDTw4BPqP9XG3ZzYNjupYvUqeU
         ZghkcgBhcWbp6PW3Ui604ts2doDDW142xAnDMOFZXgvFFb+kzZ3uBr8aGSCObU6nPdq9
         HBo6MdL02ZlhfG1Z1xoUAeJ7lPja8dmbNYGgWcF2CATMgjYE4OLe98l13SzbKtp3+WjP
         9KirPtdDN9dMaJBULOM3wdw2MjzeWrXH4qJjxi4NfiSV3sFyGVELtjdRQkyQo1jBIzTv
         rD1g==
X-Forwarded-Encrypted: i=1; AKwUvBzWHCSXHR+GejHuvCX6lma8iN6KG/LwmIBm8/C+T7ZCaVaaBfwp595k7UWDD8Fct1E5U5Jc8pVZhSiu+4VG+LQK@lists.infradead.org
X-Gm-Message-State: AFq9FYJpw7w8IzwBIQx/pNUIopW4+4o0Q9wpmfG+bGB6u6GmS12fC5vP
	wvV4u3mH8P6a0EIXhjg33cPL1G454rT8F5iWxEqenaM/cqY0Lws9XSX6EHCxFwnybqk=
X-Gm-Gg: AYBFou2loUU8yWgWWcy6SNW9DwDnCCzFahOvH63iiyu86DbNouybMYIs0W2VB3aSC9D
	y1O60EFFclgKzfff02hDKY36zR59ygxAzVBoino2GDAFAGa0pdND0tlCb7LdwaKN4NBqd1QAMHx
	GphKL0hiL2WK6sWBVcwHBzzuc/NGqdZm7aKVT9AuA5UPM7eblFCrz/duwcfUuKBQVTfb6Q0Zb67
	Y3duSlHz76kZrp6QSCuo6UFqbN1jvW6NnolEhPKmIHZlib5HlWb0fU7SGLdmZPuq4vVEaUPLiji
	O57dmYFo9zX76m7Z9x7hbsmQVXU0owbZOWpHvorUUiR1imVHr0aICQy1qXO6CVb4l/B2YlXOMh2
	gOKYrBf6coZDPI+aozqZAMhUTA7Jz5VHkGoN010QDfayWFrqgl0fqjjIG05AAhCql/01wzdb/DO
	YRnrinxh9lRFvQyMmZ+RGRHvqZoJraJZ8CEpgeRDjBZnad0xvuuUE/kBv2PfhsvSHjuQIZ5Xt4I
	zQ=
X-Received: by 2002:a05:600d:4447:20b0:4a1:d483:559b with SMTP id 5b1f17b1804b1-4a1d7612bbdmr129179715e9.24.1792430598956;
        Mon, 19 Oct 2026 10:23:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm184529f8f.58.2026.10.19.10.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:23:18 -0700 (PDT)
Message-ID: <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org>
Date: Mon, 19 Oct 2026 18:23:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com,
 rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com,
 john.garry@linux.dev, will@kernel.org, mike.leach@arm.com,
 leo.yan@linux.dev, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, adrian.hunter@intel.com, ctshao@google.com
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261019164241.403644-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_102321_221698_9FEE851D 
X-CRM114-Status: GOOD (  13.80  )
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



On 19/10/2026 17:42, Besar Wicaksono wrote:
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs.
> 
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
> 
> Patch 1 fixes a jevents ordering problem found with this layout: the
> uncore events live in arch/arm64/nvidia/t410/sys/, next to the T410 core
> events, and without the fix jevents puts the core tlb.json (which sorts
> after "sys") into the sys table, so its events are lost from perf list
> and perf stat.
> 
> Besar Wicaksono (6):
>    perf jevents: Process model files before sys subdirectories
>    perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>      aliasing
>    perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
> 
>   .../arm64/nvidia/t410/sys/uncore-cpu_mem.json |  48 ++
>   .../arm64/nvidia/t410/sys/uncore-nvclink.json |  75 ++
>   .../arm64/nvidia/t410/sys/uncore-nvdlink.json |  48 ++
>   .../nvidia/t410/sys/uncore-nvlink_c2c.json    | 129 ++++
>   .../arm64/nvidia/t410/sys/uncore-pcie.json    | 247 +++++++
>   .../nvidia/t410/sys/uncore-pcie_tgt.json      |  93 +++
>   .../arm64/nvidia/t410/sys/uncore-ucf.json     | 693 ++++++++++++++++++
>   tools/perf/pmu-events/jevents.py              |   4 +-
>   8 files changed, 1336 insertions(+), 1 deletion(-)
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvclink.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvdlink.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvlink_c2c.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-ucf.json
> 

Reviewed-by: James Clark <james.clark@linaro.org>

