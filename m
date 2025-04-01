Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D24C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn6iujXamPOMTSSX+tFE3E9MwwaCnXbxRAwBn2smIRI=; b=06waChIOYEaApQMIHR7qnP6t71
	DHphx8eIZ/a30kxk+eqMm6XWXmTaz5tGE4KldCo76VwLx8DMmffPmn0BnpObR0/fj79NUpZ7ncu0s
	eEIj4CD4ZnE/q/mBRUMq5dEjKD4eEGx6ON+MbpsUzQi3/srQI7VraeNudtGwjyu8kvdGxNyzvhoKH
	yVZbTFWW8CdsJiWoGmWUE9IbuUIr9o6mScZu2DySFfpvmGB33PW24LKhR18xgAujwnPoi63xIPm3u
	z7NvaWjuJ/abIdHH0AtSueTwGUovOttcuS/wTeUgy1vzuSVAKbEMAYTQ6+64Vcn2j2AqpVKYW86Lm
	qc+Qbemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbAm-00000003MjI-2Wjy;
	Tue, 01 Apr 2025 12:56:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb56-00000003LyT-12s9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:51:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2295d78b45cso16640155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743511863; x=1744116663; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yn6iujXamPOMTSSX+tFE3E9MwwaCnXbxRAwBn2smIRI=;
        b=uASsYlfFHMnPZ+rhi5vWcZnzYT5jafgMCxXlomvL91WZ0Bu7GYsCZRKpl/pOkNvBbb
         9AceDmcSovEK7QL9G2rrGQW7udioE/y6fU+fbC2U8B4dapioFFVjXLEv73RvM60LDJB3
         K25naAe8Zbbiu6/FB6THTVngqAeht2xllICDQkSu20VyC7mh3yBK3JKqRRW05pkkURjj
         /20K8fsL+oAVh6jyZoPTD11HoI4AxNO4RlkGritpz4LwrbSboiU1XHB3t+qNqSqHkOFm
         jGVZR4GfKlxnbj6NgQH7EkJo7vX2DmNl/grgqEup9jIH5bOvqddi9yKuVT+gKl58AmgA
         fivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511863; x=1744116663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yn6iujXamPOMTSSX+tFE3E9MwwaCnXbxRAwBn2smIRI=;
        b=bcYJrXIUqnhpEhNYGdSwcgdrRbdfZqfOZfXzMdrJ2zof8+evyKuGsYGeuEJW5Liqmu
         fUtfy7TyKWueaxQJk3KtBwUyt6Gz1UELQs9/usmrOWRk7kbIkAnQuWEcdNWx26y9rMz7
         sFCA3eMMiNyKfmEe61gywvNcOkZrO3qyOaRrfonwAU2STnioZaJukEV7uAhJmXru5YqV
         uTORFLeymaDPgWgs0TIihbTh/G73g+O2KXmx+17ohhv+oSPjDufQ0T+KA6fctxs90j7W
         PRUVjq8elg02/E76QtcxH7qxVznxOHMSOG+iQF/fquzXvLQv3ERhf8MwdbRny1X9XL6S
         Mf9w==
X-Forwarded-Encrypted: i=1; AJvYcCUUM/vQjAzlL4TGSIckwReLVavF8uPCPN3Szf2jUJdJaQeRw6SsFa7pGzj0sAn92r6fMtMp4EEMnXvMd7wVqeXJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw800lz0/akAynsliN5qwZwW97BFODJk3PcXR7xcx2jbTXirzTL
	5MVuUqKbA0rN/E+hnoSMF3omyEdddmAjyQMu7ws3SSAWpQSAkIyVLoRSrr/1LW5SB/VdRx909XX
	iJxj5IK+tU7hK5ciCoqKdv0TtVLo8iQQJe8PR2A==
X-Gm-Gg: ASbGncsixbhP4Zu2JX8iDK4hhSk4UuiPLLthqMHLOxAseBFcU5wPxH+o1ijmrPU48VC
	a22lUflPfQ81RgFvFavgFvlJJlYgCUJbkvcTE1UBwBGUf+vZ0YOhMUtvP1hR9KQzGx65Yqxja2c
	At+Tn5JuWdvwwd+UT4SGmIOVPLCaxHLxAGbJhlaw==
