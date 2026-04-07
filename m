Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3C6FEEF2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MGYxkmthcoZTlDIjYHdP2FYlzdY22eALuxJJY+zxh4=; b=3/MIsqMeMt69ITGCnRqDMNrQyt
	QffU0O0km1WH6WFLJIRpIrp9fXFn89GOoLgt6VqHX7sWvaF0aU1Z7dOCo4jddynjZjer7Q57PtMRH
	1q4NZpngc5HjzbVgR8wr1usxWF6FRQ/iE5kvVnqQ4+2Y8jfj/blr8n7fMNLDvo/ITCTJB/SJ2cnOl
	jg1tUHo2DfD/FO3Zprj/nMy91AlqVb2/3t2ik6jg3xVV4+0TOiRj0N5RQRK7UR/RKUG7VdWEzYjIL
	aRJkvcPGjMHBlZw69bp2vt5QAm4wm50bF0biO3zTvDfSAnRvBVZ131TqSWKzuqxzDLBFbxpabo71u
	QLFzFlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5CR-00000006PjV-2pTo;
	Tue, 07 Apr 2026 12:06:31 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5CP-00000006Pj5-1R4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:06:30 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso5397941e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 05:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563587; x=1776168387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MGYxkmthcoZTlDIjYHdP2FYlzdY22eALuxJJY+zxh4=;
        b=BlaMtHUDpFc/pgQyCbxDdw4aS/BrGOZ99mIaiIhfOEhl+gOUlNYtiUrVfcrAkahuqI
         v1sess6VWccAeFbuMdrhpmLHxrf4B7djK/ncPWwuiNG6eyV/YS3pG9V4mM123v+DHNtf
         CcmZOx/FMYnu088ChGnr8YynyPBNlMc5bNue6tUUZN6Fgt/VVt4e4nDEQlIl/vn/Jsqj
         BiBJxC1T32pJ/SZMenSDCCwIFgENM3LMkHzhuCOV5CjlxPbNPfvVFwNQJyarNwL4ev6Y
         yskXcOcuxqiyvqL0LfjQvBuMQcxsfEwFWCKz2uX4WshSfrkvILtvJ281Zd0sQURoLiVj
         C0OQ==
X-Gm-Message-State: AOJu0Yx6Wmx7OftMdBTURE7kvl+66G6xGk60YvPTNTYVg3+0qV812GLW
	GUOheTDA5mH0Q93RWm8YZOmUFxpxiwm4PKLlsVp07iT+y9qVR0AwuGcpHxbjb9Z5
X-Gm-Gg: AeBDiev6qRyxzk1LYdOQMgriD0E7YXgSYZIeda3bcfFMOBY0/YU9oY9l+soJbNBSfdF
	OG62uLdbl2tpAQBkEeqf2Jfg97bLiQqPbBg/BHWEEwziL10p0FOvT2HqsuZhBOqHrV4xfWGxH6D
	G1HinJaGauE83udRjJXx2qDrY34zoAf2E6RJFXiH6HlhBXNd9BwlxPCbMewk1x7+FH15WOYm0dw
	5fs+eUPInJklD2uCdsHGBMeHmQwkILy35mVuSGNPDPCk51/jY0xjfoqVnB4M1n1DIsXIwjdk6lS
	WQfPiQEettelKiQRejRS+jAs/nO7IuqspmlMPd7uTsdj7Vjpq3V6KoHdc4zlBmuLzcH7cJ5Rs+z
	qA/XMwJmDvzBv6mmtsjqMpZDFOZ+iE8vttjtNY/N6yCoveNmVmKWdsDBlCnagWC28spbgQ0Gn7m
	0bIgZotW7TGyk1ZSZdxB8nXAuulmrft3iWqX2iyS2ysTkooFZ4UaDceKZbDSENNocB
X-Received: by 2002:a05:6122:17a9:b0:56c:d6f1:d742 with SMTP id 71dfb90a1353d-56dab8f874bmr6455572e0c.8.1775563587151;
        Tue, 07 Apr 2026 05:06:27 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac4aa9sm14635320241.12.2026.04.07.05.06.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso5397912e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
X-Received: by 2002:a05:6122:4891:b0:56d:aa1f:e48a with SMTP id
 71dfb90a1353d-56dab9dd9c9mr6282392e0c.12.1775563586213; Tue, 07 Apr 2026
 05:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org> <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 14:06:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
X-Gm-Features: AQROBzBNV8VVoIPRYTToqrCO0lTdjZgYrqxs7rGtDCmLPkMo9NmWHxs4WMpk4YA
Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_050629_410392_354528C4 
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

Hi Marek,

On Sat, 28 Mar 2026 at 01:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
> @@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
>                         clock-output-names = "system", "pllc0", "pllc1",
>                                              "pllc2", "r",
>                                              "usb24s",
> -                                            "i", "zg", "b", "m1", "hp",
> -                                            "hpp", "usbp", "s", "zb", "m3",
> -                                            "cp";
> +                                            "i", "zg", "b", "m1", "ztr", "zt",
> +                                            "hp", "hpp", "usbp", "s", "zb",
> +                                            "m3", "cp";

The order of the names must match the indices in the DT bindings below.
Else consumers end up with a wrong parent clock, leading to issues
like the I2C controller driver failing to probe because its parent
clock is out of range.

>                 };
>
>                 /* Variable factor clocks (DIV6) */
> diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
> index 1b3fdb39cc426..8a8816b2ff6ac 100644
> --- a/include/dt-bindings/clock/r8a7740-clock.h
> +++ b/include/dt-bindings/clock/r8a7740-clock.h
> @@ -24,6 +24,8 @@
>  #define R8A7740_CLK_ZB         14
>  #define R8A7740_CLK_M3         15
>  #define R8A7740_CLK_CP         16
> +#define R8A7740_CLK_ZTR                17
> +#define R8A7740_CLK_ZT         18

Append at the end, good.

>
>  /* MSTP1 */
>  #define R8A7740_CLK_CEU21      28

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

