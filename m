Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E6CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYIYCIsBtJDK4jXwWO2JUdTXoGJvuUmgU1KwSHdoXoc=; b=X8apgSWlBJqfZi4uCjzoONcP1D
	jo/nd1gyiFlvPMCtWQffyNwY7v5zXPSndQyxEsXU5w7o9xTq5vKBZMUlVrwmdKzEVoBLtm739SDVA
	jbX/oSQ+DPxvN4b9ZzxoT9u+G41IuD9nF7X2PRxBvw105VBjCgSvcWdefLCUjP0iaTleb2+OVPqor
	WQPBqX0DaH7BhaUa0Ln3G3jzb8hc5RcqwZUF4MQxNrNXGKIOcOwMEoH+jfG8EZ59GicbnmJjAiAaD
	8yFMW5fUVIztq6Jx2K7DXZbu+IhCbs8kvXQg0BV3YYwlH1U2tiGPOyg+QtpyrhE+6UiKHgEFWYyhE
	lai7HXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3qY-00000003YyF-2hqF;
	Wed, 29 Apr 2026 12:16:54 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3qV-00000003Yxt-3qkq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 12:16:53 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba61a0a2d26so1669498866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465010; x=1778069810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYIYCIsBtJDK4jXwWO2JUdTXoGJvuUmgU1KwSHdoXoc=;
        b=oq+KD2q6iF1GrmL+MZXFjmlA5EdcSB2qVu1YEp0YgloAYzKRUCimckjY5h26SyNKvN
         m1WLcFDfhONaYlrD7Ut3AcMnjLbRU1I6YzjzTVZ1JKEELvWLvjh5MVzE0O2yoln1c4bL
         68ZYU0+FiPSOSjXm0Tr2dyJlUFCIBjFFmutJhAMlHbivKs4Hh47PJzGoY2k7aat2xF4V
         XZl+7BeSzKCQ4OBiSO0dnZzAFxGpx6cnMkqICB8p/qti0q4t+glXIVHNzuyu7WtiLUl4
         wdfwYBJzh7IGAqSkG50AZOmx63EaX6GC7VM/JzYd6lzuwF/NKfVACvTnnk3l4UCkMfuh
         2EvQ==
X-Gm-Message-State: AOJu0Yzxu61ouF3kYXGDlKT22tORM7894+lpnRFcIhp2f1arJEgCTCS6
	/dLICqVbR1GDQ14SdzzHCfUoIS8Upj5sqJX7XF/AdQU6OFfoWF07WF09WgL3BzT3pCk=
X-Gm-Gg: AeBDiesFpYbp+6h3eU+Fpw6Wi1koNNnS+4OnC2NyeyAD9P/+cDX5EOR77TQI+QptZRl
	qJblkNvUZ+uY9iSzyb6VhKTZJipSK7gnZuXMd7VdqbQ09QTP0XHpvVc2i7ZZa35PAoStnYBleL9
	dbm/8k6r/33xD6DSQvk1yM1MTnaJ8GFkGfXAzdE9Oq/yI4m0ZYv5RDv4dIP92D9o/Z5GtE8dzAB
	R+fql97Ipw3uOMDoazxwrPYcXeY6KtbbCQfxRrafVqzvTL7uHeD1CQXr7qsAP/sUxSc6Db9Y5/0
	bwL013s0qxB2OBZj6dRUmznWj8H57LfuGgpXRnwY0DOPc2103Eh4/4khMCQM5QMZ/yCqU0n//ac
	iDgX6q1nVWySQ+TS+QD554NY7cLjLLfE4+pw+6bdEE22K9NMdrEnoCspyUs6BRcUsdCjsRqtVPi
	fH6IC2ineQK/kG5wT/Y+uu12UunpUEn/vsCl1a4ws4uh7topJePK2py/pPFHQIhPcm3Kazbsw=
X-Received: by 2002:a17:907:874b:b0:ba6:8a6c:f91d with SMTP id a640c23a62f3a-bb804537cffmr441346366b.36.1777465009193;
        Wed, 29 Apr 2026 05:16:49 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb981f3fb74sm86259966b.27.2026.04.29.05.16.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 05:16:48 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so17484255a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 05:16:47 -0700 (PDT)
X-Received: by 2002:a05:6402:2b8d:b0:676:9c6d:7448 with SMTP id
 4fb4d7f45d1cf-679bb0969d8mr3789280a12.22.1777465006980; Wed, 29 Apr 2026
 05:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 14:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
X-Gm-Features: AVHnY4J_eIQauePt3-ENfJ0vvJTMmNJqoEy-L_5paGzJVO5LgQ5rAyTsYv0XxdM
Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_051652_010929_D12FE830 
X-CRM114-Status: GOOD (  26.20  )
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

CC wsa

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car M3Le (R8A779MD) SoC
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a77965.dtsi"
> +
> +/ {
> +       compatible = "renesas,r8a779md", "renesas,r8a77965";
> +};
> +
> +/delete-node/ &csi20;
> +/delete-node/ &drif00;
> +/delete-node/ &drif01;
> +/delete-node/ &drif10;
> +/delete-node/ &drif11;
> +/delete-node/ &drif20;
> +/delete-node/ &drif21;
> +/delete-node/ &drif30;
> +/delete-node/ &drif31;
> +/delete-node/ &hdmi0;
> +/delete-node/ &mlp;
> +/delete-node/ &pciec1;
> +/delete-node/ &sata;
> +/delete-node/ &sdhi3;

I am not sure disabling sdhi3 is correct.
The R-Car M3Le documentation says:

   "M3Le does not support MMC1.
    M3Le supports one MMC channel (MMC0) only.
    SD3 is used only for SDHI and is not used for MMC.
    M3Le does not support MMC HS400 class transfer rate."

The main R-Car Gen3 documentation says:

   "This LSI has four SD card interfaces (SDHI0 to SDHI3), two of
    which can also be used as MMC interfaces (SDHI2 and SDHI3)."

So while MMC1 is indeed sdhi3, sdhi3 can still be used in SD mode?
Do we need a new compatible value, as R-Car M3Le does not support HS400?

> +/delete-node/ &usb3_peri0;
> +/delete-node/ &usb3_phy0;
> +/delete-node/ &vin0csi20;
> +/delete-node/ &vin1csi20;
> +/delete-node/ &vin2csi20;
> +/delete-node/ &vin3csi20;
> +/delete-node/ &vin4csi20;
> +/delete-node/ &vin5csi20;
> +/delete-node/ &vin6csi20;
> +/delete-node/ &vin7csi20;
> +/delete-node/ &xhci0;

Shouldn't the following be disabled, too?
  - ohci1, ehci1, and usb2_phy1,
  - cmm1 and vspd1 (cfr. DU below).

> +
> +&du {
> +       compatible = "renesas,du-r8a779md";

Assuming the DU needs a new compatible value...

> +       renesas,cmms = <&cmm0>, <&cmm3>;
> +       renesas,vsps = <&vspd0 0>, <&vspd1 0>;

Shouldn't this be

    renesas,vsps = <&vspd0 0>, <&vspd0 1>;

? DU1 is unused, but DU3 is used.

> +
> +       ports {
> +               /delete-node/ port@1;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

