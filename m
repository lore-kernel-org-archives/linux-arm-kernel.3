Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA475CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afMhjAzIKP5bcnZSy3KWIznLuKc6kIGzKnWy48IwObo=; b=pcvNHCbWnH+f8m5HBI1dXCNclE
	e6RJHMIdY1IszA0vBEu0DaSszo6k09vED4NCj/u8qcEXRnK0YdEkf67XEublIEjx9LL1v1ZmjTATU
	kiz2HkSUDfWS9BDc4CRo7m/kI9wqXYuyTQDaQq2D9v2DyZXyv4rLtGFWZMVw31dQ2cQCXQz2Y7+Pw
	7yQz3Ls2EjXoBivLh3WNMjVycC+5cAK3y0GKYfqglOT1/cY9mFqlj1aVuBf7IIiTxB9H4DrK05Vqj
	3GrkXs2/BQNGFOeWHk/Ur+ny3n2oUeXEJKVq9MPXN4BvpVKXTN3XaU5P1MYE8HTuk22jLhh654W1s
	MgFLl9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWom-0000000Eet7-3HEI;
	Mon, 11 May 2026 20:01:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWol-0000000EesX-2KTd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA1BC600CB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6895AC2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529660;
	bh=afMhjAzIKP5bcnZSy3KWIznLuKc6kIGzKnWy48IwObo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZjSMW4AVnQL/NQhwz+ZpLjM8Hk9JMOKws3Spz8ouELIc+Bu9KqBJDlfrPHMktFTim
	 Vb4ZH+2KCTkTF/lb22lBG9p+eKe6tHw1UTPhNHH62QHGjDClYKvn1OwUMmNRFG+SST
	 jQPwXzj2U79XuxIVNtekGd9FnWj9Hc4Cl7WgZ5/uzY8JTgW/z3Rh3S6nKpwg6862V3
	 dUeuMr9pQe76NrilzH41A/u5OKYW/W/Cax5E1OAqHVUj1+9M/SOkwPmPhT7NupiyV4
	 HfuGfmHXERRdoxl1UoTJY+PwrKgnU/uBhivXGHpwYdtY5IE7kKYpaWBef0HoPAURMo
	 p9Lotrc22yfZQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1848161e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9k7dbeqfEXc4lW+RHhv7CnQW/E2BlJtJViWV9iONDyn2Yg+9o9IMmUaPF4ll7H9Teljck2sPWsKhunAnZSIsY3@lists.infradead.org
X-Gm-Message-State: AOJu0YzL+qXDEDKW40ZFIl5NDQsScLfkyJa2aN4LtqOxXenPW+bmG4Ie
	4SXaQuy+ohXCokQFsFNZBDDGenaBOQarFkcxdIRrkyQcT8kSFkgveLOLoo5JYWMC0JFTYKCM7Bj
	8/COI2J8oJnnrmkii3mF2wXsLgnzWNgQ=
X-Received: by 2002:a05:6512:3b86:b0:5a4:d9:88a5 with SMTP id
 2adb3069b0e04-5a887cde895mr8789758e87.24.1778529658964; Mon, 11 May 2026
 13:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260505104003.1811841-1-wenst@chromium.org>
In-Reply-To: <20260505104003.1811841-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:00:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpsmV=yqjrFZiqqRxHVM-7pG3SZ15DKakj_3ODnP4wkg@mail.gmail.com>
X-Gm-Features: AVHnY4KLb5dofKxjtoMouq5Gr8Qpwowhm7jBE9YnqDOByoiTwxk2QEGRigVxcuI
Message-ID: <CAD++jLnpsmV=yqjrFZiqqRxHVM-7pG3SZ15DKakj_3ODnP4wkg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: paris: bypass pinctrl GPIO layer in
 set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, May 5, 2026 at 12:40=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> While this class of Mediatek hardware does not have separate clear/set
> registers, the pinctrl context has a spinlock that is taken whenever
> a register read-modify-write is done. Also, once the GPIO function is
> selected / muxed in, further GPIO operations do not involve pinctrl
> operations or state. The GPIO direction and level values do not require
> toggling the pinmux or any other pin config options.
>
> Switch to directly calling mtk_pinmux_gpio_set_direction() in the GPIO
> set direction callbacks to avoid taking the pinctrl mutex. Drop the
> .gpio_set_direction field in mtk_pmxops to signal we are no longer using
> the pinctrl GPIO layer for setting the direction.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied, thanks for your perseverance Chen-Yu!

Yours,
Linus Walleij

