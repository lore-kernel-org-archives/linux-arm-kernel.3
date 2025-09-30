Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CE9CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nqPDNVvmHMJbuIBC9EzRG8knci1h0YqMS339lI0leY=; b=X/sXX1SkK6G4FHwqWmXekXmuqv
	3rGvRTdwiPnGoxW0AdE8p5ZfVzKvoC3dfC2JBMoXfQKlLwniUdQ0tvBVlOTvltRneKfZeIRHMUGMy
	l2PG4Du0cQiFUfFTLNl0m21DCE817yp/FpK8Lx7wGKtft0D3VMix+N5FdN6PFxOHXBJ5wrYp9cSmR
	HL3Gr/2pLSxdCKNvnFvx1R85rnDw7IWg8US97Dyu05ZOMwrFSLfZHptm98UA6my0xizgJoLn6tSeW
	PQCx9VWBJxfkhfOCYX5XV3uC2NeyQ1GaaGOJFk4otfSJkbWuVjgESt18EgxSJv2a2G5FPf53K47yr
	k3JwO1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bGM-00000005U5S-1oye;
	Tue, 30 Sep 2025 14:23:30 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bGK-00000005U4J-0j1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 14:23:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b556b3501easo5029269a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759242207; x=1759847007; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0nqPDNVvmHMJbuIBC9EzRG8knci1h0YqMS339lI0leY=;
        b=FndQg8P1523JG8L6NUPEU3jHyIb/M039s2808UAptSYqtnjTk8ede8LK5mYOduz/+V
         UcxN3L3N4KvVbWyHufDBhR7/AKQ7NFxxX/e6S3WJVZb0RIC+z3sx2GnQAWOL0axGM6mh
         haBJzB008raNnuF09FweDFK7HBJOtQ1yJJ7ulVzaFDoF+eygrdjzKsf5FHZWvZRpQ0nA
         UcNwgtNioovE1PxPh6aF0r5Fu8aoaTYeUyssPsQ3Uwh/uuPGvEM/efzmj8xEq41Ysn0U
         jns1SuXFYFFxbmopmX7goB0IkQDfLmEHiFhkWnrTYx0GFcrehlh4NXydfBHlbWRz+Elg
         bd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242207; x=1759847007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nqPDNVvmHMJbuIBC9EzRG8knci1h0YqMS339lI0leY=;
        b=PTN6E0NlGFjyOlCRnNjga2Lwn6ht9gBoDSQ4rDloqkCgyykedtJVgQ90V/bbAtIANt
         xtZl5Cy+NS3IpMC+Wwcvn0LkndX+JAlocelG86k3Nsyg0+2dON0vughQa1b0lmlAAGg1
         jy7f9Xo2krHZv4vHWlcCmtAPY+6hXHpJkVVcOKsf83sFQKI5MaNCParoE4e/ODGwKg0t
         lh2ccA4w90BvlSdkOdJTmANY4np7XJ94Ue+0Sz+Vyt9Crjp8SVrfF38zhWB/fcSnYOBy
         zd3EfS+va9YUGfqBoknzJGFQysrl2zjN/ojF4TGqAT4DIUuTA3cwf6LF7Y5W3l70ay3X
         6Qng==
X-Forwarded-Encrypted: i=1; AJvYcCVbv0Y7XntOTAwZ6gbCQt+3yNYtg4FKSQDgjbUkoZHCSia8JxuqTiHLPwBOJIFil+NMIuG6vVghH7oQeZF/R6nG@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ7G6qZmaHzcOleSVjNMEAWQm+tQdzYQ1LSGY8XfxQbUCOsmDd
	W3bywBZA8HjRUwXO6xi+lp3qZc0TE6J2UgUeClTVEsjw/HfqimpzROgZqKjsSCkIQ7jUuh6zFGP
	xi4A5/z5hBrpQ/z+HoQ+ZYNNWbOMbgyavthQpqwLSFw==
X-Gm-Gg: ASbGncsl90Y5396hW/TY8HcsAW0wsLQPcmPOn/Ordixz2Q2IqdpM58B4Vur8FZ4g71h
	pTaG8O7JO+7Dw4hGvrTfgmk8k3rULY4xjX3MrrrPEfel2IkHEEmw3nnOZfBISbNgeovpXnTxeHQ
	J7svS3LFxwLg44/ygf4+ACjygbl3EKwyGprJIqLzZgVu5IzZtVS8oPHOSjwLOFpuCj4HOSG9bWJ
	Y/ThlfcnSLrGYm9F3iOgM2a6E5c598ChJy6JNfXDPd52hZvUTgO92lJZt27+vdZFIP2GHnj0zg=
