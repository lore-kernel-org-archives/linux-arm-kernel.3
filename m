Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5190CFC591D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPVOVRPl3lC1zd+IB3b7f4lFe2w4mB21X3pW18EQvEQ=; b=yQdP8iaiK/zxFTPbFy3K4cmnX2
	1r2ZIa3f8n+WqlmkliRNHO4RTuafihdDsxFJNETDWVt5smRDdxn5+4eUVTG5xvbdlOvHtVFil7ree
	KQM8/e80gLUg2nVwzl3Qn3vGuCSCnkD+dV2IzQafoDFAKT/vM2xVy9iIrZHMvJjrKMC13CBjOzUHE
	ZLB2/g4SKoirzJxVr52nTgTmRwkTtyTWTUFfK+hxlzVmkNxkOj6nTRkWwlEcBvHhK82905UMV+RUA
	q41ItRPRPvi7QrhX3xz+rSGwREhF8DsqQHkPEo+COaIre1nF1gWv/mUGAFHOOfeJmD/JSJy0G71YH
	+2FFmfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXjj-00000005orP-00nR;
	Thu, 26 Feb 2026 09:32:47 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXjf-00000005oqB-2amd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:32:45 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a981f44c9so120286e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 01:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098362; x=1772703162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPVOVRPl3lC1zd+IB3b7f4lFe2w4mB21X3pW18EQvEQ=;
        b=ujwAJtsV9/OOjBYqFLhboS3d6g89BoTE/6XE82VlQ9qDgvdr931zqGM7Ew+SVi/SmW
         0UMQAYkjXrzphzWZZqcM1Fe8RuYbx5D+60cDmPJDe+6bMR7006+nEye8e0TD5ple6fRJ
         mb+ddBqcTqJv7vUpqVPNoJjNlcIKdn9LLYCd1hnp8rczPs20dkg+0awd6EW457WtdbLg
         +Pmm+9LO5fkMDRlFuRP1oWuHmenVIf+u6vVVSDvhE4/89yh4t8V4zcFbys62DiNig0vK
         Pj8lDFQpypcklHvRyDOIZMyTfKQx1sUQmVohIhylFDIL9tfpf2OrwfA3t7pVrffmc3L2
         IloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpOnv55d/3fD18as1yxXaLZrHc+BCh4yPV/M/vw3y+a2mzduXcXGR9muJQLIoZedL9HR3kPyJm4Za+AZk/MYqx@lists.infradead.org
X-Gm-Message-State: AOJu0YzraTA2jWJMm6MMl323yxnYoKPq0YcexngrKCHpgIXnR/4GqOrJ
	6f37xaW2Ii/7OwVvYERIosF4FT2EhI2X4W8lcsUxovxKgLPLMswsLdQ0Rdy2HQLt
X-Gm-Gg: ATEYQzwppOPeV5SYMNo9PnhsVo0PvZrF+6HU2OjoDbhAb8LGoaeFJWTw0l0FVEnOnIR
	11czrrqFa8Vz3zXIFSSatfVloE+V19JhqGJtE2M/0QERfXAYm0FEWKTddMpLdq5tm2RW2FErFHg
	PfKgoujRVm6OWvi1lt45m9ooENqcQ9aMWW3Pb7cBSfUtPWHRLOEd0yNrtCNvCCFdfN1x2ZYTYzH
	AWqpJEVnpOaJpEIupuR3Opm0bI5Ep6Pz1Wt/WwWoly/lYgL9q1/YkwNBEPiwskYO6O0WkZp7NMx
	FMFLlD4qSwQTUkClyeNG4xjcHiFG8VZcT3A3YPetS5eGtl+DFX/iHmGSkUfpfkIPXDa9pNYmNOb
	EJYeQSwH2+f7D8bzuoBBPfc8smzXVOTraXhEGzNDHLLP4TL1Caj1h0IlP58HDMim9hoVd10VElK
	vEkfwoeCyQjZppblIdLrpggkNWf6BinTjKAWW3MG7/ZX2Iv+Lnwldc9+04Ahuz
X-Received: by 2002:a05:6122:614b:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-568e48b306emr7588208e0c.14.1772098362106;
        Thu, 26 Feb 2026 01:32:42 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm1894513e0c.9.2026.02.26.01.32.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:32:42 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff1836b4b5so142913137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 01:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWm1h/a/wCxKILUJe9OqTz3Wxki/HJhpieOXbgm1uV7nL1soceolyo5iP94Z6OzcS8DtqzPrpYp/6PG2L5lHW+K@lists.infradead.org
X-Received: by 2002:a05:6102:38ce:b0:5ef:a346:a020 with SMTP id
 ada2fe7eead31-5feb2f081dbmr6698399137.17.1772098361695; Thu, 26 Feb 2026
 01:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20260225155409.612478-1-hugo@hugovil.com> <20260225155409.612478-4-hugo@hugovil.com>
