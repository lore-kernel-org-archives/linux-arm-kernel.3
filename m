Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atTIY/41;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=DlXbDuYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=; b=atTIY/41WB/t0M
	gYxdU65jfi5P7hpa/j2JNWlYxi34TjBKcwS4Bwju+JGISUdd5y8ntYV2YG41/aCLXPUgbIW14d4Jq
	2IBVYY9JVQavJIDq7iCPl3a/RuQKeJdqQTqM366/Vea7r1cfU/cgjlszjrwNbhDdlkZYeM0hIBCdV
	XRGc6QHgv0zOCzBR8eJREHv1pVDFPJuEY72rANVfjXVEz/kdbU60AH2izjWf1GHM5AGh2AKJBDAhn
	WtiEjHsGtaRil8nnH+BXTeTDo3Fconk6XyitvPNzLmJo80OFRjPL1sriduTFhrwqwq/R4qP0SVlHc
	R6Krp+uS5pnl8CFMSEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKV-0000000GWti-1oBh;
	Fri, 23 Oct 2026 14:33:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKQ-0000000GWnC-1SF8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:33:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso9801775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765985; cv=none;
        d=google.com; s=arc-20260327;
        b=duNuRuxZOitGyalqT3RqACkP2y6ob/AaS4KssvRwGDJFUdw7B2Ea0CtklIdpsyTZnB
         yPcwb0bzbLj9ymMMvTJ1Y+PdXLywkddokiAmSegHiYoGFOepGsBToxXEZjHiQGwL3hlq
         2UvYt5WkHvI7Mp8y1NdiduqDTkm+FbQbV+nROsBILq7wWE1IsTZM6wDZS9Lv4JQ4fDs2
         Kqc4r9deq2lnq1yv/0ippxDtJrHH+bKqgi15/pbDc1k+tzuWQajL/qkd+/gOWCfwRIj9
         tlT/YGZsmlbvB/Mwxzr00xRn4SNUn9Wg4zhCEdypP5s1k1wFKegCfTer38Akf8M7IMmh
         1dqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        fh=nsyQ63wgq/KtDnYngg9I1lfbo14h2SHdu3ccMmVlOSY=;
        b=MteH+nuMjxFk3+moUxdKP5vgWmmog+zR66h6J6obeqWudpZjBEqBeWyn60lbYIu8EN
         QrL5lwXHVLXDAXSejyjV80ht4yqoFgkDh6bDp7GVouA1eHeEPusBCId34BdDcoO1Bu6x
         DfmWKOuBj4Jp10YkbvwTetrL0eK9aXNGPPiElp4DHt/skLgwgsm00jKdTZEzrmUhUdo7
         +YmKir43hTdr7bNeIAb25/nn5S7GGoStEPDsmfiC6xnRoLtSbpfl1jehJg1Hmb9Ntz0F
         mvBs6RWHCZb7VIfcJJCmdsljE8GPeLN9UZyB5ZxLI4jDNak6pgEKWpao5D0/628jNLYu
         xRDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765985; x=1793370785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=DlXbDuYvl7eurgut9e45RtfPXk+X/isU9Li0hsllTNKXW/PPO9Xs9BdBUHlqGsiKw1
         fTXu7Qy62o+H4i3CJJGetq0t9aSUcxGipAWezNGHq+3S9jiUeflwEEdzcQC7ybRgIBDt
         buPKf71esrBz/p4OveSmW2EFQCYzbKnxmbO4ZGWd2S0GhTH0tdyww2Lye5hGqqjxkEuw
         pG9w6lj+FjGruAMBL3mZtNCrZq3ogLuSp1IBJsVjq94cbybjUJwUkKLNiDi6ZbX8KBbr
         x8s3ym9a69M/E7LVg2HXTarFQGGDbL39RCe3HrGDKnrPmTysUAna68yxNiKnQdBVfoaZ
         YX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765985; x=1793370785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=wdYigR2RJ+HOi7K+Bj1LokWtt+pRiXOxzfr7G/3GS6jIyTT4ALV7wYEQg+lcx0mPcU
         hxHooyPBGy492c/9XOXVUonrg5HL+eOUKbq7BATjKLRuqPq2JiK7tZG9/gnGeuunx00T
         UycZ7E3NQHhCrdj+nZ4u/Z4nh7eEPriUuIyuIEs6kpYtzfIuKbIVOVQyuR7nvUryIKic
         h4mzsVdGfb/9LEcrp5L6Td0bRY2gtLkTZ2ej1BHtYjYWivLSS+Zr/Y2Ul6LY1f9cNcjB
         SkqbqXCeGKH/GAKUsBC8u2X6L4pkUtT9q7+ziJ5hT55BucLDg8IKkyxDoRoObGJKb5Jj
         ++1w==
