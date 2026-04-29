Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB8BFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4uRNs5kbsz3D4/C3TCXfPmMeHwT6iVUCZwC9U3W8vY=; b=WN2AhIfzUVG3IvOQAXW3yG+p5v
	g7xjBy9+5/+nOPjQ3nKiUZ0hMMYJvfLbc+vUD7L64/EDbfYq7+tGRmDgeDeH1R8ElTkhwZU9U1kEc
	Jj4Rjnm3H+JMtELwGRF/Fc1Oz2S/xcmqOl4Kcu2wbgRdKAnt6s1o64/BFx1amOtm5po22W3Bkboid
	yW2fymuUdmZ8oCPoeoD2ZdevaxXgJoFxerGWvXte4EfAsJJuqgZBa4FUrFQdf0GBj9d9DlMHM3Vv2
	/iSKOJ0viOx4TCywAypE6mJh+BDLIKmx1J8EcRU1qk+9oItUXp6kzZgwI3ZLQGK0ikFWPBu/YtFZU
	nOlsJW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI39u-00000003Whz-1pRd;
	Wed, 29 Apr 2026 11:32:50 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI39r-00000003WhQ-24mJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 11:32:48 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9568f5c81c5so1669544241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462366; x=1778067166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4uRNs5kbsz3D4/C3TCXfPmMeHwT6iVUCZwC9U3W8vY=;
        b=l8Rh3CEahnpC13aXaJluIu8FoVAWtYA0oNAIdXHNXUDn0r7M9QjvwZv69Ul1MgpnKT
         6CNd0odWzZvoA0880eyfZ7jxZHoauYWztYgeqhSfSnGe7P0wST1QQxJ1p2EHCjt6PVuB
         BUOXyPn4SYOkJ3IByDHLju9HbPKKSU72vxpN6gQYT+hXE9N8Bi1eYNpmhQS84WQI419B
         Uo4tSobjoy9Bg0qfPNthGmNDZQVfcUhM7hbQUIPynU+7LLmA6bgFPjDg2TvsiLKOKYJN
         tplyEFUrMmskc1uyFPHLonXjkb+8z3iYdNSrmS4EqYU8cmmr/rpwsIZqriU2VnUdNUp6
         oO7A==
X-Gm-Message-State: AOJu0YzTLzJof18F+b84EifHAybgQU1feK6Lst1Y1w+NgAZ69ga0zFMC
	n2L/ai1Xy3Dwrgdb8yGbj8fwXRTHHvcLMA1hx1FgpruwNEOrsLOD1h1P7AUNzA==
X-Gm-Gg: AeBDies/Bb+NXXDsii15OGpwlwzwo7buwz9RyXfZX2uGT1sB362/I8UwU+mDHZlYB0F
	LfeawAb1HvTPLjUo8fg+6wGwTotB0t6peB2yH8jwb8AWSNgnnQiaG1pL18GPGksmSyzr7j/3q6n
	F27BjPVTkHrXSF7LyRF8NUaQCipWC0zpykG01k4GBSbPo90tNkCsFgLGh7cy/+xnjGfTi61KJ/D
	GC7JYj9xBahj1x9sxiTWTNnYss7wjy4QRAmaIT1uqjmOZcmRtzByhQ1rRusau1zepqBfkqVjFO9
	eTUZn06AjtsCvpyvetB9hCxPdsk0bhZeJIi94sVupUVPCGfl902uvZ2uRX9F0el0bMMFBVlsOez
	K0fvAHBfUpV+CqVcjfpXylL0KL0BBZTFiZvuyWtLzxzGjGg/o4LlG73nz0HwjUS+ZFkO/YzhiPo
	P98MYmx2Ee2dxu0nlWtTdNJDh9oGquQgQG4v6r8YreAnTCXTBBYJbBgPwJzbGMNZ3TBRYGRvTUl
	iqwuoAagDopGA==
X-Received: by 2002:a05:6102:4245:b0:5ff:cee8:660c with SMTP id ada2fe7eead31-6280b6f1eb6mr3663209137.31.1777462365774;
        Wed, 29 Apr 2026 04:32:45 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629848683ebsm834015137.12.2026.04.29.04.32.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so3811335e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
X-Received: by 2002:a05:6122:1814:b0:56f:b2df:1791 with SMTP id
 71dfb90a1353d-573a566e6camr3723066e0c.9.1777462361508; Wed, 29 Apr 2026
 04:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:32:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
X-Gm-Features: AVHnY4LCd6eTq9wcyp22X0zMAv4PuhD2Uo4vLw9bsPU9plD7Rc1VJGY_TMU-X5Y
Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
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
X-CRM114-CacheID: sfid-20260429_043247_536579_BE48835A 
X-CRM114-Status: GOOD (  20.68  )
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

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -11,14 +11,18 @@ maintainers:
>
>  description: |
>    The CS2000-CP is an extremely versatile system clocking device that
> -  utilizes a programmable phase lock loop.
> +  utilizes a programmable phase lock loop. CP2500-CP is a compatible
> +  drop-in replacement for CP2000-CP.

While CP2000 exists in two variants (-CP and -OTP, cfr. the link below),
there is just "CP2500"[2].

>
>    Link: https://www.cirrus.com/products/cs2000/
>
>  properties:
>    compatible:
> -    enum:
> -      - cirrus,cs2000-cp
> +    oneOf:
> +      - items:
> +          - const: cirrus,cs2500-cp

cirrus,cs2500

> +          - const: cirrus,cs2000-cp
> +      - const: cirrus,cs2000-cp
>
>    clocks:
>      description:


[1] ttps://www.cirrus.com/products/cs2500

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

