Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A927C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qt0obc65zslhsJe5ID8EDkS8LtWy0Gpp/1LJUID83I=; b=P2iFbacBGumfa7TIxnKC6XGJaE
	cTFQfgWmihLDe177EMLdETRoCrVnWvBTzKXwLAvrNZWtJH3VmAg3x18XLPbS7O+1FP/RehV3r/NVJ
	j1L+a8JMT10SvwVIY+K3Gj9AJxAbLCIEdRfm29lLmV5Vx0m8EvI7Wpf2ibnJwImRXVkHtBiwr9JbW
	tAKgth56wUMjIeEIjdKjNaZFgXppxklinSXK6qjQ60sC+TxFWRzv1qqcv9q60ZcqqtiDebJOp6ftQ
	+2LREFjsZCjdf3nLP8voCsRInNRmtRP+h04dkYfrln06iLWWHdyHjdZ7pgjA4efMn1YZSzuFJp2yq
	J4iqywhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQsd-0000000BzRi-0UcR;
	Mon, 10 Aug 2026 14:21:31 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQsS-0000000BzLr-1dk4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:21:28 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so462879137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371679; x=1786976479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3qt0obc65zslhsJe5ID8EDkS8LtWy0Gpp/1LJUID83I=;
        b=Sw7OtHQwQoP2sk58tdXG/0tUpQ1me8d6i6aG8AcYhEvdIYsgD3XR01ce4vImX9DQ43
         8ytoszC6cM1MXjCu1i9CsQxbtFsQ0chYtRXswub80pLGkeQpJkLyPS+wyOVasJOqBSdN
         gEAPDFxvEQDYY8En/2JH8MpeRhYhQ1vI9KPOfjMUGCtaHJk6/TZAdPGyO83KvDUtYhkW
         6b+XdBI9aJ/6k1sY0lfesWNMd9lXY3EwvJWiX3LKmDYAvNcy+/7fNzUrz/UzudcgIAG5
         nydQTWOVpLPY6/k91vDvWE/A/ide5tPkpJpV1g1BMKR4gVTHtN9OQlo5RZIfq5LAO6w8
         oISg==
X-Gm-Message-State: AOJu0YwUbyiG/RRHXokqpXoBc9pRGYfvZAzvQvTw3scKgNGollXkvFRn
	ROA9b5pdkzY49Oa2BVGfpWWH++98PWZQf70tgl9rlumsRDgazKJmJfpwfExcg0Ms
X-Gm-Gg: AR+sD12eg3K/vbcnL2nErwH203jx8tnzbE3ZJ26b5XeYWuFMW1rGOMaqzDlDbeuTpW1
	fuTSVITngF7gBBu52ttdzonEwhMXe8uzKR39CcvnkmtCBPd7hmpRXTZM642XlVYG972I0mh3TMN
	22G4D2ljsbg1t4yeRuXmLyuWgllYfUlSuFiwipEzXv09sSLQqEoGUkEGxqF2+SKhOORw/Iv9ttT
	yjG5I4e5RQhOshkgJAtqiZ4E4PJT+E5JNDazanIX7/YRWFO+5+3KqAshYfnuKeevY8o2bBxwBNy
	s0S+e1HF6bzNKDkhdUwK7aWD+L9mm6WtOAYrA2GADKvcRwRdKXaqxPpImLct77tbYDSeJnJum1w
	GXchL5l4LAQ1LatkEDFWtAfPQ+lqbmlhRNhPY7ER/nahnPQPgAipyVgqu1AH9MVYRDL/djyoCb6
	82Y1ubdcLGzvW7NKH9g0N+KYKsLb/Eet0qqAWE8v41K+pjY3uC3HlZmXAGkfyUhjCJAxrknvidM
	vGtA/NFvXdXlTSV20Xm8SORvg==
X-Received: by 2002:a05:6102:3f10:b0:74d:ce65:4739 with SMTP id ada2fe7eead31-7642e391698mr4838926137.8.1786371678940;
        Mon, 10 Aug 2026 07:21:18 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc6besm4613662137.5.2026.08.10.07.21.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:21:18 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963f63fe025so232041241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:21:18 -0700 (PDT)
X-Received: by 2002:a05:6102:50a6:b0:728:f34d:f410 with SMTP id
 ada2fe7eead31-7642e3908d2mr4413691137.7.1786371678544; Mon, 10 Aug 2026
 07:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXv8rqGGdFjXqBw4RbzHdoy=CAWY0WdRfsvjSccm=kvxA@mail.gmail.com>
X-Gm-Features: AUfX_mzTCV5NDV8QSZzevbAyZcff566ZTll72oycYTZVrDtUDH1idu1vYH_kZ9k
Message-ID: <CAMuHMdXv8rqGGdFjXqBw4RbzHdoy=CAWY0WdRfsvjSccm=kvxA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072126_839699_D0276186 
X-CRM114-Status: GOOD (  20.67  )
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

Thanks for your patch!

> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

That's the URL for KSZ9131RNX. The correct URL is:
https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ8041NL-RNL-Data-Sheet-DS00002245.pdf

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

