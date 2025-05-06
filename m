Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674A8C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR5SLyEuVXCgzfFmFtCWiF+tB6qj8RmfZjai3JkMnSo=; b=BIA0HVTsMm+DqOZCklhy55fZ0w
	0HcUW313Si5ZDStZabJ/S2+mp+pgKGn3pVFwwi/b+7IgYIrPNkPc3SCfuNcHSEATeg8IJrdJeRYBe
	c/16hTFKwMBApNuA/lKW8uW16Y5Nku3dHJ6SXqBC9ysAZkocW3UqyBRKI+65AZ6NQu4+BVtG7h3qx
	r6DW8vyzBjS/tZGZZ9bHK70wTi1UQG7lErsDdMtUsSFOsGUXjEA20G8bJuHnwmmKI4GQm3k88Kcry
	8TE9QtEQ4eprWW95d+TAo3HNbT3hazxVnEbXShD6ERElGnYikQPglpWivFBJgXpZo9cBmaqpGgWPi
	vvNook8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL2W-0000000CeVt-1HuL;
	Tue, 06 May 2025 16:21:04 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHkS-0000000ByDc-21Gk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:50:13 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-877c46ab075so1061889241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535810; x=1747140610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dR5SLyEuVXCgzfFmFtCWiF+tB6qj8RmfZjai3JkMnSo=;
        b=iN8qoB5PaRA/jK0RBc2/awryP8e9qwV70w10/8Y7XqzUwdXOAq3AhZIacdTa4BGvZv
         HkpeYIJ4IiYqPB2nVfn+R3O7/ToNL6aqhvdW6MX8W7c1XtL4G2TZSHOKQn1yHkEf6Wbn
         lgy1j9CpBqktOPJfVExZjM9ZriVjJqSUgVjBTEdAiLLHQcN99+bHns0YpHIXdjuLJ6sR
         qD66FKkAHlCEqlyZ3aQ9S3on/1cRLQl1L+ykdFYUEhxTAaB2pTpOymG5uqIuaz8pkJC3
         7xa74ZHNquR1D6ss6YYh8JEFQurVeZpnUEKvfNPwZIeSSiLMTJbwD2tGPg7PFluSNrQe
         E90A==
X-Forwarded-Encrypted: i=1; AJvYcCXnrEpvUpocLjagVJLxlmAepAu1Av5aMAQLodgox9R0sMNd4MFO0kC8DlXlsgLxvAzkR7kEeg5Rk1Q7MVQir07S@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuumzrwtvf309snLjlnPPZ+rhAb29jcR0Y3uy0q3OmDgT0jYP/
	gMaEKIS34CUbAr4HZq9SoITMl+5kAMf9mwSIU9jYJBvyLqRfiv3VXx7A7yOH
X-Gm-Gg: ASbGnctOkqbjPKV2L6hy7qz/WHGtR129p5ObNKpa/DAe/ylcm8ZC+poy4p+qddPMt/c
	9WH3VMMa5FTxQI6bG+/CbRHSAIz7uQ0kFpazud/0+x60QM9K5P+D0qFg8lrC2H4xfYQ6U1WD0EH
	WybODeOgnfBtBOq5TLmTK6gv1lhpDj2/Lf881S++F52ViqbCG+MqRt0zNCumRAkdMxtCnfv5Vgg
	5f2i3HSt+tUsFUVG150TdQ6nGSLDY/sVKxp+NuRaBB1JzHtNRzwEC4PrA75hQP+FAAskZR9G0c0
	i8WddAXEHRfzD9FjC3yUI2CPkzGPtP+zr/2PKTTakwcP8hqTWfxkmOdun02Sew6K8b+SP8GZgdU
	rivU=
X-Google-Smtp-Source: AGHT+IG4c7zf86Ad3Ou8qYYIOp5Tkg+sht24zalGvQB35i73IaM1Q6XdWEKeOTxAGYtn3EinstnRUg==
X-Received: by 2002:a05:6102:15aa:b0:4c1:801e:deb2 with SMTP id ada2fe7eead31-4dc64fe2a7fmr1356403137.7.1746535809640;
        Tue, 06 May 2025 05:50:09 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b02018fsm1580523241.18.2025.05.06.05.50.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:50:08 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86dde90e7a3so1239532241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUE5Sts6bDud2bVHT8w2NjGSKGzQkdwysI5plHrg5OjlHbAIQ8DS0jGn3+RPGGpCKn6G3ouo+dm9QRS2JJgPJ4u@lists.infradead.org
X-Received: by 2002:a05:6102:330c:b0:4bb:dba6:99cd with SMTP id
 ada2fe7eead31-4dc64fe3d40mr1513226137.8.1746535808032; Tue, 06 May 2025
 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 May 2025 14:49:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbeZPCCxqqU2O3J5K38ygJb2zMbuNq7mD0CCjLEgtPxw@mail.gmail.com>
X-Gm-Features: ATxdqUGlzOJWAzAM_swPtywTszF9Wt5U6k2_C5syW23x2Dms_5uimTdgJSqV7NE
Message-ID: <CAMuHMdXbeZPCCxqqU2O3J5K38ygJb2zMbuNq7mD0CCjLEgtPxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_055012_520656_0532ADBB 
X-CRM114-Status: GOOD (  24.05  )
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

On Tue, 6 May 2025 at 12:32, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Previously, the OSTM driver's platform probe path was only enabled for
> selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
> SoCs, which encountered IRQ conflicts like:
>
>     /soc/timer@e803b000: used for clock events
>     genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
>     Failed to request irq 16 for /soc/timer@e803c000
>     renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16
>
> These issues have since been resolved by commit 37385c0772a4
> ("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
> probe"), which prevents reprobe on successfully initialized early timers.
>
> With this fix in place, there is no longer a need to restrict platform
> probing based on SoC-specific configs. This change unconditionally enables
> reprobe support for all SoCs, simplifying the logic and avoiding the need
> to update the configuration for every new Renesas SoC with OSTM.
>
> RZ/A1 and RZ/A2 remain unaffected with this change.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped config check and unconditionally enabled reprobe support for all
>   SoCs.
> - Dropped Reviewed-by tag from Geert

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Boots fine on RSK+RZA1 and RZA2MEVB.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

