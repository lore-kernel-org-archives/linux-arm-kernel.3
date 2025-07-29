Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FD7C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ3Q4vacdASfiKmYfor37WZJr9osSzqsT23+mekRAPw=; b=YpXiy8JnfI54tYAUvtr1Cemivp
	VCdxIgmMTcfq3i60w7tYk16m3ZcmlWI31bOs/QT2GCcvr7Yb+cVIXNDHOVKT3i02sicxdIz5EnAL+
	Nr/48COdrCtG/4r6Z5fRGbOFJh+GkWrjK1o6L+Yvgipm8InVF3wtfdHSJJz4X0WixIZvUSTm2/kY2
	8OnDuFDQ00X2rewjvqQ1A+7t2ZRXb8INNpNygr2TNnK1tmCoYx8S7KHANOKk1dvYtkvUklXIjQA5v
	n2qEAQ5HyTrdM5GbJOINrY036/nAHeBFi0cmvoh/nxqnmpreErM+fvN42K6p6SjOTVvcyXBbtTAtn
	SrpuzgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkvq-0000000Gs8S-321h;
	Tue, 29 Jul 2025 14:03:54 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugksj-0000000GroW-1Ysr;
	Tue, 29 Jul 2025 14:00:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-75001b1bd76so3604033b3a.2;
        Tue, 29 Jul 2025 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753797640; x=1754402440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZ3Q4vacdASfiKmYfor37WZJr9osSzqsT23+mekRAPw=;
        b=MiG5n9w4dIvR8Y9CKJOpsPub24+v83K6pJQMxQO5ymMZx/wLXg5Fd3ELsGNXcYHy+t
         pyS0j4bnnAg4C/4Yn2TW/OX1+26xZwVl2vMiGjQzb23AtozdfvddewK0NA/GFVWXv3yB
         GOqweH9niq0h9wOUK1PazQqXKUytihLT1LxizuKEBBJrEoBWOszfvFHhrRUEPW71oMbC
         wVx8nNlvb5gaK9Oj+m30p3Gq1JyOPmqfEUvfiYfL70N+x3TDzZwPWmIrw3VLSpqunTTN
         smYEBPYivdj/kxMYC2vzJVsS8Knq0fb/WPi3JoINBVdzmUvrP4z6WQZslxHSZxAGqlp8
         vSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753797640; x=1754402440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ3Q4vacdASfiKmYfor37WZJr9osSzqsT23+mekRAPw=;
        b=dWZhqxvcUNkYGgdMMAfRsF4HEwea4jwszehCYAmaHnl+BInooiSbg6LL5n/sy5GWSt
         t0KAFGF9pgfRRhJUdMvKEGZTFpeZbAtwrPISTGsWOc0MHgshiDTuvHgW558zT+A4RfAV
         NR9oYHL2b5hPDPgDSjWDyCVZH/uy1e2Ttv1YcE/yQX2R6vHm4dlmHzEbP3Hrs4tMo8y+
         MhHWQG38qlmJmyvWEicQ6JSeFYoHmzJvauyhBioWzK4so3lGo7hdKu2Sr2YXZu8GoV72
         nMHUBTYKlJQTgQ7dqvoJkv56jjPumkcR4QjnNkUqN9rrk0Q0qX10bpYfEefYwFLDpuYp
         viUA==
X-Forwarded-Encrypted: i=1; AJvYcCVo+omtF82EQXqVdwH15X6Q+T5n/3quGTXaKxtsrZWkZEo5vfkAW4XE+qjKoIe14B78uRein555pf3F5zcEqGs=@lists.infradead.org, AJvYcCWmkPL3hbIOUUb4QA4QTX1XHyHj4pnFIaCvP9z92PE/gh4TqnRCH9+S1/UDY76XqPMZd1OeH2OWpWXv9RurJPuG@lists.infradead.org
X-Gm-Message-State: AOJu0YxI3EnsONo0w2wudIurFf9HYoVNnAuDjKwWB+SMv0is1YkKQEi+
	KjOP0qxsUKmWbtmPNpF7rXbts6F6N5psBv68T+6U1iz99612k8D81Z8G
X-Gm-Gg: ASbGncua7kFI5lYvO+Ycr2wMrLnZveNNi8XiaNqPrBcPN5gsma3l/JORU6nLIcLA+Sr
	jZJu3VpqFuR32OhJz3y7jAwwXYP71IS9AhtdLhxLxWDnGWZoLusniQTECUcn62uFXUnAiif4vJq
	FDiYF9hgnPG0gPetmjsDsWrg4S+eEoYF2Bygdtim9XF0zJgMdB2KimKUpPjIi67YlIegf/Zoyde
	lBJJfsr9eYUXsCQtSGuVUrd67ZjPK8kZ4FtB9U4/CsGXCP9p8nxIxhC7alBRUWD853cOP1AVl5O
	q34RftHLNzDY+1boAl9+NufzfW2nN4xbLsV0btP84oXKOx+my7v3t4UtdxW3H0VXfeS33YQs2tP
	zmlPVBMkId1k6aVO95xC/yBijXNWRv8zBPtY=
X-Google-Smtp-Source: AGHT+IFXGaCEVs7xY7OEH0Rh57cbQdgev16rb7LJALK0hoS/2THeoTBzdzd2hGNISOcI5cbGug0+vQ==
X-Received: by 2002:a05:6a00:8d1:b0:736:d297:164 with SMTP id d2e1a72fcca58-7633227ed77mr17122565b3a.1.1753797638427;
        Tue, 29 Jul 2025 07:00:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b2de3dbsm8211262b3a.113.2025.07.29.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:00:36 -0700 (PDT)
Date: Tue, 29 Jul 2025 07:00:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ao Sun <aosun718@gmail.com>
Cc: wim@linux-watchdog.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	geng.sun@transsion.com
Subject: Re: [PATCH] watchdog: mtk_wdt: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Message-ID: <2bf292d6-0f51-473c-bd44-f129a0b2a7ab@roeck-us.net>
References: <20250729035117.3170-1-aosun718@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729035117.3170-1-aosun718@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_070041_444346_5D8627D9 
X-CRM114-Status: GOOD (  17.62  )
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

On Tue, Jul 29, 2025 at 11:51:17AM +0800, Ao Sun wrote:
> During the device resume process, an interrupt storm occurs after
> interrupts are enabled, preventing the watchdog device from being
> awakened and functioning.
> 
> To ensure that the watchdog is executed before interrupts are enabled,
> Use NOIRQ_SYSTEM_SLEEP_PM_OPS().
> 
> Signed-off-by: Ao Sun <aosun718@gmail.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393f609d..5f2179dabd67 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -327,7 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
>  
>  static const struct dev_pm_ops mtk_wdt_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
> +	 SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
>  				mtk_wdt_resume)

Extra space added at beginning of line, and bad multi-line alignment.

Guenter

