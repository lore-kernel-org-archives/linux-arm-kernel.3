Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D390EC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=; b=y0/i3tCgJ43yz9fcorpxuDe98v
	hNBWSvfQB0RnOJFPev++dwA51VL+1EHDKz6iFT3maD03vs3xrdq3et08sO+jdvf3w5fqOQ4fXqbJn
	A9DNMs2LyHv3eqO3YzklpS60x2ddmdFtF9VKEWtguYg6RdEOLiX920/m2MNoSwFDvjn6r16cVCl9K
	tRdPjrDMHprIycsi+CpZtMsCGrF0zaOBLm0Vug892ElvjTUlLwVWOM/VNXb2tDXCp+3BCvhFI4NT9
	Dx4LW7vv7BpNRB86gyjiY6R4XSmEqsa8Vo8rxhZW3XJsanr/BpcDBq2FEIvbfUWCw7J2Mz5B63WgI
	8+CV4A/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQqz-0000000BynA-2qKk;
	Mon, 10 Aug 2026 14:19:49 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQqs-0000000Bykz-1cRE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:19:46 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74748e3a4d1so949079137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371581; x=1786976381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=;
        b=oUTxFIAQyEt3/BAoHCUKNR+E7oea0le1de1EapU3+ER6FUPk8kmqs9NUtVCB961WMD
         tZo2VY9o0BK0f0OeNiyJuXHh2rqlhMCXIy6Sc08M8oy37aphrty3X+wAlpS+nx6RJ/wv
         qUc8pArz/KMwOkXrYIHQSgQnmfMng6y1LAXeQidK7XwNFirsnXD/AeeYhdLfZC/KMOzq
         XsDe5k2jXm7tXNomx6Jv1KRh1M1dyj/3N+XgaPe21IjE0521mGXd2We0oIlFedkqlL2/
         O0xNeZg0GZV7qWdFvLRm796LsKRwGpxT2asSiMSjz2y792qfwfAuImC4m5zf/uBStTup
         495w==
X-Gm-Message-State: AOJu0YzjXJ2vbE3E6cT5ERPhcaRgAbLlKuFaEVZxQ7JWg25V6pxdRXWH
	V/y04EJXF7nm1Iky8CRV6DxCan+ixFIcBxsqJlpsvNbBMtImqy+2qAP43ByZoatc
X-Gm-Gg: AR+sD11Vp0g70mxWQXb0onGbrL2EqgawLEbtp8TEahzmQ3+xlqCFVsenRDSrIDZYHsp
	kDa0h9rCndlJ5IPpaR5a6RQ6VnrsyIFE7T2kn+kbbFmuhVvngV1XBee//UgG/44w2ZhLXj1v1pP
	KJOWbWSR7atAjbjuLO1aQJmqFqiTb4tLQCQtzftYlvqPWRbtKU+2mUwaN6+KfvvKoakTK+nsS57
	lJE93e260tz5mbPhHZ0obHDozC3wzPVjO1ghObR0QWVlvmJKzjohkWDWDFv5VQ9eWqjqLXfh3fM
	DRAw0uNmOKUxo2mz/HVpJ2/yzhrlW+UxIYsbIi6TDvSv+WUHNSn7WkWmC6+bMidJ/h0v4mvyoJe
	kWngHLatTFoJIVEMucWwmCsb81XuHV34HEkIbSiZWnV6ZDCDbgYD7Bo3rrWx9pPHx7Se+ypoJTE
	6pmkz819VnVYtTvxKRpamm76Ps0oMBb6ubIj/Zl0r5T4knAQuMwNZfh2X82SWZezzE+vc97EePn
	PIdw84vMRXCr+DEUzL4TPU3dw==
X-Received: by 2002:a05:6102:5e84:b0:737:9003:ac54 with SMTP id ada2fe7eead31-768e29aeec8mr602697137.0.1786371581004;
        Mon, 10 Aug 2026 07:19:41 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2e53fb5sm3593534241.1.2026.08.10.07.19.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:19:40 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-752a7f4d4b5so1113240137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:19:40 -0700 (PDT)
X-Received: by 2002:a05:6102:4b19:b0:739:5cfb:50f4 with SMTP id
 ada2fe7eead31-768e7e0207amr545053137.11.1786371579827; Mon, 10 Aug 2026
 07:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaCOFhLrJdzbRRE2PYe2jA=Yiq9KTCRT4i4Sjyj0gnvA@mail.gmail.com>
X-Gm-Features: AUfX_mwCClbcVmT6ktSeGN6Av5hVIsJrTjBIhbY7_MyHUutP51gtYjLaOZvaetQ
Message-ID: <CAMuHMdUaCOFhLrJdzbRRE2PYe2jA=Yiq9KTCRT4i4Sjyj0gnvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071942_450127_C40BA945 
X-CRM114-Status: GOOD (  21.18  )
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

