Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE4CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBvM2ORohpXQB4d5IQuHmDJKKy3F6iaCOKJvYc8ytZg=; b=oTckxwvAJVAJzQyS1AsDrHkBpj
	lN1wRx6jFIXjK3ajcbdIOeTxNOPfB5KaSICzh9XxQTbDbh63IOejZ9dhWDUViHwyaIDFL3FdMvmvx
	RryctFmjXhSeL2BBLf/C79fVY8xMCm9t92pb5IuQW1FWCyh4OzpbRticKyb3NB8LcvkzL/d8bHrr/
	0AUjblY1lvuXTcmZ2qCHzbvuNRfR497ufekr5/AWKntS9R7BBOHh+6RantuOjk1oEhn3NDHr96ApS
	vcQ9l3ftl+eKSvLEr5VOsx2/yGgH5WATmM2y9B3aWWJuS+AJwduBLHr8J5BtoZCRggKmEP1lvgwJp
	9O00YKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbmr-00000009OHW-1PdZ;
	Sun, 31 May 2026 08:44:49 +0000
Received: from mail-qv1-f48.google.com ([209.85.219.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbmn-00000009OH2-1cd5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 08:44:47 +0000
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so42107216d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 01:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780217084; x=1780821884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBvM2ORohpXQB4d5IQuHmDJKKy3F6iaCOKJvYc8ytZg=;
        b=M/vri30vU42FfdmbhpRqVkAtal8N8LvT0xceZlhVMcsG7blOtY3pYBnHJd8ucF/dQl
         g7L2BKSXPYelDuDuOqH+V6JvY6PPnFbLJ46CKO+923WJexhd45LaDlJ/1s6fu1O1bQ6I
         uaKr5Vr6HyLfI9jQfSFCe5HnV0InLesBc3IjIK3FkYuHynQNiJbmzCsdbIs8exdw5Tcg
         ndbeHzkE7TNq+zUNp00pAX3NNnm0NssYa4r0kJdqghHoijgW5znR66etonh6CBmfvLkS
         uH5TFeiBJQm+gDXjhRBxmvwx0a/yIq115/xAjLMFK13AGCYBibna8wcp1c0zW16N37N9
         6XPA==
X-Gm-Message-State: AOJu0YztCWufwIKbEfRurB4xLPkDpUU6jU9YmnK3c03beL6rtu4h5nu3
	22zMbwmfcmHj2xjdrnSzBWswAyLhFlo0RoQRKQD1rxPqQ4LFIKpNq65Dt68+RYwK
X-Gm-Gg: Acq92OGapBi7laJNwSXDH5ef9xJ6TH+X7SnWfK+Tf9fgnbElEIHUofuPfTXaUQbjwpx
	VAj5/06wQZDSH7OpgXOhrlqGsRQ1JY35YPHr/kJJrm9f/9kQgkyiityPPVPREMUrXgvOk8tKN6u
	UgVgVCcZu7v+yugarMvDQtXNfGtSYB8+p1nffbylqLFPTRPBtOnrdnclk5llV62zXDDK5dEZTOv
	iQi9SCzEe80sA98456SQfY0x+GlohABE/t1rol+ZQHfFOlzuNEF/96KzAngA5jAHS4Lj00Gpj+z
	a4o53HTiUl7wC3WbuJir5wL0aadx9Jc4+tTti7fes/fkIkUUWGO+6REyXo6ZvbVc4Q8/ldRIbGe
	NA0Iss0WBQRfifqS/gH1yX2KS54gpJvMsGupi5noTQlSbG0cM77V4O4mBK2Cr985aTBfzrV8wB4
	k1XJhWSERKR/B85miH1Iarrv7pFXQiQh4GJ5ehIEq2y4xruQYRs3gH1e0e6O47QeUIB5reVrY=
X-Received: by 2002:a05:620a:4405:b0:911:e74a:1e73 with SMTP id af79cd13be357-9153db6a06cmr981408085a.55.1780217083629;
        Sun, 31 May 2026 01:44:43 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153249370csm711479985a.19.2026.05.31.01.44.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 01:44:43 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ce0f17a69cso5282566d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 01:44:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5344:b0:631:4cda:3ebb with SMTP id
 ada2fe7eead31-6c693a257bfmr2158834137.24.1780216616348; Sun, 31 May 2026
 01:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
 <20260504144534.43745-4-marek.vasut+renesas@mailbox.org> <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 31 May 2026 10:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
X-Gm-Features: AVHnY4JIRr68RiPmOxbgFI01Y083MJgBCtNRl2Ceai1FVE5g6dLCk5lLsnDcPaA
Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_014445_425454_58D4F80E 
X-CRM114-Status: GOOD (  19.29  )
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

On Wed, 6 May 2026 at 12:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 4 May 2026 at 16:46, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Document backward compatibility support for CS2500 chip, which
> > is a drop-in replacement for CS2000 chip.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

