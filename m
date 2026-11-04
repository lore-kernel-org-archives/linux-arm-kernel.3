Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0/3BcPp;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=J8ctdk8t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=; b=P0/3BcPp2aFAMy
	XJEW3G65ptlnrzyPUSo9LZECShzXUYMaqrPkD8C1+Z5UT6yyi/+Pxu6clPK0ObXnnUwxELuMcg9bd
	LGR5MEVYx7Ircme3RNfe30KwxJqHgQHz/r27uKCUizJ5NY9fsFRuKBlydK76vzkmo/vHqNylBfF8P
	8vKu75RiUJmvfQuTlXXw0XeHeh0Xk6lHHJYdAHb4fIPvNOOWioVqrHs8teIgnBXrTImLheCFUEMyZ
	Cftb235NBGH8uomgLGySTpj9+nequkEuTxqb9w1et8cySh1aSNWmV9gkXdIXYjky+IRgGer8jmNxi
	cxlEtz1w0Yjpub2GXYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOc0h-00000005e5G-46dZ;
	Wed, 04 Nov 2026 14:30:43 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOc0f-00000005e4Y-09RE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:30:42 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so750260d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802639; cv=none;
        d=google.com; s=arc-20260327;
        b=L968gIscJzry0xJNgtsbi71bpj+ZwMk7+YwthrN70/dEU4LoZJCDfolmiGP6LRb3PM
         WSCTVbaTlUiQFqLNW21BG3BukZWepFlAcZqLl7FdlsrXGRg7heE/D+U4ajU8llNhv6+l
         J6TWT8nQgFL+UHngrJQez+wV/TjY7cRLYVo+V2kYSdTetwioUUgcNrKkfFGvExSzp/ZL
         FZnROB92JBqSl8OoxqIj6E8UW9phjoThuN9TYbg4W2TrtL2UKE7lkeIP9N4bdbMI17Mj
         g9ThFPbrKzeH3EnclQUL5aF+UYpvO59h9B+2LwQUlQGP7huqS4vOk+EJ3juvzaFDptXy
         T8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        fh=52IAE1fQvS7m2bI45iXoNJ0PoYtGpK/Wzp6H9E5GaTM=;
        b=K340DaEIPJxYy8VeWWjVesI/f74HYmNI8HUidiS9m93ADW0zDAqoB2SWkb/3f+qOyI
         8aGjC05SWcDXlkQSw64O1DdfzDprCEpcwoPOmjMi8QzaDvPeKCiRtRtNoS+/cNCfvFGB
         P6Rt8qrDuU4YxD2mZf8pqABHaUrYTvU8QYq+NaPc3Dq/3gPkzsJk+/GCnRp2DoDyZ8lI
         cGEuqq5X61TmsUtEs6HByNNZdNhj5eWbODhV/9E23zn/8ZMFJNlw9kAr/Z2Ga1rX6Lh2
         Ma9yUYsl06SXmMpf0usqCfhvGGpZ/wlZqSyu+O+sBhpmH7TkIqyERN0c04fc0RrEKZb4
         nWYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793802639; x=1794407439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        b=J8ctdk8tKX8sL717zYojIZBMVhqrlrvlUYB7VWGlihAKBaT/sKKRcLXzajexgHPcvO
         ZPg5+DxBaxgwg8fiFyAcvwxwx8826hL7LUb9eB5ltp8dAPGsCkB/MDoJEiN8/T/RjI8o
         w3Zv7lYxFTk8Ssr0PXktlnBuT8VzII5z1fALg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802639; x=1794407439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        b=jOs08nYqAp6WN1f05kAtqVI2ZT2TZMrok0yD6+z1rfwUX/TtTPUWFcvN3UyeuIBy1F
         dG3o5R8Q522jjp09opoIIgWYgHBHSJWUVlCm9s8d2rfVoCmBmHyX2YzrHyg6q7zPtKzt
         wNiXySGtMkV/Hq6lPQC2Ta8jm5sHs114fA8Yk+e3bKULaKgWiNjN7pSNyqDLDRQdeuNj
         49Swv7stnSiCu+wpm/+7YkWg1xzQ7KWIzzyshOKPYFOi8EWU230Zz3X6BL9cSj78kAj/
         LpZSz/7L4nzFSSc2UxJoYMuUUUoeNRUz80cv07IrV02D64YOrOP6psCXk5g88/lGxmMx
         un2g==
