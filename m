Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51433FED3CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLliIgC7Zznw0AlYmN91F7ir4F1HBOk7zj2xfpT4/Jc=; b=mLvS96Bl248k1QMQzHOxBPSd8A
	+lwDrVxaMqYXCC349vmb5ovfrEWh2zx5lpQGQlXgkY9RNgu/x/fLkoMRW5EFD7EFvDEtwTlMGINxa
	xpqXHSy3EasBSpRJ9nj7mMu3C53MmfL9iFuohB3JkTbwsVUGBXSSPBtn8X2A7mnyAoXwMONid9c9o
	DaBInNJh9iHHXq7g7/Wz/sUt+7M0ER4Jnyce4NLiEWef1waGUfiDVg+ZX3XPFzMiPox8Mu3mQiBiM
	0bbsYQImIYzTsihXQqENM5x8kTkW9ZDaiqlllUzqaQuoL7pz9Gg/vtUrixpi3hoGlQvwaIoPt921C
	/0wIibzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGrF-0000000DGl2-2A7o;
	Fri, 24 Apr 2026 13:46:13 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGrD-0000000DGkP-1yuC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:46:12 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so4292337a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038368; x=1777643168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLliIgC7Zznw0AlYmN91F7ir4F1HBOk7zj2xfpT4/Jc=;
        b=nwR59tmh/yJ7fAFS0WszkM8YOU6e3quppqNieG8vRRN0M8+GoHPDqk8sIoZqP90ePR
         6hMZpKiIMv3OgsE3IDxk424q9UvtqGg6NR5QX9gh2PU2Ephry5caVmnEzRDqFM4hWItC
         5IvdCozYXGeiPXjqRzjQDExTel0D+UctpjCzuctbJXwhVxZGXkjiGJSQnY6mW/vd/4zF
         Quj4kl7qCo+nKNS9VsM+Pw5fwOoUFm3xv2lK5lvBJnIW+IKRCIUkVbAgWiMTimlDKXC5
         z1448uueNt254WA8G+6WvEsTUsoORJSrmnIFykvfEGaQr8R6YW/3QY2Ezxy8BryQd2Pd
         b98g==
X-Gm-Message-State: AOJu0YwAsrGYl33ICAg4rJMoz2S3zyNHgwVzsXcA1IDJJ3aLkpuN35v6
	Op9mboILRzens0WMYZZ+IXc0GCL4/Qtl3AQQ2LN5YfIcgIHbTLRAHrErAW8mX7VtkqU=
X-Gm-Gg: AeBDiesTe4ctki5IR8PdrpLAqHbKLy2NlP5U9Z63tygFzLr/AlYl3c637TAVIKO9qcW
	U1dkaIdL0AoNh0MynPbw207AQ25mZsAKQ/W2P1IqLJt2ZlkgYAnGyu7M42Dai/aX0JQMmL+MkDt
	3dIKzsEUemGomDTM7fbaETN3kATRemEc9ENzsKWiPLzx7X6Wab+YanCxXIVR7Qco7QzD4ZrRenY
	SnbRUMJ8z7h0hwVgo/HxASTp7OhDivCFZ2G1FE5MuCiZIG67QJxZ0Z5lFdseMzyTyCa6+7MG67Q
	IHyXriE961NkgSHNcPRgwGv1tZTbamNZO6Riie7+Yf147mmjPlhc8csE2trkZesX2i7EGW4HC38
	TJUieuNz8AhhMIdn+1x053jRE8y4AH5WQk7jXuwlRDT4cfCipNQSwmFDw3XMfbO1jfolgL62r5F
	f6Rd+sqqYr4ldGu33mLbtUykYW9Wy06A3yYWCk58qTFv3u+BJyh1xwHCzr/TjSWqSI/qTGjHk=
X-Received: by 2002:a17:907:3d10:b0:b9d:8697:73b8 with SMTP id a640c23a62f3a-ba419654967mr1511185966b.22.1777038367394;
        Fri, 24 Apr 2026 06:46:07 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bab1sm755099366b.35.2026.04.24.06.46.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:46:06 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba92146cc86so725933166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:46:06 -0700 (PDT)
X-Received: by 2002:a17:907:268b:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-ba519702c56mr1350019066b.34.1777038366261; Fri, 24 Apr 2026
 06:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:45:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
X-Gm-Features: AQROBzCeUf1K_8djXszLWSG49-1ZmjC232gBnM75vFZ9xuQJc1mtkXTcurZTMVs
Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_064611_511112_818395B8 
X-CRM114-Status: GOOD (  20.52  )
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
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add ztr/zt clock at the end of the list to match bindings
> V3: Keep only the trace clock DT part here, extend the commit message.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

