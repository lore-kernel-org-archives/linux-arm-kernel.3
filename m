Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F1FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=zBuSCt8cP0vpCJD9UxAyXJqiYS
	H2hhis36mrKBib4vX6MYydaky+5PXbg4922cEZQdxYynlDy5FUWTMWZZNmcvvQwc6Vsk6G0hTkWjf
	fakhpoKpOaz9UVOVbSksf9Z9cJtgzQj/YBKGTzldMw85NUpFc54Lz1zj2JXoLsK1mwVwJ49HmxrfG
	BOTsCjIPxDJSr1+w2IRHJ9sgJlojhfNtr9e10Lv9dPRe4Kd0oDhWni1N7ZUxBRftBNUNi/Qst60Op
	FyLfd2OXVocjFmn/WX6ZWgEHlDSWN9bMr/ANoB0byFNToHZ7j9ApCmGXQ66+DGtr6nu8+rGiK7WVy
	bqJnOfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPqY-0000000Axn3-2d1J;
	Fri, 22 May 2026 13:23:26 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPqW-0000000Axlp-1hCC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:23:25 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so1263134966b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456202; x=1780061002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=P9vgOuzk16ZDAEREysOtGohxozai+fHDbS1+acpL2nmcLP+733PGBMQzjkrIFOV5qq
         a6Wa6HogHog16wBuj4FDR5p+X2w484tDSMY4n1q5J8+GiRLbZOw/Kfds0y5+xnm1W11m
         aqgVoTwr09Kx0SUSCCswSXV+ekBrA1s5I+N2TxV8ydfW76svTYqSWWLysP/f+7RLf8Rj
         X/svncK35blUVpUlW33tg5B5rg5cC+Hzeq1nZ38MO/54lJ27/6hD0fewTQLBFBiOCkX7
         ftcYsc35+ZzW2hO6G6WYCXnw4zjytO5qBxg3sSf0Lp+JtiqB14qy+UwufSZZW9g4zs2g
         tTJQ==
X-Gm-Message-State: AOJu0YzmRG8ZfYxCWeQLTgq5lNB00IWNWoF5O9TJAGt99elDNXedk2ED
	HDKIM5lshUQSxZzK30reVMWJ/rbcI1HlX9EBb7HwKI6zi9Cu4JQcxRs+GO8VbwdUhuw=
X-Gm-Gg: Acq92OHAZcQ5v3YeSCdZHUHwE4WbrFZhE8wGyRhCgWnZM1gDFQwpDh/zsiBYyEBBttl
	1TL4eGJezD3KDJyoD4Cjw7qKP2NzqOZU1usejrmugvD2NLCfaOLeaPL8FtkPwqZSVAHL5ZJ1UyU
	56Ft3FNBJr2ONOHUrsVbjIvmbiWgSyJ1FdQJqo6eWY1JQXzNIrXeg8cQn5/zgF174XQYFbJGn2l
	VfhGvy+gCqwkxlC0rsRFpa85kbIc/+nhpTEJK230sJJzwdOtjU+xeL0mtXKBFU6Ri1k6ytv5iLY
	3OvzCaiyjcvNaimriRTJa8A3vWZXeIb6PHCoG58kxJe9of7Gq3PiFRWz2uxtm3K4+NOrJlXy7GG
	DovpjisdMjNCH60cwWknVG51QMz5+1J/qPCieHIa7pl6g7h7ZtrMnqS4cQA5ut2awgomp6BqVO0
	0skyA0zgWVtbThJlbQVF71Gq0iAF5vd2jxguGvD69EurbM+k6pW6YjQfEaCR8NAi033+oes/o=
X-Received: by 2002:a17:907:3c8a:b0:bcf:9dd2:f79e with SMTP id a640c23a62f3a-bdd26cd265bmr248199966b.29.1779456202469;
        Fri, 22 May 2026 06:23:22 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc68e0ad1sm52414166b.60.2026.05.22.06.23.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:23:22 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so230861a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:23:21 -0700 (PDT)
X-Received: by 2002:a05:6402:380d:b0:687:afc:23be with SMTP id
 4fb4d7f45d1cf-6889c43e8d1mr1763806a12.6.1779456201755; Fri, 22 May 2026
 06:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:23:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8vraGEzDa867W585P438Q-Ad6pV9jTCNG+t08kzqXqQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ihk2THxP9D36ru28lIf4LHCgnk9MqLoJMcextr1G3iaJ6rvpPRhCHiZPg
Message-ID: <CAMuHMdW8vraGEzDa867W585P438Q-Ad6pV9jTCNG+t08kzqXqQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: renesas: draak: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062324_440120_3063B2D6 
X-CRM114-Status: GOOD (  19.73  )
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

