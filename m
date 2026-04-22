Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2079F94CC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 04:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eH4zus6aRXEsE79ZbJPuyaxQ8dOTtTmwWEdDWPv4Bs=; b=g/RdutOXa7JaEs3WJHlS9/O5Xh
	NQ8GXjn3pqDLKhc/zb+xHMQk8vgxLunlUB54AaHPmaCqOkfOxZZLkFZkj8fZXB1H0nevNbkHGEORp
	0pBJpjNMqZfLsUg2XKm78sincy6eG3UGiVqtCD6pIemWzDzmWzTJk9k7BcB1geVLnvh0rKSffQ/KX
	2dZm9Q/Gzx4A5AnYf2MmIspfRKQP0niuWGxNBjIVxXZShyZ0XkS3uWF6071RBfdODs+YIUZfGUMoB
	ugoyl8smODlfqRH1KkozXYV+i6WmZQtWNSIYmGSKBjcPfJWyHBqywIhG/H/4DIJNU7ufwu+avPmj1
	jitfVApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFPX5-00000009arj-3V49;
	Wed, 22 Apr 2026 04:49:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFPX2-00000009arM-07En
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 04:49:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad9a9be502so31099865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 21:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1776833383; x=1777438183; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9eH4zus6aRXEsE79ZbJPuyaxQ8dOTtTmwWEdDWPv4Bs=;
        b=e2UOpHZiNxRBmv0AwePYvs18LR2uJYeA1BBntVgy/FGQbLHxZIrYml7A2eTk1TI18Q
         vcGAMSH+iQktyhLq1wjpToMEvjN94LFCIDZerJdHVLRzuRaQMqoOJPIniRngltQbcHjb
         Lgl+1gBKJxAEXIPC3/9QtYekhYWtmNvpGRF2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776833383; x=1777438183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eH4zus6aRXEsE79ZbJPuyaxQ8dOTtTmwWEdDWPv4Bs=;
        b=pJdzZ1HZt6ATnw8VaZK34SnII3EyC292C2Ob/HOnzC9GZAKF86FLEE2w65unGs/xFJ
         NnZMitResHFFrXmeKs2ueCbQx/iVk4t3P7CO3X8mSSnxiPYu+5N1V7wG6Qs443tNXTeW
         xmzy5g8UmgNJ0+VY54CDNhyW/EdHGGvLHX33OfbSMmwFdb4+cJ+s23n+nh4HfTvW5/TB
         qMScxcmbsO/+nHh9eePSD2zqwaRPnxoBSR6bNNW8VHZPWzGDcKHo9PEoQLU7G2HKJlrX
         9UIPKGaHGWUMRvN7c/Kbdb+Drdn5Ywyu9wyv1b92uYL98HF4K+dbxtOlGZgDY4cAGoq9
         8Beg==
X-Forwarded-Encrypted: i=1; AFNElJ/RyrS2pWfN4EFkuUu61r8jORdv902WMvjTJp83takuKF8k1vEmUyYJiFhmLdVr/F6LUwxMOz3x+L1WCoJWSMuh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6dIuBIJCYnPcATRfvpeEg/zUsNGsOwtxM6prOSX4COhlVMnGR
	vAIYvBe1+U6yvc1BzuGTrh20otEKpPhmxkvlyAsKPGgicaxdY1KhMdBght16JEoct1I=
X-Gm-Gg: AeBDietlcViz8vmu9u//8sYAHARggxmOqJqtLFNXihMRdetiffRtR+BdLjy7jhUZ+5u
	tYoZrgz7ISm/mLeNbcTeH/6tAr/wiQ4SJfReQAxC0cTIQOkOYeBIAp3sBUBHV61/7cBqAJ3VrY3
	wHhGdAH81WrlZrrHlKicXJxYX3rZPbUsFUQh7KOO2ry9A0a6o7f+jGaTXspFWtAfiluBwCRb6aP
	iT8ds/Vt2jDKstga1vcdJTc6k/+6XHnsJe7pRBJbQ43sOYqEn+PipAK9AT9NLnglvHV8IweG6O6
	0TNcGE5ViYLcNqJgWvuPV3JGo1a6TJ20xJZ1L3v3KtN75CF0/m3Ccgj93vRdN6EVgxUSv62aP0L
	9woZ4uluJGHSZ7CW3icAJs2XYa/GWALuIiDA6fbzFu2/M5IfRsVIdIUuOjYn+BjZbMUhKzXm1Fg
	45IKTVcMHC7Natb6DKWTgZAnMDy/9+bcMiM8OJkW3N1bj5WBUe0gOIP3861b4E7gTENmB1N23+u
	g==
