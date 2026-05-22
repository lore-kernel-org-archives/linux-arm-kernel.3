Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF3CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBu5hzdEZCJNEEaSkylnsZS37JzN/qLiW1wsYZsF+yY=; b=pb6iAir9ry7TgzH2F9frwDZ7+8
	FN/vtdLVrOL/tUTXvXgOg8gPCZWN30JyOHO1G8nDonFkDaP9pvfzEhB3ARNQ3txUCvz4UMqBP/OGO
	SbV94/80HaPrS1RpNb8peIJJnkhxhdI6Pvz+62JDg31QQHorUGhy7DL57pM7co3P5hSNJKJ5AGurw
	5XY+ppnbrUpsf0mjkkvQHyVQaU/cd2i1lgenBtgvL3MLuOjrIfvv7cRGMeUaUqdBHAnSCwsil4Sxv
	GF0QwMvf6wNvmfFj7a+uGLnt6e6pLl1CBzUGd5hzfwVllaNQFCW3Y/iYN66Y/ZFfVmxfBCrfioYzt
	u+JcX/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPqA-0000000AxeY-1oss;
	Fri, 22 May 2026 13:23:02 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPq8-0000000AxdA-11Gf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:23:01 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso12121854a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456178; x=1780060978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBu5hzdEZCJNEEaSkylnsZS37JzN/qLiW1wsYZsF+yY=;
        b=cPoBBueFE9kTh6R1SbDfgjN1ClSfvOx9Ffk9owQMFiBC92zb/QYNTrEPZwb7NOzVM4
         iNWtKQo4/9P9DkrWCZGnEQhhefPvfuTGDucicJE4DpL7pLti6Z6DZW2UkkgfVmdW99q6
         cscpIqAGBgNBYUuRfjWXinST0d8I1IBslDmqhl7DHPNvEJH7zzUiSkpKaVRx/X2BIt6O
         vmRHZifdXQGAUvKWFQzQeyEb2kUjgPRF5sxrFNZ7zAJ8T0J1YHyvOh7nB/IAjbn21uit
         NtYK4vnTfcTgvvXWb3qPKk93cylG05lmg47jO2ZPfMOMxJrz/9ao79z2iyWF0FJnc6Ib
         XDPQ==
X-Gm-Message-State: AOJu0Yyn1EzwRr6HrxQM2pf9lxNu7Mm0IWv5SbQsNDk/8llpsJE4s2en
	7ENodIfITjnXolVTX0ODWsm0TdlHeoWOTcobObGtzcXFug1kI9pgk55j6xI0fXULlNM=
X-Gm-Gg: Acq92OHRzpaYkKM1kpzdYrSIGUqU/83FI9ETab8yQ2Lx6ppVmGYTFRqEaJRtAdaxkfB
	kX15p7VR+05VXJ2j2clAsRTCLnCWyTYrcR5zRZ7T9qjn2N30+Lm66Olp29GdP79DD2XEGikiBiY
	bZm9RCDyYHpVTHsbnbOSRykSUWD/IA49mLK0ian4abakz6ZunOI2JuyQ1DizmwGhvVoYcf8n9FZ
	SDjsMILjmaHDaHTa1G/LekRyhj387h8/ZIsNxJ3rhu/GHddsYfiSdXRSRFBeLw9o90OCtgx6Y7C
	s5ybbrwruLvDgVsgfQylaYClGpzfuZZ9486AWjZOF+buTSNZIWHtctpy/SDDEmg6suhq2MbSBCW
	DDa+wukeN0et0eC9vrp44/3vxaIVzBsFWRk0/jxznqSfIQN8tf3Yg8cN0dUZqfp2B1ZxHW6mZMr
	gnhromIGD53a9jMnku2eNDqwQrMOyMaHDa5QM4F5cp0cAxhxHBDkA02ypJhkRU
X-Received: by 2002:a05:6402:354d:b0:66d:d2f9:520c with SMTP id 4fb4d7f45d1cf-6889cc4d583mr1901509a12.19.1779456178257;
        Fri, 22 May 2026 06:22:58 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm660552a12.12.2026.05.22.06.22.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:57 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6870f904c6bso5820930a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:22:57 -0700 (PDT)
X-Received: by 2002:a05:6402:34cf:b0:672:f3e:1475 with SMTP id
 4fb4d7f45d1cf-6889cc3247amr2056924a12.12.1779456177135; Fri, 22 May 2026
 06:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:22:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtQokLyFM3JOx2G1L4R9xd=nGki97-YOaai5K=FJjxiA@mail.gmail.com>
X-Gm-Features: AVHnY4KnysQXcgL1Uqam7oLPpsSLc3PwQrnRQv3msLbCEYBNfu2R-YDzbK6u2wo
Message-ID: <CAMuHMdUtQokLyFM3JOx2G1L4R9xd=nGki97-YOaai5K=FJjxiA@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: renesas: ebisu: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062300_729698_76BD0DFB 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on Ebisu-4D, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

