Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CB7F8A160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=; b=AjRRISz69GeWRWKy6tcP7hg3fz
	c1XfvZfCBXM/jS3E10G8E1OlTGux9jW13RysAgu/DbwGyPQqjXZB6pggIfCyy74qtNzBVh/PN/Voj
	Cn/nuyFzvps5SpRo3nU7ulDfaubBPxPguv/w2zmn5thyZrVKUCaoRx6pqu7W0XSVu5I3jdEnG/3OM
	FRKuKU0TCZ/f0d6i964PLm11NCTiIiLqzDpE4Ku/KoHb2I4laMQ9Dc+FBPtcZ5fouFdqyG6AzqlW8
	08EGje1c+EMSUhfMfLPknY2BdOecKVPmAuaZowg82UaRLUlugnjIEZQzH4UUOs0veqcgN4UBMtXwn
	xD92b3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKni-00000002NYJ-0uHS;
	Thu, 16 Apr 2026 11:22:26 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKnf-00000002NXO-3QP0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:22:24 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56f65f62b4cso1437010e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338542; x=1776943342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=;
        b=GZsmk8WB/uCa/3HuT6QevQ3dSUdq7yzFZl9TVV9OswVc6n9l1k4WDyEcyMtBqJGPsn
         5BWB4PC5/dMZs9mXHTlZvekslbbzQzs9pR3YlQ5nUzNgXR9J8kxtcuR3gshjxzh3TTlG
         hLf4fyxJQJgQqQoARLw4ea5K170SrSqmx8Sn6rnBRCsFyFdKwwVJiUZqZzVGGgQrqJLH
         CPFuE9zBuqBYiQb81IYzf4Ay36JqlT0q+jktgvP3skvvNWY3GR7zk61oRAJNxPxo5Q0g
         r/6sCqChsszryXTMKndeB2gi0jIR3Dc85XjjYQlLO4Mj29Up8A0rlphcPADzl2KuPQSK
         8ong==
X-Forwarded-Encrypted: i=1; AFNElJ+VwSCs+Nl6sVpbYpF2ADi2kqUP0cvZbq4m9qDAbMlBVBo5P28rIql2bSr/D6BjIiZHwgxG/m6eLvxPuKgdso5g@lists.infradead.org
X-Gm-Message-State: AOJu0YxuXgb69z+Sc+iqkIZ8edGH+ri6qVFNarq9BLAHxQvkashok1t/
	wc0HyiGjbMWwpO76/PGnlJY7YLqnxtpICmQFUhm5sw3GGC6Hdyk8uw89a719xgIY
X-Gm-Gg: AeBDievQ6Z8VdZZWGk3v7IkvsUCkf8xhlMjjDjV5pC3iUU1VGHgQZSWBjT69PPAxp7A
	jdiZGEvRoHtkTuxNZW67zPhTxwriNiQ6J0Wqas2iG/O7gsaBT4CxibH4qgcF6wGKOz0+OcXMs8t
	WSWwP7YUGmnGVhfVlj4OPMksHWOovQQ62ZLJa8KhiLICvOgl5x3T0+mUTeA3nEPcNcHKqDpEE/2
	Tq/VkXYR71aWNhPs7LetOU2K1Um5kpItNPMgiVvoqfBnRphygaDxSACbTydfErcIh7ep2slITLw
	5Am4TitimNsHK5fdR1pqZMo6abjhlzKfxv62jhxmT+3xB3C76nP7ICGKVg7MZXTEVdYWWeaXehJ
	WHG3ef0WeNqovTWOaHTegRAysdYtXF4ynXmbqaaOH0m3LWLs+75iQupCKRJQxrZ8Nq5nZArW+UV
	BNoxGW9kmY0s5Dygi9mD8HeM0f33NTWFsBiBFKok5BfHUY1yjke7Iamz1kXmBNfjCkCDeqy00=
X-Received: by 2002:a05:6122:2896:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-56f3bcd3972mr12999030e0c.13.1776338542249;
        Thu, 16 Apr 2026 04:22:22 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89c56192sm3060713e0c.0.2026.04.16.04.22.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:22:21 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6108228a851so1353038137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+14u3AAD01hpDwfc8XGWm6LSYVs4wGeBsLHbSfrgttm+IvITOSDruL243QWN6Sa13oOp1HmMTLxBrw1zzs85Ev@lists.infradead.org
X-Received: by 2002:a05:6102:3fa2:b0:608:1b6e:f4dc with SMTP id
 ada2fe7eead31-609ff0c50e9mr11028119137.11.1776338540828; Thu, 16 Apr 2026
 04:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.045532623@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
X-Gm-Features: AQROBzCyA8BqoTVnHFn7fWQMKVWyMF2wrQlYn44P8f0X0RsdCOwGnnxui8decDA
Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_042223_863410_9E543463 
X-CRM114-Status: GOOD (  22.01  )
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

On Fri, 10 Apr 2026 at 14:19, Thomas Gleixner <tglx@kernel.org> wrote:
> Most architectures define cycles_t as unsigned long execpt:
>
>  - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
>
>  - parisc and mips define it as unsigned int
>
>    parisc has no real reason to do so as there are only a few usage sites
>    which either expand it to a 64-bit value or utilize only the lower
>    32bits.
>
>    mips has no real requirement either.
>
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h      |    2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

