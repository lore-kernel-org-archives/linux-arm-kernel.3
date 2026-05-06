Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8BDCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frOZWVrduNGKMu3VYaa4JiBvzYZTtFtYjox5RDxS4rA=; b=fMkT+uoYaoVMLPQK1eztql1cBN
	8TC6FE2j9IAx7wK6HoEd9UpmMcsfaqMV/eHXJtH3101PItIFL/+KxMq/ck29+x1XPu78tap68M7a7
	wHQ6KO6G0HQwAa6Y88JjgnTvF8u9WIWdE6Pgm2z84SBN2Kj8bXyv6mmU/HPpL6Mv8zyUhpZzIwHNj
	+FFeswlN200AVC9h4DaSS/Rdfsj1l+PxKZ/mwlTTLDdtxamaztW0oCfTEhAUKGHyYnP20MbGTAk3t
	pyq2FJC25OKDWpkEVri3eicfGiR/8lIumwz1GDJuHg1/xQLzMV4EIJwA16aMKJj16UXD2a6AWNrhP
	mXU3wQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZLj-00000000TET-2qyf;
	Wed, 06 May 2026 10:19:27 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZLi-00000000TDb-0rgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:19:26 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3763776e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 03:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778062764; x=1778667564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOZWVrduNGKMu3VYaa4JiBvzYZTtFtYjox5RDxS4rA=;
        b=RU3pyRZZWak6p768VB/aaCYp2g+pC8DEsnFztT74Y0WCj2iex7OK5735UVkV5qk0ed
         MFmvTXEKd50FiOporTTrbVc9ngWM8Swn7+o3fUrLB0w36LsAwNHiwHNAuOCGOGoMpvoR
         kd68q5GAMuHv5W/3abtHwItE2Y9M54jfbhqb40AmxjK1nTuOI4wgBItFxH6oectTCzmy
         wDXxyEmjmx07w8+pifqjdMae69qPqsu7OgRUvxDacEtq6wetrbpdcU4XkJiUlHiLzMc1
         nWQGt1lhI+0cXV0jsszqptVDpqzq8w1C3sTbUL2JPPPI5j07CUa2PaGMlwcBxnXGTBke
         orYA==
X-Gm-Message-State: AOJu0Yy5HiV/Lt7yOK9XCgyYWyOI37d0qT3eavR9+wjI1lwWzizziilH
	yKFu3hsOHZaPJTNKRjVxNOAEEdWnfXWS0JsSn1Sb1Mc973scZNUwpoDqkPv+rXxP
X-Gm-Gg: AeBDieuN9Lidrr4GuFaXqLeqEdiwTUWFNTRmsJ/iQYNGDfwxeyJdx95IDf/NTb6lHXl
	3bFBy+YHZ4HOHcvH2+ymvWTWdIyLPBgtLfH8fV2CwVWt8n57ojA4ckElBXpOAE4RDl1/VU8pEjO
	3VepK8p3CBSR+Ex2qJwHwBXyOje/MwbyZdw+TlI6jCYbF1DkAWWuBFy+AYu7ViQYsY5Yy+fXvis
	Mky+DMOHurkF6sMH36aWtlOdSeqO9okN0qgWt9ftDzJ5UwmZy7oFjNPNQZ/LQwt0a0XYnSF9MPq
	wO1nH6vlc8CAk6be2JzcToabVmCFyk1ZPy06DhnjB65yMi2LRuz1wqDP9b3BwQFdyIScWeEqIoK
	loFDkh4m0POIyKvETBxitJ3OSKe6uXe5a0mJdb4IFniDwnI4yqzTXU9vnq5gVgGXBRtgc6A2WH0
	tVk7ivOSjkz0UUCRRB5p7Z7s3U0lSudaEkwJ3qT+PTsw4b0JH0nT/zL+kU2iEHUgqN+zUPt584M
	mKGg9WcNrLwbA==
X-Received: by 2002:a05:6122:4891:b0:56c:e871:31a8 with SMTP id 71dfb90a1353d-57559691a23mr1388479e0c.7.1778062764038;
        Wed, 06 May 2026 03:19:24 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5751adf532bsm6732495e0c.8.2026.05.06.03.19.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:19:22 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3763752e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 03:19:22 -0700 (PDT)
X-Received: by 2002:a05:6122:3214:b0:56b:815c:961d with SMTP id
 71dfb90a1353d-5755963f49fmr1289109e0c.5.1778062762167; Wed, 06 May 2026
 03:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 12:19:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
X-Gm-Features: AVHnY4JCwkwAqaqLSNXuaf0ETjjPOv64a8QgXMobUA_baaUFwZots-RZr9ezKew
Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260506_031926_248777_1D5437DA 
X-CRM114-Status: GOOD (  16.90  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

