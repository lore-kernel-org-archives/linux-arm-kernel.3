Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB5B109C022
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7isK/Dbl65EI3Rm86FPt2M8EyGlg1PW9pqCn5jlwq8k=; b=Itv4DS1yOnKkWO7ZirlxqnDuG7
	QxveRpSO9NgYyyLl3uDZvjla0OSk+IcmPAX5qyo2SJiNpYV8GbpdTDCVTyfgd91qFnzKEoyhwdq+9
	iK4hd6Ra55TMNyZ0hTnJglCpy9f9kijznFt+T9W4ZskZRY+vDZ4JQcRkNVTshAbK396zC7wir1vtU
	ZcK4eaFWg4hI+ayOzO/Vs+H616wtqu5K0C9K1juVjl56inTEFyG8z1b3Xy33BZ/SpkdXuEHFUNVyX
	Nu+9fbq/uBOGdoctiQh/PYDqvfQKz0PMCIH8bscGKtqJ6Dib6lsnFhgNKAKNVLTK2YKzRmsL4HAb6
	fdtgkn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEw-00000003bao-2Ijw;
	Wed, 25 Mar 2026 14:29:46 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEq-00000003bWy-2RoM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:29:44 +0000
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ffa277c115so4357256137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448979; x=1775053779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7isK/Dbl65EI3Rm86FPt2M8EyGlg1PW9pqCn5jlwq8k=;
        b=Ks16UIuJerk+UiMcVu7+glyZNnE25EyWvPESLVIzVmhAGjl5RW7GztEGf6imWrtmsy
         //eXAgWgq9ZNr6QCEA9xCbYUUFfC/AiurlPSL2FxeRbteB7DryFcqZkqReFQsKCubhyq
         zJ3qyAxua/qw0A8mu90ANeJTQqTdjsD8twvCdXrfMKw4uN6ziPT9x5z5Q198TXaO0oZq
         kJn7qm/HfDtuyk8r//TDgflwzuRA7NATdKjnwFXgdWRWQth5L3TpseivQwnFG0YY8Rcn
         /bnx6lrLnqRjec5yPsv5oBaWQhPUQWA2W8FAYw8AGILphlgXF6SKZoPl5pIxrqHGoL8l
         FBlw==
X-Gm-Message-State: AOJu0YxSrZIbvSv/AaU8hyA2UA8E1ra6t6x5REPbNmdAw8W2oO5uzWPE
	NLdHl13gqAvRsERSXL3uhIe7OynAuVjUS7kXKnvMeve6vpCzWqmvTOqH9srrSLhb2Zw=
X-Gm-Gg: ATEYQzwyHakItWlSvcoAODnDPrfH9iXpMt51V6TayrXMtYnMSHyDCAh8L9oNuIQQw1X
	pUHhSbqw8c4yNoHIIchR1s5lhy+JiieAItK43kTR0QXk1zdzCf4c0FZcITn2l1taOL7eML7YKpv
	NiGC5Mn6JShiRXrZy0PTC/pKY9qa5I0SMvb+nL+NeyL9waB01FSM6PPKa01/0UpcE9Iw0oiFizx
	cipfeQqq6cbgnk2J6+nx+O3GzVwao7P4sexJmP56COSx6Bk1FLVrczZo/t1fB38y71UNBgg80fU
	Um60m5gg8t8CVcHzZ0fGBUBu8bAU5b47FkhWlat5K8Rv0GbgZaAOq8FEwE6SWhDsbaxtm4VySXN
	/InXuNTQLG/HSsBpvBND0R/J3pa1QRmo1BIE3pkJILojeEnUvoPxrnMqWIFCPP10XQol02NP+O1
	Vtkc/RlmSpSQVvDzGM1rWx81xMB9z8DuHBnyslHEoQruZq8/JKETgnydMQ8LGZ
X-Received: by 2002:a05:6102:5086:b0:5ff:c6b2:efde with SMTP id ada2fe7eead31-60378fe593dmr1751241137.6.1774448979112;
        Wed, 25 Mar 2026 07:29:39 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be185991sm111308241.6.2026.03.25.07.29.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:29:36 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fff18d44fbso3917124137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:29:36 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc5:b0:602:7627:6c4f with SMTP id
 ada2fe7eead31-60387238034mr1950349137.17.1774448976166; Wed, 25 Mar 2026
 07:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:29:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViXzq0H0UwZori2gh2Tcd6o4ssoGkXmJfFFwiL5AwHwg@mail.gmail.com>
X-Gm-Features: AQROBzAzZX42-SVVM7_zKELfgnu5iQhGBNJzdGqfYMua7CEfqTRedVMpWqUArVY
Message-ID: <CAMuHMdViXzq0H0UwZori2gh2Tcd6o4ssoGkXmJfFFwiL5AwHwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus
 txdv-skew-psec property
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072940_638193_F89DDE73 
X-CRM114-Status: GOOD (  18.78  )
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

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9131 schema does not document "txdv-skew-psec" property, neither
> does the kernel driver support this property. It does however document
> and support "txen-skew-psec" property. Fix what is likely a copy-paste
> error from the matching "rxdv-skew-psec" property, use "txen-skew-psec"
> property instead of "txdv-skew-psec" property.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

