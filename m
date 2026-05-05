Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CD6FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuHpybwjKLKCiao/+mTwUndwe61THQbcI6j1mq+muAs=; b=E4ufcT0qL2OeDYabXENkFkj7eg
	r9XMz/ZukaQDS0BvmbhWRcrIAQxOFQOAimgOqPnQUQhqSaV3sc7YlOAJ6LVTt2LTgF+i0EmTJJOnF
	GBTzgu0O4exOxGsdUVS7hJjKkpUiHQC8RusyRBOvAsdRDK+tk7n9uf44eqAA9wXBZ+z7zc2dlHjRw
	erXq9r+KC/eX2j2r45TVwcP5LSpnDwy7RZhMfuWOlfAG0fFIbVuNcKQXWVkbtVakVdLLnFx+AwMfJ
	3Tpc7nsFFK3+pMf+us8WwecPG2iX7I+wNFnfKcvFqC8l0nuU4WcClKayckyGX1fdOXez1Jx7/B9TN
	FSElcJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCZd-0000000Fk8B-3DZf;
	Tue, 05 May 2026 10:00:17 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCZa-0000000Fk7p-3DNc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:00:16 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-956995b5bb6so1271628241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975213; x=1778580013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuHpybwjKLKCiao/+mTwUndwe61THQbcI6j1mq+muAs=;
        b=NFnWjzdUkTbJt+aKDK7E/UX+LweHC62GTif7+NhAfjcJwbIkFxX9g49s4ZzduVsvT/
         6NImKq8vAf62/dSs3b2BYjgCHWanTwHKfYR9KGfpBc/vljG+/pjuxFvcLd4XV2Zg/n6t
         Z019q9XOmgZkE4iBMX3fn77Fzg1aZlKzowRQSA1kE3PKpkHpYAcbOacB6vJmAl5+KJtg
         NSOwV+eqwShA5o/TZCucvSDcmsmGOfRjXui2YCRUYl5DTVk0zEq4oGfZvlDc1OwiZRLK
         ClialKZZZbPTNN/VZdpmZUXdP8xiiY1B2iFbrBkaRKm5DOhgIWFIqlhl76dWXQ9l6W/L
         6OHA==
X-Forwarded-Encrypted: i=1; AFNElJ/SF1/lvm8ZwqFnLlKAlRKsWoe5TiUzNEFQ1cc7kOBJyRpW5h+B17fHm+RJO0/Gd/0hsvIm115xReyVuPMIYeJQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+EQzwF0el+sR7e/ywfx8twbFYq3wekR7ZtFjC35JLUtF+F5n0
	mrCoLBP8/G9/gHxEs+xT9o56VLb51GP2eGCDvKRrKnNGKgbEAgFytECi7W1OKe0O
X-Gm-Gg: AeBDiet5BIssEfe3QaHc7Z17Ndc4CfWcfO3+wqu0uNtrXDw8UVb1NxZipTvkpxQAJww
	JLAYTeatlZEbyaJb1baMOo52U0AyVBPuLBfcLXvePbIMrZy9fv+zwDZwgbBF9U+rqaAxTYoAxbs
	kI1pTUyGtciSZi6bPSI9y1cPZaNO98Batf9zF3y3yLt2eurHLC6ulL5eBLeSahOgqf2WKqR8CB0
	7RMD5gh/7M4NRlIAeE5wlgsFL+nRvKZtsptOInlemtpi//aWX2bewXc3O3DJnNxkj1p0IThKlBU
	ad+xu4o07GqywwHXXDiyB7h33BBh2uQKq2X9kV/U40N+JekHCtB4FBy3FTy3xZkkzrC4lLtVUen
	sT6uOmhkl7mOnrl7qoH4g2S3rwGZU/qRKsdOVoYdc6ptdV0pfO+2b3VqD+0ZwokXIKfgLtwWm9k
	NO7hOF0HHF7jRvjWbvPkRkbXVu7t8o0jiJp1cqDvk9a8zq9C/s40ekGe7dMFqqSKAUk0q+vT4=
X-Received: by 2002:a05:6102:598e:b0:612:c135:1b77 with SMTP id ada2fe7eead31-62d87c81d8emr5852240137.27.1777975212677;
        Tue, 05 May 2026 03:00:12 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62f49c49cdbsm2034421137.12.2026.05.05.03.00.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:00:12 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6221c7251d1so1769524137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/gPDyqTgoc6oZnZuXpmACHhMDTIE2rI6aYPTBW8+jhvwSjXO9zrq1TEnkF5lScvBwEceaftF+x2Ky7vKPDD9UU@lists.infradead.org
X-Received: by 2002:a05:6102:50a3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-62d84f62cfcmr5756702137.4.1777975211494; Tue, 05 May 2026
 03:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-14-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-14-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 11:59:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
X-Gm-Features: AVHnY4JmctwdZMNWtvo6vN96jl6lMZtYIshncwB9zfTSrryPHUlTFUdh6bCKhZs
Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_030014_875753_BAE5EA60 
X-CRM114-Status: GOOD (  25.69  )
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

Hi Cristian,

On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Clock rates are guaranteed to be returned in ascending order for SCMI clock
> protocol versions greater than 1.0: in such a case, use bounded iterators
> to minimize the number of message exchanges needed to discover min and max
> rate.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> +static int
> +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> +                             u32 clk_id, struct clock_info *cinfo)
> +{
> +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> +       int ret;
> +
> +       /*
> +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> +        * be discovered in ascending order, lazy enumeration cannot be use for
> +        * SCMI Clock v1.0 protocol.
> +        */
> +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> +       else
> +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> +
> +       if (ret)
> +               return ret;
> +
> +       clkd->info.min_rate = clkd->rates[RATE_MIN];
>         if (!clkd->rate_discrete) {
>                 clkd->info.max_rate = clkd->rates[RATE_MAX];
>                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
>                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
>                         clkd->rates[RATE_STEP]);
>         } else {
> -               sort(clkd->rates, clkd->num_rates,
> -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> +                       clkd->info.name, clkd->rate_discrete,
> +                       clkd->info.min_rate, clkd->info.max_rate);

Printing clkd->rate_discrete is futile, as it is always 1.
It would be more useful to print clkd->r.num_rates instead, although
that may still be lower than the actual value, due to lazy handling.

>         }
> -       clkd->info.min_rate = clkd->rates[RATE_MIN];
>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

