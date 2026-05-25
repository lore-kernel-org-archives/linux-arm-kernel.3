Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F26ECD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocdluSnvPrajohiha17GJ29fdKK8Wu3tb+aFtvggHIg=; b=SIMwzW7j6ufWOMLmv6WZ5DTE8G
	MpkuiDClcth254itnz36YE3hcq0LaFAmBVICJuknWscckwZRM/1z54A6Sbh31vrs4x2VXc8xsNzHt
	Dl59G48uQsbTXWiAE6/lBytNeWdWCni2g7a/aRcrsnNZyOqblQMo11zsfMsEmuNUe9z9JB7PSh2G/
	ff4NPn9nBEEz8w+huHDzNbSaVIot5rj2XDgu73+wnuSvtOEbh0KQ1QIHLTpuW/0npdj5hslPHvvgV
	wc0UcnpR+oG68hnPyIRlWxFtqV+f4LgmUZzQxWAXlemEcYDItU+hl2ej6PGNVY1F6wak1X3HIVnr0
	IxQHrGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQlZ-0000000Gfe1-1P8u;
	Mon, 25 May 2026 08:34:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQlW-0000000Gfcy-1bo0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A51CD4452C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B4C1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698065;
	bh=ocdluSnvPrajohiha17GJ29fdKK8Wu3tb+aFtvggHIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fnSp8BvJfPkA04wxA7mKTPbAve6r/Z636vOY7whORBxplpYMAfV/wkIzs/q3/i2kU
	 WSylGbm5FPI/FIZ80h8rBFkcL7YIWfl2Tvmv4Hn8GME56dJw454mXQsmyz580RiJib
	 gyU/S97sGNd5c/GiPD36dhMtBWOTRXGKlC5f592aABylxp/uZgKFZ7gPRY9Mlfr5w1
	 7Kyiz37jA0NydxK2lw2LEDAySWkh1EwjDUNIwJXUojPX569EN+Wdv6msvBVo4DCfoJ
	 SfjcCp3DkU5Q5/fmn938Q7HVJfEXHnMiXnIP1cAEe5NLoxt0DU81yDyuYOBf/PzOFr
	 /RtWzh9XFxLhA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5182982e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/uzvKl3F4rFN5v6G6vOv+9KNfSyT4sD347/MK11h38puUjCkkT7gQCr1l89FrtDCvtxMajxC+1UMNHfy3nWS7V@lists.infradead.org
X-Gm-Message-State: AOJu0YwmHmZOuwpKp1cpA8CPV4ywxZ7iVS+qjBIyUyIawxcN5kNssOEQ
	I5BGeafTugIBU7/JqqSkDdcRcUiJmtccqMfz8tzF1VA6+LXVicElMU63dJzd6pobnHYvYfv800L
	D3mPmVYBf9leImMK7o7koNh4Akkz7aJM=
X-Received: by 2002:a05:6512:31c4:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5aa32369f4amr3970074e87.9.1779698064269; Mon, 25 May 2026
 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:34:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
X-Gm-Features: AVHnY4IyGTi3BnZWsq4c-wualt0vr2BsufA5tdx1c0CYn_gbaKAGwoMKhoJOICc
Message-ID: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_013426_444729_D5DB108C 
X-CRM114-Status: GOOD (  15.81  )
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

On Mon, May 18, 2026 at 10:26=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> When the system transitions from bootloader to kernel, the GPIO is
> expected to keep driving high.
>
> However, the Linux kernel first configures the pin direction and then
> sets the output value. This may cause a brief low-level glitch on the
> GPIO line, which can be problematic for regulator control.
>
> By configuring the output value before switching the pin direction to
> output, the glitch can be avoided.
>
> This commit fixes the issue by swapping the configuration order.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Is this a regression? I.e. does it cause problems on a supported
system with mainline?

Linus (the big penguin) is unhappy with too many non-critical fixes
so I wanna check this before this goes into fixes.

Yours,
Linus Walleij

