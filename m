Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B4DCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZI1PMoMgSNQ27UlN6QAasFy8RXu1wi4ErH78n3sc3I=; b=eR8YSU+baLx11I/hSkYchw8dYa
	7d1bvojKFiSfW8E0iKq9zAV6K7Xlc6lSGVF8H470gv1hoS+xyIDoZ7sGQHS1p849QHM2V4AaxTgLH
	5c1Wk1irXW5MLZqtDSUpLJQwg501AspL6QNCMrTlqXMiu7gkqw0kJvMMxiq3xi5Ec/bCKwpJdckFE
	/CHQhwxi8nay02SOjVbghS8mnZslYSHOYhPMJwoLYmG+5G/m55gU7FY/mJDiOz/wmWxv2TFbHiK/y
	GLx70QTlB3WWDFT0qQLgctPqspsKGBmPPX+KqaMZM7DKNZT/j1aDmkdU7QHlFBClUJt+ulqzBSiVV
	zTIijNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPs5-0000000AyHo-1fgs;
	Fri, 22 May 2026 13:25:01 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPs2-0000000AyGh-0J6A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:25:00 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd3eb594960so875604466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456296; x=1780061096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZI1PMoMgSNQ27UlN6QAasFy8RXu1wi4ErH78n3sc3I=;
        b=Y68V3updLtgxK0h9Z5iZQej/wq+Uqn+XH8C3p3uGY9x3d1GgU9LuCT4KOdVKGwqdFZ
         FING/YSaMtai7C/+urQtCA1RekXD/385PQCMcp+G/FnJP4BPmwx944wspU6MzKRnGIkU
         UWSTLGOv37dq5xDAnmkpHqvnHRwq+EhRxFxffaG7Dlu09LeQ56OpP3BCiUa6XtViscxM
         6k5y2DiXvb5UyB+fXP8gKQnRiVkQ/xrgAWGeEsWJCgmw7uUOtL90V9pFQ0w1bmM640BY
         w8Zl686nz7vMuUdjfOPVP52q4e97mBDfEa5NLU7xPG819RJ92pRSYyEvc63v8FEZ48+Y
         AAkg==
X-Gm-Message-State: AOJu0YyHdR/Hsb3tbK4tOv94eBTI1VNXd0uqhONDOdndvggH6ARJ0hBi
	MBHkjjhUINS68BWoD9gRpYB9FOtgibO16AXxYXhfVrwwWF2UmSL1NADq0KSTbBfdC58=
X-Gm-Gg: Acq92OE6mLvjJVB7yqoq0ij22ywNU4lhhZPpPyansBD+Mhy8euVOTZYfmsowJ0Nb0vL
	CpcyA7vu6dFh7b9S4kmjyNm5QygNNN7lG1tdyo4FuYROIOdaqEFd+JlacRuhxDsxa+FdKWXCM8y
	7Nsw6etus+HCbHV5RtOopHpDeGtrRknHL4HeViu51jWXlDedGmAESZ/2jkxiT8QWW7TSex2a7x2
	B9ceDJuq6/JxPLihsnUobxfdza9dRHVLEjUsu4jO9Jb5yCr6VVpNNDiCU0gZrXfWDCFz2rqDgtr
	6XYUcSO0qD6GL/jLs7pBmmsRwZy2xjE7ofg7MpqI90U+UNkJmNs4Q/olpNzf7LcGhdK4XZxvdId
	LzZSUfNlJJX3wDcFrnLoQsMe7A5EPEGvhgwLBPW+6JQhXJAN7aSMEU4HKVgKLyMpG5BXM1Mdp56
	nj1011bO0wHQ2Fx0K/eeHb1EjS55xNB0zTocZWqS0Lf1AnsdLF4AmG8eQoQ+f87zTMBf1GV7Zlc
	Zw5Qe818w==
X-Received: by 2002:a17:906:844b:b0:bd4:7b7c:a4b3 with SMTP id a640c23a62f3a-bdd25cee487mr180831566b.32.1779456296253;
        Fri, 22 May 2026 06:24:56 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc355d4fesm53259066b.26.2026.05.22.06.24.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:24:55 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo15102307a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:24:54 -0700 (PDT)
X-Received: by 2002:a05:6402:4348:b0:681:2472:414b with SMTP id
 4fb4d7f45d1cf-6889c41ecf2mr1807151a12.3.1779456294545; Fri, 22 May 2026
 06:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:24:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3xOe5GWDuqJ5qVKP17+46FwrwLEf5KkmxatY-mdip2w@mail.gmail.com>
X-Gm-Features: AVHnY4K0hyBTxidEUz0Cs6vOI6UOPodIYHl-4j9DmEyg4MCcdO1vyiwsRekMv5E
Message-ID: <CAMuHMdV3xOe5GWDuqJ5qVKP17+46FwrwLEf5KkmxatY-mdip2w@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: renesas: gray-hawk: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062459_762564_00A8E7AA 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, 5 May 2026 at 05:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on my Gray Hawk Single, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

