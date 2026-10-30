Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15079606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TCAPjLPT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=; b=TCAPjLPTH6jXpLQH23+KYMM5j1
	skRqlejhg79FLAVd4mduQBRlxttoQc/Gvow+i+mtUrhFchT3B0XQiuS+Y+5yZygvZuAJuFEc3Je4/
	eVWn8Rc2xEbK/A0lUur8bIwZXYEkOuXK4wsNTJ0yew4SHFMfHpJdNx5DURNE/IvAwNeM6KyLk3YG5
	Y/U4hOel6cfNDsnJtxTwhHZ1keYUF3iESQ+jNqCbJdW/+P7hMyFLkThQeuulbW0H73ZoR6sel0Ilx
	o6tZQ0hXzZmUnyUIawAvCF6IRxzb8HaASmriI29HUXQuAg/Ml+4AYGeCvFzaEMtO5Qu77dX+ItibJ
	nA6FDz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjhs-0000000BNO0-3Kd2;
	Fri, 30 Oct 2026 10:19:32 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjhq-0000000BNNd-2qeG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:19:32 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eafa528803so160175e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355568; x=1793960368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
        b=agUP+gOQjvofvYJYhQYVhQZQIWPeSK/e5+JNgRTQQrdIBZxR/4MqNclFzqJ01DT9gI
         LUYYKOSUorZB21rd+UIJy4WCZ87Wv62EmHk6ROJGCElwEMHeS1ZhSvnZBJjz6zcEoRKD
         ke58eS4mH5siNO0rcx3Vnp7v0R5+IPLWqFoiKgM3CXxrG6sbCj2wJ/kL3XZlo/wM7x6c
         jHf7VVGnmPoojtnZDlU45JrCY33a8evTy+ryg46Cw8vWSZ29StMGgFUJ3AuQcRg3LW47
         Jk61cVqYqM0tp+9I2RTPGYgf9dme2PZMEBS8DYhoRJf4aURHh3nO7SmSqTn1K8C1e5bU
         /DJQ==
X-Forwarded-Encrypted: i=1; AKwUvByuPGG7/fUpxoeClxX1hZg6VEflNLKxGTlCLtLaEUkzinWjtNWjn3uTABRQUyet2slxdgD3tEb1H8f0JOJdi8qZ@lists.infradead.org
X-Gm-Message-State: AFq9FYIF6733iKFfTIbgpCVSzG0oq+LPJrOF4Y9tL8d7+Xjelrc62PZh
	NSGkbSInh4/Cq4DgAlT1IR0UktIClJcPfxSUS70akwRZ6NWw1mZc9z5pgF5WWV9k
X-Gm-Gg: AYBFou0Yswt9VLCZPx/w0OnvBId37bhQzge1I3POtS+esP4bq14LVAjyHeqvUUaEZcF
	IGhpgBBG2YoMX9e5VAuigYEY2kFyT0iab/zoBLT6EoSrISK1ihxHSlfOBFAL1oza6wnbRSP/IQl
	1UxRfW1ajhqTmSZy1VdBdqgGqxyED13wx/qotyf3xUB6TuAQxoxdOI6GRux9N8zN3BoRMF9w+O4
	3TmwKB/9X6StgveosLOtPMCYWAg871Jh54s66vlEIevTlg1Sx0SkKK1KW3Qf/iJzaW1HVtn7qLC
	9Zny4F9WOMfPpmNNW42eeAsjLqJI4/sBeQGZ3M05pxVaMb5vcuBQomKAO5tinm3tSC7QKC/NNIh
	AwMy25IFUcLmmglIf8St6cXBRvSrWlqkkjEH7FCK6cpcjsShto/hckA0SZg4ZThoahTZxqtSChU
	8a+IuUsyUZ2uxGiJOAROSzApkXwB3VGPcnF1HShfifX6kd1ffY6y2MNsXye0FQ4tDwhxMLGg/Ms
	ZcBL/u0PhVan4XcXwDboE+u273n3o+wgXqcbdfwNYtcUxHw/bSBHNE+YQuDabcRI+xjzOST1MsR
	1xfLgDrtn7W0UCAyqt2Q+O/QVuccQ+oB8fxMfnFvdE0DVg+Ff8DMc596NglsNoEanMazIex5x07
	1Oxz5T8kgT56K
X-Received: by 2002:a05:6122:6082:b0:5e9:76c4:cf19 with SMTP id 71dfb90a1353d-5ec6870c557mr859482e0c.8.1793355568330;
        Fri, 30 Oct 2026 03:19:28 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bbe1f4sm1884169e0c.4.2026.10.30.03.19.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc0892f92cso136861137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8aJCQMnjuogCbEgVSKHuPiA9CINqNVqyl0PuF+VQfM+SrE5vyBnRHtKFgUpyd5yzPD/WmYS8BJCvnm9qLv+i9@lists.infradead.org
X-Received: by 2002:a05:6102:9d4:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d0728d38cemr726412137.36.1793355567237; Fri, 30 Oct 2026
 03:19:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
In-Reply-To: <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
X-Gm-Features: AclHuK8TLIiJXfBZEbZO-sDHcOFpgPhdmma0xCzHFZfNFDpVgGdGYD9NeIfWwIY
Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
Subject: Re: [PATCH 4/9] can: rcar_canfd: Add support for R-Car Gen5
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Biju Das <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_031930_734340_898E5656 
X-CRM114-Status: GOOD (  23.80  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 14:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The CAN-FD block on R-Car Gen5 is similar to the variant on R-Car Gen4,
> but uses split global and per-channel interrupts, like on RZ/G2L.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -636,6 +636,23 @@ static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
>         .external_clk = 1,
>  };
>
> +static const struct rcar_canfd_hw_info rcar_gen5_hw_info = {
> +       .nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
> +       .data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
> +       .tdc_const = &rcar_canfd_gen4_tdc_const,
> +       .regs = &rcar_gen4_regs,
> +       .sh = &rcar_gen4_shift_data,
> +       .rnc_field_width = 16,
> +       .max_aflpn = 127,
> +       .max_cftml = 31,
> +       .max_channels = 8,
> +       .postdiv = 2,

R-Car X5H does not have the /2 postdivider, so this should be one.
Else the bitrate is twice as fast as intended when the external can_clk
is not available.

> +       .multi_channel_irqs = 1,
> +       .ch_interface_mode = 1,
> +       .shared_can_regs = 1,
> +       .external_clk = 1,
> +};
> +
>  static const struct rcar_canfd_hw_info rzg2l_hw_info = {
>         .nom_bittiming = &rcar_canfd_gen3_nom_bittiming_const,
>         .data_bittiming = &rcar_canfd_gen3_data_bittiming_const,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