X-Received: by 2002:a17:902:f9cf:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b5f9e64c18mr142624095ad.3.1776833383473;
        Tue, 21 Apr 2026 21:49:43 -0700 (PDT)
Received: from localhost (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm160434605ad.55.2026.04.21.21.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 21:49:43 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:49:40 +0900
From: Sangyun Kim <sangyun.kim@snu.ac.kr>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: atmel-tcb: Cache clock rates and mark chip as
 atomic
Message-ID: <20260422044940.tse3ek7jlv3x2dbt@nunu>
References: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
 <20260419080838.3192357-1-sangyun.kim@snu.ac.kr>
 <aedfEzeRH5tH0-Fb@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aedfEzeRH5tH0-Fb@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_214948_447119_B71C64E1 
X-CRM114-Status: GOOD (  20.51  )
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

On Tue, Apr 21, 2026 at 01:40:55 PM +0200, Uwe Kleine-König wrote:
>Hello Sangyun,

Hi Uwe,
Thanks for the review.

>
>On Sun, Apr 19, 2026 at 05:08:38PM +0900, Sangyun Kim wrote:
>> @@ -438,16 +441,33 @@ static int atmel_tcb_pwm_probe(struct platform_device *pdev)
>>  	if (err)
>>  		goto err_gclk;
>>
>> +	err = clk_rate_exclusive_get(tcbpwmc->clk);
>> +	if (err)
>> +		goto err_disable_clk;
>> +
>> +	err = clk_rate_exclusive_get(tcbpwmc->slow_clk);
>> +	if (err)
>> +		goto err_clk_unlock;
>> +
>> +	tcbpwmc->rate = clk_get_rate(tcbpwmc->clk);
>> +	tcbpwmc->slow_rate = clk_get_rate(tcbpwmc->slow_clk);
>> +
>
>Only one concern left: clk_get_rate() should only be called on enabled
>clocks. I don't know the architecture details and how expensive it is to
>have .clk enabled (or if it's enabled anyhow).
>
>If you're ok, I'd squash the following diff into your patch:

That makes sense. clk_get_rate() should indeed only be used on enabled
clocks, and your change is the simplest way to ensure correctness while
respecting the clk API constraints. I’m happy with squashing your diff
into my patch.

>
>diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
>index 1a2832f1ace2..3d30aeab507e 100644
>--- a/drivers/pwm/pwm-atmel-tcb.c
>+++ b/drivers/pwm/pwm-atmel-tcb.c
>@@ -437,13 +437,17 @@ static int atmel_tcb_pwm_probe(struct platform_device *pdev)
> 	tcbpwmc->channel = channel;
> 	tcbpwmc->width = config->counter_width;
>
>-	err = clk_prepare_enable(tcbpwmc->slow_clk);
>+	err = clk_prepare_enable(tcbpwmc->clk);
> 	if (err)
> 		goto err_gclk;
>
>+	err = clk_prepare_enable(tcbpwmc->slow_clk);
>+	if (err)
>+		goto err_disable_clk;;
>+
> 	err = clk_rate_exclusive_get(tcbpwmc->clk);
> 	if (err)
>-		goto err_disable_clk;
>+		goto err_disable_slow_clk;
>
> 	err = clk_rate_exclusive_get(tcbpwmc->slow_clk);
> 	if (err)
>@@ -469,6 +473,9 @@ static int atmel_tcb_pwm_probe(struct platform_device *pdev)
> 	clk_rate_exclusive_put(tcbpwmc->clk);
>
> err_disable_clk:
>+	clk_disable_unprepare(tcbpwmc->clk);
>+
>+err_disable_slow_clk:
> 	clk_disable_unprepare(tcbpwmc->slow_clk);
>
> err_gclk:
>@@ -492,6 +499,7 @@ static void atmel_tcb_pwm_remove(struct platform_device *pdev)
>
> 	clk_rate_exclusive_put(tcbpwmc->slow_clk);
> 	clk_rate_exclusive_put(tcbpwmc->clk);
>+	clk_disable_unprepare(tcbpwmc->clk);
> 	clk_disable_unprepare(tcbpwmc->slow_clk);
> 	clk_put(tcbpwmc->gclk);
> 	clk_put(tcbpwmc->clk);
>
>
>This has the downside that clk is kept enabled the whole driver
>lifetime, but that's the easiest way to make your fix honor the clk API
>constraints. This allows to fast-track the patch fixing the sleeping
>function called from invalid context issue and the optimisation can then
>be addressed with more time during the next development cycles.

Keeping the clock enabled for the driver lifetime is acceptable for now
to fast-track the fix, and we can revisit potential optimizations in a
follow-up patch.

Thanks again for the suggestion.

>
>Best regards
>Uwe

Best regards,
Sangyun