X-Forwarded-Encrypted: i=1; AKwUvBx2SjSsG+u5GXPFfm+A+nZlRlWqYpayHkmC6HPo0xYrdX3w2Gc6zlSvdv4zKdnDqs/ig+vwi0y0Uzb2Rv9iObV8@lists.infradead.org
X-Gm-Message-State: APuU4Z+p4r4Y7Y3rjbzZePvxCNJCaBj5udav8XlaWfoGCsLaEpfKYWfQ
	cFCab/Rv0/IA1xW3apSQjx2xQ6ggi0VoJd5bS/2y4ECHPu21PcBCYRTdo1Aw12/eiJn6EnFXLAZ
	Oj+X0HbQ4HbLGrrz+eN4nnW2gPjZxJVFIK1X3XtdfgQ==
X-Gm-Gg: AYBFou0DrbDdfKz4GnTELAJmUCZ07lNJ4rurzIYjFVCqQeeB9S1Eoo2YHAT0WO9o8yM
	50mBIyE72lH4pXuCqmjnfVSMV1IlXDryQOK9uz3/krDc6/+yNGUBayL+2LjGKOTGuFLgu4L6q65
	cBh7VHpDJ4RUznFCyNSnl6ee3djHzGrbFH6S92o8ApD9Tan6JuB56rNyjL2Vw4Ac/98BIChMC/K
	QXNKOtPlQYomQjxnxDO9I6WkLSdw0LXnt87LKllK/Qf1AgbI74M64TQEumPByqbslRJs2UPpgTJ
	OA6XG1z098VddcMH4sVTMHATbulzAI9JWkJ4MGkzBE1ZJ+vk0O0sdWzMtsSDPSNjwywAY1K0f1I
	o0DwhysACNJg8QVW0yOc/JITz3RxF5AdMbGrOBe3bSCgtCR6Gdukrs/C8cv3x3O5OdSlT
X-Received: by 2002:a05:690e:128d:b0:67b:f2b4:7ea3 with SMTP id
 956f58d0204a3-67bf2b48061mr1185261d50.18.1793802638944; Wed, 04 Nov 2026
 06:30:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com> <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
In-Reply-To: <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 4 Nov 2026 15:30:27 +0100
X-Gm-Features: AclHuK-2YVD6MLpocItLoy0Jf9YnF4dS8B-jCRxYLxfAIe0sapLG1UQibi0oIPQ
Message-ID: <CABGWkvoVrA7vaE6mKdp=2KNajREtgEi2RRV4qFcJmFqqWwQDoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for
 the RGB output
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_063041_129950_B1E5297D 
X-CRM114-Status: GOOD (  48.45  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gabriel,

Thanks for your review.

On Wed, Nov 4, 2026 at 11:42=E2=80=AFAM Gabriel FERNANDEZ
<gabriel.fernandez@foss.st.com> wrote:
>
> Hi Dario,
>
> Thanks for working on this and for testing it on the Engicam board.
>
> First, a small remark about patch 2/4: this driver is based on the one
> we deliver to our customers in the ST kernel on GitHub [1]. Please keep
> the original copyright and the Signed-off-by of the authors when you
> reuse such code, and add your own on top of them (e.g. with
> Co-developed-by).

You are right, I used your downstream driver as a reference and I should
have kept your copyright and authorship. Sorry about that.

>
> Now about your two questions:
>
> On 10/28/26 14:59, Dario Binacchi wrote:
>  > - the mux parents are referenced by their global names. Should they
>  >   rather be described by clocks/clock-names in the SYSCFG binding?
>  >   Moreover, no driver registers "txbyteclk" yet.
>
> Yes, I would also prefer to describe them in DT. I'm working on a
> version where the mux is described by a clock-controller sub-node of
> the SYSCFG node. This sub-node is populated by the STM32MP2 SYSCFG
> driver, so no auxiliary device is needed (patch 3/4 can be dropped):
>
>      syscfg: syscon@44230000 {
>          compatible =3D "st,stm32mp25-syscfg", "syscon";
>          ...
>          syscfg_clk: clock-controller {
>              compatible =3D "st,stm32mp25-syscfg-clk";
>              #clock-cells =3D <1>;
>              clocks =3D <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
>              clock-names =3D "ltdc", "lvds", "dsi";
>          };
>      };
>
>      &ltdc {
>          clocks =3D ..., <&syscfg_clk CK_SYSCFG_PIX_LTDC>, ...;
>      };
>
> The driver takes the parents from the "clocks" property
> (clk_parent_data), so the inputs which don't exist on a given SoC (no
> LVDS/DSI on STM32MP231/251) are simply omitted. For "txbyteclk", we keep
> the existing clk_dsi_txbyte placeholder until the DSI driver provides
> this clock.
>
> I also want to keep "#clock-cells =3D <1>" with a onecell provider: the
> SYSCFG has other clock selections, and I would like to be able to add
> them later in the same driver without changing the binding again.
>
>  > - the pixel clock source is selected in the board devicetree by
>  >   assigned-clock-parents. Should the LTDC driver rather select it
>  >   according to its output (RGB, LVDS or DSI)?
>
> I think the LTDC driver should select it: the source depends on the
> output used, not on the board. This is what we do in our downstream
> LTDC driver: it gets the mux as "ref" clock and calls clk_set_parent()
> according to the encoder type (LVDS PHY clock for LVDS, LTDC kernel
> clock otherwise) before setting the pixel clock rate. The board
> overlays then don't need assigned-clock-parents. Yannick and Raphael
> (in Cc) can comment on the LTDC side.
>
> Since I have already reworked the clock driver this way (binding,
> driver and SoC DT), would you be OK if I take over the
> clk-stm32mp25-syscfg patch? I would send it in a series, keeping you as
> Co-developed-by, and you could then rebase your Engicam patches on top
> of it.