X-Google-Smtp-Source: AGHT+IHlqrF77diP63ZhDQVMfJWUo+/0TZt3BwI3xY11fHgWjg0Ux3q9e6vuHFffQMviYnG9Lmb3ChO4Ab9vW56zgng=
X-Received: by 2002:a17:90b:33cf:b0:338:3156:fc44 with SMTP id
 98e67ed59e1d1-3383156fd36mr7576183a91.18.1759242206789; Tue, 30 Sep 2025
 07:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-5-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-5-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 30 Sep 2025 15:23:15 +0100
X-Gm-Features: AS18NWCylvJO4XDrBB2qR1BNCRaOtWRTvgNx9co65woUOUOgpi0U0PYwT3BkJ7A
Message-ID: <CAJ9a7VhQ1PCyRqjOPxATt1CqQ+k7b8WvUp=ECKM3FNVtoFLWnw@mail.gmail.com>
Subject: Re: [PATCH v3 05/31] coresight: etm4x: Ensure context synchronization
 is not ignored
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_072328_219958_6FEA0175 
X-CRM114-Status: GOOD (  24.60  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> As recommended in section 4.3.7 "Synchronization of register updates" of
> ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
> ISB instruction after programming the trace unit registers.
>
> An ISB works as a context synchronization event; a DSB is not required.
> Removes the redundant barrier in the enabling flow.
>
> The ISB was placed at the end of the enable and disable functions.
> However, this does not guarantee a context synchronization event in the
> calling code, which may speculatively execute across function
> boundaries.
>
> ISB instructions are moved into callers to ensure that a context
> synchronization is imposed immediately after enabling or disabling trace
> unit.
>
> Fixes: 40f682ae5086 ("coresight: etm4x: Extract the trace unit controlling")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 38 +++++++++++++++-------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 382ec1a1cdd035e76d451d0112afd3f029ecbdb6..31d4838b47ae4a3a96c6a06774707214943268fc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -460,13 +460,6 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>                 return -ETIME;
>         }
>
> -       /*
> -        * As recommended by section 4.3.7 ("Synchronization when using the
> -        * memory-mapped interface") of ARM IHI 0064D
> -        */
> -       dsb(sy);
> -       isb();
> -
>         return 0;
>  }
>
> @@ -581,6 +574,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>
>         if (!drvdata->paused)
>                 rc = etm4_enable_trace_unit(drvdata);
> +
> +       /*
> +        * As recommended by section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        */
> +       isb();
>  done:
>         etm4_cs_lock(drvdata, csa);
>
> @@ -956,11 +956,6 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>         if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1))
>                 dev_err(etm_dev,
>                         "timeout while waiting for PM stable Trace Status\n");
> -       /*
> -        * As recommended by section 4.3.7 (Synchronization of register updates)
> -        * of ARM IHI 0064H.b.
> -        */
> -       isb();
>  }
>
>  static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> @@ -983,6 +978,13 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>
>         etm4_disable_trace_unit(drvdata);
>
> +       /*
> +        * As recommended by section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        */
> +       isb();
> +
>         /* read the status of the single shot comparators */
>         for (i = 0; i < drvdata->nr_ss_cmp; i++) {
>                 config->ss_status[i] =
> @@ -1120,6 +1122,12 @@ static int etm4_resume_perf(struct coresight_device *csdev)
>
>         etm4_cs_unlock(drvdata, csa);
>         etm4_enable_trace_unit(drvdata);
> +       /*
> +        * As recommended by section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        */
> +       isb();
>         etm4_cs_lock(drvdata, csa);
>
>         drvdata->paused = false;
> @@ -1136,6 +1144,12 @@ static void etm4_pause_perf(struct coresight_device *csdev)
>
>         etm4_cs_unlock(drvdata, csa);
>         etm4_disable_trace_unit(drvdata);
> +       /*
> +        * As recommended by section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        */
> +       isb();
>         etm4_cs_lock(drvdata, csa);
>
>         drvdata->paused = true;
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

