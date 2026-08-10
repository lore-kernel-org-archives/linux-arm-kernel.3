Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD9CC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbEsllBk0EU/5gfHmuE24f9NsGRgf+tdlgI7A13kj8Q=; b=iFFLX6Jd6I2+KbOXZn5Sq43bcb
	AWJXRf7Te+gWhHOzY0NUYbw6WFZCkvIB8JduAlGVZzRsDI4Vmj282iwWhuuH5xheie388+rrdOnnE
	P/bj8Ube5JSfEYjDUwH9xHGPP/zaKhELiUcgIkyhVN1rpJcZ+YhnFN/YbLIqybHxDDU/0H1LidC5e
	2skMqAeJdoq5JVPmi0xEt/cxARkOYYjrxW7yOyAuaA8zonRoDT8gbbfODjbEnF0r8dS1hWo8DDP7E
	VsYOJstMqX6xbDuKuwZ10/lRf5aF95Gn3+182S2Bw8zHAKS6GXxhq8k/07rJvFkvOouuhmkc1d0Wa
	xlMLcDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR7C-0000000C1rK-2tCJ;
	Mon, 10 Aug 2026 14:36:34 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR7A-0000000C1qn-1VK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:36:33 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c3fabe908eso563665e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372591; x=1786977391;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbEsllBk0EU/5gfHmuE24f9NsGRgf+tdlgI7A13kj8Q=;
        b=I1SMS2I9B3WOfhsgqQL1urSZD6dYJ28vAbeuhQBlFYHU+saTfFKFv92NS8Lwio7zzY
         bQ9ZOp9am6sTV/SjNsVyhyPLmd4htc9wUGsRtPeGS+6GPE2j9X25J2Mp85UlEyvngvWL
         8K5CKDFP4Cl/BN01HvaJQLUzAZ4UhRkAmZVHDvKetSoUkCU+Kik9NB0r2URL3FFvbhRW
         xAfBhqYvFvwogMD7xmh3xsyAiUrQXyZhGLjbt+0mQZ692PEkZ+hgQNQa855GNxQfDoKz
         qLRBqmOqF2X0/P8F59gWDOedXrQoSYvaKbkTz45QXl3vOMBsNLA/nAxJ/Kjjv3541HM5
         4oqA==
X-Gm-Message-State: AOJu0Yy949cdPpxvxXw1TjPRPo0CPzD8Q7cDXu10et3osfe6CCGQxEBg
	XL2Pe8BhC3JqZhVtxElnHsgSID/HVAAMYSBYnXhaX0Nxm5I+Ff5aTLoQZjWpis1y
X-Gm-Gg: AR+sD13/EwV8x+8vno5jvCCqUWPUQlbqg/m1ghPXJjZ/OtePjdVmODQGcTT+NRAEZl2
	Td4oMW3vMCtLaqVKXjhz6WP37WdhD3c0uCN/us6rJgPehZcERFUZBM/Su82eKKgcdJEMPYzcFXo
	1NeIMx+3fQkWT+9OrXjIKjdq7+OpTAfXo40xKRZPpSQCMpPZ+uKvVY14ghSqJXkBUq9JUoQUL7+
	/Szq3oUw6SYNdHbbPJ/HnCI6aXQOzFCmH7u9UVqY1ZxlS09N4fwoWZE/qdG0MLLA4DzEey8BSAA
	Hfe3iI7b1Igq2j0FZWJI0X0hTnDRJTx05m1HzmFThPdi61JZW20CQDYRd1WVDX0gsCftSPd34ai
	XLbLBPlsQwu0sFXXeYc3gx8wyF/s1eo8L5VpMYooNahzTwviSkk9oBPGYKP/uh/wJdst3LZQUPy
	hlzYOBTPvdDDOTPdjVn85iRNoXQ54tyqqqeWwxgRxa1Ozl6SKmQ8e4IQOd+sVoMDxCr5zCVsIE2
	wEGRbflHtUhGylbNUO9gdjKxN05+g==
X-Received: by 2002:a05:6122:78d:b0:5bf:ab99:ea89 with SMTP id 71dfb90a1353d-5c3d924f087mr4403709e0c.12.1786372591033;
        Mon, 10 Aug 2026 07:36:31 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303b72bsm3419957241.8.2026.08.10.07.36.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:36:29 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfaa014978so770000e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:36:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3e03:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-760e62c939emr10451604137.1.1786372589081; Mon, 10 Aug 2026
 07:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:36:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQi8e1iKucJtg_nWZ1eWgsx4eJoM7ei6F3w8bqD+z7oQ@mail.gmail.com>
X-Gm-Features: AUfX_mxRGFAsneILwiGbi03_BcU7Uq8jfCmWcA753H01LUA-8HtzsaR9xWF8_vc
Message-ID: <CAMuHMdUQi8e1iKucJtg_nWZ1eWgsx4eJoM7ei6F3w8bqD+z7oQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm: dts: renesas: stout: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073632_421958_5B98B0D0 
X-CRM114-Status: GOOD (  20.03  )
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

