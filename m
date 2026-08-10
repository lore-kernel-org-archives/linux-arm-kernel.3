Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF46EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=; b=0dzK6uaS0GfCDLiU+/csi8hR2q
	tikz8lM2gJDE7u/9I6sfB5tB+Sh8C7VCicrtzAa8TT0urtPkdZDq3Mw7i0j6nanzrR8ROFH9XQ0B5
	U4T9SMCTbFgXgeBwzJ9Mtb12aYiIi5c3ZdcGOxWbJ9cyqMnrNLk12liPnCHY9dAn/yoIXx584Ahqf
	//TZqrL/IdhhyEkX1ipUwAM5GWlqvYfrczpKIKl33dd2HVlnkaBcpn5bWEH4vbPzQtl81pQOL7JnI
	xuwnxq53L2+/W7foxzWsJ0By2vYs62D5duXvz75ese982eqE/nE2BD+2q8veQn3loVZLFE4NzpAkk
	rLhTZOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQrJ-0000000ByuS-3K4Y;
	Mon, 10 Aug 2026 14:20:09 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQrG-0000000BytV-3pZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:20:08 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1506146e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371605; x=1786976405;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=;
        b=M4EbqKWa3pMsDD44ikRYWDBb6PMzVu8Se3nuWmVNiNqbsxqwxIULTwA2xzYG1kXKU3
         xy/+CiXAmb+keQ3ypV3In98ohyFAw2LB2VNfqtcZN36OWQI02aZZ7RQmwzeWq9x1zQpp
         +zEpYFP0Yx5RPPrtqEupV3NVgDnO7kgUHzh435m/xFd0KK13cyM4c0wcwJTsLBGB4h/W
         tetL6xlCcRGogGolls4qPwAbat6/9F32kF+RZmREcV2ly9FvsxFLypMqnyVDp+yiSqkZ
         7JGl07PIQgm0ckAU9rN2x1af0qEHsUHelmsuXLwEp2QjGoxECB6Dlhz28Fx4gw9Oe7LN
         9hfg==
X-Gm-Message-State: AOJu0YzJ4DVgZEngry/mXLbm76dMb5+UfsK6rb9PsOeeoEWWeCqmK/Cy
	u9HoA0pDDd0m5t+LniWD93OWYM+liWDTMq+cdFXq/FE9nFXMUB2pWwjo5FmUVRpF
X-Gm-Gg: AR+sD12IwivDbQBylxal4UUFamiP0uyPLc2JnMcPZJo/HuHm77GaIPHaeGA1+BJC2qy
	e7lDSD1Sq+1Rt1WIU8e2OOXlGVLcVAseLDYfVXzDkU7VreRhi/Ci7z170imfVpWa5bDNifA8JPA
	VCcunyI5XMBPrBGNYr4z7av4mG2D8WRk4OXLKCVWJeQeCVF4Jm0ns4G0RuEFTI45i7tg3drlmIT
	HSKgC6BlB4LL8W51z4jVKEba5oCWE19RrZ4tb1yZfa3LdPqey51IS3tpE9xeAnPhn7+7aHU8tvJ
	GRrdv53ldHGdNNv2+V2dTtRULWN7/82qpf46rHng72BAbPie0W3cxcqpO7sFMlmzH3nAsb5o3hT
	EuvZCcFgrHUe3VqJ12IwrEnMY2f65PXhAbpZTXCr0DGrzX4AHOC8G1TDHVp8G0PNbbo8LI/9YUX
	6etICcXz0o3T6zF4NDHsVEfwsAHwYrGoQxz5iif2yVm7Bvo3tiYlw7wVZtknl/lAJHrBBTjq+Iz
	iZvq+zzoaP/Yv4LV04LVXU4wQ==
X-Received: by 2002:a05:6122:32c7:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c4418e4a2fmr327369e0c.1.1786371605629;
        Mon, 10 Aug 2026 07:20:05 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8007sm4495377e0c.11.2026.08.10.07.20.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:20:05 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-973b676e5f5so1074765241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad2:b0:744:a3fd:410a with SMTP id
 ada2fe7eead31-768e8940762mr560960137.14.1786371603877; Mon, 10 Aug 2026
 07:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org> <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:19:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1soMQwibF8kr+K=aStvzRoouDyAms45U_WQtWojdDjg@mail.gmail.com>
X-Gm-Features: AUfX_mzmyaFcfAhDqolFSfcUlHhBbVcrn1RxopOMapmQqRAQ7qu_SOQmReL3jC0
Message-ID: <CAMuHMdX1soMQwibF8kr+K=aStvzRoouDyAms45U_WQtWojdDjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: renesas: armadillo800eva: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072006_949946_EAED8BD9 
X-CRM114-Status: GOOD (  20.68  )
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

On Tue, 14 Jul 2026 at 15:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
> POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
> long should the system wait after deassertion of the PHY reset and
> before start of communication with the PHY via MDIO. Opt for 300 us
> which should cover every timing option, including the 16 us delay
> required for MDIO to switch to 25 MHz listed in Note: in Chapter
> 3.8.5 RESETS.
>
> The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
> POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
> supply voltages to reset high is at minimum 10 ms. Set DT property
> reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
> spell out how long the reset has to be asserted, but this at least
> covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
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

