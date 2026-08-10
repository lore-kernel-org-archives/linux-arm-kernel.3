Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED5DC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=a3kHkPesK5fAObZ9A5La5cQzGa
	amajMslxmdOCDipf3L10841ZjEj3Ry7SpagRoc1Ij/bd9iD2I6xeSHpWLXE1qcOklcGvQEJrQBOQ+
	MJ+vuuldWTINWap8PMtMjXXWBXOr+TqVXG3nXuXNoTwjOarHxtyIfebTCEfOpCrkLmSKltqptcKfl
	8WsWRdYx6rMgrvwPRy9b74fDGYhRUv2jSaz/KloK3kH1O0qGfZHJVUpXtrpvQ4F33A0+ugOLv2Nkw
	RDvprhIqFpAd/qQbrG8vVg+s5PZyWttgLuJi0tGftBgqGaXt5YgYCs7PXANijefOm/l0IVWkcEE6u
	cPdoV5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR8j-0000000C2E2-1HV7;
	Mon, 10 Aug 2026 14:38:09 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR8h-0000000C2Cr-1SqG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:38:08 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9696319e14dso699033241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372686; x=1786977486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=pUmE9aA1PWbm4Wmde6UZ03cSo0loU2yThrlxvo1kZywQysGwuN6jXeqhprtxYf19OR
         Qk0VgA3o4RhOzQwj11Z4V7gyblHqu5H3D6XRgaAyDv/i5cNySaesDe9O/A8MS7TMpZUc
         KNxL0GOUsPPpCqg9dtQP+IV3dzLB9p5fBCaHT/UOf6Xp/MqE5P5TR2YIM7i28VhQN2Hy
         2dwA1rpcdUjFgPr+kv3gnkYzmw3vDtqSl6XFrBvrLoz6K4U0xsRfy8C9J3ZhjzAU0hK6
         eiyuDnpYZV2kHLbXAYfZUsdQNxjaQGP6BrK2k+VOqppTKn9szlMiEehMfkYuRRe9r09L
         asGw==
X-Gm-Message-State: AOJu0YxtHsR45kl3XnH72EwLbKYNfRdo8ZN1KbpbxWuWbKo9V+a6qmHk
	SuCXc9e1qVv94lLVBfIU1t4og2YfHwSdbmC4NKSGJtsBDq215Xa21KCkQGlYq81K
X-Gm-Gg: AR+sD129Uwx9o01HuwydWiboN71AWM1mSTdaFJKafrN8xcF1clUglXyTxy8YOWNoip1
	GAcYne0THKo/ddeJBYXcGA1g/muU07lRkRRgQz6F03M6zBbx7Zp70kBVps8QIyes/bSdveeiWuP
	0EAnnheD/dwSIGOuvheYJpsMN0izKIy1iTVHid7VPGZwaP2/ngznmg0c/ZorDco+vNYkO2/S4UO
	8GvDOh17XNia1dvxbWsoa/rMvRTr0pl8rqe14G5dYVRQ629SR8tE2CzunrcLvmNQY0sNfQ7KQq+
	27U3xHd5SljU7Nvn/Au1+vzUW8q35KKkQzDHkLxabGxfgaensZkyB5FsWlyjzB4DPc8ozVbx9VN
	CnYAeND9XBXguu6KwV7jT3VdSUWV60OkXkYOa5CgVltgTO8O0UMEK48g5TevcqdDoHHb6rqdQwL
	HHaOA73pvaW9P4bZkyhM95x5G3rj3b2yGfuJ6DO3quaCRbNK3q8rRNngj9b8IAPab+QpWzbq6eM
	kxLphFUkbql/Wsqn/tyDqcgyV4MaQ==
X-Received: by 2002:a05:6102:c8d:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-760e6cd86a5mr10194041137.4.1786372685749;
        Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f3081eeasm3628997241.12.2026.08.10.07.38.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so543198e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
X-Received: by 2002:a05:6102:534c:b0:728:53be:7c87 with SMTP id
 ada2fe7eead31-760e77dfab8mr9982753137.7.1786372685152; Mon, 10 Aug 2026
 07:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrVzFKMYwOJsBj=We9_fRNruL+AAfBwvvBb_fVK5oUDw@mail.gmail.com>
X-Gm-Features: AUfX_mze_-zHFwLEPllsdSuJpX2MOFA3Rbmq7xanY1eONL6iFxyWiwDqSoDZXYo
Message-ID: <CAMuHMdVrVzFKMYwOJsBj=We9_fRNruL+AAfBwvvBb_fVK5oUDw@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm: dts: renesas: alt: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073807_385377_C360ABCD 
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

