Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E708CD5CCB4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A66QRbAmerrW6V7sGjQr/c1N9bxUtMh8x/uKuirbyvM=; b=X4xM8kSE+gbOq2sgYRDlL5BwNT
	mgsHPwzmi4cWkKos33FRKwsJci2aNrP4pdvoFUVFBegFjzhiu4imIq4s1x9KHvXHOruu6CtlfTYF9
	ng4SHLG4936uv8PyreHiq17TFS3yvre5peLx5NqpQeIe4dY0tmhqNsAdLNUEHAs5s24Jf4OlWrDSD
	ZO/T33Y9QVK7QWAkE5CGGKabcXCxICOZbo8DBstnuh+GVHGelXGhwcHBdZZLFtQcHQsjqGUkbxw1S
	S7Wb5oNlLR2UqWW0+yhEHf8ftk3UGIWktD/QGNwJ/UXqDFpfU4gaxPv2/xLdLnymVoZM07TUoEJaB
	OJsQt3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6A0u-00000000iS1-2mwV;
	Wed, 30 Oct 2024 14:49:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t69zA-00000000i38-2Dhr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 14:47:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e681bc315so778576b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730299667; x=1730904467; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A66QRbAmerrW6V7sGjQr/c1N9bxUtMh8x/uKuirbyvM=;
        b=T1DUtsPLAlxAT2KdKrk6QZgqjKuh/jsBz/jlpDZJ5n291vI/QEXJKT2ChVsd0x7v0n
         0YQ5Yw6jlwLZinrC0NuWNThc/uC1w9RygwrLxaEF0yc0T3rC8JT2IzLzmJ+/HOcxC4FF
         xN6tC+/p56StLKmv051kLOEFcHdvsgVFcuP2DAIemXmpAd8wWSACxwXqzZ1bVeeaEXFJ
         IfCMbKTjvOAOE3TSt4csQiA809Mg22sWd8YY8smN+hPIFaNPoyFjlggOQXRN3BbJEVp2
         cLR60rUrGi0h62/BpX1I7TTtTbKpkHMKiY7wHsMopPEcepokTh+CRqzwlaQlDrXWF/4e
         nwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730299667; x=1730904467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A66QRbAmerrW6V7sGjQr/c1N9bxUtMh8x/uKuirbyvM=;
        b=RF5DRgqAgZFexh1enmrOxzzUFLrjYlkJ0oldEVc/kwt0A+AIafPYoKQk1g8G8EVB0n
         g/u8TCNjVb7+Kc5FztEdSAlsFRrkimD9AOX+R0j8htYIkqBYChaU6H8VKT4xFhW9NS0M
         hRrDH/CFccxC2OMJlaI7pqa4BzcdsxwfVzopo+Qhjo0/kX3yT98wpKSkTqW/VcEU3ICC
         pTm8BiclIFrstZCZSLBiL3ZfQfgBc//jZayNKH/mX7GgCO34vsYlyXewyYV0XYHpmB5m
         uu5UXOJpO2JkRx97Fnuct8bCWuRNEvr3ODv9e2W2MR37kJrvzL4k64oZC77BtvhJGj3p
         dvrg==
X-Forwarded-Encrypted: i=1; AJvYcCWAg/FqTAZnZ+O0cfKXaZ3tjM58qwUrqALcopcgcu+1CEdimsXV3P4qkKkt57clS2DJMyWdxPs8ApGfExIVn85F@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5aMIiNKi7cskih/345xhSbmFGxRmYsHZ6MyMT7DC/su0fI+2L
	26iBSU6Z6ZzUK7/7KVB/QSNrlemxu58G3m9jjzKP/SxwCWeFUJOvpkIFkj07RFrcHg4BfW6w7kK
	NiLT0qlE0KoAZtEEiCrkds6msQdOec/0h+XljzA==
