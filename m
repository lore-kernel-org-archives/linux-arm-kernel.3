Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F65E1125854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHqYyMyxNQscHKqebkYfjh9WcEHBmwP9uSBnn8fEJDk=; b=S6OcRktR+eI7cEmg8rqWnwq8PX
	/Pkwu8pX+98CpgHKF2y1NHtiXLpy3DztJiyOrQTjNtcd/sOajRL2ONwqjmIG3rX/9lK1sxBgBQ2nZ
	vzfUusxKGrGI7+IlI45LcqmncA5UX0Z5vZXCnHKRhmSMYr1Uyhfm3pSwDd3MhwhotPcIVx0xxMRXT
	IBzQGCc/mKVvcqKEdUBUMWChN+AFq+e8oPWszxW4IgIntOWT25WVALGu0ilG6mVQYHZBPOU4LwLMS
	bnrYNxnHHzco1VNLw3M1yWs9svk9l1MuKe+5z/9iNqNzNtVSrV9DALijoEPmqvNA+Rfio54zVYeGl
	Kddis5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mue-0000000BxWf-0w03;
	Wed, 11 Mar 2026 17:00:00 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mub-0000000BxWK-02Lf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:59:58 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94de4f5531eso15729241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248395; x=1773853195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHqYyMyxNQscHKqebkYfjh9WcEHBmwP9uSBnn8fEJDk=;
        b=cU+9AO1lBvhCQtCvGDcwyJzIKrfuKHaoF7BdqvyPBkeK9j4nP+5vK+hJs89T4hHYvN
         Z0109ltwndI+vNZ2qadmbp6Deu9EHSxBjmqH88jihSK3nOD7+kWTJGPNb6dRZGDwf2d3
         zOSDhcuvgaAJZgjSOKGgf1iiklxCkJGPC6xvdPvHlzS1H4PkXi3/wV2THR1j7D+ggLsZ
         EH1B2VEN5iKJ+xDx48NmRdboxSZ4gcz3wdWjDG+3C/gAgy3XaHRdXlv8JpwquLb7RPVr
         MIFgoH1detGZUvZ3kjMiHpUMuzwqSRrm7s6bGThvzb0uluj+GN3N6i8deiHGNqAU2NGS
         iPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGv0pYUQitYhqLJ4E5YgOeJX1fSLK3qpW6IRlswWejYsjO5Bl/w+8rGW1Dsk6ZnIdoWLhc0Erq2XG1a7qs1Lkc@lists.infradead.org
X-Gm-Message-State: AOJu0YzH0AlbVhDiiYn5pjJ2Tr3WcKGvEhJ5ybbxAZ57WgTsVyILTj43
	ftzPJ/3Je6G3LUD61gzGA35eBRLgCqoB+gclM3SL1qo0rnKk6XqQig53k1/AqqiPD1M=
X-Gm-Gg: ATEYQzyFyOS6oeSyPE7PlAz/VSkt0xpUBgV81/7AlovnL/LM9+a9aCvohbBjkD6cHG/
	5wC27VvtUGQWbtUPJekVRekPK2IgFYQh7Xt9tYAZYIyoRW3yeNw987FuoOEUOgxDU1tea7VYlzW
	eyROtJn8pVNtTROQiGLB78iAi9Zcw/OoVOdEtMXhiPGgg0Yd3TR03aIE0AjBzUDKePOxwxkJ31Q
	blafLA9imcZAbGlDJ0dQc8qX5FYsTILVjlMd2YC+JXrEYSY54mqs0OCUTHJfCeXtW9nul1gYMCC
	XHJlSiAtaXUHMVov2TYQH9GFEAWHEJ6/6KmbX+8Os/qpO0H7KJtg9rw7eLz+EE8JNefvBfi/MGr
	Hp4SBprpaXN+iRhnNpPYZJ3WCpwQLPqDbSZ5MfLKDvaU2/jdImhW8SPhQPzfB9FyF3Nf7Csf+3P
	1Mh2ecWi8aJMpWofpHqTxjW8CN9WnhgvQivQT7p9uYjQt3XcTg6RYk0HOabHqg
X-Received: by 2002:a05:6102:b14:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-601def6651fmr1198691137.32.1773248395129;
        Wed, 11 Mar 2026 09:59:55 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deafcb04sm902787137.12.2026.03.11.09.59.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:59:54 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so25746137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVv7b0Z9njzQih60TvWHMr/VLYHTe0Kz0VWZBMieh1gwGPb4RqqOYN9OdmYVQIeaPXQhFjwVpt4T94+U6NxwAuH@lists.infradead.org
X-Received: by 2002:a05:6102:e0c:b0:5ff:a16b:93f8 with SMTP id
 ada2fe7eead31-601deaf0a5cmr1083265137.6.1773248394584; Wed, 11 Mar 2026
 09:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-9-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 17:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
X-Gm-Features: AaiRm52tcdDuztFkx9k48Wz50kutFch70oo-cU-eA7FFMTwppL_ACNeUC0TZgzs
Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095957_053176_6A525C5E 
X-CRM114-Status: GOOD (  21.89  )
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

On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -               if (!ret)
> -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;

This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
do not support the SCMI CLOCK_ATTRIBUTES command.
Before, these clocks were still instantiated, but were further unusable.
After, the whole clock driver fails to initialize, and no SCMI clocks
are available at all.

> +
> +               ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;
>         }
>
>         if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

