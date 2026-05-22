Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EA8CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FixydBMStjIkh+xhknFyVmJmnf/BoQ9WGZ0+yOe1GDc=; b=UpZ+l2Gbs2UZsGw/1p1y5qOL/A
	RIFud6VBVvkR0ZzLLSCc3jlT6fKURM5ZzfGmnAu51sXe7EHx3UR+7somPaHZhNEAQoYRdluwFNuOQ
	RWGiKgu4oY8UNMZ79ICv2HUfD76Ut6/aidek81n75HTP58DI4MyreRr65ND2O2svD/h+/8/WisdcZ
	i6+IoFETyYmtYDKWJg9Dm/HYh3w+XUDd950aGEuMQRG0ydPFxcLWlgoh+TSCpmoX2Xli9s9l1K+o+
	eyKCSzyks0skbIWGzn/xjw1oaoj7F4p+YjHylsXUVZ/sQEX+vgx7DRRQJ/ntD8IC+ypJ0Px/L3mPb
	LLDJb1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS0n-0000000BJ5c-28Rl;
	Fri, 22 May 2026 15:42:09 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS0l-0000000BJ51-1XML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 15:42:08 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-484ba8bc89eso5108658b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464526; x=1780069326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FixydBMStjIkh+xhknFyVmJmnf/BoQ9WGZ0+yOe1GDc=;
        b=OfdzqHZULOylgJN3TvI3eJUC4H799rxCh7jD3WUfuh4l1gOhUQWCEN50/e7vUNFf9r
         Bml1IypUqszdVCtL9NwSkxJG+uxneLCDLG4y6wjerHZorLwTBzn2eYhw4Z952X5FZXGg
         ghYqCmHbrM3lZGmzmpX1VF03K/8aFo8VrzAiNHryRrWJh5JZkjAyl2NAeW0H0b0jvFr3
         KN9cW5Da1bOLL75nBq8BFZWzcAWji06fmbc2fkR7QHQVD7ykldD+u1367ZG+DRrV60Y3
         RgJWuqYw9pLZ6EFWvLvbWSsyGWiYzzMZifS+Dc7u4ldY2CoefST1JIj0lHPDGKiCAAkG
         JdPw==
X-Gm-Message-State: AOJu0YwGXbMpHOsvocvR5prsWicHcbINTFL+C5BgA3IocwCAQr3bZWYI
	MPwkrnoynz5S2mwyASARLMOKBoRhHg9bUcpFxQ+z4NqtlN7q/br6l0X0gPnFXRuvNeI=
X-Gm-Gg: Acq92OHlFoAw3x2vErlWCtrClf7t02lsxePlhyAhD8OO4sqp/WupWuhhA3rJsfg36Ht
	lRlH/8l03QIay4bbCtIz040z8KquWiZ6LEM3PcQH8RgAuo9wpK01HqBr+zPlXOLpUPbtSEiXQLj
	4xtRwTxGr5koJ2P1Db88YuwDsxRORtgZIbruP4a/ZT4yUfNt5xgYDn/QsNQUsccVx1CtxwLBYfl
	xsim6I5iafmprUDF27PtOyffcoT8dDEEc9a+g/qT/fakQlA4OUJnYyFYy8/kUIne+OkihzCj6N7
	XC9vB34LX6o6ZQA0GE79dk28Tkh+/MBkE9Q4J9cFJ11bYQld4VUtP9kDtUN19vr49OH1Zv3jHvo
	aQF6jZ60YhvikdKQpeaYkeILxtkgVkARd5+uTmKxjcJU/IxR/BcVoAoNnjukdlF8WxlQQPopaIM
	QQ7bUZJ6H61i6+vdXAKSN4iWycqXxS2RWOP9slcDep9vMwX80ibxM6wwTyMuy3
X-Received: by 2002:a05:6808:1719:b0:467:281e:3d85 with SMTP id 5614622812f47-4854a22869dmr2207323b6e.29.1779464526283;
        Fri, 22 May 2026 08:42:06 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485544af817sm694179b6e.3.2026.05.22.08.42.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:42:05 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69d7cea33b0so906638eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:42:05 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0d:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5865d70cb8amr2549460e0c.1.1779464091785; Fri, 22 May 2026
 08:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:34:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
X-Gm-Features: AVHnY4Jf1Pww2GHfOAXrLj07kMcY44kD7u6kHAIZKMSWedE81wNkTdVC9LQ0_SE
Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084207_410306_913A61A5 
X-CRM114-Status: GOOD (  20.42  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop DU until it can be tested
>     - Reinstate sdhi3, switch SDHI to dedicated M3Le compatible strings
>     - Add no-mmc DT property to SDHI3/MMC1, because MMC1 is not supported
>     - Disable ohci1, ehci1, usb2_phy1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