X-Google-Smtp-Source: AGHT+IGJ4D6WlyWRmXCY7tI860Hkqd5R2026ZqBanuazeSj4V5Z2viAo41F6x1U8U43Rxn2+DKU1Wn2n4dsVbHHsNpQ=
X-Received: by 2002:a05:6a00:2383:b0:736:34a2:8a18 with SMTP id
 d2e1a72fcca58-7398044db06mr16843430b3a.24.1743511863245; Tue, 01 Apr 2025
 05:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-5-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 13:50:52 +0100
X-Gm-Features: AQ5f1JrG6rHLtjrc-40BATWpK-5ZTpp_JctZAVhjYGTU8Y716TkHgEMEmzg3WSs
Message-ID: <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_055104_296232_D688C268 
X-CRM114-Status: GOOD (  36.92  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Leo,

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> This commit supports AUX trace pause and resume in a perf session for
> Arm CoreSight.
>
> First, we need to decide which flag can indicate the CoreSight PMU event
> has started.  The 'event->hw.state' cannot be used for this purpose
> because its initial value and the value after hardware trace enabling
> are both 0.
>
> On the other hand, the context value 'ctxt->event_data' stores the ETM
> private info.  This pointer is valid only when the PMU event has been
> enabled. It is safe to permit AUX trace pause and resume operations only
> when it is not a NULL pointer.
>
> To achieve fine-grained control of the pause and resume, only the tracer
> is disabled and enabled.  This avoids the unnecessary complexity and
> latency caused by manipulating the entire link path.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm-perf.c  | 45 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f4cccd68e625..2dcf1809cb7f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -365,6 +365,18 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>                         continue;
>                 }
>
> +               /*
> +                * If AUX pause feature is enabled but the ETM driver does not
> +                * support the operations, clear this CPU from the mask and
> +                * continue to next one.
> +                */
> +               if (event->attr.aux_start_paused &&
> +                   (!source_ops(csdev)->pause_perf || !source_ops(csdev)->resume_perf)) {
> +                       dev_err_once(&csdev->dev, "AUX pause is not supported.\n");
> +                       cpumask_clear_cpu(cpu, mask);
> +                       continue;
> +               }
> +
>                 /*
>                  * No sink provided - look for a default sink for all the ETMs,
>                  * where this event can be scheduled.
> @@ -450,6 +462,15 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>         goto out;
>  }
>
> +static int etm_event_resume(struct coresight_device *csdev,
> +                            struct etm_ctxt *ctxt)
> +{
> +       if (!ctxt->event_data)
> +               return 0;
> +
> +       return coresight_resume_source(csdev);
> +}
> +
>  static void etm_event_start(struct perf_event *event, int flags)
>  {
>         int cpu = smp_processor_id();
> @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
>         if (!csdev)
>                 goto fail;
>

Is it possible here that the first call to etm_event_start() also has
the PERF_EF_RESUME flag set?
If so it looks like we need to fall through and do a "normal" start to
get all the ctxt->event_data set up.

> +       if (flags & PERF_EF_RESUME) {
> +               if (etm_event_resume(csdev, ctxt) < 0) {
> +                       dev_err(&csdev->dev, "Failed to resume ETM event.\n");
> +                       goto fail;
> +               }
> +               return;
> +       }
> +
>         /* Have we messed up our tracking ? */
>         if (WARN_ON(ctxt->event_data))
>                 goto fail;
> @@ -545,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
>         return;
>  }
>
> +static void etm_event_pause(struct coresight_device *csdev,
> +                           struct etm_ctxt *ctxt)
> +{
> +       if (!ctxt->event_data)
> +               return;
> +
> +       /* Stop tracer */
> +       coresight_pause_source(csdev);
> +}
> +
>  static void etm_event_stop(struct perf_event *event, int mode)
>  {
>         int cpu = smp_processor_id();
> @@ -555,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
>         struct etm_event_data *event_data;
>         struct coresight_path *path;
>
> +       if (mode & PERF_EF_PAUSE)
> +               return etm_event_pause(csdev, ctxt);
> +
>         /*
>          * If we still have access to the event_data via handle,
>          * confirm that we haven't messed up the tracking.
> @@ -899,7 +941,8 @@ int __init etm_perf_init(void)
>         int ret;
>
>         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
> -                                          PERF_PMU_CAP_ITRACE);
> +                                          PERF_PMU_CAP_ITRACE |
> +                                          PERF_PMU_CAP_AUX_PAUSE);
>
>         etm_pmu.attr_groups             = etm_pmu_attr_groups;
>         etm_pmu.task_ctx_nr             = perf_sw_context;
> --
> 2.34.1
>

If the possible issue above is prevented by perf internals

Reviewed-by: Mike Leach <mike.leach@linaro.org>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

