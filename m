Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C3C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbDA2HJhRK7uccW2i/9tvYlKy7xqWbKNdvfK5Qlf1as=; b=TA70uJxMwvhbZzo492AJpYtIEr
	XzBegmHBrL/eUzDNHKFR9v4kI3p1EiCu76o8d1WgmNrE7E+wG5EE6ff3xJfkrSeZSUAPccsubg+ZA
	HdSpgXYHrKbrOxwFq7iNCX1r6n62YmToxvYMzfyk94Xgx12ckY00Z+22+lxVxw0LvStvg+7xfnshK
	qW17S1C9JUvH2joVynHKfqRBHQIpRkvdR/CAOnpwWDJ1SXC3sFaQ/x3LKzPZNMNTHHW5BXcN6dKUj
	vLZGO/RuYbxmMv62Vf9RF+oUKUmfEqnp7w86HLpbRLYmXZNP+1+ZSyV+CpwlNbUhB+KVB9nLYGqQh
	YmIHGLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wth1o-0000000DXP6-1djx;
	Tue, 11 Aug 2026 07:36:04 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wth1i-0000000DXOK-1CN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:36:01 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so1573099a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 00:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433757; x=1787038557;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbDA2HJhRK7uccW2i/9tvYlKy7xqWbKNdvfK5Qlf1as=;
        b=PAKgsm+1cNIKcP6Rz9hmrnmiP5CuLDlA/I7h6EamG2Su2+fVUaOEpWIXRIOetH7MOa
         WjDXA3lSBCkLpW56u7w5kLk7RryaHiAmcjFspbrF0feoQ38pcgn9XqiMDu11HcomEXM9
         K/2YV7EuaTtoRHDOYypC9QVYFMV3PBzpjpLjpcjGXVaDpVdFbG8yK4H5SOyQQa7XybBc
         m7hy5DBbJPYsiS+RGmiHkaNI+5TTQHvtFG9gdOj+dceUKOArGocHx3e2WvJmJPJBcnDN
         KFUMiMrSFyadKjxHoRSCNrsQngagxti2TcMUOVw+Au1tkGKx3BMRdjtqqbrCdM9XDsT9
         kTuQ==
X-Forwarded-Encrypted: i=1; AHgh+RruiR2NwPMb9k2rreHpwUysstguzDXLON0ZRzxm2QnwkNkwVdwPUJ3PdpXSI1vzx1PVYwLRWy6ImPppTvCiXCZ7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkzfv8FFgrtmTzaNqr+0yF97K9oibDCWwh6tmyqcfBJGULs4yZ
	6awBB8a1yLfVMnxhpbbLI08bqBTgaPnUvvwburvJ7w3h8PSnsKxUNoosNUkExZT7
X-Gm-Gg: AR+sD104Vnz6ytf0LILhb/T9Wcss+j0vZXPO3xjkTL5koNS2mIwznucHNT81kvfzXrn
	kDfi6XXs38D8k7gC1l6abr07fse+43qmvdty0rTlhNeqpcgHj48h1KsoJg7jy6bYhD9LWXjREge
	FTySq8AJ4myTpMths/nawjpQCT2PrYxrBkefOYi5/KZerl11OmqUev3VXTp9/boBZgA3/rp/5Ck
	n6+7hBcqsmJ6PErgIJCuXJSHFtpq9rFJVupDaodUBIKVIdFF7BwN1+xroZCV0DR+Pvx2cNUwrBR
	izHrmQ/B3kyWE2+S/41m0NAajLFzB14GlthOukjaSnTYUIxbZc9RARbUHiUBBrGwZbcdE1ZS30A
	nRdzqmwchDTXx0nI9NaBQFbLvOntSgDVuApkXIUgmCczNCSgu1T2zTEmPBNe6eE7AQmWRhreuZ6
	v8Vpu7o7Mrjn9gRBMOV72p+mSav/gBWGjXcQdBU97MdyzQUiD2W+1mB2sWgwfoRCzsPIrofFJsU
	JVneqddFX8/1dkUKChE35OLtA==
