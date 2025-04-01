Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60AAC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1zyMwtR40qQQhixsawu3/3AN+ghiZjIje47Qoy6I1M=; b=PhgwK14+BlHbZOiXT97HghxqlN
	v/tOSt0awfCkD+1/Mj74AYy4782xp7q5NAUpLx0bDb81DLgLI76kkJRrPD490w2f97arnMM0AWnSp
	0OsI9dQtKKjzKt0dk0c0/unAeR3aX6M9Refa0C5XblL1b5dTfq35VX9NaQsq6wIOZYj38ogxUoV8Y
	CSvWlrpjTAPPyG9zPs/VMKOAvJmnhkLCGXZy3P+X96M3P1hgJc2VYDHildGzqsYbHxhMEUVS8edk9
	XLMMOl2MEE2xzraKcHe1CnKQB/zi0TO3E1eqj9va4+/RTvfYcNiplcP04tEZb7XK7O1ofJAZ59MiA
	588xrH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYcn-00000002azP-3wpD;
	Tue, 01 Apr 2025 10:13:41 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYFe-00000002Wir-3HRI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:49:48 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523dc366e42so2296423e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500985; x=1744105785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1zyMwtR40qQQhixsawu3/3AN+ghiZjIje47Qoy6I1M=;
        b=aplw/jxqwCj9EBI4Ur0kfl/sA4YjuCPNp/LWA4mmGs6WZRq5uG0xiHRqkeo5vxhLqt
         sfwtBlTM0hhoyJ+4IgLcbdr1bEqgJvjdx1a9O6C3hc7+XQd/kOWBGDwEYI98kmHi3yJ+
         Uiftolcy1BdOwIu5mUSeTnKkYtpRKKriBxtFlsT60SDGOR9medFBA8nrkSRrxJowW33P
         EokQGYYXr+1/wP8i+mGsdNIvIKZzZyYHLwKHsr126582AjIPxBB0lXudtxiB7QPiG/ek
         GokBfRTqV9jIum3gVaRdlS0jMa68JWVli9B9miVJ57SyQaQH7H86n+gi4u473xIBkLAv
         avqQ==
X-Gm-Message-State: AOJu0YzCXOxFWolLCiciB1ro/1pCvevuT6i2qJazuX14Y2fwDS7Cj/Ux
	ZtyDuv4v7MnfNch/UegpTZy9nd5M9NYipmkHO8XsZpMupm9VIBgsKfERrsaG
X-Gm-Gg: ASbGncu/+kU4d95NnzKk/uyPFVRNfcxDjJ6dIU/Ue1pzvVckY6UiRl8w7Q473Bb9R2y
	dEGn93cR6geSH9NOmLSAWJMzqogRTFYb3FtWVZnTp/G8cXWR5YOgKVvl1SakLJ4ANnIvbpkLJLY
	FguV1ZMzJ9dTdbOgeHXzXrpck3HdrYaTSnj9CUe4jalIVvCxGPoyHkvg0XaZQTQajcHWF0StPFS
	T/BSxmQiNVYVOWOqCw/d8ugqHJXcUVm2Frwo18oq7MS9uwXCxzBEKhXlSmqPcsDGr6kfoaI7z7x
	oL6makdOWV/iQ+28TTiDhHmk3CSlyaS6ooe9GyNWgFeiPtMKMW287qM1QwolKMa/MtDV+nQZ1MH
	T95rfNog=
X-Google-Smtp-Source: AGHT+IGGkT2P3NdGrChGPvB4OodJAIHWHlo4OPBQc/JX1MV+1LOKqXm7dLxN9BLcsBWwGk7W2aoz9w==
X-Received: by 2002:a05:6122:1796:b0:523:e175:4af1 with SMTP id 71dfb90a1353d-5261d44c087mr6225400e0c.6.1743500984645;
        Tue, 01 Apr 2025 02:49:44 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260eab2aaesm1938098e0c.32.2025.04.01.02.49.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:49:44 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d36e41070so2410412241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:49:44 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:4c5:1bea:1c29 with SMTP id
 ada2fe7eead31-4c6d39af686mr8115053137.19.1743500983709; Tue, 01 Apr 2025
 02:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org> <20250330195715.332106-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250330195715.332106-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Apr 2025 11:49:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUx31WHW+fUP0Qbfs-Si2+cLmxC=YRUKWvSudn7CBZ4Fg@mail.gmail.com>
X-Gm-Features: AQ5f1JoeIvYp6dxZPMkSZCvf_rs3MuLZLQfoBSTfTx3w9rvwfJ19pgmFQ3EdrXU
Message-ID: <CAMuHMdUx31WHW+fUP0Qbfs-Si2+cLmxC=YRUKWvSudn7CBZ4Fg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H
 Sparrow Hawk board support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_024946_843731_08CF8E87 
X-CRM114-Status: GOOD (  23.63  )
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

Thanks for your patch!

On Sun, 30 Mar 2025 at 21:58, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add Renesas R-Car V4H Sparrow Hawk board based on R-Car V4H ES3.0 (R8A779G3)

Retronix

> SoC. This is a single-board computer with single gigabit ethernet, DSI-to-eDP
> bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports, micro SD
> card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD, debug
> UART and JTAG.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -0,0 +1,671 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car V4H ES3.0 Sparrow Hawk board
> + *
> + * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "r8a779g3.dtsi"
> +
> +/ {
> +       model = "Retronix Sparrow Hawk board based on r8a779g3";
> +       compatible = "retronix,sparrow-hawk", "renesas,r8a779g3",
> +                    "renesas,r8a779g0";
> +
> +       aliases {
> +               ethernet0 = &avb0;
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               serial0 = &hscif0;

This assumes HSCIF0 is the main console.

As you also have a second debug console on USB:

    serial1 = &hscif1;

And the serial port on the RPI I/O connector:

    serial2 = &hscif3;

> +               spi0 = &rpc;

Do you need the spi0 alias?

> +&pfc {
> +       pinctrl-0 = <&scif_clk_pins>;
> +       pinctrl-names = "default";
> +
> +       /* Page 22 / Ether_AVB0 */
> +       avb0_pins: avb0 {
> +               mux {
> +                       groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
> +                                "avb0_txcrefclk";
> +                       function = "avb0";
> +               };
> +
> +               pins_mdio {

Please no underscores in node names (everywhere).

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

