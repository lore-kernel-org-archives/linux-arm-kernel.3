Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27660FED3CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVITAiWvrW92i7MAbP6rXRmEbOpDAiwmF+Jd0SOVBOs=; b=y7X+D8zLAICGswXw9JFtWs/sdR
	vs3+8hb+EjjuDOk6lyJ5HwQf1W2ozuU5tlYDfW3x5QQWoiaiu1NQMo1kZ3zHiuHQ8psiggL3XAGNh
	iltqt0wwVnN/3QLLFxMuBl7CpGcTxOJ0PWu/nFi/WCJmSJY2pRSwdZynVTHHxEvB4v0OIG9xOddL0
	eJF877MdUsDwwV74VORHDQMERv1oKFdMevB/VnO/GNyeLWWoNqXHsTXosELfi2a4Kueyo5YQFB+of
	vW6goAdtDjXoXRC36AX7nxktiETGxwUu5bAc+/eL46XJEYbWZntxNdjMqvk4DDhOOalPuNH0rGM9r
	S+VOHdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGpq-0000000DGVx-3UtO;
	Fri, 24 Apr 2026 13:44:46 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGpn-0000000DGV7-3Xpp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:44:45 +0000
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ba699316b42so949302466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038277; x=1777643077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVITAiWvrW92i7MAbP6rXRmEbOpDAiwmF+Jd0SOVBOs=;
        b=KRQKuScsJWnqxgj3VDFkTkhjlfK+Ho+Qe7beiYur1MySJiWLKPyrRaOf48LNFyxfAX
         znYPe+77GPuwJzEi17tJ/xbISw1gE1AFLcXoEc6fgfKAlVhWm4v1gKxGaOIB8AJp5QGf
         M8hcDXPueOfrOxeDMqus4A/UAfhjb87tb0ZTbq7SJRbbtOrU231z6X8IetUBME0C0Jt3
         4OgB2d3ZfdOpwnTlM4VrFqBR8zppDaFv9SAwJJiR6tdB9JinaXGw0lDdTmDTD5I+VbGm
         YOJR4EsvX3Rt76owd3pmdD/rmdo65yKCIqLut/RB8XrauVhU8oUrHyA2/U/ExXl00H8A
         BMcw==
X-Gm-Message-State: AOJu0Ywvp1oaLG+8zEbviSjkaSyk8gn7qgKW+BvLAatNxgPQF9ytqp1e
	pu/AQcOgdkuEJZZUJrfKNl+aiN44KtomX42YOB9w91PcbmC5t+bjHc5XCROPr0uCgej+nw==
X-Gm-Gg: AeBDieu4nNj/4eeZ4wyEI14z8cUvOOV/PcFPqD2BdxwSPEuubTUMyaK3dPfhJgVf5Mi
	L/3MFdk6NAfwTEzcDi0ogLCM3yLr5xsS3HbM1SOLPCa6aQt+gHx/4XPMJfztKzFU3n9Aj7VVOOU
	Krh8lPHKXcHbrZyJegFon4PaV7R21zc88IpENglxt0j/q5zwitIcGKXqjVX5gU3zWBxypfbn64i
	Z8F/QWglrsMcUY4tC3qhXyNouJGw5E6ZfXaApngdXby1jzi0w1TyaI7bTWf5OeBpBlybwZ5swcS
	ZOqWtST0I+njTtDLwKX3DqIsnp2RM9V6DMZSwv6958oFOKOFizztCPK6/lJ61yGCS0kvriZ242e
	2HcxIf66Rt6GAeDjM4UZK0KIV3xM/V0DvZF8QHLi9UyIDIux5mdOAq0H6v01WmqsOEJxP32yCdR
	itev9TjKxrIhYvo7//yW+YfUhRC3hRhO0jlVVuQLCmYeRO8+GOYUZU/9ix+FGHxqOvslkNODY=
X-Received: by 2002:a17:907:2d09:b0:bad:6134:7125 with SMTP id a640c23a62f3a-bad61347395mr228150566b.38.1777038274497;
        Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5d8f9sm4774871a12.25.2026.04.24.06.44.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba699316b42so949293566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
X-Received: by 2002:a17:907:9308:b0:ba7:34cb:388b with SMTP id
 a640c23a62f3a-ba734cb3cd2mr1213880966b.42.1777038273933; Fri, 24 Apr 2026
 06:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoiAagA16Cg08vTzOzC2Lx_PAZd0K7rggEsxBgZ0NMdw@mail.gmail.com>
X-Gm-Features: AQROBzBA7dqZ2ppfvOSrUp0QRX1PbdziYnEq3L5TnWuwS1i-ktuGiob_NjXbKkQ
Message-ID: <CAMuHMdUoiAagA16Cg08vTzOzC2Lx_PAZd0K7rggEsxBgZ0NMdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_064444_382907_0B14724E 
X-CRM114-Status: GOOD (  18.28  )
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

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

