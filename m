Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12ABC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0GhslFIBhV7HjGc4JTm9mx3d3RqP/ws4R5ft90HGkM=; b=WLsAeiEWF0vCGi9J3uCb/RK86H
	DEX5m1+cuvWF5oB9l/52eOiWZWjMevHh0CvXH3Jl4Eo7/shCQa6vVkCXYVgD5kW00sEctgG8d29fL
	MjyHaAQrouiErlCTof6ueQfOdwl5QBFk5uZgbKiup8EGrvSL28qvX2hnh1ACJn9egK9SBaKXFGPgI
	HqVjzce8qXH4wGLGESM4lT6sf9zHG8qlFbPuZbQJFWnRsgiJ6xyPM8oJmZcGfxPxoOhVDAruVCGGQ
	874BlYpa32V5l/xLez0v02kBowfjf4ZpZ/wWq098XNJclVIM6lUCtRx8UjmmbhjBujLz/XqkX2/VL
	5Ut9o8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjChn-00000008g8o-2gwD;
	Mon, 13 Jul 2026 09:12:03 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjChl-00000008g8M-2LmM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:02 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73a75f251a7so757202137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933920; x=1784538720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0GhslFIBhV7HjGc4JTm9mx3d3RqP/ws4R5ft90HGkM=;
        b=oEVnC1HDQMD7ud3hP6TLsWgjQAjh3vVDYEqFxDzs+qtV+UsQeMd9yBYLB7snsHcDOY
         JHxmu2aqS/Pc2WlcEm6kVMEREifouV+00xy+5MccYrkmZcPnvXYx3h4hXQltiBwIxiin
         FyPbZsmCdFgy0I6lBExrGxwYxpvEdMO8AATNWLAbmPg2Ir8GHcc8sTwx5AdDu1tbeEAo
         fnXLh20fEJxFS3SeaTjW/q5Ry+lCl5/zmD+RLguPTQ9ICi/lFPM+oEpRNvgm1gxFKt8x
         FGRw3dlJZiZXbAFaIdJTe0VRBtav+iPq1Dsy4IjXJJgS2TusX9/PP0K1jQrKAz9gjXbg
         YD3A==
X-Gm-Message-State: AOJu0Yxg9uR5+6LNV4AmA/6kto8dUu5ikF3KSanRSZriUI4t6K1Dn2dR
	+2WE5r+DllqpwtjzHyVUTtlK4zdSr8RlY8cQqsKtYkihhSAC3ALh2mEvyAdewpQ7
X-Gm-Gg: AfdE7ckUYFYOItNb6nE8PaX2L+grVBmPTxfG71T+gIkswOyPw+Zt24CR7d8ctcUNnQE
	lCazWlSWmBAsO1/eTGO/Qp4ZPmjzP0ZmihbGOqKCia0gJNpFfJ4RWi8PPSSlZmA6pt7o4bOl7RH
	NEy4QFOwPVcTOxJ7mx4S2+gboKwSJFOhzOuDYtTMBfsU0Lf+klrddxuQbtAS0bRbQogJ0O/wUWh
	OYP19rP0ofR2/u+ZQfR2ncLA7QqatH2bfXUHIGCPZANdj2g7HGbv1Rs9zgL0sG9zqDhLyAzWi01
	T9j+sU2jeMueXFtS7aiTdebHb4mFKV/2CPT0ZG37LZWxtFVDfOILmNpwE1V7ZveVvJcPJGZ5UG2
	OcsmkkxaS4F/xIFznitMergXZjape9htyw1mhzusRUAoreWqnPPP/4kFdgE3JbPT07LzSZLgWCC
	seYKusPk7VtCkR9nWBT7lJXj65vQBWFQ7SnDiDh8pppoZ8DkSXD0GxgMgU6l4hIYAM
X-Received: by 2002:a05:6102:5129:b0:633:2389:3a82 with SMTP id ada2fe7eead31-74533e86a2dmr4883394137.28.1783933919948;
        Mon, 13 Jul 2026 02:11:59 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a921a5sm8958939137.6.2026.07.13.02.11.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:11:59 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466867cso982192e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:11:58 -0700 (PDT)
X-Received: by 2002:a05:6122:4881:b0:5bd:ddab:59a7 with SMTP id
 71dfb90a1353d-5bfbf36c0c7mr4476532e0c.10.1783933918601; Mon, 13 Jul 2026
 02:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:11:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
X-Gm-Features: AUfX_mx2_XwwyHYURvzuCSrFPVED98PoIu91Ql66CsUnywXi7izjAFqbWrYeOLo
Message-ID: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_021201_615940_5602C3FD 
X-CRM114-Status: GOOD (  25.32  )
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

On Fri, 10 Jul 2026 at 18:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC.
> The inline ECC utilizes areas of DRAM for its operation, which are
> in the DRAM address range, but must not be accessed or modified.
> Describe the inline ECC carveout areas used by the DBSC5 controller
> on this hardware as reserved-memory, which must not be accessed.
> Include DRAM areas which are unprotected by ECC as well, those are
> parts of the DRAM which directly precede the ECC carveout.
>
> In case of high DRAM utilization, unless the inline ECC carveouts
> are properly reserved, Linux may use and corrupt the memory used
> by the DBSC5 DRAM controller for inline ECC, which would lead to
> the system becoming unstable.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Include the unprotected data areas as well

Thanks for the update!

With the ECC carveouts, Ironhide survives booting with "earlycon
memtest=17".

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -107,6 +107,47 @@ tee@8c400000 {
>                         reg = <0x0 0x8c400000 0x0 0x02000000>;
>                         no-map;
>                 };
> +
> +               /* DRAM controller inline ECC areas */
> +               ecc@10cccc0000 {
> +                       reg = <0x10 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@12cccc0000 {
> +                       reg = <0x12 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@14cccc0000 {
> +                       reg = <0x14 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@16cccc0000 {
> +                       reg = <0x16 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@18cccc0000 {
> +                       reg = <0x18 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@1a66660000 {
> +                       reg = <0x1a 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };
> +
> +               ecc@1c66660000 {
> +                       reg = <0x1c 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };
> +
> +               ecc@1e66660000 {
> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };

Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
start at offset 0xcccc0000 instead of 0x66660000, too.
As a bonus, we get 4.8 GiB back ;-)

>         };
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

