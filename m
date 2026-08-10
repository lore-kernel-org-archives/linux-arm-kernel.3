Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8096EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giEldGY175WVS3peHWMV7A1WyTzZJJHYTsaFpkbRHpk=; b=HomCdaUT9UY+sC/gg4+Wa/cevL
	yiGjngIBOJFzxzNaRQ2gPLzJI6VB72IDQdH/ieHT062PTi9DXsxNYg90M13ni3DPOcERAPgLLQ1Ot
	43csggLNf52Rk1eGRM2mDnnrYWeeqqUURDzuS/alvrlZiV1t1dswM2LhOLHwYUNwhp6RgJ3CEjtfV
	iTP9RlrR1BJ8stzq/hcVA2/TwvQBdCq6ClfbFN5iXzyw4nDP+zOe5685p5uNa8Pb9JDVZpLAVdFr/
	MxF6vSo7/i3kqGeSEHjnJ3jHdkCqlj7s5ixsNFSs2yrZQ/TJkFYA5Un94T+6OXbpjM9I5QNjRat8C
	vu4Pe0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRCN-0000000C2og-1c14;
	Mon, 10 Aug 2026 14:41:55 +0000
Received: from mail-vs1-f54.google.com ([209.85.217.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRCJ-0000000C2o8-3sfh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:41:53 +0000
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-73a442f7cd3so1238159137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372910; x=1786977710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=giEldGY175WVS3peHWMV7A1WyTzZJJHYTsaFpkbRHpk=;
        b=WF9r816XDaI+nMbzUw7wgjpkaoFr8A8eOKg6OEgHDET9J1OZ/d1u+d9xJZuRcUxgUV
         tSh8ijg5umiA3Xum1Us87m6wp+EznF4iX1bYeTjE20VPFlj9zjgDqizwh/1slpTzO+yK
         EgIhU2vDykmBiqEKEKSoby0bPbggeOUAfDcl1GV6+rhk6rjQaKp7GvL4IJGnrivSD4bz
         U12YJx26EJ3q5yZUtlWfayc5rjDD2XcZLdgIkHCoVRwblxlPe+zL94Mpp2vAUZ5p5F+u
         TzqvKFJ5Lt0AeFH8X3esYLJriXtWjElrRDobXdcZtvho/xQnBcrXWmQo4kqj3owMgV3w
         R5sg==
X-Gm-Message-State: AOJu0YzDW8JnwQqjZ7v/zQBO1RsY8OU6LVTGaBuoBvx4t97IyhYBQnn1
	BSLxDbFqyey5q49hVgITToyhzxli8bEqX/iAuqbtL8BkXuHccuceS20Ocno4qmb7
X-Gm-Gg: AR+sD11zoeh9ne9rTaXFrcarPQT2OCnDKHFZphVKoUQgobQ1GxYwa0l4E6hbpOLj6Xa
	0yos/GJxBWQApWMLUCBDD+u6dorURKds+7qfbVeBfWtooq14kKyGyTv5wVUoVn04q1olthWMCHD
	ToQSlODu6QXfwPtwmQwvQaKeaWxuixfH/HkrrfHuR7cpsK3hcV8vGzOVR4BHIv/Yq+GShWwoSoP
	ziiwdnugjrFBytKtK25tQJjz0qfjzTIuzLw90LamdOEDhavpW/AcSHHVTYmHi4xCYZIAFhO9psq
	DeGp9yuVPKlkw8wzT4k5HHusvppCgwwrH3zQErWRjTQEVlLDplRqNtdenswgIaCGld6aNDqHUgW
	Z8HqS1l6LGclhWcJO5C1ZMCvenlf28V1yohtl69706c3VjoSOxI7I568MKIZopuSb/AYynpA85f
	t9e/3H94DvKyTfv5KCv+1iDlOwXlKKjitprzMWF8HDv011o/14YdVQ4vukRIhBFqPMpfvMOYAeQ
	ZEhZWKBntATgvIWcrU86mJ+Nw==
X-Received: by 2002:a05:6102:41a1:b0:73e:9fae:5845 with SMTP id ada2fe7eead31-764e1c5f6d2mr5644120137.0.1786372910589;
        Mon, 10 Aug 2026 07:41:50 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4da46dsm4712795137.3.2026.08.10.07.41.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:41:49 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-966e7380109so1390696241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:41:49 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:737:783d:1912 with SMTP id
 ada2fe7eead31-764e7be8d9fmr5541460137.12.1786372909447; Mon, 10 Aug 2026
 07:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:41:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP4O9O4hQ30mz8dL1iw_AgEPuqqZqRQiM=qNGqb2bQvg@mail.gmail.com>
X-Gm-Features: AUfX_mzwLbC_augmoVM0gc4_01wytzxMg7NdumAxkIRznv81wSo99Vl4iox5wsk
Message-ID: <CAMuHMdWP4O9O4hQ30mz8dL1iw_AgEPuqqZqRQiM=qNGqb2bQvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074151_964420_3F4D4BA2 
X-CRM114-Status: GOOD (  21.05  )
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

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
> POWER SEQUENCE TIMING INTERNAL REGULATORS does not indicate how long
> should the system wait after deassertion of the PHY reset and before
> starting communication with the PHY via MDIO. Opt for the same value
> as used for KSZ9031RNX, which is 300 us.
>
> The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
> POWER SEQUENCE TIMING INTERNAL REGULATORS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9131RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>


Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

