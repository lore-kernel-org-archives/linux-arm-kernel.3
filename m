Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39302C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEpc/1/47AsHfaTxY/tAR9B9xl8xB58wnw6vmMA8FEI=; b=ZGa4yQDw1MS3yRup5y8FtLY41+
	moyXnna4MOqkiRWKMH6iR37hV38CPWdoI+x4kc0bC+vYdbXfsYLDVqwge9PUrHJkrCktfFVACiztc
	bd3T+nXsHvGyrmyf/p1zM+DdmSQ6KxReY7c/ank3L4i0OF94M9u7NViLhmECdTJpor0B+/eY2owyu
	vKLpTh66lnWniwsgZVhqpHabyA8f7nxCHlh96bcnwwkA3xPoIiRlLGsAwwXjyYxazkfp9nPa6oBw9
	vEZIeqG/RefNT0V6oQuJyiNV7Wi9TzSrmEJdTthd1jZGKUcVijCAQeDTfPsMey4QTEjGHlrVpv5dR
	mQSIlvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KGm-0000000CAl0-0QHT;
	Wed, 09 Sep 2026 15:31:28 +0000
Received: from mail-vs2-f12.google.com ([74.125.227.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KGj-0000000CAjb-0uT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:31:26 +0000
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso420360e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967884; x=1789572684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NEpc/1/47AsHfaTxY/tAR9B9xl8xB58wnw6vmMA8FEI=;
        b=CDPRo/rwOdd6mvAXL/Af5Rw62/h1czE2qhWcUZDm1UDDX/enUhkgzUmnFDscy2XlHv
         86g2ps55ldPZqlkGOjN6zO3NtMjDkNoV+8XLwx6SUWEdsjptEOlxTnfWbB/rK+yuzq+6
         MnbDJERsZwFi7JCqxam+hGPlJNC6FLHNT6TzocKUX6RlGOe84ZYm6qPrMdmQ73P8HpHt
         9EfyJ3+TYpRX1RP+ZYWOnFW7JKUFaO43VyOvM8xCxztR31e09pkTvGOrOOQK7fiLGmq+
         fJJQdu4YdxGAByz5GJFK370cQHJK6A7VVACOsJeYPJnuoeH6N9H49JPreeXqM2ntvngS
         fNgA==
X-Gm-Message-State: AFuF++l9qkEdcQoX+HDmTIo2CoW7TXnTwKQtq/dv65OpdkAQcsaGkXYr
	lax0nSHhBqOWicHdwxxuEKyyOVwaSvvR3i+KrUvFoXG+j5r7TXWYxtZbJQb4TO+zzBf9qA==
X-Gm-Gg: AYBFou0dEHSkOrLFb54FC4BAiZMu1tDwkmgO9gheiFvkCw635Xacic8dUwyrPE7WMM+
	t8JhZP3pY4luaM2VB/bkCZyL8RfIOl3nAb/2IreQvOKGSu1UyfE3w/PzlOPlxrICp5Llqnw3DR8
	M1MDnjoRCtTcjC1jR8h/HJsfyNucdmeKdVv8aS2oWQRC/bhFB9YAIGTPoiMwvyjp865Yy5h3zuq
	YQyoqJHQpMdN5oZG6F1qOfyXdPiC1IL5MjEvBDnpMCUHgB/KXVee/1amV43hW1X65f5qwelSmMA
	0J4p9uGFKjwweC+Uy1FEbk3kyvV7zjJIJCRntPDAf4h+537pkEFz+spRuwmV2sG9yW8BC+lH6+p
	4bMcHJdY3gZCsLM2SN97bU0vHZQWPf6mY7Fp1FJkS0gLhoYvI2KJpYjVBH04zd17sVyArf1S7tb
	TpI5SwOpc7YlyWUzJyBANqQ1px4Vd7IAS0dyh/Y4JquQSP92QNYJL5eLi0TPyqL7fIFmEUYbDRZ
	1ZLiOCrdO/ogt1jbUSCHpPAMBshcx6bOeZe
X-Received: by 2002:a05:6122:130d:b0:5c7:fa77:f291 with SMTP id 71dfb90a1353d-5c8287bf22cmr3595200e0c.5.1788967883747;
        Wed, 09 Sep 2026 08:31:23 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef798sm12903138e0c.4.2026.09.09.08.31.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:31:20 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292faso470840e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:31:20 -0700 (PDT)
X-Received: by 2002:a05:6102:8095:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-78f757d562emr2534584137.8.1788967879800; Wed, 09 Sep 2026
 08:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:31:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
X-Gm-Features: AcwNN1U9fr4mtgt5B_Ox8jzqkFHdJzcqPtQLtvvJUBaj2_brnmaTf7bMLwSgx_8
Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_083125_274182_BF5A7554 
X-CRM114-Status: GOOD (  24.58  )
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

On Wed, 9 Sept 2026 at 17:14, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop the unique spi controller node identifier
>     - Switch IRQ to active low
>     - Sort compatible and reg properties
>     - Add "CN7 pin 22" comment
>     - Move pwm1 node to the top and add comment
>     - Rename MSIOF0 PFC node

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi {   /* SPI_1 */

As this lives at the root node, I'd rather change it back to
spi-ws-2ch-canfd while applying, if you don't mind?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

