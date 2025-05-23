Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A07C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tMirZWfsi+MGV8gZCAIGOzywZSQ1Z0yW01g9pidm94=; b=l9fGIDl7FiAfcgTXWvFLvV9qS+
	CxS8Esrdv1sP+xKERMkhd/8U8nzxe9x5SB33KpdnEZNywzxlhFC/XuOhk8joADkLunPBu7Dat8P/Q
	un5R+0d7r135o7TDqARGdkkDog3ZcNF0eAttj8ah68S30fhdgmnqQJJedyjo4bmfhslmPZ0W1WCse
	MLBE8ev0d/UzXjJqSCFk55eXuR8oFVp2vO/5+44anlNXn1FDox2BQneCJQOAQ627x83X8p3l9Bld4
	whovEGBI9enOJ5LiupaPKBfE2haoUW0csLsU0CIsDkffWldTxRIO+oFXpfbrR4KZSVW4QaWeKH72/
	xfRBNJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUTm-00000004GsO-0KuG;
	Fri, 23 May 2025 15:38:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUB7-00000004ELW-06wA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 15:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7tMirZWfsi+MGV8gZCAIGOzywZSQ1Z0yW01g9pidm94=; b=NFxCEOzI+UxyZc6x+5rBa8yBSp
	QDNIwKcX+1hZgZfwBowigNgffk3uGHDuUxN5JuPeoBjY+J+jRel6dauRfx9k0G6RPPYRYhrBqNkIQ
	dfZdH5ACKghTjYlvX8KlkcRZYRTi69TdX7KZkYRfJWw+FZevfHxgKnAFYBiera1YdY8FugxMVo+1F
	njWTVsZs7BY197YHiIGfKWXIzU4eToarmWhJYcKjqZY4WstsJDx3oOA4qMGWmIVFdOl7A38AtF36J
	slkLAudBcH161B74J/YQq/bMilBfjB3ikSxEbLqbdUCulf4qSf2mYnuxR/Dxa7udaZ0+g72Kx6/Df
	kLLID81Q==;
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUB3-00000001LOj-3Olf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:19:19 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-70e102eada9so277117b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748013554; x=1748618354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tMirZWfsi+MGV8gZCAIGOzywZSQ1Z0yW01g9pidm94=;
        b=ZaQSqtQu97UrXpgSpFfhjI+28QHCUmf1TLX9Hp5822mwQX1GBGCqv+m07wGXZcs2wo
         u+hWe6bVmO5mExUHWzUV5cHasF4t+6Pw9V7CUe8nBqSbD91zlS6BpeNMQZl5D4wJhHxn
         CxS4rUErIuhoil6C5wOZW1t9C7s8idN4FR1xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748013554; x=1748618354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tMirZWfsi+MGV8gZCAIGOzywZSQ1Z0yW01g9pidm94=;
        b=MJDwNBERpEc5tcFlGIb/4qETe6uS73CqH8iewalgiZpXzPSNDTgu8C3rwk2WtyiAlo
         NdBE4LX0BeUUiGzXdZS694EouapaJ21z77ne0TjmGfGlGLSD+v/7vQKkGWiFgn/kc4+P
         2DG3T9vYOoFDHfAmKGrgTWl5F/44mkFUyqa5HucZ9XYdSdmvjNS5yEpXRVsIRcFU/wSN
         pd04FkZiEBipT64qKDKyc/0RYVRq3ckKbwHsRiN41eWvMFzugYWmqj0hOA8mc1LkM/3r
         DHZbpQxcss/tBjwNEYIn60GX3siAJHtAUyVGFKNvlGKhfvP4iIhq+GhNT6pave0M2xUw
         IOKw==
X-Forwarded-Encrypted: i=1; AJvYcCVOcgrywjKXGTdGaokgeegulidUj49GnNy79bRpAp5DAUIiut5LIsqBLiHlO1r5uFCPQBgEWCUkhAtSLbLpU9dg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ZkUrT/sYdceKAHIF9FDf9T/k3mRgM2PZS8nUqLj1enkCcfTv
	cI8aiAzMngEmqIlXJnStIkQyYNwUla29J1SxsJUCESNUDLxWalSkHGVFHPJUM+gV8IQyx82Wae0
	PTnDk3/ZlIoABE0FszpX+NJTBByDabUa/EpimNA0H1g==
