Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51C6C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=AsTrccZERyD5Y3ah6FCMoOFVa1
	ysJCsWuTRN6eGG3bFxMdjeTEmKwJxH6ExC7xBYFT437SOIEBw10UYJ/anvBPL7a6gUh85D2fKS+QO
	USpCZwY9e4xuA7K5knl5bwgw5woCNRXaE3ftVGZtdhXJhkYZZNst5uD7E2O8R8KfLQTnDhEOHFzsr
	y42sVMOn2DoExQchvptVNZw7unzLa/WRefdUtv7yEidqTap4bb/woQ8NKIC6VeX60iyGJhSHPkA5Y
	I+kjPmmsnL/S4dOl+TUppIypjWUCpnwtYQcoZJUfcZE0Pg6h+Yzdtq2vkNZsIKkpGQl4FpWwVGmNH
	dDJmYEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR9f-0000000C2Po-39Mm;
	Mon, 10 Aug 2026 14:39:07 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR9c-0000000C2PE-3HU1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:39:06 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c276bd3692so1704493e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372743; x=1786977543;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=K+zAfkDRrxrdXgQiFqJzNcVgzhyvMCI/SJzfd2GwfSBPuXzx6l8Hf85l286Gg+5/zd
         odCjkDIVu+62B2piYia9WsM/gyt0TUBYFch0B5RO1Uo2C7o1UZP7EoQCBPMmoKDMiacP
         cldcwYU0XJfTHZ3DMW1gulie//1XjiWyJdKEGShHbsqIS0iR+Z5y5IE3I2ZjgtRIudrZ
         3B8eZhf/1k680ACkibSQLTJb3V7qCA6PBV/3nAFu3Z0hon6dZy1D8SBX1oKIuAKdmLq0
         YJpHqq97He/ZLMx7tBL/YH9C2sqTeZ13El0LefTi7qS4fnDBMSMf6saY6Dybi7FN/G49
         KkDA==
X-Gm-Message-State: AOJu0YyrQhjLaxIXacn0CLIQMfvAAHgnEkMD/Vzb5BNeJTTh3iGypgm5
	PU9Pkj7Ho/IpBwJSvnz0aCUJXm8o8fDWsSQpsGLxxczWm7iv6sUszhakwSj3ORCG
X-Gm-Gg: AR+sD12hvzchNdwyrDh7PZ3RwFZlrgsCVkQTjPtMMT72EMCGSFzwO0Kaa8mC59xyGcE
	tE/MAQM/mM4CIccytf5pJnjbwX1FDScp8o1JS4/KGXweJ9RmIIEtMWDO5xroxhyRzokp15X+icc
	UAi1LzLVrd7e/PCsYAyJvNiAGJR1fvoUkbRN/x5cTMd+7TtSZngS6WwxZrzU1z+ZHVPkLs/TvHK
	G0iE16yTcMBZea3ekaEfJV07LOujdEpoOxf5BJHuaijDyJmmDs6O69xTYGQptEROxQ1i5O/83Du
	u8uJQmh6J3ajnQXANMVdy6XeC6zTfhoKNgbVv7eZ8ffdOQMi1VvG1H45r8UfZ1yqjaSAGI4J/Ul
	Zx35hoOc8zj2adS6hdtGC6WJqDoyCHi8XpM29En+PWS24EQ2osWZLytvjf/K1WyavWi23+JQX6R
	u2xOO4j5ebFF1uAlprYLmZMn7wHpDlb2efiCW5YsitU8fcXd9eTw2uVqS5GWNKUYSJn2oe/HhgU
	Q81e1kSLJ1iqD47dQn5iTw78Q==
X-Received: by 2002:a05:6122:8b8d:b0:5bd:ecad:8f80 with SMTP id 71dfb90a1353d-5c3f9e68046mr3975571e0c.2.1786372743428;
        Mon, 10 Aug 2026 07:39:03 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a7e95sm4500100e0c.12.2026.08.10.07.39.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97727c2064fso1303374241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2c88:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-7634b995627mr8426129137.7.1786372741848; Mon, 10 Aug 2026
 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPHrycOqtYsAf6ui4mdGAv_tp=EhgeyiHzvJpuuxJPw@mail.gmail.com>
X-Gm-Features: AUfX_myvevmtR5joPePEVta7aMlmbyqquBFhSTNi5eja1FOfxEmgcMn8mxhnvEs
Message-ID: <CAMuHMdWAPHrycOqtYsAf6ui4mdGAv_tp=EhgeyiHzvJpuuxJPw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm: dts: renesas: sk-rzg1m: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073905_233415_B68351D1 
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

