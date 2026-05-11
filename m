Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACD1CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=law7pV0kaAFlrOEy6awjJWyzbjCOdnKqodHrGvaGQIk=; b=fC75bjo6cCDsbyGOxEgbYaSxmp
	rs8UBk9bGBiMfEP4cyo+xWbm4sk82pfdZFwz5Zy/7vx/Cp00hhmLRxlVBsgd/6SCiku48r7XePUuo
	we/vZO0N7i2e6uETFi+l2vS8BkaramjRj8BUzXGRP1PgN2pmf8WFb4YDQLopXN9UK5AYrxnxdSkLC
	esXBqSjI1ruZYSV3nlfs4TESYC3/M9uRRNkATPVTXq3x1aXc0m/K6Vegj1u+/1g2bENo3AmWO6BJz
	zzm3gb120XDNsdta+PaiH7YjLG/+mI3szeIBWs79eM2eukRlGmt3gRc3Vu/MZf4NLy0XlzHMTZr4q
	N8fh8/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQcd-0000000DjAf-49fa;
	Mon, 11 May 2026 13:24:35 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQca-0000000Dj9q-3XeB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:24:34 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575602688deso1193843e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505871; x=1779110671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=law7pV0kaAFlrOEy6awjJWyzbjCOdnKqodHrGvaGQIk=;
        b=Lmr47EDfVW2CJmfzf+u0zgrAmetG7UQ3AUMTiEJqNVIREoGc41GV9Bjb+Mh5kP5wOy
         /MaO4giB8i0XF+B/Zi6uKu+1ClH39sqdCaFLhx3JuxrcT3vbu2qs4I6izf/RjR4WRMTr
         bbmUvmiNuGAzq3HA13uldXWG3hEFbRWvV9g6Zw04FKY0vgICxja7iXMkSvm9yke3Komp
         jJVd9pRZ5Nza0K/f6kOrF9P4POr8qLp6jdH69e2e3EeX3nGhuIaNTA/vs+v8bph7PNbs
         WmoGjSArZsQNcAMcXNf4Wssbg7iYSdhwRi0QIV9UicZQRQEDH8Wwu06V6etlItNGqJaV
         eOsQ==
X-Gm-Message-State: AOJu0Yy3NuAAaV0l4/kKcf9vq4u7dZTMgN4uCok2UnEEMGr2C2bTjgnh
	PXGuFE9XKkKApwVCGjWKdS85K1ttswcFxmhqXgna0VldeEK53Tpk0xi3zWdfiN6X
X-Gm-Gg: Acq92OGmnu3yPMXR87i0An2YJtrZZ7xmGcIU8is53T1j07CHDFET4Ve/kN+KjguSrua
	fIPKWc7NABN7dWgaX162rlTWVhQHkXmZnhxli9tdEzifDF6cPhgLWbbQAoWBvH+ZxUV347qLn8w
	yqkFHpTA1iQMFCS9cER4AunLqpBvqP88os3FaV0/gXyFNFkZNBH9BRtLCblpJMlQU7OuONnLnMs
	ngq4teyfoEQ0BuXGH7x61Nvh6VL69pTqF/TbAIGIOCDkruWf6tb9X07C39EaEsWSOnuURWPNlvr
	F1pC2ksTKa6iA4zYuwZD5MXVeeopCviFi/o8ZpbyXKUxvXH7NrsKkpLW8xuP0OLAoR4nFbP//sD
	sYOMjrq94QJzO3nH8jNuvs85B3+rbn6FalZvl/aCaqIZLIBuWPk/LfJ8ifAhQTJu0PA8LoiqwoI
	al+sB6L8lddapIwBstv/gfJu23K0BFg11CtmmfDJdba88VXAzLaGjs0vT+7LDHCj0G
X-Received: by 2002:a05:6122:3120:b0:56a:f979:a9d1 with SMTP id 71dfb90a1353d-575593b5a40mr11903536e0c.1.1778505871255;
        Mon, 11 May 2026 06:24:31 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21a15c54sm5338955241.6.2026.05.11.06.24.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:24:30 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57513733658so1295717e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:24:30 -0700 (PDT)
X-Received: by 2002:a05:6122:a07:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-575595be49amr10895995e0c.8.1778505870316; Mon, 11 May 2026
 06:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
In-Reply-To: <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 15:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmpxtMno3Tt5LbiUHH1etGD2aq0c2rjde1kcs5e4Acsw@mail.gmail.com>
X-Gm-Features: AVHnY4KM_QK8CB2bNfMDHhNxtA1NDb0fdW8Zso7UqyzZiddKho5PeDYIcKub3kQ
Message-ID: <CAMuHMdVmpxtMno3Tt5LbiUHH1etGD2aq0c2rjde1kcs5e4Acsw@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_062433_273343_43662970 
X-CRM114-Status: GOOD (  19.58  )
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

On Wed, 29 Oct 2025 at 15:51, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 27 Oct 2025 at 22:13, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Enable GPU on M3ULCB with R-Car M3-W.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Now the crash in case of missing firmware is fixed by commit
26735dfdd8930d9e ("pmdomain: core: Fix detach procedure for virtual
devices in genpd") in v7.1-rc3, I will queue this and the other patches
in this anonymous series in renesas-devel for v7.2,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

