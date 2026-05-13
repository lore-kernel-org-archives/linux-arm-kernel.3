Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04209CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dw4EVFD8umbNXj6ZLEY6BaqpT1xcbjLyZmag6+hF/7o=; b=xMGqthzbMQ6VEB+otZ1Hg5XQYV
	9xOQ4Epni1oxTlkVhsoX36xLrmQyU0TV/mhCCrqOjHqGSdClXF6u/24RfGAzrpspGPda4m28iBppg
	C2l0X135Ms1P/tzFAHYqf76BCwbhN0M0+f1qIRo3XFLMY/xqJ+MJQKkGGF1sQVnm+PEL3gILFMgPH
	xLUmcvtJde3OviemoKy8PUyZJqH04uB4R/O5F/CDKxOm3GcpCmBknVNw6PkC1XD2CHPqPkxEQirNP
	rl8DSf6b3JUdC0BbyAdIcQMafhX8d2qX0/NPw1UBSr3cgXUv4aVC0Hv0+FTfmCro1uiTmY2JRNp9h
	MkT1Qt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Oo-00000002crm-32Fe;
	Wed, 13 May 2026 13:13:18 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Om-00000002cqd-3FTL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:13:17 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so4006966241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677995; x=1779282795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw4EVFD8umbNXj6ZLEY6BaqpT1xcbjLyZmag6+hF/7o=;
        b=IIgmSjbOVYmnlsnOKHMrW2AvhGzOh0tP4na+veowobsVEKL1i7hHt8i34MiXQ9pWep
         xNf/lQl0fZaZtiFkP9jITWoxJbWlyq1xkhOvqfXfRrT8KVuwKj8CPjCN94rS5/VQurFK
         gqPD+zrEn/DIIib5+PjZAF4AHuLRa8Zp8CkSOJMltZDZV6UEcyjuCwGNpcURCv2IIbiP
         Rl77lWvA4tqn90HKULG5Cx58ZwgwzBbvuKcWCSmGIcw1rGi0DOy/GA/Yf3a5yyJO86KU
         ZZgTkIbQwk8OUuv8OD/6TLk38XIwFIbuaHr1K/1bxi7EJp0nz/vUruJREZTIqvMpmKU8
         G8tw==
X-Gm-Message-State: AOJu0YzKGvNcOV0AY+XoIO8oAKo7JStgVbfC7Em+GvRlaW6iRVF3Ab3K
	y8xKYR6VPXipeRj3XDw5EXAyzuYeWSOZWbBfgV6g2qHi/SqEkT5yPe5QbJqIm1uq
X-Gm-Gg: Acq92OFNXqzXSteuM8FhpgSX+bCn9jFHQGjFfOZ0cTu9HARZHfv8vamNVM144zb4RYH
	FMcJ8LC0GdYSjJlZMhW+7cO119jEmx35aEtmJ2qWCS2+WdXHtqvMcO3oUAgClbXdLYo+EyBbXKZ
	UhRzyipwVH/GF9qmNimtCAWzTcbjiJtCqNL9xfzcGs8/DUZxu3mSeyMmbbetEXy6hOvcy2Hu3dH
	LfAOQ0o5k6pBYMbkMHHvjo/zB8AdVHQFllIX09N37Hr/2Yo8qbv7W3mMk6Cgz8g8KJn3CWVwpsZ
	jV56NBqjmglfBKNtMNCh4MyvDC4xanhWG2VXxzIyqTxkNlMphcdMgJ4B//KQ0+/2FHGYH+y7jE8
	KCzSu/m5yrVM8jkCq9qP9w4iqR6TFqQn41p2MsxUfE6FgaNIi59CtnjXvCqmByi+xbXt/ne7m93
	/kkglDm5brtYI7SBdskMACRqJezj+p/MJ4BfM3Rl1T4leC/rN3ZfaI7PXYQsjz
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr3592741137.18.1778677995358;
        Wed, 13 May 2026 06:13:15 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21a274dbsm8862845241.7.2026.05.13.06.13.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:13:14 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so4006954241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:13:14 -0700 (PDT)
X-Received: by 2002:a05:6102:148d:b0:611:959c:86b with SMTP id
 ada2fe7eead31-635d1ea150cmr3550416137.16.1778677994300; Wed, 13 May 2026
 06:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
X-Gm-Features: AVHnY4IveyelRqFQvstMxxryiMS78Fp-yg20GxMmqsqgU9kR07zLUMeO9C8m-YI
Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: renesas: r8a73a4: Describe coresight on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061316_824889_1E16B16F 
X-CRM114-Status: GOOD (  19.55  )
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

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile APE6. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Note that only core 0 part of the topology is described, because the
> other cores are still not present in the DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

