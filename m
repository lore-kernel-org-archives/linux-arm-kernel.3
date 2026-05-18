Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1BBCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BaSm/XjGBh4son00sA6wyvpPsCewbAXPb4XTuwg+MM=; b=pJh5UifTAh7WVHEhvDmB2qPOk9
	2jIG4Q7NCRO/AoyKVcvPBONroezQj07yKP6oVq87xH32TK/fVbl2lDjIvhMEd4gV9Jknr/j8xaikw
	RnohvdS9ihV4sWlGDtd4rY2KurUZad4D/YiDB/RbybNAEM2m5OUHHP6FnJbz0npC/lBZ/2+RRe51W
	9t6G7nAn4+0iCVjOKCV1p9ViGdaA3nnt5ZCkbERGm5+0chfFPe6W60qs0pP4WVv5Lp5MAzjhd3Fbv
	Y5fw0SuJ8c6yKBYQf993cLp5HxScl1NO2L/F2GnBxzk/a+M5DnPxQxE5ZQtkckXAyvW87Sqr3843P
	MuUoihMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsFI-0000000EYbS-3nF5;
	Mon, 18 May 2026 07:18:36 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsFC-0000000EYYZ-2QKr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:18:32 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so1271111241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088709; x=1779693509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BaSm/XjGBh4son00sA6wyvpPsCewbAXPb4XTuwg+MM=;
        b=itRVm98KTk1FfgUyUYcpKYeK3zZ8lcBE8CKVLmeoVY8Lfl3glHIL5gw5D0CQ7Cke82
         Mp1azyNXmBdeywFoSfaoyycvg3ilUgzDzv7MOa7VyTjz15W+igGIsxl2BzzFy7H0xjiw
         9LNefGxU4j/WDImtsj9xoPNcCVwOrRCQMRPd/hlNoS5fzupGwJqMwJVV0V0Pclbpxzhz
         +e7knIOH7zM11ehfvUoXkxOoTz3jp/y1GB6wBfr5Dh66TYWyETTpDCpIOZw/XL9nq4pm
         crB+V8HLaYcPaCgR+NgPCs4n6V8FOgYXEU6/f81Geed6f3fqNDcZcX8DX2YHcq0x5iwa
         +qBw==
X-Gm-Message-State: AOJu0Yy8wE2X823cXjVA/zWYKo0+VcOrE2GJK6eM60yrX2X+uSJ91sMi
	KvDiL/AiqQXzidgKw6WPajUhtVU06V/uvAInXFyj1xSZNfb8Og7qdWb4xnutE6qP
X-Gm-Gg: Acq92OExE5YBrYg7q+dvjEOlE1PBxSkDWG2ozEqShG/0cXcrfxP6H5218SEzIICjBP9
	f1nRpSZIl6t+xgaeAFvIAinfpzGpxtPrCe2XNty+RRIDgnII98e8I6gOPj5BkcpnS75xKRdS6Qg
	KnhM/Cu9MCHXmaKFBDov7Mei8FoaR0DFskelVPkB6U79TRS9eRoC1UJXlMs/GMflMqOkRSF4hli
	lrsyfz6HykFzRqpNqaJ2yxwCSwC21RAe/iYfwgauTThPdNf8z1PrpxEKD97Or7aIMRBjY6+aLU3
	gys4EtTNkIdxu/AfLa06IKTe/+vc0Ah6xpgXZkFmuXdSuU6NSkwnQ8Jp37AnaWoMZTlIRe84KjL
	sGax3CIAs1xuTi/ewN/khZ8Kna6HH6DTq08T8Tb5yRZnhlEzlJASgsNh7pJleg1U9N+7LXebucp
	f0TRe1qwOoogyXoQalIMruH/RkfUdXKrpAGtF8HPc0Xl48sVsnnKfQKpeRFCue
X-Received: by 2002:a05:6102:2910:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-63a3996686emr6877049137.0.1779088709093;
        Mon, 18 May 2026 00:18:29 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2fe0a69sm4322341241.13.2026.05.18.00.18.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:18:28 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-63145ce291bso1608490137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:18:28 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:632:137d:3ab with SMTP id
 ada2fe7eead31-63a403ad984mr6556785137.31.1779088707988; Mon, 18 May 2026
 00:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:18:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
X-Gm-Features: AVHnY4JKgHlqd5SaFhNLozD0z7aZ9BTFwj4ug759FlpKdE8vGqFRTa8yvRVCDYo
Message-ID: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_001830_628713_EAD5A95F 
X-CRM114-Status: GOOD (  31.42  )
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

On Sun, 17 May 2026 at 18:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fully describe all available DRAM in the DT, and describe regions which
> are not accessible because they are used by firmware in reserved-memory
> node.
>
> Replace first memory bank memory@60600000 with memory@40000000 and a
> 518 MiB long reserved-memory no-map subnode. This memory region is used
> by other cores in the system.
>
> Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
> SCP, TFA BL31 and TEE.
>
> Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
> upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
> round up to 512 kiB is slight future proofing.
>
> Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
> entire OPTEE-OS TZ protected DRAM area.
>
> Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
> any way with any new reserved-memory {} node to reserve memory areas
> used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
> those areas, which lets Linux use all of the available DRAM as it is
> described in the DT that was passed in by U-Boot, including the areas
> that are newly utilized by TFA BL31 or OPTEE-OS.
>
> In case of high DRAM utilization, unless the memory used by TFA BL31
> or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
> used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
> unresponsive.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -20,10 +20,9 @@ chosen {
>                 stdout-path = "serial0:1843200n8";
>         };
>
> -       memory@60600000 {
> +       memory@40000000 {
>                 device_type = "memory";
> -               /* first 518MiB is reserved for other purposes. */
> -               reg = <0x0 0x60600000 0x0 0x5fa00000>;
> +               reg = <0x0 0x40000000 0x0 0x80000000>;
>         };
>
>         memory@1080000000 {
> @@ -65,6 +64,36 @@ memory@1e00000000 {
>                 device_type = "memory";
>                 reg = <0x1e 0x00000000 0x1 0x00000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               /* First 518 MiB is reserved for other purposes. */
> +               firmware@40000000 {
> +                       reg = <0x0 0x40000000 0x0 0x20600000>;
> +                       no-map;
> +               };
> +
> +               /* Parameters set by IPL. */
> +               parameters@8c100000 {
> +                       reg = <0x0 0x8c100000 0x0 0x00008000>;
> +                       no-map;
> +               };
> +
> +               /* TFA BL31. */
> +               tfa-bl31@8c200000 {
> +                       reg = <0x0 0x8c200000 0x0 0x00080000>;
> +                       no-map;
> +               };
> +
> +               /* TEE TZ DRAM. */
> +               tee@8c400000 {
> +                       reg = <0x0 0x8c400000 0x0 0x02000000>;
> +                       no-map;
> +               };
> +        };

Shouldn't these reservations be added by the bootloader stack, when
passing the DTB to Linux?

>  };
>
>  &extal_clk {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

