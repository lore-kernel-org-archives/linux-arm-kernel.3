Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7140C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xm7RyDlMo9WT+Jn3TQ7VCvAt66o0eLzEm8Xyy1akUbQ=; b=culqNlCv/nBN8UHapBaeVpQtk0
	RJz+8l+diSoeh4HyP3VxJLHOOz9rYCVN18LGZMItQ2i/Lf29jCU5Oa2knR2MDZ3k4tEjDEkhRgmA6
	kFvKQTPs2zkCMDknpp6/Zano6O09bKskVjMi8MEvvSxl7zud2o6jJDlTOdXSsKvi0F/gWcN2cO4g5
	fIzXtNAYEKbZ/mW1+AJuKctQxjLiNBDo+XvJNxU5obsmyV3dvTm6ZShgrcz9UOTy5Q3I47dMXo46P
	muk+ysNwj8C3Mo48SXOLU56diQNppLjwUt5xlEvjFlubCHV4KxwWD5QL0cs6RP9eLVF6EPPLZTYUO
	rzcFRNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaQi-0000000Elrm-3704;
	Wed, 06 Aug 2025 09:27:28 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaBQ-0000000EjJJ-2Z6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:11:41 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-88dc783e09fso764410241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 02:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754471499; x=1755076299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xm7RyDlMo9WT+Jn3TQ7VCvAt66o0eLzEm8Xyy1akUbQ=;
        b=hZErAXQYeOxD0i4sfPuwj68htjjg5v5sQL3SIm/VKz9J7Du8oozvXKF9KKsEyhgkWf
         xckfAMeeUflQ+Tqq0gN6W7bNYzA0G6oGaIY79pdDpCvBZmkfqvl47cqxxLG5jmPc114E
         mOvIhz0STdaDFudCGmkuLQ2TawNdf2xPmw1/jWtqKwG1Cvk2Uomwvp3WTTprAxXHpVpo
         /1R/pjUhxOVEMf9J9RbQaIwli7ex9ku19LH+WL2RGmN42n61+94OSr7hvUmGA0oo9zjN
         S+JTEnGEfVvV+f1HIGhySmJ/d+TE1qq7p/YlMWE3pz1nFXrGNtNMCtC9dEzzISz6fOW5
         BiwQ==
X-Gm-Message-State: AOJu0YxP6Bd+BRG1auruO8tQuy0nn7+GBVexYteBmSnZf7MQcb9TauVC
	bxt/i3epPDLibjIvKB2N9zigMIy+4mFPDoB4sFrShwLBpvZSQ2mgoev6BYzZ7Bao
X-Gm-Gg: ASbGncuxQhElyZSZ9OtUTJOSwNA73d8Jofgv1jywXrrfOo9+oDOVqLC271otGBAXpRx
	HiRGC7MtvcizFOI3kyNHVc2IPxLPuuk3IjD6xmkJzgR/TFHtjbdS62GVXiYrATh4EcAgoXiLOJ6
	BYX3knMSExLP0LFWDu7flQp3nRCl561NH+UWw+/WlBud1tf1xm4Rpp9a1EjxYiQEFTQY3RVuu3I
	q72YfdpLwJVF9I1Mr3TLbmnobYbd0o3cRCrR8VJwHrVTDdtXaQ+UkpdGPPFSveFOG26M9yh7MtG
	MHUFmhCfrl8uucNLHOottFRx00HwCWYCCRapFpiBd6R6WLbB3zmZy3OMlPn283EQ7YgSPFilESs
	3zG4D2fDKWBvQcRnxuLHIm1roi0sqF9eaiaaKxQ9RDmk6EOg9wIOk/Clyq2d0GMvp1l7vfGg=
X-Google-Smtp-Source: AGHT+IHrjxhN4agqdHy0CDiFzLnNGy5K8SwqoIZ4OTxoLRYTk5vNU1tWzTCPxZuuhZqPPwRP/Qx5hA==
X-Received: by 2002:a05:6102:e13:b0:4e6:d784:3f7 with SMTP id ada2fe7eead31-5037aae01f0mr648620137.15.1754471497989;
        Wed, 06 Aug 2025 02:11:37 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d46d50bsm3569865137.17.2025.08.06.02.11.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:11:37 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4fc9db52e02so1558499137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 02:11:37 -0700 (PDT)
X-Received: by 2002:a05:6102:e13:b0:4e6:d784:3f7 with SMTP id
 ada2fe7eead31-5037aae01f0mr648606137.15.1754471497092; Wed, 06 Aug 2025
 02:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:11:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
X-Gm-Features: Ac12FXyTLkQ8Fim5zNUDUaYka6FZ4b931A7kHxZ4txshhqX1WT490uS4CUxX-bc
Message-ID: <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_021140_646886_0878DD7E 
X-CRM114-Status: GOOD (  26.59  )
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

On Mon, 30 Jun 2025 at 00:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas RZ/A1 SoC.
>
> All SoC require BSC bus, PFC pin control and OSTM0 timer access during all
> stages of the boot process, those are marked using bootph-all property, and
> so is the SoC bus node which contains the PFC and OSTM IPs.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
> @@ -41,6 +41,7 @@ bsc: bus {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges = <0 0 0x18000000>;
> +               bootph-all;
>         };
>
>         cpus {
> @@ -108,6 +109,8 @@ soc {
>                 #size-cells = <1>;
>                 ranges;
>

Please drop this blank line.

> +               bootph-all;
> +
>                 L2: cache-controller@3ffff000 {
>                         compatible = "arm,pl310-cache";
>                         reg = <0x3ffff000 0x1000>;
> @@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
>                         interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>                         clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
>                         power-domains = <&cpg_clocks>;
> +                       bootph-all;

Please move this to the board-specific .dts files, where this node
is enabled.

>                         status = "disabled";
>                 };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

