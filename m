Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A8EFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=727TQd0c+qHkAEInnHUXDqUTv77oNJr8Ljf4nlxgtUQ=; b=uVvzGREKDpR/uC8UAHQp3no3ka
	Ga6GQ4X6uhYoIcoa7RllRLoNaxipUVpfu5Q7M2cWalAxMp5m7fuV2rWV3/BHGtDi6cvScpbVGD65b
	oUaASDZlJsBgg1ZmFI2tVgOBWTspL4lMvHcoswGVzbQhcfBpY/MJCgdSZOAfY81uuLCap4AAQP9lr
	x8YAn+AKLz/NfkAqR6xFwGo2SJXifpQKPpsQWLcY6/igq7F7MZlaFEhvmW69kpMSJCR5A6i6hEpmB
	9zQDRF5eWjcGN25ZmELZgyNn2yRqr5ro+R4R6HO2smaKS6k3J8A8pmQJVEBU0JrSZ27mGEg5qA6Od
	ypplkkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1g6-00000003PHf-3fUI;
	Wed, 29 Apr 2026 09:57:58 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1g4-00000003PGO-0LzL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:57:57 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60591ade110so8553180137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456674; x=1778061474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=727TQd0c+qHkAEInnHUXDqUTv77oNJr8Ljf4nlxgtUQ=;
        b=syoRwSXxAgYMmgU3rA4/FQdhvQMpw2MjvSQv7wYcVZLfxrMNWEuZY48OhcSrEIpZbk
         HRrRSgukQ4xkJBn4ryps4/VQOUZhntnyFPKWJQDblPJqI9lzx24B0/VIggCsrJFx+IbQ
         srAfw07vIAqIubJs8xsTPXk3mAUhNZulTtx42kdpjorKkaVFyZkzvDUJ0TWua1KrxoVs
         QetkCvpswGjfTgs01AJqqGC3uBYnH2z4olsHQr3dI4u7JvOV8FA4+KKRedG2B3UmSpQc
         m3ahsZEXN41zwP89fHx0oBwV+GDSSmZCXxGded6uUEpkLdsatjBPOcjgjYU3WByvT/fC
         C/SA==
X-Gm-Message-State: AOJu0YzWwvvYxFCx+II4h49Ix32DhykBxu5TZsFFbNkPog8pNUtmCrRW
	PXvk0nCOkGhoqLxNmsauwl0Ge8tisoOcXgUh+N5rceY9qQozb27oZxBDiFZA0qszLR8=
X-Gm-Gg: AeBDievG71Wq0IhEP3YK0ssGt1c/zi+jqr2KP1D6QDs9ZIn9wW5iuGZGDR1AflZzbXQ
	4JnwVGi2ZQvC6KN4d8oT+/bgweZpI2bDKsi06PFOjseEUnjioW+7bS/BHnrV7YtOFx2XMKevjx1
	8cAM5o8wXVcNNAZAMtpSK91OQ35MRy0V8rHtddrt88Lvjav7UgnZelpmqE8spjJEeBWDDHof1Xq
	42S/6z6xz3PwNJQqjFAT7ySKR1ZF4maITaEbL4DJd/Q9V9SC/ZvQO3pHQBLCt69zHCV8SBmIXmT
	MahCrZ3gazXloXwTAKwub7Ynr6nkB0FFctkKyUoSTKCemT9VvRWfjMaNx9Ax5WoDeGI2v4nScri
	NzGDHeNJTvk3g9j9jp4/vsSQMZ60LapvUM3tYOFaC10KnKhznIRvfkN6tCaj6Z6yJxPrJT/NPG9
	pvaeNMUcz6N3UPQZncKgFdWyDfBVkOkhhMYDLc0/dmCqxRea/6fl9lrz4Ry+YsKd6uu9lANWY=
X-Received: by 2002:a05:6102:6a85:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-62926ae44f2mr1674358137.18.1777456674339;
        Wed, 29 Apr 2026 02:57:54 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629848683ebsm746164137.12.2026.04.29.02.57.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:57:51 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6058ac0ebceso7469237137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:57:51 -0700 (PDT)
X-Received: by 2002:a05:6102:598e:b0:61a:c2e2:932e with SMTP id
 ada2fe7eead31-629272e37fbmr1942655137.22.1777456671431; Wed, 29 Apr 2026
 02:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 11:57:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
X-Gm-Features: AVHnY4IlsJzOGR_PMCF4iS-Uk9l-2ljuIGS7ZCYV7JbOA-5TFuOsoyAbIfAM7Nc
Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
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
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_025756_134376_DAC26841 
X-CRM114-Status: GOOD (  23.71  )
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

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Extend the Renesas DU display bindings to support the Renesas R-Car
> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> except the HDMI port@1 is not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -42,6 +42,7 @@ properties:
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>        - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU

I am not sure you need a new compatible value: is the DU really
different than on R-Car M3-N, or does it just lack some wiring? ...

>
>    reg:
>      maxItems: 1
> @@ -890,6 +891,75 @@ allOf:
>          - reset-names
>          - renesas,vsps
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779md
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1

... E.g. you still have a module clock for DU1 (the documentation
for R-Car M3Le does not mention any changes in clocks).

> +            - description: Functional clock for DU3
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock

... E.g. the package is documented to have pin DU_DOTCLKIN1.

> +            - description: DU_DOTCLKIN3 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.3
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3

... E.g. you still have an interrupt for DU1 (the documentation
for R-Car M3Le does not mention any changes in interrupts).

> +
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.3
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1: false

Perhaps port@1 can be present (and thus required), but left unconnected
instead?

> +            port@2:
> +              description: LVDS 0
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 3
> +          maxItems: 3
> +
> +        renesas,vsps:
> +          minItems: 3
> +          maxItems: 3

Your arch/arm64/boot/dts/renesas/r8a779md.dtsi only has two entries
in renesas,cmms and renesas,vsps?

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

