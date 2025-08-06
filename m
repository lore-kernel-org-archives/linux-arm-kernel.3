Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B467C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8idSeLj0k9V+7xL+wl7mu5nbsyyJQs8y+AkCxOVjYl8=; b=qGgKfHqNE92N2KdCNrI7H2UZ4C
	G36qOIv0uaL4QXNSMYTUxYL68GhFZSLn86mtTDu9UXBYUgsZvQSGl8JGn6UOXc0ej1y7h/NmbzzMQ
	AnDUx6JzC9xIIsubGqaVRW9s7moEOHf8e/UgtMSxMXFpKzTcvottQuhOAJ+hZ62x7jfjfx1JybqV6
	79Ay+ljHTvLEQBU/D6NUpM8CXPE1HlxPUZsxjZ8xMq50H95opwVowpyt46HJ2IaUi/29tH9BhwduR
	P9MpBAnSGmYyetIH1M3ZkHMzJmAmXd8itbPbhl2Pbgi2P+3z31cM1bw2ynQ1drEFj8J2DuyVj1Xfc
	CJOwYh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg7y-0000000FcJU-3590;
	Wed, 06 Aug 2025 15:32:30 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfon-0000000FZ33-3Ogc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:12:42 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so4760937241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493160; x=1755097960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8idSeLj0k9V+7xL+wl7mu5nbsyyJQs8y+AkCxOVjYl8=;
        b=jaisawOJ3DfmU0ggjBy6xwuxss2PpThypRbTKNZXOFt16Dj+RuImYmcwdkGsOl7dUI
         ZsCT95UGXj9tyxmsj4o9ksiNmNl0xRwbFtN6edLggEJKtWFAy39DiTvahyyeQdPLK/1O
         Vp5iI8/qnCHqpwrhujThw/SbMfpLVkB8/GBXE2b7r37gl4iRKM5SY/TMsfjcnneOBwmp
         IQzaHmASBppglpaG8NuA6cM7WInl/RcwMcbBZSCAs0pfrdzH+YW1R9WagwB/ojW9UgMt
         /oVS46sN7dVl5VJ/csU2KP1rOdXUqhL6xJ5YJ2/g38dNlTb/RYCmQhAaATbdrct8TiAU
         POsQ==
X-Gm-Message-State: AOJu0Yyo1g7pgvddoz8SL3vLx4FB3hEENN4gVW6Khk2ZQmRUgHAm7h+Z
	yIhNRLweHnsq5ZKJPKuakwBwITUClgdIrxt2CT1igDgXaCTlkG6ddT/t7d6j3DHk5l8=
X-Gm-Gg: ASbGncszyTubeZku9Fk06++aGfgdpsFFDkqYsUY7Pk3jENEZFnYCgK1HysCX4tOUyDJ
	Cjzan2SM34NkISWXH/4TrleCrdfwKsn5iwjZ8G3rcnfN2n+FCaG3eZj3ISF2ssWz7Ow2ahBYzc0
	0KNX11VNtXfqyAydDehmqFWPeT4VL9WAr4yaBuVJdFQBTb9bgb5IsvdMnCJSI4zdnNtOnRgSBV9
	zgZ1j84LAq7fbu71eeRFiFTXDSgnPUnAeEEnXWjthXIoeme+EShBCUOT8FxcUrjOUkgCxXeI40V
	sNN5Tt4KEKZ5FekyMt9yFAPesEBrfFH+Nydx2nAPEwCIrGa+yl1Of0BMIs85Uoaq4ANdzYCjyUo
	1cGl/7hs5tn5S2wnNrJKGID6oarhUd82vRtFOCvAVOc+RnEQWi2OGFBtad5srp0D3dyCPZkk=
X-Google-Smtp-Source: AGHT+IELzZF/ZnVHy1qUFCEQPN4cxA3v6yyJi/fG1PdkqSQJI3XvG90bV8jseijj0RspqdSQrNFhzA==
X-Received: by 2002:a05:6102:d8e:b0:4ec:c548:ee2a with SMTP id ada2fe7eead31-50373e1d917mr1727294137.17.1754493160326;
        Wed, 06 Aug 2025 08:12:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88da99162dfsm2822829241.21.2025.08.06.08.12.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:12:39 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4fc1094c24eso15581137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:12:39 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:4e5:9c40:824d with SMTP id
 ada2fe7eead31-50373e1e391mr1744378137.16.1754493159652; Wed, 06 Aug 2025
 08:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com> <99ffa8fd-d2b5-402f-8a59-59d60ab49afd@mailbox.org>
In-Reply-To: <99ffa8fd-d2b5-402f-8a59-59d60ab49afd@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 17:12:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJDBVJHGruL_kCssVC9n44pbYGDiZK3ks2D00NCp87Vw@mail.gmail.com>
X-Gm-Features: Ac12FXxwMUfhcnL6gXfoRu0Fr2bYb2TG-DcGkDV_8GtDXgKEbO9nbJMpzliWA74
Message-ID: <CAMuHMdWJDBVJHGruL_kCssVC9n44pbYGDiZK3ks2D00NCp87Vw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_081241_849194_889881E4 
X-CRM114-Status: GOOD (  21.71  )
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

On Wed, 6 Aug 2025 at 17:06, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/6/25 11:11 AM, Geert Uytterhoeven wrote:
> >> @@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
> >>                          interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> >>                          clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> >>                          power-domains = <&cpg_clocks>;
> >> +                       bootph-all;
> >
> > Please move this to the board-specific .dts files, where this node
> > is enabled.
> Shouldn't we rather enable OSTM0 by default , it is enabled in all RZA1
> upstream board DTs it seems.

Perhaps.  We used to have issues with enabling all timers by default,
as some may be used by (secure) firmware or another OS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

