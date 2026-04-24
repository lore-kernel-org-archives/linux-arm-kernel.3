Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C15FED3C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAdDpaEBGdJ4DrL6veRXDKf9tGg5aCWLhuxw6BI8jYM=; b=opDh9OfhFfRnzDijmtwR8xcnov
	/eljsYRG5ETlYbL44Lz7uFwulZYkEezT/N72AbrEhc+zTLZa3OXg4CJJguzWIn++oZWPW+AVesYMW
	fIxttz8X2phBblfBE0x4eh+rLPnQ2fvO6Z0WzlRGligsEY2ZBu2OfYAMOX04dpdHxK2U6le2JKLYA
	z/zoEP6kfjzuJaIMNEGe+t7cZ3OszRNsaQG70rajoWW/3haSDNY+R8bqzVQVqnQm6KfB0j6akHGUi
	jZAR+6J88L7aCsp9DN1j4RtTd+m1oPPnd/MhSkTzLZNOccqzxOFaqtA4SDCkCacU5z/+fvy0Pa2dd
	YsLOQHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGq9-0000000DGb2-0Tb4;
	Fri, 24 Apr 2026 13:45:05 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGq5-0000000DGZX-2tvS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:45:03 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so10495142a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038297; x=1777643097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAdDpaEBGdJ4DrL6veRXDKf9tGg5aCWLhuxw6BI8jYM=;
        b=OImJs+BpJjnjohVeiGes4GnhwGW59H+B2go8RnQx1qOcML+wwbJ61SlIHXSySingiE
         n7svV62TBN4wrlvU0pxO3Qt7M5F05CI3lhIDhFyaFM9KcmA8W+IwVChRVWbxRIOoP3RS
         F9KLSFwGiZhqP1eZ4uL9cM7l6/7/ynTntBNB2uQv6C1u7gW1OaPfTOAymolOBiBR93WN
         94TRZyNzxWuFt+5PguHZFE5KP9TQz6pzcRPKC1bXr6O2IQFkZTyegZdhVatdWFdCyr09
         vH5iJ0GRL+f/qs8sL/fVmtIVGQy35m/9u+a/xILxyMmngPNss0/QX3E6vZg8aUyrH9MB
         +FoA==
X-Gm-Message-State: AOJu0Ywb+TrmwbRoVjgdBT3J/LcwmPnimdmo3Z23G6Fjh+n75ap2mCcS
	EbyY90Q9GSTJOVEfyz0aLghF2fGCtdxEc6XAkX2F1JhdOF9UAUGUWXF5twSf1e7BVRU=
X-Gm-Gg: AeBDietWclo3PDlvDdTZRsD5DhfxhsFMDAWWlSOwxzrpZ5Wde3lVvE8Osupbq2KSMA2
	6X6DrwQRh2mavNiiuc1jtnaOlHnujjiaEazXAvAjpSV+8Xr/hhchmzBZ+gLxcybv8ZpJKFL6AJK
	t7AjIGHgx3pH1+7tcDaC8TsznoehP3x1UJedgyC7NUknBdj1KBwqhB8szUzPnrnWXPc17NaixJe
	h4wrShirYnKQr911Eed80V63domYyck2NPm6UoxJ1dkon52Odd6gO6pw2uKlOv77KrpKtueqVUt
	sm+a5xJTiKjjpZIrhXP7SzAJsNl2euU4uLXRIQi1nOattv8FUo1C0nFq/Wsw+VaVcqeTOURVw3M
	M+sK+/vECUI38amrr5ExZgZ868wOJKQZYPvHpaVhkZ5PLIcQghO2UNfcP4Pv6fiOZU17VyXA7cH
	XGWZNPxzidK4Yya5lzA+gIsrJRk2RmFp+G4Bc9Y1H1DO35uFwr7zkdzhjNm9goKWzrXuftaj67z
	EmxklXKsg==
X-Received: by 2002:a17:907:3f0f:b0:bab:7930:db48 with SMTP id a640c23a62f3a-bab79401ea6mr618797466b.46.1777038297288;
        Fri, 24 Apr 2026 06:44:57 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5babcsm4801487a12.23.2026.04.24.06.44.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:56 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so10495098a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
X-Received: by 2002:a17:907:c10:b0:ba6:8f34:b419 with SMTP id
 a640c23a62f3a-ba68f34b5c5mr1336772766b.13.1777038294976; Fri, 24 Apr 2026
 06:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
X-Gm-Features: AQROBzD95mCpvpKjt-tx1E1uXUYHVxRwIWBz9wiPmciBkPhVEaN-gD0qoxp4r-g
Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_064502_421976_81883667 
X-CRM114-Status: GOOD (  19.21  )
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

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/renesas/clk-r8a7740.c
> +++ b/drivers/clk/renesas/clk-r8a7740.c
> @@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
>         { "zg", CPG_FRQCRA, 16 },
>         { "b", CPG_FRQCRA,  8 },
>         { "m1", CPG_FRQCRA,  4 },
> +       { "ztr", CPG_FRQCRB,  20 },

This is not 100% correct: ZTR has an optional /2 post-divider that is
controlled by the ZTRCKCR.CKSEL bit.   As the Coresight drivers do
not seem to care about the clock rate, I guess this is fine.

> +       { "zt", CPG_FRQCRB,  16 },
>         { "hp", CPG_FRQCRB,  4 },
>         { "hpp", CPG_FRQCRC, 20 },
>         { "usbp", CPG_FRQCRC, 16 },

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

