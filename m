Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23BDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buDjsHUOrU1N61z2NjEKXi8mfrqkbTQ+ONutH5nLRvQ=; b=uNJW7DqI5UKwF/TlcI9v3Hj0eq
	woqwU8vzZHTh91F8Za8zVkf77F8HncmI1TlkqSqYKy7noCyfdi/zx3Up7fs5TfPJaH//wC4WKYYaX
	NwqBREDZrsd4GU4dUwFiuonAIBAbO8XqLNe+3nh7eMtBqWayM+IltnBGfZAZq629uDnTVXuqe9JVz
	SI2LtYEfogKxfDAStu2iuDy1BySxGQBiIxZWDeOaQq+BE4MSG60pLNTGx4bp5zadJaE5wkcq9Rw12
	1SUGbVIwPtz9rJ0+tEKCAdIbnHXney1a0ypsDT/u0Q2yTsoUakG1qclq9dIZFQJxdKdCw8lmf8rrG
	ssk0nHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSPV-00000008IeW-2bnp;
	Mon, 26 May 2025 07:38:13 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSLC-00000008I9A-0dee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 07:33:48 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e45d07d66fso85310137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 00:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748244823; x=1748849623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buDjsHUOrU1N61z2NjEKXi8mfrqkbTQ+ONutH5nLRvQ=;
        b=jD0aRnTCYYQvEVIBzC4VentJbFNt7+zhIyigfbuEGeiz0BLZZRciYb22Wbo5IusQGw
         9FcKAI21/UwJAOEMrKNlSOC0zeO+YLeMwjfdmMfh1ZVftUoqcoqjA/t/hiuM1Xu2a4g9
         xi3E5pFUNl1fEdEv5sCKil3W/5otdf+AKsuGHEDMNR7SWXKEUZHUZ16njyDVLyrb9u+A
         LT+DwsXh7F6ydiNunQ0Z38cepXQ3pqj9iM6ip5ROaa9dVDeHelPQPsqG9PE9/RKaaVwB
         HS0klmZ6HleSK5aS68yd3x+rsruCGkqHmfGwDYANMuTJ0hExZj0z9pgNwwEORy2No0hb
         kvmw==
X-Gm-Message-State: AOJu0YzqnVthHMZEEr/kg19tUYMIWRSs0bq3+lUTQbkXtI9VVqQey6YP
	tjY5QwdgjKFAzbNBYuUGFiIeQ2ez0aHN6K7PXwTZED43AXKDYQL1Q9kw+enBxuPX
X-Gm-Gg: ASbGncuY2Xk0svc3rVoNyXKH+fW7WmklPt9cO/vI2jHCbLbqt66Hg9Uopl8ilPmCOCb
	BIp4v7cIZ86uti/I2xNXgpxODNy9qoFnV9BalXVgWpB0OGqYnNe3bqstDp2VKHfRxX8hNsRRg6X
	KnMcFwgU4tX9eYCxSnb8Blx22SK6eWcsBJcQPZK1CSDzmupaNI96L1LKqgIWyQvxUO37zp3z/kS
	XbbN1bRPUBDD7Uxxm1K/aDe+CqjIzkKompccUUSMceM62GTLtFus/a2OBYpt4/xckPI1sUIwqrg
	/2vuRzMv7PbyAgJxuRLDefe7JLiyu52+5JS9B4J9EWlO3cJqLc+AEsBPZiPrV5WplMwAlNZgvOk
	bLk066nbqEWXvaQ==
X-Google-Smtp-Source: AGHT+IEvFZ2xWTI6p3Rko6a3gYaVbGrRXNIYzphs+YfwkKbLd6QHJgyRjMkVyKqUxmgckS+/2HkqQA==
X-Received: by 2002:a05:6102:54a4:b0:4c3:6ba1:4129 with SMTP id ada2fe7eead31-4e424168ac7mr5298561137.20.1748244823042;
        Mon, 26 May 2025 00:33:43 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87dff459239sm1197431241.14.2025.05.26.00.33.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:33:42 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87be9d1fe01so528922241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 00:33:42 -0700 (PDT)
X-Received: by 2002:a05:6102:c4e:b0:4e2:aafe:1bb7 with SMTP id
 ada2fe7eead31-4e4240e70a3mr5279874137.15.1748244822251; Mon, 26 May 2025
 00:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 09:33:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMyaUgct_iUed3LO5Brmb4vGJ2=Pgwqtoa0eLvWf4frg@mail.gmail.com>
X-Gm-Features: AX0GCFstOU72XTrRPlHMMlrcLXZJoTUFgukeaL2XLu42JRLwExEXTH8GUTjbES4
Message-ID: <CAMuHMdUMyaUgct_iUed3LO5Brmb4vGJ2=Pgwqtoa0eLvWf4frg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Sort DT on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_003346_187855_1DAA06EB 
X-CRM114-Status: GOOD (  17.78  )
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

On Sun, 25 May 2025 at 18:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort DT alphabetically. Fix up the placement of &rcar_sound {} .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

My bad, I moved some nodes while applying to fix sort order,
but still made a mistake...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

