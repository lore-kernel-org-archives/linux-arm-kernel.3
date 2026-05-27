Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B09CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOmm8R3Cq+WYMZhLsp0nlZk+GIal/aJfbZcGuqrg9gM=; b=reg6ke+9j/1TgGwEZo4l6r2Y1l
	0aZvUYqAvgpaB483BygYr3BXuxHSjeufRN3vIY2WDohpJLssh3Ppz/lXdY/qDLuP5v6NkdUd/aJUl
	ObOrUJbzpJRI2eGoLX6Pspt+gdWB7VqAu5JJM+tGtbONDGEXxhxKK9ftjD5VfKlHj4jjke+nn7/zI
	asbW+VLemKD7aVqgd8RBvb/GoIs/7D/ownZa+RZ6jZFU2N3ob2e8mqfbfOm3EJSg7LLzJgFpdNn/d
	dZTxx+Mb3m05WIBviSEUUBIzKozHc5CKNjkJJU91Yg8NidTI/cO/pZf7sNtGAnJJsJYiJ/Z5km0V6
	xAMneeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8OF-00000003RTM-27tM;
	Wed, 27 May 2026 07:09:19 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8OB-00000003RSh-2qFw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 07:09:17 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so7628836241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 00:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865754; x=1780470554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOmm8R3Cq+WYMZhLsp0nlZk+GIal/aJfbZcGuqrg9gM=;
        b=Vsrx7tvHfkB9zLC4f5hdbBFtEHCaT5AvKGHItjGfLX+o4mDd4xBaST/2Xohc4A+A2U
         Oq1OPCwVjUT4+4Vtj3iydqVpYrWKyqFD9ZfJ0h21U45ou7rp8mmKNetRxlhRBK4DkKlY
         paEfWm4w5+waCd7QBMN0LST7hzRvaFS6w4uDQxgxKiDhtWY5xi2VVAucVIujjuDd+H36
         BaDwNSmbWhykLMHIzpqujYkFmBv7QcxdEXwE5M25OZmR6xLR+rytKdEIdAgcMJeQrEWr
         xkShdu92vS5Y1+MmpUIg04WL6PA0zM/n8bcb57L1qPSAbHVB1rX0f/n4IlGijFG4Qnx+
         XM4g==
X-Gm-Message-State: AOJu0YwCNVYuWdn256KoP0pDGt3ZCD7nhl/EwVCRIBz3OpWpJmPj40Sz
	yR8165f4oude2LYkjAqmrNeLeBIMocjBUuH/YJu4hPLAccESGJdycXTnakpW3btEO6g=
X-Gm-Gg: Acq92OHFRb6xdTRloof2TOTK5v+v5dqvAeM6SWb11UkqJdhug50vXG5lBJt7IwYD2u/
	pq8yPWoA0Wq2t7YFfxWNBxoAuQEa6/6QkTGtehgdwBi14ak61/ilBnERgSorPHL7KAVUPWa1BGM
	9JFLkelcBj8mOc/xa0V43oRHpQKoKjXkBVViXCe3XcMtQ0WiIONtqaWg7oKTgBMoXGZbGw8d/Cg
	uMWK9ivOpVqQyLHQojnJdRca15jB3PBYs1eMNMaP6k31mFOuwKRLUFn7PAnXJfX3xki1ba2+sS5
	E571macrFriifIW6M52gg7pZAQnj3heBwPPvrK24KaX3jbhtnkfNWz5FWBiL0v+BcYTUd7uJ9F2
	qv9IKVV/r9TvUWKKts+7mfE52IrN41ghLz76rqM+ELC8iu7+FrRs1/9FInSXONRQ3wzGcARVEWs
	y1lejx0ixfVM2C7gyR5D14hSoabkB67GbQjrBBgLMyLP7s5u/r2zo9TfcQXZhQu8UB237BYdE=
X-Received: by 2002:a05:6102:15a1:b0:631:d3e4:efcc with SMTP id ada2fe7eead31-67c8cba81fcmr11815572137.28.1779865753876;
        Wed, 27 May 2026 00:09:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173842ed1sm15714393241.6.2026.05.27.00.09.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:09:13 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6314c3818baso8897856137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 00:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8009:b0:632:137d:3ab with SMTP id
 ada2fe7eead31-67c8e2c996emr10450851137.31.1779865752913; Wed, 27 May 2026
 00:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:09:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy4HDUDCT=UeKLJt5S6gYW4Mgtkx13zpyQgSych7ByZg@mail.gmail.com>
X-Gm-Features: AVHnY4I0JbQSZqWOxsG_K3k-o_DCUSP-T9m5VNAB8LF4AI_MR_0R3ag34vx9oc8
Message-ID: <CAMuHMdWy4HDUDCT=UeKLJt5S6gYW4Mgtkx13zpyQgSych7ByZg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_000915_719008_35902832 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, 14 May 2026 at 00:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe SMC based PSCI access in SoC DT. The system can interact
> with TFA BL31 PSCI provider running on the Cortex-A cores via SMC
> calls.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

