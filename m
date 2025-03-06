Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80384C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3kxF9s0s10HtMJFdaStPVy028iaechePMj70+RdBiw=; b=lTfZNP/DRSd59twJ4XJAdF4gDr
	hrDJQ9CttyYsfvjfhsGVSa2PyaHEJ3P0Nb9MOzo/4fZsenMDewDVuc2Q/6xGOEnXbMp4bUCOdw6+w
	ite3EMWetr0sz9WGJgu7wZBSYVrrAemSWiwQKB0Rv+8MectwtFG8JsXIg+BRzTAD3veUesXTSZAZ1
	fpY0ECtq1mNRUWJ8+G4b93otIzghAejjMNOnFBT1xbMu5MsXPeFrUnGCVchn6HPj3kXdVAUnfPE0s
	xpnWzvbSTJhl3ecd/7pdsiGKis8L9tBGpShQXoJKRc1vmmwHFfpFxjs1FiXzrGZ/7rXitB6W6KvwF
	AJqlh7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9xE-0000000AreM-0hSm;
	Thu, 06 Mar 2025 12:03:56 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8rP-0000000Ahks-3QOJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:53:52 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6f74b78df93so5250997b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258430; x=1741863230; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3kxF9s0s10HtMJFdaStPVy028iaechePMj70+RdBiw=;
        b=vWQdUFGFzplBfj2S0OOycs2FtNIep9PSdvjimFvaWYE6eevyA0m/lEuhBQICtTZeC6
         zTQsGiAVoL3FLX8Ipdrhb34r/+al8gvkRkUNvKqpk/R7FV4Hi32Tuo623nzgkgOsk15x
         P5zutL2atW9bqzUs5B7lCfcQvosmCNVL1JzozxqkTG8F2z6ndrd2jksiBnTvA4kDAhuf
         DQHZtDB7/wOoGjnrG3DIzh2KTUEGH/yHcpSWBe02fXxYLzar2ETq2xjxHAFhddlmqehf
         J/K8UXhQstGCFuCQVcG/mjzEs+4rRyndnUuDIN3rRx24Rg13IwtUMAUjxXc+xMMNJRXn
         gHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258430; x=1741863230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3kxF9s0s10HtMJFdaStPVy028iaechePMj70+RdBiw=;
        b=mY8rDVu2U+B2E6zO9AbqvlsLCbH5dnsfDrJhImAYeo7Uju/KNpFh5ROSnPS2BhN7CA
         we5KQSqDFIMcoH3e1KiFTxYHA0zuPpXgtjJ6zEayvWasGc4EeZiH1PoFazpuSmwxepZy
         JN5L38Zqz7AYodAtjA0cWUHXh8XbuaJ3gFQMJI0jt/Er3OCcRNfD8n8LmdcW6pfhqy13
         3AHeq4N3XUC7Jf/vDe2wpnaDPOsAjDZwYyGbSk9T5D60mn9oRta/cAcfmk6Pq8ELDDSA
         iPLnfARcvrogRI6h6j7L3QVGqlgET/LAe2My/ZMK7Ul+mRodZ91gbIXpbW1c/HqDyWTW
         8PWg==
X-Forwarded-Encrypted: i=1; AJvYcCUmulgg+SIuX8IfNEoZSUgatgkRyfgUy376Uc3l/dHwto8IFMJfq6bqcAuX98IRcIn5K69cQBmNJEMvRCgKf15N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1S8JYDkW7e+M3Djb/XiZl+vwXSOHCo4fdZ7NT9IopTHUj0tJh
	F3+rqNxQ34uNEideYOzkXtDBCF6zhfeG3AY7qy3GLnmTwi4LFC5BR56CCNYdB/PX5bvMY03zJE0
	JLGa1Yy8HA9RwOiI9Dz8mhUL8J+ZfnZR9iRL/GQ==
X-Gm-Gg: ASbGncv1rimHQBrDLrv1KqR3mQ4RcQC0UV3bdLs8jONsRYWg9Sw0R3BUVpvxYCcykez
	/6oRc2AAUzP6f7VRBLkEJhdDFCdIOpzUZepRI77msacVRRU3GoaBOBrqGUl5t2g6kvEoU0dUQbs
	PgUrwmHL2rMBOsMIPbdkYOfCHKd2U=
X-Google-Smtp-Source: AGHT+IHveALh7pfAJxb1zQDrWysmjfRsRboRORBFdyusSPBVnlo9Xnd8mhzTm+ZPYxFyYXm4hgY3Nu9iytramRNs4y8=
X-Received: by 2002:a05:690c:64c1:b0:6fd:44a5:5b68 with SMTP id
 00721157ae682-6fda306fffbmr91783397b3.35.1741258430563; Thu, 06 Mar 2025
 02:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20250306061805.2318154-1-ping.bai@nxp.com>
In-Reply-To: <20250306061805.2318154-1-ping.bai@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 6 Mar 2025 11:53:14 +0100
X-Gm-Features: AQ5f1JoVI52ootMQgeP7Rja3_fKhyfkFzcUyyz4qn2NojBs4a97d8HfR3zSlUrg
Message-ID: <CAPDyKForY4VNZtqietDPt2FQM3p4OsaoE_oJb0PPLUAh98WsHQ@mail.gmail.com>
Subject: Re: [PATCH v3] cpuidle: psci: Init cpuidle only for present CPUs
To: Jacky Bai <ping.bai@nxp.com>
Cc: lpieralisi@kernel.org, sudeep.holla@arm.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, james.morse@arm.com, d-gole@ti.com, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, khilman@baylibre.com, 
	quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_025351_877749_7F680825 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, 6 Mar 2025 at 07:17, Jacky Bai <ping.bai@nxp.com> wrote:
>
> for_each_possible_cpu() is currently used to initialize cpuidle
> in the PSCI cpuidle driver.
>
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
>
> With nosmp or maxcpus=0, only the boot CPU is present, leading
> to the failure:
>
>   |  Failed to register cpuidle device for cpu1
>
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> PSCI cpuidle driver to ensure it only registers cpuidle devices
> for CPUs that are actually present.
>
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Is this problem specific to cpuidle-psci?

Others are using for_each_possible_cpu() when registering their cpuidle drivers.

Kind regards
Uffe

> ---
>  - v2 changes:
>   - Improve the changelog as suggested by Sudeep
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 2562dc001fc1..00117e9b33e8 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -410,7 +410,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
>         struct cpuidle_driver *drv;
>         struct cpuidle_device *dev;
>
> -       for_each_possible_cpu(cpu) {
> +       for_each_present_cpu(cpu) {
>                 ret = psci_idle_init_cpu(&pdev->dev, cpu);
>                 if (ret)
>                         goto out_fail;
> --
> 2.34.1
>