X-Forwarded-Encrypted: i=1; AKwUvBwnoh4h/NlduZ29k81Zg4L7qTK3Qx1AwR7mCNyCvWmCNh9sRYKyaEzwV9xml/RIyZ4n9iew3DGcZ3BQC/sBEGuM@lists.infradead.org
X-Gm-Message-State: AFq9FYLRaFj6zBqUFhed1ywJmmVXjQ+NEJcPKGjbPBsJZ3C4Pj1QXBB5
	up4ui0Cdm+jlb8QZXMRP6/33K7HQEFaMe6ADS4mRrVmgPsWw6WWVmeG2pxkHLsZkNkDbSfus9+z
	KzMDhTr8a3ySjvCQNq2Wv1aBrCKC4psxrWSlyAAnkEaB3/qSfDai9rLc=
X-Gm-Gg: AYBFou35EMtwEe029IsfnwKpIkkgEVdMArV/QEeJhZRk41bRgR/LkiiezfPrBryL0E5
	F09eQIo7OXprYcdTjSD2ZZrnGiBXLUoDJNu0uIbdI6ORYBHfWTn63ESlw8AYvOMwM9dzEhR9dX2
	Vw1eD2sykkEjhxBMKsvFhzCs4AVuNEbncg1dJS/4f1Vgq6rlYL1arZBNNIEt/3S2s9mCzC/iOmH
	PmGhjjrzLtMFW7b1ap29yQw7fOwSDogqgZcTzKmo6PO1JnlbdAigtmQIbsNv5ucpyfZ7xu1RS2F
	ii4lrSvVmpciAKjhrCRQhKIRXa6lcTl/B5oNfWkDUqac0gqOYM4RkfXKYLm+GKwgDYJYWEGRpiB
	cQY69LbfqZK17BYMitlkb6eGqVVncNqKXU9DUScPHmzhhkZMdgy1izM5fklb4LiwcHdKlf2jTDt
	Ua2gPUsSU07fVTf/vdc677kMCXuUFh4sNB/pcoi38l8KPvBySKruOoLce3
X-Received: by 2002:a05:600c:1392:b0:4a1:742e:3 with SMTP id
 5b1f17b1804b1-4a211ecf2d6mr37791005e9.27.1792765984553; Fri, 23 Oct 2026
 07:33:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-15-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-15-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:52 +0530
