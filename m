Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507EEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wfDbDw7PZnoCnsPrhm6swez/hsddVhdthnzc2lFnm0=; b=glyLOku3W6PETK/f2U95Es2/yf
	fdDzU2HxpQwI3rmtnbjZ/176zebPKd30wNdyoCTuRL9dZjBrmqHBeFRKq8uTrjpDOSHJ/iGhMOumZ
	GmSIztjeuvEnS0foXGMUksrGHPf8mbqhPZyifEDg5sKEId9yJVf7ygpL40E+ZQHFk818uiIRJM2/a
	p8o5cvQqXHhMsV/ZKT/7+Dyv47HSpEHVzLpAa8Jib8x4yv53Q2bi2m9AOCU0at0Yh6nz1Et693Sxv
	GU1yPY9wVpmDS058Y/TznEMh+cS3wL+84AtwZFnz5uDL+vsXjCVNA8QxYxGCY4a93M1H19lQuxhLF
	cPTobuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzgO-00000006Skz-2SYe;
	Wed, 02 Apr 2025 15:07:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzec-00000006SXl-3fYb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:05:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2295d78b433so37914745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606322; x=1744211122; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+wfDbDw7PZnoCnsPrhm6swez/hsddVhdthnzc2lFnm0=;
        b=F6lbAWPKnCnPsayfLXgKajbI2Vi2DSDnWAsz8pdOuaIQrB+xTbGghNJV2GewXQlyQ9
         h4dlzUPW6t3jymU1Aj/qwV+bRZmXg5xC57bE5k9BYWB6suJklb9wm+FPDN8V1dQP09fF
         Qt1mzTnormlYwpJiKwHUOvacI2Dpbb/PI3TCciQ3mgo9KRSyYa3Kf4ctXu7yshG965Y7
         9lf91mWHoLfdQnxKOiZEi10qu+8FR4s1lSn593L65UdPm8Snp4jgF3y6JZSuAZ/aQ20P
         bHYnkH5AKYHGRwS9QzvedYl1nvt4KnoPSBBEe53qbAjnNiNVulupwRefBKLp3hu9lSIP
         ksSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606322; x=1744211122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wfDbDw7PZnoCnsPrhm6swez/hsddVhdthnzc2lFnm0=;
        b=igxGfCEs5NdM4aIJH92hA2LbRcFuN2vhvFc8VWwKpbxfraSMhk0wnelOo2tytVIjzM
         oazWuqpR1I/UWFuQ7hBUmRldn1uz8m+c339ImVkzQ6Y7SklRDTQrKtvmX13U9TGl9Mvt
         gAzMY9FBNDxIeCPqKUwJEWlzfq3EqyTDU27YzAE3/6xWhfjmp3NAq1Ku50eCDChFZ60o
         Nd1i1ea2RwCtEIEo8PgQ6EX14xOraK1Va6Ub/jrbDPwwx9n4/FOEfuiAZeaUQBD4OjE1
         aJIcnDSiuIHXkyU5fGkeLqqVXMGkI3W0oj48I7e7pLUKS+TpSPhxbSj6oK8hGZhrhkeN
         wP0w==
X-Forwarded-Encrypted: i=1; AJvYcCWxQXUh1/fKUxvSwNNqp1BZm6ipQMeZONMAPAvsKDVbc/HbwrdNBoxTWgTP0qc/6IqRYwl5s2/Xh+o8lPJDiWio@lists.infradead.org
X-Gm-Message-State: AOJu0YycGGRyNTox5N60f/b7fC0vXo3Y6shWJoeFxOn6Dr5DGDEtCNTi
	jWRLgXMJZopE9sv6KRwHF6oz0Cul79V0YwXY4ZhgCUNMqP3Sfi3QKYw6KMjr+9DMNcTzGmcc4eB
	1XjcqSYJsHNL//NFdC0YvSWxSYy9jwgY725NKdA==
X-Gm-Gg: ASbGnctvdOqvheSn2H5UtUA/EHOi9t3J7qow0A/px89uT6zyoooHdco6FnT+K30QC2+
	CNDw2BfWl//GQHws711FYg08JRwn0NBOyyCmfkzSYz9gDeIaPlLTX1SnyzauXCRmela5YeNZ6nN
	RHuYRxHgM9Ir0tJLJkolR20Z7JAHU=
X-Google-Smtp-Source: AGHT+IH1ueFnde/tdjqCikl2BWv6iv6T4BIHQaMPIq1f5OwqX63kwGuOYor9s4hDW+z5LXETkM7PQnIIwqfbkXlFKdo=
X-Received: by 2002:a17:902:f608:b0:224:160d:3f5b with SMTP id
 d9443c01a7336-2292fa0cd43mr300305445ad.49.1743606322178; Wed, 02 Apr 2025
 08:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250401180708.385396-1-leo.yan@arm.com> <20250401180708.385396-6-leo.yan@arm.com>
In-Reply-To: <20250401180708.385396-6-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 16:05:10 +0100
X-Gm-Features: AQ5f1JqPXimSTtAyjfj7SHk-fZPinJru6XpT0nsdzLE3awgdovNvQGTOPPystmk
Message-ID: <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080522_913711_AFA63CBB 
X-CRM114-Status: GOOD (  26.07  )
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


On Tue, 1 Apr 2025 at 19:07, Leo Yan <leo.yan@arm.com> wrote:
>
> The buffer update callbacks disable the sink before syncing data but
> misses to re-enable it afterward.  This is fine in the general flow,
> because the sink will be re-enabled the next time the PMU event is
> activated.
>
> However, during AUX pause and resume, if the sink is disabled in the
> buffer update callback, there is no chance to re-enable it when AUX
> resumes.
>
> To address this, the callbacks now check the event state
> 'event->hw.state'.  If the event is an active state (0), the sink is
> re-enabled.
>
> For the TMC ETR driver, buffer updates are not fully protected by
> the driver's spinlock.  In this case, the sink is not re-enabled if its
> reference counter is 0, in order to avoid race conditions where the sink
> may have been completely disabled.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c |  9 +++++++++
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 10 ++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d858740001c2..7584cc03d8e6 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
>         unsigned long offset, to_read = 0, flags;
>         struct cs_buffers *buf = sink_config;
>         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct perf_event *event = handle->event;
>
>         if (!buf)
>                 return 0;
> @@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
>          * is expected by the perf ring buffer.
>          */
>         CS_LOCK(drvdata->base);
> +
> +       /*
> +        * If the event is active, it is triggered during an AUX pause.
> +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> +        */
> +       if (!event->hw.state)
> +               __tmc_etb_enable_hw(drvdata);
> +

Think that the  refcnt should be checked here too.

Does the  ETB case need to be handled? - somewhat confusingly the
coresight-tmc-etf.c file handles both ETF and ETB.

Regards

Mike


>  out:
>         raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 76a8cb29b68a..8923fbc6e1a0 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1636,6 +1636,7 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
>         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>         struct etr_perf_buffer *etr_perf = config;
>         struct etr_buf *etr_buf = etr_perf->etr_buf;
> +       struct perf_event *event = handle->event;
>
>         raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
> @@ -1705,6 +1706,15 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
>          */
>         smp_wmb();
>
> +       /*
> +        * If the event is active, it is triggered during an AUX pause.
> +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> +        */
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +       if (csdev->refcnt && !event->hw.state)
> +               __tmc_etr_enable_hw(drvdata);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
>  out:
>         /*
>          * Don't set the TRUNCATED flag in snapshot mode because 1) the
> --
> 2.34.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