Yes, please go ahead. Please Cc me on your series, I will test it on
the Engicam
MicroGEA-STM32MP257D-RMM with both the RGB and the LVDS displays.

About patch 1/4: in your SoC DT rework, will the LTDC "lcd" clock become
CK_KER_LTDC on STM32MP255/257, as in your downstream kernel?
In that case I will drop it, otherwise I will resend it on its own.

Thanks and regards,
Dario

>
> [1]
> https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/clk=
/stm32/clk-stm32mp25-syscfg.c
>
> Best regards,
> Gabriel
>
>
> On 10/28/26 14:59, Dario Binacchi wrote:
> > On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
> > DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
> > clock (reset value) and the LTDC kernel clock. The SYSCFG node is
> > already described as provider of this clock, which the LTDC references
> > as "ref" clock, but no driver registers it, so the RGB (DPI) output
> > can't work.
> >
> > This series adds a driver for this mux, probed as an auxiliary device
> > of the STM32MP2 SYSCFG driver, and selects the pixel clock source on th=
e
> > Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
> > independent fix for the RGB display overlay.
> >
> > Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
> > (Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H=
)
> > displays.
> >
> > I am sending it as RFC since I am not sure about:
> >
> > - the mux parents are referenced by their global names. Should they
> >    rather be described by clocks/clock-names in the SYSCFG binding?
> >    Moreover, no driver registers "txbyteclk" yet.
> >
> > - the pixel clock source is selected in the board devicetree by
> >    assigned-clock-parents. Should the LTDC driver rather select it
> >    according to its output (RGB, LVDS or DSI)?
> >
> >
> > Dario Binacchi (4):
> >    arm64: dts: st: fix the Engicam RMM RGB display pixel clock
> >    clk: stm32: add STM32MP25 SYSCFG clock driver
> >    soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
> >    arm64: dts: st: select the Engicam RMM display pixel clock source
> >
> >   ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
> >   ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
> >   drivers/clk/stm32/Kconfig                     |  12 ++
> >   drivers/clk/stm32/Makefile                    |   1 +
> >   drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 +++++++++++++++++=
+
> >   drivers/soc/st/Kconfig                        |   1 +
> >   drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
> >   7 files changed, 159 insertions(+), 2 deletions(-)
> >   create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c
> >
> > ---
> > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > branch: stm32mp25-ltdc-pixclk
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