X-Gm-Features: AclHuK9X4t2_Wp-iA3viS1hPfBa-r77osa46AUeHd9u6gOQJy4rh2geNlywyhlQ
Message-ID: <CAAhSdy1zHzqf0Ozgoz_nT81_tjg6ojsNgGQMUpeXNaJ6AN4yug@mail.gmail.com>
Subject: Re: [PATCH v9 15/20] RISC-V: perf: Skip PMU SBI extension when not implemented
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_073306_452076_E3D15A75 
X-CRM114-Status: GOOD (  25.20  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Aug 7, 2026 at 1:40=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Charlie Jenkins <charlie@rivosinc.com>
>
> When the PMU SBI extension is not implemented, sbi_v2_available should
> not be set to true. The SBI implementation for counter config matching
> and firmware counter read  should also be skipped when the SBI extension
> is not implemented.
>
> Signed-off-by: Atish Patra <atishp@meta.com>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/perf/riscv_pmu_sbi.c | 55 ++++++++++++++++++++++++++------------=
------
>  1 file changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index fd4bf8804c9a..f0b8b6eff2ea 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -493,27 +493,32 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_ev=
ent_data *edata)
>         }
>  }
>
> -static void rvpmu_sbi_check_std_events(struct work_struct *work)
> +static void rvpmu_check_std_events(struct work_struct *work)
>  {
>         int ret;
>
> -       if (sbi_v3_available) {
> -               ret =3D pmu_sbi_check_event_info();
> -               if (ret)
> -                       pr_err("pmu_sbi_check_event_info failed with erro=
r %d\n", ret);
> -               return;
> -       }
> +       if (riscv_pmu_sbi_available()) {
> +               if (sbi_v3_available) {
> +                       ret =3D pmu_sbi_check_event_info();
> +                       if (ret)
> +                               pr_err("pmu_sbi_check_event_info failed w=
ith error %d\n", ret);
> +                       return;
> +               }
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
> -               rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
> +               for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i=
++)
> +                       rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
> -               for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[=
i]); j++)
> -                       for (int k =3D 0; k < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i][j]); k++)
> -                               rvpmu_sbi_check_event(&pmu_cache_event_sb=
i_map[i][j][k]);
> +               for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map)=
; i++)
> +                       for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i]); j++)
> +                               for (int k =3D 0; k < ARRAY_SIZE(pmu_cach=
e_event_sbi_map[i][j]); k++)
> +                                       rvpmu_sbi_check_event(&pmu_cache_=
event_sbi_map[i][j][k]);
> +       } else {
> +               DO_ONCE_LITE_IF(1, pr_info,
> +                               "Boot time config matching not required f=
or smcdeleg\n");
> +       }
>  }
>
> -static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
> +static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
>
>  static ssize_t rvpmu_format_show(struct device *dev,
>                                  struct device_attribute *attr, char *buf=
)
> @@ -712,6 +717,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *e=
vent)
>
>         cflags =3D rvpmu_sbi_get_filter_flags(event);
>
> +       if (!riscv_pmu_sbi_available())
> +               return -ENOENT;
> +
>         /*
>          * In legacy mode, we have to force the fixed counters for those =
events
>          * but not in the user access mode as we want to use the other co=
unters
> @@ -999,7 +1007,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
>                 return val;
>         }
>
> -       if (pmu_sbi_is_fw_event(event)) {
> +       if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
>                 ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_REA=
D,
>                                 hwc->idx, 0, 0, 0, 0, 0);
>                 if (ret.error)
> @@ -2132,12 +2140,16 @@ static int __init rvpmu_devinit(void)
>         int ret;
>         struct platform_device *pdev;
>
> -       if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
> -           sbi_probe_extension(SBI_EXT_PMU))
> -               static_branch_enable(&riscv_pmu_sbi_available);
> +       if (sbi_probe_extension(SBI_EXT_PMU)) {
> +               if (sbi_spec_version >=3D sbi_mk_version(0, 3)) {
> +                       static_branch_enable(&riscv_pmu_sbi_available);
> +                       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> +                               sbi_v2_available =3D true;
> +                       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> +                               sbi_v3_available =3D true;
> +               }
> +       }
>
> -       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> -               sbi_v2_available =3D true;
>         /*
>          * We need all three extensions to be present to access the count=
ers
>          * in S-mode via Supervisor Counter delegation.
> @@ -2152,9 +2164,6 @@ static int __init rvpmu_devinit(void)
>         if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_availabl=
e_boot()))
>                 return 0;
>
> -       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> -               sbi_v3_available =3D true;
> -
>         ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>                                       "perf/riscv/pmu:starting",
>                                       rvpmu_starting_cpu, rvpmu_dying_cpu=
);
>
> --
> 2.53.0-Meta
>

