Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F5B106F311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF0VWb50M+ZUryfs9KzhTMt2/O8j1VfHTGDlP+pSQVg=; b=MpU0E3cbR7yE7DWr0rtjkdW2Cg
	GQURuMSd6Ls2Qh1vEduhGX4anVDbyH4FW2QnCjxgJo8F5jJqrfBfUHniJJxwm3VCNbUn1yymTvvUT
	zCACrI3ksMJ6tv+QXlo2n6Mqx7ckr76hmVlBfWovPVavHwTfSMhTGZcjYnrOwafZ5px2OS28EINoX
	x+jIU4KhZK3bLsuaotni4zraZcIBXblclP09+wEylwCpkcBF4Yq2n6Gb9CoSgnDNrGKIoyvHvQ5nd
	f7UBN5nVmcxVVyZJ62njzXyDORKNrfSTlechGPmt6Pjg9rRwduJtdd3RehK+1RAMomi1nA18QEBeV
	9ipUOWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hIP-00000005BQT-0s3Y;
	Thu, 26 Mar 2026 09:46:33 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hIM-00000005BPl-2oR0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:46:31 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b7043c97eso336773e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518389; x=1775123189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF0VWb50M+ZUryfs9KzhTMt2/O8j1VfHTGDlP+pSQVg=;
        b=ot7E0l9Sppjs/ZH9pT6e37ppObWOBqx260n+5BW5H99idH81xMz2OXD6eumAsW2byr
         CJz6nCh9IsVBgt9LmHdQ3FMzM3hs4UzmPmqpBqDPikHPvIqvKJ8sBsGOvFbkllyRSzw4
         ExKnT+mu8A6xeJvTTZYUMZ3/0OnxGo92mGhchRU0Fb1PfPKR6tQ+NHT1xwJiDrEAXXgm
         HKbSZ3p3z7znxDrMiSJ6J0YuRcN1M4Pknm3LjPOP2cx7L0BSbeHKj6Y7RFm33Epb1rDD
         29OX/ihJGZrLGZDWdAVYh6GkS+6xoMwUvREq6OgP8P5I/m9Yf+wvjL8JZKOMcohXBBzu
         aymw==
X-Gm-Message-State: AOJu0Yy/AeaKq08kUy+ndRya3Bsy4qn/8S7E7/SGMnc8uEvdswa3V9F3
	ZcBIea+wJoLMOoIkfE00i+6Caa/xqD9V5+Uihimq0B3RzDQCxBy7bVeKfGqRwyOSSBA=
X-Gm-Gg: ATEYQzwSfhWE5r0mx98WxXKgAAP2jgtnhMTJ7qG49LG5W1mvZk1Vw+pz7ikBVmfl+h7
	UL4rJauEdzfBDid35Pt2f5eefg7a9M/KLQrS74g68MvGXFNiqP5Tw6MUJVS3lq1sT+wOfYKbT8f
	waKPabU9ax+8vJYgimfRX579RpD4oIgNKado7VcdNolxZGnshgBNnG5xxPIk2M1kNpI7PMME/0m
	1TQyDz+vjkW4tgEVjPSaxtcuYsN+MhHD3CG0xtKkhZkfen02vFEpBHQ6E4RsUufexmCK7v7XadO
	X2tPRe4/tvdGRDqHo/qJUwjKiyVrP/NedOj8MNdtAwM1UchyXE9dB0+1i309KPPHBwzDwfgeoM0
	J+G48B+H5FJE3FZSJ2NZjzXmiNAaHWrFFAwoV9Lp5XPDxRtMwDRQu2bx96RPPvlDlul12c0jOJy
	YX3c8ZdlvcNELViS9V/PxdizJteE4CAjn2+afqmUu4U83uw9nt3JLZcocWlUwd
X-Received: by 2002:a05:6122:6611:b0:56b:814e:d35a with SMTP id 71dfb90a1353d-56d21f7bb81mr3819750e0c.8.1774518389179;
        Thu, 26 Mar 2026 02:46:29 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c3097fsm3586570e0c.7.2026.03.26.02.46.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:46:28 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6031949debbso218524137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3351:b0:602:6c69:eec7 with SMTP id
 ada2fe7eead31-60387246888mr2874362137.23.1774518388244; Thu, 26 Mar 2026
 02:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:46:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU67BBLP4NEZmvT36Pk5OjcbKEDjdyw7shZfiKhwVNGmw@mail.gmail.com>
X-Gm-Features: AQROBzC40eYoryYksApDOIGtz-evI70xDisaZpapKThRIts9LzB-N4Lzp7D6J98
Message-ID: <CAMuHMdU67BBLP4NEZmvT36Pk5OjcbKEDjdyw7shZfiKhwVNGmw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024630_712966_DE6AF5C7 
X-CRM114-Status: GOOD (  17.57  )
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

On Thu, 26 Mar 2026 at 05:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ8041 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1537" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

