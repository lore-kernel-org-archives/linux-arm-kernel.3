Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD2EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdt2ZpMbpiIZVtPHl8mFZke/+oHZ4bhDPI14xdCANR8=; b=x78iUiCU6yHHfdNVM+uH2WRdj2
	agktjzfW1NYLVtPjTsbnEBQxVSDadP90Ub+pyeOkH1sLtBH89etUBnlApynxBTJ2A2WRaDwxeLLDn
	rK3iVTKJ2eq+f9vCRjg+HCwo0FuhxMstz5gMbGotSVvJi/Bq4pEt8x1pYPy5CLRBPwRnMxLNPCX7T
	Npf20Vr7OeL6gXJpPcQYCKli1jw7X1vlULe06EaieyvTR33+Z/1OgnZxCSW8Xqh1zHUpaJQskDEp8
	Gl2zx28pFUL3GKx3wppivRNL8L++hIo4kVIhYmj+PRDqGzmYkcmrfd6D1cHI+ivOejWsPAI5gdJ5j
	P8LvK/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCid-00000008giQ-1g1n;
	Mon, 13 Jul 2026 09:12:55 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCia-00000008ggC-1hof
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:53 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96723c7151eso438876241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933971; x=1784538771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mdt2ZpMbpiIZVtPHl8mFZke/+oHZ4bhDPI14xdCANR8=;
        b=Ba5vcBcDrPP3A+ZNmKJYE1UefP4P/a+KX2dhDQB4M2PRFpDFR1AChlsCMo8Bb9CaDH
         lC+kPCg25UOI1FoDMjIgmoFnIURVOqfnSsi1D5TeyUwxYr9b2HGH4W3dbvF/VAl7OfMr
         6ASUIoH0T812DxNIu1y6vpN3rOAGKLg9ThGtT9xNZWf42XDHQmi5tPv/8g/f96plFwlu
         UqVJ9eE1u4EI7KGrkq1lzk0ZooLrAKyPQC6r6EaekmOwQ19/QHFzPQ4ALJXHlcZ+741/
         ZfQi9IdDoRRFwPPXILZ85WHRs52xeSKklcherZmDatndjXSxd466fUmFe4fbz8Vx8gmq
         uI1A==
X-Gm-Message-State: AOJu0YzUCIcvzrjPY+hfq2EDRTqBcYKcnJIDSxn2ZkmwA86sBuOkNz3C
	Jj9RLS8KQQcsc2RRwboMbpWBCO5WTM6mSGEWUHxXiFiu6H2yebCoaatwiasa4e61
X-Gm-Gg: AfdE7clL220UgiKOFgX1vx+EB6Fz3dJKxSXNswcXGutZ1EJrprFG8pAVmCLfJzIwiOB
	jNAEkpwSb8tdfg0+NfStkOk+axaWIa7Ti986cu+39yd89B8Iwc53cO9MQ7g9QOMkheawWXpeJE0
	ME7Yn1AHt6L1TBbNo+sjIvxj5hcA/DoGfeXEJeHNwJCBh4uyFj5dDXVg0qN5uuA2k4XUh/3Kjo8
	IJjps+UzlfJ2K2At2iIJGAUI5yqKZlbl2FQIOYKlPtzb62nkQcOYaTRkYCNfTpRg13hTajUGB8+
	5YiUXT7e46k7sxROOMp4v6eCl9O7lKErPrZSR6QjFkzcLBp9cZ2/+Gq0i1ZNVmqiexDt92bqaQh
	sTQOEK3NkoJGPcxcK/APETD1lCLTFASQ3EbuI90ksBJsw8sOvmkw66JwCFewrZSUl/AsD76u6a1
	q/hBm7myUyNlEVTmL9u8x3fosANtV26iVdxdZJZJMn/JKqHIxPDA==
X-Received: by 2002:a05:6102:8082:b0:738:bf0f:d0c7 with SMTP id ada2fe7eead31-74533e34122mr4760318137.25.1783933970940;
        Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ecf790293sm7553138241.0.2026.07.13.02.12.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-738b39dad22so972949137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
X-Received: by 2002:a05:6102:c11:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-74533d5836bmr4638111137.13.1783933970193; Mon, 13 Jul 2026
 02:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org> <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
In-Reply-To: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:12:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD=y++zr8sfnf9ZjW8md43ifmuytd-F7PY7r6e2p9Tbw@mail.gmail.com>
X-Gm-Features: AUfX_mwAEKuhdsHoYqlC4vkeXsOmSglqwfwCjvHk1qnz5qkYmbXVC-KIeAr11Bw
Message-ID: <CAMuHMdVD=y++zr8sfnf9ZjW8md43ifmuytd-F7PY7r6e2p9Tbw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_021252_455169_C7393E8E 
X-CRM114-Status: GOOD (  26.40  )
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

On Mon, 13 Jul 2026 at 11:11, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 10 Jul 2026 at 18:05, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > The DBSC5 DRAM controller protects DRAM content using inline ECC.
> > The inline ECC utilizes areas of DRAM for its operation, which are
> > in the DRAM address range, but must not be accessed or modified.
> > Describe the inline ECC carveout areas used by the DBSC5 controller
> > on this hardware as reserved-memory, which must not be accessed.
> > Include DRAM areas which are unprotected by ECC as well, those are
> > parts of the DRAM which directly precede the ECC carveout.
> >
> > In case of high DRAM utilization, unless the inline ECC carveouts
> > are properly reserved, Linux may use and corrupt the memory used
> > by the DBSC5 DRAM controller for inline ECC, which would lead to
> > the system becoming unstable.
> >
> > Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> > V2: Include the unprotected data areas as well
>
> Thanks for the update!
>
> With the ECC carveouts, Ironhide survives booting with "earlycon
> memtest=17".

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
(also with all offsets set to 0xcccc0000).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

