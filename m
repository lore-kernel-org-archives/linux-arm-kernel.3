Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E285CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAlUGw/HNtzbgT6oAPTSPOgW3T+XEEHWpdGiqyY+DBc=; b=sQ8E8eLjFggxIG9jsxyAyudOaS
	gAOUge8/ZgFWD4OiQRJHnMdR17jb95wiz2QKS3IwDLZI9pSAeUMnIW0XEIyoXF5/RFTH2MH8KGpjD
	XOB005RqYuU7PsG4MBkbjSb6v8D5ohYVbczUL8AZ3FVXCGEgqzICr4nSf6vVJRZfnkeF+/8HJPlEa
	O3AUrTKoIpVP5pnvLhAqR34HR+lXc+uK1tGKcgWjp4mSyrrJF237DEJD4Z+mPYQ9X+Go6nQQvKeb/
	Wva/GoaXEZOZQ4KFzqPFInvkxScgohe34Pdd5CCYURkBbdSzPnZ+33YsvkgozKf4tVGqUUPCDmWpa
	XIqEqTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPmG-0000000Avzd-1Fsi;
	Fri, 22 May 2026 13:19:00 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPmC-0000000AvyM-3VSk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:18:59 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd56d108454so1387805566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455934; x=1780060734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAlUGw/HNtzbgT6oAPTSPOgW3T+XEEHWpdGiqyY+DBc=;
        b=sHRO1Y5g8000SVr1+Z+neq/bV0DAhXizo9+R8yPV+yCbGJQXS6EfmcyEinlMm9oqnj
         SawgZ6GaaR1rkgPfUjBX0likjK5c/VV7gWiLWNCo6h7vRwaX1Uf+K7wyoOf9o8YZQGCJ
         mwTH1qOl6KvTcdAQkgo/AwD1t/AfjO8fI8pW4D+RacHua5KnMhbUOvo/B2QM2xTUghKY
         Hej82iVzhniFWOAnGibOaM+RxvqE21VRy0MdoH9yyxT7ONbqSkEjYRC9d6oLC0GdBo1g
         9KmhAUbz7z8Bh4uhJ80GaA6x9HTeIrDYHVymSZfJKEuSEeZ9WT4iKYlPBo85E2/skuFh
         3y5A==
X-Gm-Message-State: AOJu0Yw9uflgPn7rZRqfw3spXEHfKgezPBXTZo3D1A0VpUbx0kFRsTWB
	568zk+Z2ruURI7SIjMnOFqAsh8bXXVZFULxl7V4Zzi+fiEznqJitZ0ESAysuITCBszE=
X-Gm-Gg: Acq92OHbzlKDlK4RUG7wUw8M9Gr3MQc6aROI5MFKMKyCvLUPkBL7THs7jInI1gPErvV
	/mD9eJJBwKzQJw2u+zAu9UlqA7WjGYnFzrqtSjDrFxNMajRqZK79xIdGUAM+VIxBEBgK22acIXp
	0/8qdAK5UODuNKCCQaR7FDVmtmf5BDWQQ1mxbCKUxzLyQZt8TDMQqtOL0SZ+ynBVHfkcweaWXx5
	cTh7oZlacvCvTjQyrFLWxMnnp/0a9rdF0fdlZGAtORddA6/eq0G02LuAhXhRD/tMoP2TYWoIcsU
	uhUBlGMSQk863+xXMzkX4o9IsJYYMsw7Gle/2Gxe32ti1t150fRFRO3SjefwH1S6b4LhXlRYO4t
	rLV0eL/7jnDHtWo6qHQeFqfoFFy2UHBkiAl8aQXQvZVdDHo4fsPnmR6GPchdZeBSvJXuCJgD3Wp
	4bDrKgiN7LWjV3G/QY2z/qoYxo/Qf6Emqlr4NHWh4gE8cyhbLJYiebqG2l6pnnto9uRjmRE5g=
X-Received: by 2002:a17:907:75ef:b0:bda:17d0:cf02 with SMTP id a640c23a62f3a-bdd23af1a1bmr193609366b.19.1779455934091;
        Fri, 22 May 2026 06:18:54 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc314c8absm54497466b.22.2026.05.22.06.18.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:18:53 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so6995963a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:18:52 -0700 (PDT)
X-Received: by 2002:a05:6402:42cc:b0:683:75ec:c17c with SMTP id
 4fb4d7f45d1cf-6889c4464afmr2034627a12.10.1779455931829; Fri, 22 May 2026
 06:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:18:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
X-Gm-Features: AVHnY4I_gegiQNXLEYR8j1H8kUfrINmIpRVRu3Rg4C4CjWJrdAfVaY1saWPkdfg
Message-ID: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Subject: Re: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_061856_891065_EB21C61B 
X-CRM114-Status: GOOD (  23.27  )
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

Hi Marek,

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This is the same patch for various boards, details are below.
> The discussion that prompted this patchset is at [0].

Thanks for your series!

> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:

DS00002117K page 62 FIGURE 7-5

(and page 74 on the older document I had ;-)

> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply

page 62 TABLE 7-4

> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> The Gray Hawk patch in this series depends on [2].
>
> [0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

This link leads to the KSZ9031MNX part. Correct link is:

https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf

> [2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/

Shall I do the big search-and-replace while applying?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

