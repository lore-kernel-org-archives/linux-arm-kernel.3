Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B166C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=; b=PXn6xFRABQprMfaHKWDf05ctdf
	WudMRy3rIsYumkh7QtRVr0sEgS4UhGE1BmZVS2oBFilaf55MUozuEicbJ4yUDZvOt7eQTX0a8Nj5n
	rEHMEyecDMFPwVmmheHqYXIg7dyXvD5RXPCjOr1jcRMvTOwYZXZlnI5Z69FtCc5Xt+kCsSjlTYSjY
	ABG7ZO2F2nX/v8KHegBcZgAILr7T8soB74qF7+78YWinfIWM2EgjNvgUi98wT6sSpXTUg6eXZ3BMS
	L4kSWqA71v0IqNQ6Q1fdlxmPO1NanlqcE87Sjf5SnNOn8IFEUJmWxXzOzGdJzbmJydUxGQDijDCD5
	LgxS/8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgJN-0000000DSGD-3Dsw;
	Tue, 11 Aug 2026 06:50:09 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgJC-0000000DSER-0u0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:49:59 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf9466867cso688070e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430996; x=1787035796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=Uy+Oe6sAD7jG+G+N877W0+bsBiddIJu02q5zKmOHWFEg/7kI+MT1oxZzqxexmiXQn/
         kH4sWHHABVd06ScskWKe9laL+3zlEtoTEKXJqZh8bVuHRMwT+hChwPL+jaGYLBXRXZe6
         QPBNGT3oTw+XZHQbAyr78VZv6Yd3RXu/TZrlpVm1Q5JdCt78EKzbS2fs6yPQeugOIQwN
         4ja3hnWKnDdM74XAWvuKskucWppgxfJi6mK4Kon3SjVBs3IfW3ler/xXwVHlPJYk08Kn
         UT9LId3x5E/pkB7EWNyLyobOx2oaja3YHQXfvdZYlB5zwg63VEPHQk99QweiPex4CmRW
         3ZzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcyvVK8MvFj9IENq7k72w6ZN2Nn133RnCj8gduWKmnT9paDWgCQHhPTs3HnAR+QnizwUdEgRZ5bU9riVTLUwpp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4KtWRZwTlYo2LPHzAqG2T20FREQZV1SqlcVpxiUuq5rl7inl6
	O4nioPSzhuYj5jZU61bEGSZjN0FEVsT4wiAYk2NKLtZNzxU3mx87GFyQs5eeqMdC
X-Gm-Gg: AR+sD10gT5yk85OUOGj0BjZokbKfSEfGx4ZKmi/mVqPTjYJt+SbtXoqZPZEWEy8DO3R
	933MN2ZB18OZDcfEaKBi1OQPmcp0iFXgnCgN3yGMOEmmnRRqbcGbArlICRWEJfHPRHf+u4XFRJk
	OBEqbONnMLQJULw5c5UBzpRWX4P8u2L+UT2pcCJPwQIRnqcz04DSND/mKxAsCtBPmyJg6s5Yb8g
	ZS0YysaJ+LP/yZRaKl24ZoOZq3TnQEi3wZHdMNyw3RrqAfhkaHoV5PcanUmohyt1zeu75Kzlwbw
	J+BAqqWDHQhpdiKygWsNpsdsxAw09l3Y+kq46IoI+iZAMwiuweg7oRwVOlc6ulQM3lEqI6OpyFz
	DYCc7nR6lHOrH5w/jozN4R09iQbURlIQDN4VfwnOuHHHyI9CSIhx+knPPPuh8WwDD/eLIxgDmkZ
	zG8bxqLvW0M3NPb3ZJyPXUzZ3OC9D87zTH3vwY17G8kAkUYzd1aGaHATKkrVomGI+vy270+S+/V
	2VZA9tHZ7uvsa8kdTmkiiEWikkJBI02pPNU
X-Received: by 2002:a05:6122:3a1b:b0:5bd:ddab:59a7 with SMTP id 71dfb90a1353d-5c450484261mr130662e0c.10.1786430996391;
        Mon, 10 Aug 2026 23:49:56 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c451bdd58dsm135633e0c.1.2026.08.10.23.49.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7466771f1caso824486137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpcZc+/yVlK79v/7qzsemFoJ17orzgf5NHO3roCeQK1i2Ps9bBQZKHAqfpmB5s+gsjs+SSak9qe58VDrBYh+MTy@lists.infradead.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_234958_284502_4DD9613D 
X-CRM114-Status: GOOD (  21.57  )
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

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