In-Reply-To: <20260225155409.612478-4-hugo@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 10:32:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdYX9p9DfDoyMv8qEm52kY51QULkEnuxRBH2OyWyYf6g@mail.gmail.com>
X-Gm-Features: AaiRm50hY6HKs5Dg1D5Z1eUzl_ss50J6M1_HbmNyMG8PvkvLkYn610mEhS3zufM
Message-ID: <CAMuHMdVdYX9p9DfDoyMv8qEm52kY51QULkEnuxRBH2OyWyYf6g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: input: add GPIO charlieplex keypad
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com, 
	mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_013243_670637_2A60B33B 
X-CRM114-Status: GOOD (  29.40  )
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

Hi Hugo,

On Wed, 25 Feb 2026 at 16:54, Hugo Villeneuve <hugo@hugovil.com> wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Add DT bindings for GPIO charlieplex keypad.
>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/input/gpio-charlieplex-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO charlieplex keypad
> +
> +maintainers:
> +  - Hugo Villeneuve <hvilleneuve@dimonoff.com>
> +
> +description: |
> +  The charlieplex keypad supports N^2)-N different key combinations (where N is
> +  the number of lines). Key presses and releases are detected by configuring
> +  only one line as output at a time, and reading other line states. This process
> +  is repeated for each line. Diodes are required to ensure current flows in only
> +  one direction between any pair of pins.
> +  This mechanism doesn't allow to detect simultaneous key presses.

Indeed, e.g. pressing S1 and S2 simultaneously will show a ghost
S5 keypress.

> +
> +  Wiring example for 3 lines keyboard with 6 switches and 3 diodes:
> +
> +  L0  --+---------------------+----------------------+
> +        |                     |                      |
> +  L1  -------+-----------+---------------------+     |
> +        |    |           |    |                |     |
> +  L2  -------------+----------------+-----+    |     |
> +        |    |     |     |    |     |     |    |     |
> +        |    |     |     |    |     |     |    |     |
> +        |  S1 \  S2 \    |  S3 \  S4 \    |  S5 \  S6 \
> +        |    |     |     |    |     |     |    |     |
> +        |    +--+--+     |    +--+--+     |    +--+--+
> +        |       |        |       |        |       |
> +        |    D1 v        |    D2 v        |    D3 v
> +        |       - (k)    |       - (k)    |       - (k)
> +        |       |        |       |        |       |
> +        +-------+        +-------+        +-------+

Don't you need pull-down resistors on L[0-2], and/or a way to specify
in DT to enable internal poll-down on GPIO controllers that support it?
Some controllers may support internal pull-up only, but I guess that
can be handled using GPIO_ACTIVE_LOW?

> +
> +  L: GPIO line
> +  S: switch
> +  D: diode (k indicates cathode)
> +
> +allOf:
> +  - $ref: input.yaml#
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: gpio-charlieplex-keypad
> +
> +  autorepeat: true
> +
> +  debounce-delay-ms:
> +    default: 5
> +
> +  line-gpios:
> +    description:
> +      List of GPIOs used as lines. The gpio specifier for this property
> +      depends on the gpio controller to which these lines are connected.
> +
> +  linux,keymap: true
> +
> +  poll-interval: true
> +
> +  settling-time-us: true
> +
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - line-gpios
> +  - linux,keymap
> +  - poll-interval
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/input/input.h>
> +
> +    charlieplex-keypad {

"keyboard", as per Devicetree Specification Generic Names
Recommendation.

> +        compatible = "gpio-charlieplex-keypad";
> +        debounce-delay-ms = <20>;
> +        poll-interval = <5>;
> +        settling-time-us = <2>;
> +
> +        line-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH
> +                      &gpio2 26 GPIO_ACTIVE_HIGH
> +                      &gpio2 27 GPIO_ACTIVE_HIGH>;
> +
> +        /* MATRIX_KEY(output, input, key-code) */
> +        linux,keymap = <
> +            /*
> +             * According to wiring diagram above, if L1 is configured as
> +             * output and HIGH, and we detect a HIGH level on input L0,
> +             * then it means S1 is pressed: MATRIX_KEY(L1, L0, KEY...)
> +             */
> +            MATRIX_KEY(1, 0, KEY_F1) /* S1 */
> +            MATRIX_KEY(2, 0, KEY_F2) /* S2 */
> +            MATRIX_KEY(0, 1, KEY_F3) /* S3 */
> +            MATRIX_KEY(2, 1, KEY_F4) /* S4 */
> +            MATRIX_KEY(1, 2, KEY_F5) /* S5 */
> +            MATRIX_KEY(0, 2, KEY_F6) /* S6 */
> +        >;
> +    };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

