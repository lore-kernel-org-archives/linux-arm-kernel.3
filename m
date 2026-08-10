Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A66C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=EqOnjPAYOnox4/+SCNzpkGPA3p
	0EjnlLNAJldCF0d3lri6UgKGs1wxVW+aPBCLbhEadGmI/1MQ4HvUXVUrfVs5pZwNfHJw+e3CRXi+8
	Y0yEhckqMFp8v49R42d4Wd6I8ik6vmjGEbwwMBpOeFbjq/VXsC3fh0p5iUjXuGfnVi2m2JEAMxAsy
	iINjsEsyFLDkKf9xfjbzsciEB50DdBKhxhg58wCW2CLOFUZ2yk1YiYBzjAKF0L7tI+K5R0TKsmCWN
	RMRIjOM14UZ+E2BlVwgqwDC+m/PihSj/xKXW/TwWf6oWgSUi1ubBnPXonTMq8IYF+FK2lXhv3U/hQ
	b5T4sPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRAj-0000000C2Zz-3oMe;
	Mon, 10 Aug 2026 14:40:13 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRAh-0000000C2ZK-1evq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:40:12 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7564b7a9490so3085288137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372810; x=1786977610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=EGmAIn7Jk0Hq+rAl2EgfXSEPcIkEevyNRFtwVmVvABx+IzyxDsYVeMSpBlo8KrYdoP
         SzgW5iKfUpe+NT4SKKW8Apm+bnnjkiOoup4V+vYANOd7bdYy1JEEO/fMHizyOy+zZlv3
         0MSYC5G2ZHbovEk01AMH8ISsybYNou5mEWIHesIYXZ/luSuI/6ZezCr4Kttb27w4QFgm
         eCdgOR0caNgjs0HeksIp9XfOGw6ayLzzv6OnmIynCCpdBGoOwjrISUIf+oy9hupgT19Y
         Nibb/V57ZF2+if20aoPRF+hCNLWk1cm0MEmNx7zZB3Xiz3jSlvMfgGmASXgqilwGySpO
         Lrag==
X-Gm-Message-State: AOJu0YyDOucCDjY0tY8aKrCYpv+HUp/m0k1hOgho8MYRiTpViu402jty
	wCNtCSHGmTTrD8KI7phcptYfUoN37oS4Gwa7msg+dU3GzOF1aysY1o/GbB6AxqGP
X-Gm-Gg: AR+sD13lfzl7Gx6sA7HRyM2s/ZCfXdYnWScGloWiZQRk5JzBcRpWwRYrhF+EEGBj0WA
	fp9JPbQlX/Yn4a/6Ae1bdXYOpOOz3em/lY6e3YIJjbHbW3qfNRs2ZlyE+Mn9ftfpXrFccFyQP+a
	Sjg7x0qiZcp3NlFoTyAxjsOrhb49kYLFvxKuHKRwXtPbRMvSTpGnEOM3pVp5Qxy7wExi6x3Tv2V
	Fqvz6eJp+0+NfJp6LPmDpfvgDEcUQuRZ2ZT2VNIc5pHwbb7Em+noOLlz9WhABvfCgiLXIzUeEN5
	0+NLEGqW6Tg4uArLx4R2R4JswvlxqHLgoC5Dbe7N/sqXTb8CXkgEohBf91lDytJfC+JTQjgB7IR
	DaysqagUgUAYvCyNcHnJZEkESkJ82zBtIVoQTPIplyBDofhbas4WOKKnundqdkT1OsZ/lmh6Wqi
	93irudOwVw7pExqo/MaP5CGcZgJOAFqVuDX4+Ck4TGk6Hdj121ZHIxS0T4L41iS4AoUE5eNQ02+
	2N5zYDQLleUX20RAt6Go4ZAnQ==
X-Received: by 2002:a05:6102:d1:b0:6cd:b43f:72fd with SMTP id ada2fe7eead31-76522a36371mr1636206137.22.1786372809903;
        Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979ffd28f6dsm3190644241.4.2026.08.10.07.40.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9770e900464so1560365241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
X-Received: by 2002:a05:6102:a157:b0:744:e49e:df75 with SMTP id
 ada2fe7eead31-76522a3542bmr1213203137.21.1786372809208; Mon, 10 Aug 2026
 07:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:39:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKVWFutMzBUVd=sQjRUzbRdJ_mGc0-x+o7WsOjo+-ZzQ@mail.gmail.com>
X-Gm-Features: AUfX_mwN7lvLitZDlPNYWEclA-T-vCWyRoc3tq1Uu1GaHP9xVqafEpWVwj9VsLg
Message-ID: <CAMuHMdWKVWFutMzBUVd=sQjRUzbRdJ_mGc0-x+o7WsOjo+-ZzQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm: dts: renesas: sk-rzg1e: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074011_430394_068C5A8B 
X-CRM114-Status: GOOD (  20.39  )
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

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

