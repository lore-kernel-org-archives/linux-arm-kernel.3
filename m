Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A6BC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D70l4VPHEgzTRxp8QD99cI0kN28iFyT1rcFBC7OwJpk=; b=vcREqlaOZeMk85IODjJWiYY5rW
	vysuA2pOgW/4n6W/emlEH6twITXJWvK0Gj048kx0E2EdOokQFrEi5br3ja6FC/qW0xn/Dj8Pvf6IW
	45svv3lyErFVzp/NxcSQ1HWgGf7Ej6geqMkhJp19qzbQVmJZpc+9XBwdhXcgHC5IMW9Zsc3s4Lwqf
	QuyEaX26H8v20W6AFNc32U2J7EBtDxKuEQJJVvY1/j5VAoiElN0dlHyL376BJP4T341NmRApDw8Hg
	ALozckX3wGgNdjkvzyW8sHMugFFbui74A1mRd4a6NQyHxwv+NTcw52Q6G1uqBzY/0Ph4eIEAz2kci
	s2vL8y/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Ml-00000003SDy-2mVH;
	Mon, 14 Sep 2026 12:00:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Mj-00000003SDd-3pBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:00:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A95B4147B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7831F00899
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387253;
	bh=D70l4VPHEgzTRxp8QD99cI0kN28iFyT1rcFBC7OwJpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ERpz8UJnqS93FUiR4vRL+CRB1I/YoiV55I+8ZHuW1qXUbGj4SprS39VkEygVxtlwX
	 ZQxuO8HsU5dX0jAOUOoX6muxo1z9Yv6PBstLZuUO5BL6YbVQ9kOOhqfU4f9Z4wuX7K
	 9Hk/Qf5zK+WvqP5236Rzgnve21XcSqFgEQi0EKlHhlFBVrBUzV2ZJIqEKp5MEfLY2a
	 fFxMjZGXn3vnkKtRa1vuwTeZ9RVaTS2HVb9y8Lz6NWaf1/8cr43mG+cTb926rJzlt6
	 DpHYqbGIgTZsja+bVabtGGSPcfE7sHnIFxPdWQs/3qX+A28m8A1DCPyzr89TrQReSV
	 SH4TCKfIT+VIw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso3076167e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzflxnoP0KcQpMBODgDLF3VVJrP6Vbkv454/IKGkmhSCuajGZQLEzubSCQQSNWLAJesi9/r96CuOiK4L3bxz2Vv@lists.infradead.org
X-Gm-Message-State: AFuF++mgshRyeA7ez3UbKvuL3BWCfWJrS0JJAb8uvZCwpVwC9Nw8YkP8
	F22LZXs0z2oSbxdh3LDtjPKpl2ZVjXGcBP8qZYn2S+d7ohQ5w5DXx3Nd3pPubPQH46e9kUMpoT8
	ObYd4es/xrM7f6FFN6k3tR/XHfVnuOw0=
X-Received: by 2002:a05:6512:a92:b0:5b8:9a84:74fd with SMTP id
 2adb3069b0e04-5b8ae662fb1mr562659e87.4.1789387252070; Mon, 14 Sep 2026
 05:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <20260903075940.2089367-2-mehmet.fide@gmail.com>
In-Reply-To: <20260903075940.2089367-2-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:00:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
X-Gm-Features: AcwNN1UHFrkssgocRyJk96IyI9ERzW3G9X2teZo00fKI-ZjldU-BuzFqADQ4hhw
Message-ID: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 3, 2026 at 9:59=E2=80=AFAM Mehmet Fide <mehmet.fide@gmail.com> =
wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The mmio pinconf get callback ignores which parameter was requested and
> returns the raw conf register, so a generic query through
> pinctrl_gpio_get_config() gets register bits back instead of the packed
> parameter it asked for.
>
> Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
> PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
> the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
> is 0 with the bit value as the argument, which is what the
> pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
> next patch) expect. Other parameters and the SCU based SoCs, whose
> firmware call returns the raw pad value as well, get -ENOTSUPP; a pin
> the device tree never configured gets -EINVAL, as the raw helper already
> does, so a caller can tell "no answer for this pin" from "this
> controller never answers".
>
> The only in-tree user of the raw register was the debugfs group dump,
> which called the callback with an uninitialized config; it now reads
> the register through its own helper, like the single pin dump already
> did.
>
> The set callback is not touched: the fsl,pins binding hands it the raw
> pad register value and that stays the only thing it accepts. Nothing
> in-tree sends generic parameters to it on these SoCs; making it
> understand them is a separate change.
>
> This gives gpio-mmio a way to read back the line direction on chips
> whose direction lives in the pin controller.
>
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

This looks like something I could apply separately from the rest,
can I just queue this patch in the pinctrl tree?

Yours,
Linus Walleij

