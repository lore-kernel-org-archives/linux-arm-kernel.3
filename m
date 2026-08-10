Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D03C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=cF3Cma92jNbQcm47ikC9YtGMzW
	wbvm+R3aQAqhtOTZl3sNtovExSWBwYf2JyuEDXkawjFO1Momwy21w1agTAO8yi6gRKpZd+DrnczM/
	3Q95AbCSxqOIPx5yqrYXjWeZHbuJY2dnbBeHd7RaXNOi1Sycql0CWUxsI6GyZlFTzuDRgtEuGShNU
	DsDge9bXfZG0piwaxxOt2isvTQ4MJ9/8IraqMiKw20H7hm/WkXQ+PHQYYXAibDYXVnOm7uqdmPweU
	XpTn4JFd5ANaCL5oy/XJMSzVYYbj/xaOW8dcQAgJEWKm6l8csb9b2obScQITjhzNgPq8w5iUNTNh6
	HaoxBO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR9F-0000000C2LK-2Is2;
	Mon, 10 Aug 2026 14:38:41 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR9C-0000000C2KT-2mCp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:38:39 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-979fd43810dso273423241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372717; x=1786977517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=DMmGO49EHzbLKyonaPhcq9Xw6JMvLO4qQZl4xCYSPMEaCWFYzg936iy+wWW2+bX2MO
         LV91oW4KAYk3cPCyvN7KxqXwl3+6W6Tnod00WNufOQ0turJgFUdahIeYXb2ZMqop32gh
         aeJDwkejaV08dZXN8kfL1e4rrFq9dJPg8J1Ul3D2ye1mWBQoOKW2wQ4NSaKaZS0LUUiK
         MRnrZadO2s4oNgt2b3T0uW8UXdyYLHHIBIDqESuRm3IS/pyrmPTo9ia1VCQrGqWM7BSA
         BKMZDKjTD0AcEmJwJDObyTv8w353CcGPLRem16AHrOqQbeYSoYMz3T8YxTn8YG/FOkh8
         iniA==
X-Gm-Message-State: AOJu0YwS9nV5jzNQjGBApItCAh8OOoD6BKd4IeII4Esc8a4E5cpVWb2V
	tRu4VHZshHCk7vvF5jARIP3S5Dpjv2yR8T1gIV3F6p1ClIcTv4Hy8IqLq0+/5f/P
X-Gm-Gg: AR+sD11ywJLYWn69ofXAglRWhUvZ7vH2ycKilLn8pgqd4ehUtRHFcnXYxBZNx40OftL
	QvI/dWywbG3LmhjbjoBlL1gMzE4nUSW1+i2bYsgA1TfSBrKHdbseODsQfwWQjrX1tCj24IIptP/
	tjn29GaqzESkdxu/LqX912Kq3EYTgdSL8MD/0naYbyDDOG6Nh78fbM5zBS5TiL0ug95msx5LfHX
	gdbzdGi/3LXw5qRbXy0LXlaUOzodt5W3kkmj6vTkvS4y9K18e1k5AtO7xNkWrlLWnKH/QxvddNk
	ZElFmk/jAh6sAmcfafDnRlfu4mmQxTbpN8PRjqeJPsNXm5LZAXESkxsdy25uYIu5Iv+pX2EzEgK
	mUR2/TTDsTnF/Sk/MGhIy/kxHzsr4MElSVU3YX8IzWJScXUcU+C2jGhTyKHQYNn+TSjgt8g0E+K
	jtaKcT7GnFMQ5V01Fx4LEPv/a7rjVY8UEBTfbh5zsIv1iYeMTyVkQA4efb+ZxcnBoJ9AebAOzPj
	EWLcltJvBAIYnXlxQkqb4LTBA==
X-Received: by 2002:a05:6102:14a2:b0:738:9c30:2baf with SMTP id ada2fe7eead31-7642d16f359mr5271908137.2.1786372717298;
        Mon, 10 Aug 2026 07:38:37 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fb6a7164sm4829340137.0.2026.08.10.07.38.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:38:36 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7466771f1caso583032137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:38:36 -0700 (PDT)
X-Received: by 2002:a05:6102:f82:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-7642d16f34emr5609033137.1.1786372716525; Mon, 10 Aug 2026
 07:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:38:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4V4tUe42jjNe_PZN=3cPuNfY-f48SfaM30DCHG6T3cg@mail.gmail.com>
X-Gm-Features: AUfX_mzMBIGgMQPjwxj1aRVEbLrB1qEDZGXr2C-cIphISdXHCveNYmgvbEJ2aX8
Message-ID: <CAMuHMdX4V4tUe42jjNe_PZN=3cPuNfY-f48SfaM30DCHG6T3cg@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm: dts: renesas: silk: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073838_700355_C4FD6BA6 
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