X-Google-Smtp-Source: AGHT+IGE7SsUIQK43Z4vZS5EhJTyoCpTtVo7W6Nv8yrAqHUH5kel+pZdVCezqU0Hw/lsMKcRpIyDLKIrU3G5mxocaNI=
X-Received: by 2002:a05:6a00:3c85:b0:71e:5252:2412 with SMTP id
 d2e1a72fcca58-720ad14b1cdmr4375376b3a.2.1730299666657; Wed, 30 Oct 2024
 07:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241030133133.2932722-1-quic_sibis@quicinc.com> <20241030133133.2932722-2-quic_sibis@quicinc.com>
In-Reply-To: <20241030133133.2932722-2-quic_sibis@quicinc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 30 Oct 2024 15:47:35 +0100
Message-ID: <CAKfTPtDY965+8wbF-fgFyD4Br-2obQQjJTONwJoPpyYBrdN_VA@mail.gmail.com>
Subject: Re: [PATCH V6 1/1] cpufreq: scmi: Register for limit change notifications
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, morten.rasmussen@arm.com, dietmar.eggemann@arm.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_074748_620301_64E71E3B 
X-CRM114-Status: GOOD (  23.67  )
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

On Wed, 30 Oct 2024 at 14:32, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>
> v6:
> * Unregister the notifier in the exit path to make sure
>   the cpus work across suspend/resume cycles.
>
>  drivers/cpufreq/scmi-cpufreq.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 5892c73e129d..fb3534eae722 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/scmi_protocol.h>
>  #include <linux/types.h>
> @@ -25,7 +26,9 @@ struct scmi_data {
>         int domain_id;
>         int nr_opp;
>         struct device *cpu_dev;
> +       struct cpufreq_policy *policy;
>         cpumask_var_t opp_shared_cpus;
> +       struct notifier_block limit_notify_nb;
>  };
>
>  static struct scmi_protocol_handle *ph;
> @@ -174,6 +177,25 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
>         NULL,
>  };
>
> +static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
> +       struct scmi_perf_limits_report *limit_notify = data;
> +       struct cpufreq_policy *policy = priv->policy;
> +       unsigned int limit_freq_khz;
> +       int ret;
> +
> +       limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
> +
> +       policy->max = clamp(limit_freq_khz, policy->cpuinfo.min_freq, policy->cpuinfo.max_freq);
> +
> +       ret = freq_qos_update_request(policy->max_freq_req, policy->max);

If I don't get it wrong, you are using policy->max_freq_req which is
also used by the sysfs scaling_max_freq

This means that your request will be overwritten by the next write
into scaling_max_freq and/or you will overwrite a constraint set by
userspace.

You have to create your own freq_qos_request and add it to the list of
cpufreq qos request



> +       if (ret < 0)
> +               pr_warn("failed to update freq constraint: %d\n", ret);
> +
> +       return NOTIFY_OK;
> +}
> +
>  static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  {
>         int ret, nr_opp, domain;
> @@ -181,6 +203,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>         struct device *cpu_dev;
>         struct scmi_data *priv;
>         struct cpufreq_frequency_table *freq_table;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
>         cpu_dev = get_cpu_device(policy->cpu);
>         if (!cpu_dev) {
> @@ -294,6 +317,17 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>                 }
>         }
>
> +       priv->limit_notify_nb.notifier_call = scmi_limit_notify_cb;
> +       ret = sdev->handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_PERF,
> +                                                       SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
> +                                                       &domain,
> +                                                       &priv->limit_notify_nb);
> +       if (ret)
> +               dev_warn(&sdev->dev,
> +                        "failed to register for limits change notifier for domain %d\n", domain);
> +
> +       priv->policy = policy;
> +
>         return 0;
>
>  out_free_opp:
> @@ -310,8 +344,10 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>
>  static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
>  {
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>         struct scmi_data *priv = policy->driver_data;
>
> +       sdev->handle->notify_ops->devm_event_notifier_unregister(sdev, &priv->limit_notify_nb);
>         dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
>         dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
>         free_cpumask_var(priv->opp_shared_cpus);
> @@ -370,6 +406,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>         if (!handle)
>                 return -ENODEV;
>
> +       scmi_cpufreq_driver.driver_data = sdev;
> +
>         perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
>         if (IS_ERR(perf_ops))
>                 return PTR_ERR(perf_ops);
> --
> 2.34.1
>