X-Gm-Gg: ASbGncveksKXDnASHlboKv7ZRk/jFWcMxI/1Ovy+ibRVHIbFqKAw0nr+xKD5Fkc+wJ+
	ew6c2oOKas6jXhKFhhMmtmYuoLDfZjpctoM6lZ4Ecas6vH0w+z0V4LpI1N3Ua1fiFalch0uZlL1
	PPWEggQ9ITzPbUCrT/NaoSiiM/3EnpuW/lL5D+Ib0=
X-Google-Smtp-Source: AGHT+IHxEZibSLTC27ty9k9SE4RestS9NJakh2D2/0B6bmuMwt7+v2CHzq0G2guIGMTCMUwepBrci7zFuK4tcost1sw=
X-Received: by 2002:a05:690c:d87:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-70decdda042mr174164037b3.24.1748013554100; Fri, 23 May 2025
 08:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com> <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
In-Reply-To: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 23 May 2025 17:19:03 +0200
X-Gm-Features: AX0GCFvfElR9-JsrdMn4qtdpNkk4pgwm-5OPkXQJhrc9LVmxjY0io-Yr760AW04
Message-ID: <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Abel Vesa <abel.vesa@linaro.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_161918_009406_A663160C 
X-CRM114-Status: GOOD (  26.92  )
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

Hello Abel,

On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wro=
te:
>
>
> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > This version keeps the version v9 patches that can be merged and
> > removes the patches that will need to be modified in case Peng's
> > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > The idea is to speed up the merging of the patches in the series
> > that have already been reviewed and are not dependent on the
> > introduction of the assigned-clocks-sscs property, and postpone
> > the patches for spread spectrum to a future series once it becomes
> > clear what needs to be done.
> >
> > [...]
>
> Applied, thanks!

I was surprised to see that the series has been removed from linux-next.

It=E2=80=99s been 8 months since the first version dated September 28, 2024=
.
The most critical phase was version 3 -
https://lore.kernel.org/all/20241106090549.3684963-1-dario.binacchi@amarula=
solutions.com/
-
where two key issues emerged:

 1 The CCM design is flawed because "in the current design, CCM is
   taken as the producer of CLK_IMX8M_VIDEO_PLL, not the consumer."

 2 A driver for anatop needs to be implemented because "using clocks
   to replace fsl,ssc-clocks is possible under CCM mode, but you need
   to develop the fsl,imx8mm-anatop clock driver."

These development guidelines, agreed upon with Krzysztof and Peng,
enabled a coherent implementation of both the DT bindings and the
code. The following versions, from v4 to v8, were necessary to
review and refine those implementations, bringing us to January 2025.

At that point, Peng opened a separate pull request -
https://github.com/devicetree-org/dt-schema/pull/154 -
for the definition of general-purpose DT bindings for spread spectrum
handling, which ended up invalidating mine.

While waiting for his pull request to be accepted, I submitted version 9,
trying to at least get the patches for the anatop driver merged,
eventually reaching version 12.

This final version was merged, but then a few days ago it was dropped.

As it stands now:

- We still don=E2=80=99t have proper spread spectrum handling
- Peng=E2=80=99s pull request has been stalled since February 20
- We don=E2=80=99t have a driver for anatop
- The CCM design remains flawed
- Not even the first 4 patches of the series were merged =E2=80=94 these we=
re
  simply a replication for i.MX8MM and i.MX8MP of patch
  bedcf9d1dcf88 ("clk: imx: rename video\_pll1 to video\_pll"), which
  was already merged some time ago.

Could you please let me know if you're still interested in this series?
If so, could you suggest how to resolve the issues that led you to drop it?

Thanks and regards,
Dario

>
> [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> [02/19] clk: imx8mm: rename video_pll1 to video_pll
>         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> [04/19] clk: imx8mp: rename video_pll1 to video_pll
>         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
>         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> [11/19] clk: imx: add support for i.MX8MM anatop clock driver
>         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> [12/19] clk: imx: add support for i.MX8MN anatop clock driver
>         commit: 80badb1d7264e83b512475898e7459f464a009c9
> [13/19] clk: imx: add support for i.MX8MP anatop clock driver
>         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> [14/19] clk: imx8mp: rename ccm_base to base
>         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> [16/19] dt-bindings: clock: imx8m-clock: add PLLs
>         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
>
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