X-Received: by 2002:a05:6830:2696:b0:7e9:e8a6:6389 with SMTP id 46e09a7af769-7f3a817fcbemr821555a34.4.1786433756913;
        Tue, 11 Aug 2026 00:35:56 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3a7873158sm642419a34.3.2026.08.11.00.35.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:35:56 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so1658796fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 00:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpyUJMggMbLn0S4AHlQM3clNDg7SQ6GhKTubnOUYgPyypiT3CmW5D97Y85S3u2sYy8lsUEJlwlXBtqf0WXg/Bck@lists.infradead.org
X-Received: by 2002:a05:6102:4187:b0:75f:e517:ec96 with SMTP id
 ada2fe7eead31-76b51b25220mr340921137.0.1786433314033; Tue, 11 Aug 2026
 00:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260810111841.77898-1-phucduc.bui@gmail.com> <20260810121914.GA2757863@ragnatech.se>
 <CAABR9nFkFyhzQO7UGsaiSDcZ8km9=nv-2+4xWo40EG6c555Lbg@mail.gmail.com>
In-Reply-To: <CAABR9nFkFyhzQO7UGsaiSDcZ8km9=nv-2+4xWo40EG6c555Lbg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 09:28:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXR1GH7-nPmYv5i7ooB3kpqjOvY3A3vR36vYLVnv99Og@mail.gmail.com>
X-Gm-Features: AUfX_myuDTBVQLkzG41xoEKKZVf2OG_s5XczCeosvzRfItD6qUWkIcj6z1Z8K0g
Message-ID: <CAMuHMdXXR1GH7-nPmYv5i7ooB3kpqjOvY3A3vR36vYLVnv99Og@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_003600_416433_2D27BDBA 
X-CRM114-Status: GOOD (  39.50  )
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

Hi Phuc,

On Tue, 11 Aug 2026 at 04:02, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > > -     if (rcar_gen3_thermal_request_irqs(priv, pdev))
> > > +     ret = rcar_gen3_thermal_request_irqs(priv, pdev);
> > > +     if (ret == -ENXIO)
> > >               priv->ops.set_trips = NULL;
> > > +     else if (ret)
> > > +             return ret;
> >
> > I'm not sure I like this.
> >
> > The old behavior is that for any reason we can't get the optional IRQ
> > the driver still works, but without hardware trip points.
>
> Regarding the old behavior, it was handled like this:
> ------------------------------
> irq = platform_get_irq_optional(pdev, i);
>         if (irq < 0)
>                 return irq;
> ------------------------------
> As I understand it, this is essentially the behavior of
> platform_get_irq() itself:
>
> https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

Except that platform_get_irq() prints an error message, too, which
we want to suppress.

> This could be understood as rcar-gen3 not actually supporting an optional IRQ.
> If you still want to keep the old behavior, then I think we should switch to
> platform_get_irq() instead of platform_get_irq_optional(), since using
> the latter
> could give a misleading impression that rcar-gen3 supports an optional IRQ.
>
> Incidentally, I also don't quite understand why rcar-gen2 supports an
> optional IRQ
> while rcar-gen3 does not. Is there a hardware limitation on rcar-gen3
> that requires
> the IRQ to be present, or is this just a difference in the driver
> implementation?

On R-Car Gen3, thermal has an interrupt.
On R-Car Gen4, thermal does not have an interrupt, but routes this
signal to the ECM.

> Regarding the benefit of the new behavior:
>
> If rcar-gen3 actually supports an optional IRQ, I think the benefit is
> that it reflects
> the actual state of the system. It allows the developer to know that
> something went
> wrong and investigate or fix the underlying issue. In the case of
> `-EPROBE_DEFER`,
> the benefit is even clearer, as it allows the kernel to defer the
> probe and retry it later
> when the dependency becomes available.
>
> If we silently ignore the error as we do currently, the driver may
> still be able to provide
> thermal information as you mentioned. However, can we still guarantee
> the correctness
> and safety of the system?

-EPROBE_DEFER should indeed be handled correctly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

