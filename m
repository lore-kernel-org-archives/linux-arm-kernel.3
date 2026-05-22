Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BBFCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mat1V267K7OB4qn2fEb5sEkdQiWDnrER2vm5Q5jlK3U=; b=UtPv8DvTjLACm+l3b3PlB4YjDU
	VjxeesUEH5kHWuVlv6v/72Dzag7n3V87fpSWFAD7co1vKc+tsyLObVsvKZJrdi11/KSwd12CAr1aB
	5iYE/S9A2MFgySEAi4FkQmBPib4ER0087IeLHI1qqKM1GAIR7f5XWEBvnpPD3grNFupDhV2XHdcuS
	rjS6RAgIp/Remh1DSy+2r0Yci10gcf1NcEmAiiwv/DTqWS3RuKLeqAaX18imhA5p7d3FK1S3sYACT
	fu/fzikM8WXZUPMJJ/sXqsvXSZsgWxKJL6qecOAdNXRCXxtVhNQqBTIApUYDyxzaX4w21NaVS+MHX
	jGC+OONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSC7-0000000BLIe-0AKi;
	Fri, 22 May 2026 15:53:51 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSC3-0000000BLHc-0D8W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 15:53:48 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-912475287a5so816258685a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465225; x=1780070025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mat1V267K7OB4qn2fEb5sEkdQiWDnrER2vm5Q5jlK3U=;
        b=b2TU9kNVAJhS/qixyM1RdBlRA33Bm5Rg9c1Y/z1PgJvjB6Mi/MJABiJEoCqKHRo6nu
         eyC6xPH9D47OG3YpnjL1P/XuiDiIXxYNswipmhfphXWzJkuhkJa9clI1Vig1uWDnHbq5
         XgINj6bJIBcqFkjS/PXM+WzHLAXRcWqo79sj8HOh8ea8YsE2IFhzDXJQwNEmp3ecR+Cp
         jZadhlGOpO/chxNXViH/tTDhBmM91sz1AcdCEV4aT8u8nHyADtXNZWArJ1NYmCR4P+A1
         ZYmbkJ4zo97N3juM3JuQI3t5sn4kxUbx3Crl3phQA/znFWlnfKAIRyjB7BlSOo91Eg4r
         rehQ==
X-Gm-Message-State: AOJu0YycgqwnhItp/NrrRGn43UgFSF6ktcSOPFmu7VG56FYJxEZWazZr
	pT7bvvBi32h7+comPuTsX9p4HPwMVHDAxBUfaiIJzniyes4rdKAgp2RLis2C3OoSEZI=
X-Gm-Gg: Acq92OGnD9AJKiTeEsz/PYe03b1jtkea0m4r1KOWPPhbHShso9vVN1wPtj696Icgn2E
	QLSop/vMtIwZ7bGf4rh92z2Il91aezzU6FkfSFz+rWT79k3ZbMDME96b8lZeUmiWWY9v7z9X7ko
	RCW67WDt/WufNT3B3x6RjcR+RfkU2SCYK3obn+ANBgbGeyIkKPqwCHbf/q4gifbtL4ubqzrXQBO
	fzeqv9eTc+we36dy7qgsakQR+T83s6L5LGYyJfRLfXVROZDefB6yp+iZbC6DMmgb+p5ymWd2QzW
	zscuN9ACR9Q6ojKSiKju9iZf+bbMq+8qT7VHVnnQ/GKgi0EzoXlJQ+emqCZe3nIbqoesvwF+zwc
	ejSO5vBDsHoXdp4cEksykLqwECI5/XcVoFNmWB1NxV4ekZrMP0L1vae/Dtc+HdyBoWUMMWr5A5b
	L1Y/3/l1htTq//colNM81d7YqFRev+/zQbTucvP1uawuCr/BFMcaj2va/m2sFEMQtx
X-Received: by 2002:a05:620a:1728:b0:913:e5bb:3dc1 with SMTP id af79cd13be357-914b48d55e2mr618393985a.2.1779465225012;
        Fri, 22 May 2026 08:53:45 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bb8e8d91sm155534485a.11.2026.05.22.08.53.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:53:44 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51306c36c3eso82935521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:53:44 -0700 (PDT)
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr2614239e0c.4.1779464839874; Fri, 22 May 2026
 08:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:47:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
X-Gm-Features: AVHnY4IbX-4yvb6-_QqYAmKEvB5Pw7JiMigOp3rN1DUejXGr6NhPRl6ad5aF2d4
Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r8a779md: Add support for
 R-Car M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_085347_099584_84343ABD 
X-CRM114-Status: GOOD (  25.30  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop CS2500 variant suffix
>     - Drop cells from rcar_sound ports {}
>     - Drop ehci1, ohci1, usb2_phy1
>     - Drop Salvator-X reference from commit message
>     - Split panel DTO into separate patch
>     - Drop FCNL node
>     - Add another memory node for the second 2 GiB of DRAM,
>       although the DRAM layout is patched in by U-Boot
>     - Drop FIXME from audio-clkout {}
>     - Sort nodes without unit address
>     - Rename regulators, use npmv suffix for n.m V regulators
>     - Rename x12 node to x12-clock node
>     - Add PHY compatible string
>     - Use interrupts-extended in PHY node
>     - Rename clk_multiplier/clock-generator to clock-controller
>     - Use interrupts-extended
>     - Reinstate port@0 to rsound
>     - Drop iommus from SDHI2
>     - Drop DU until it can be tested

Thanks for the update!

--- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts

> +&avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       tx-internal-delay-ps = <2000>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-id0022.1622";
> +               rxc-skew-ps = <1500>;
> +               reg = <0>;
> +               interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +               reset-assert-us = <100>;

10000?

> +               reset-deassert-us = <100>;

300?

> +       };
> +};

> +&pfc {

> +       pwm2_pins: pwm2 {
> +               groups = "pwm2_a";
> +               function = "pwm2";
> +       };

Shall I drop this while applying?

> +&pwm2 {
> +       pinctrl-0 = <&pwm2_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};

Shall I drop this while applying?

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

