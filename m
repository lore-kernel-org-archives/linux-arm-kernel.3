Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98242C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts0zOL1kfPYuS6zomJ9otxY90fzQ/wFMmbamI+iWdgk=; b=VY1SsEOeo61I7f9X5SVKf3vc8z
	pjC8zkVeJ6SNRcMyee7r7h3gY0y97El/QRxYlfTQ72TlMwMtsOCVpbOfG2LHq6fQ5F39loH9c99Ji
	COSAU1BudkL16Kns9WAP0tJ7xKFt99QqEC1KxGrjAqme1Wm3y1DEGbb9U0U0a9ywQ+FLgApE03YIR
	gxdPzVXE5aX6ZchPXTvcE7vi7UeTC7tBGCuJABM617Q+zSsXTzXh6r0VdPZUOyor1mt95kVW3GlOR
	2LLavCJr6P25XRP1+fMkNzRejLrMbOnElH0rUojwUnf1tAjpW9FYFpBL1B7hLWwk9UerjiIe1p9AL
	n473O9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQZk-0000000F6jL-3n3m;
	Thu, 16 Jan 2025 14:10:24 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQSj-0000000F5Cx-3DrQ;
	Thu, 16 Jan 2025 14:03:11 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so1652723a12.1;
        Thu, 16 Jan 2025 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737036188; x=1737640988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts0zOL1kfPYuS6zomJ9otxY90fzQ/wFMmbamI+iWdgk=;
        b=iZVd5MvX3gLIatACgrJKS7xlB5KXuEyJ5x9YZbNbf+XdM82d1d1GB/f0jdTMnrQtdc
         4o5QxWlzw7A7PBKcuxjzVQ+jiV45GjEs0TOZyM8HFhZH2lEYQuRDNlJ4dhjOOBgfa/EA
         kI7sOhZqMPf89MxwMPKanz27XWy6L76INx8CGBVekrg7I334kAKjXttJKyivTPaccLun
         8h2UmeuYLuH3DhAJRpOh1m3ddn+bPZlUYSVBfegv+mhocmt5a5qsyNccT6zuQ636ACg5
         zXl7CxPW3urmICH6RE+LrYSDwfvIzklnti2Ns8wl8hG6VaaM7s0NQ2gU7zzzUmmZc1uJ
         xN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036188; x=1737640988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts0zOL1kfPYuS6zomJ9otxY90fzQ/wFMmbamI+iWdgk=;
        b=fm9F0+1ikTbaAepffP0oa//r/ippdCL1nQdGkRWzLSRQ/XBh4F0lSd/N6O3US3Rsbc
         xvm55ZI86Uw4FtFlfl4w0XYz+EgkNml2OvsYQ1oDCXtJ04XFkG6RqKT3GSoJh2VxnFuB
         RrvtM/AmzAi1sAvfgW6njVZyCtSNn6S/uQhZBkwngo3iSPlkRJv7FdMBzfdS9KkZqnKs
         kAqR5oqPg7F/cW2Wsc3q7XycOYnMfZP9RqBpOmvz0uZtDml/OIUb34+R0jIsbzFXTsLQ
         QpI/BBAvGdzlEMFMmk48qpmjlCoz/uzWwhCNknGiWWOWEf89Z6FAE9RZvHBtlImLPO4G
         mtkA==
X-Forwarded-Encrypted: i=1; AJvYcCU+LJW5WxIUjAiBi3rSJrcZrOC34+BFSRt6jouEqVOe6hnypX572BO/rT8l3BsvmyTAYjlqd+XzCIuc@lists.infradead.org, AJvYcCUwso5R8n45zWsejxGUDtGoIPK4ebsSdTS2tpQzRBbej5ogIiJsR+4QjnUrbXlN6lsTpnsI48tWuljYSxa153o=@lists.infradead.org, AJvYcCXGGhZwvmf6LBqbJ/aejdoABkG/ztekWmUAMP78gEUYeYWRLkzdDlwJ5V3+Ibli2BsNkdnCgsBUbHVFubNqU4iV@lists.infradead.org
X-Gm-Message-State: AOJu0YyaYUnS0B138HnbhOG6pAdLFo6XN4PgLw7YYBLY8bNn5DTojI8U
	Fzag18Vyd8x1yxy5n91fzJ9WB2uw/Mlv/DHoJQSQ5f/PY/m1wv6LXbMGjPqFQYJ8BUNG/G5Zdp3
	g4+SPdwaN1gBwJlV05DAA0i4gAJ0=
X-Gm-Gg: ASbGnctvGqK5aCOojmaJuc5Z/+4zuEeigEmp8NjFY5n/PWqgs7Rk5WRxjUneMj5/zm7
	6oGcQ2fPq2pJ1fojuJ+ng2DgVHAiDNvajaF9l5YY=
X-Google-Smtp-Source: AGHT+IEFBH5rdDRzxNwKshRgTNAcDQcukVnz1qk9b2CQwOqVLB74sIBmizfzmVBpnEI/k3+EDMO9YL89iWmnCUbKvA4=
X-Received: by 2002:a05:6402:3483:b0:5db:67a7:e742 with SMTP id
 4fb4d7f45d1cf-5db67a7ec89mr597372a12.8.1737036187661; Thu, 16 Jan 2025
 06:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com> <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
 <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
In-Reply-To: <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 09:02:54 -0500
X-Gm-Features: AbW1kvZDgqM8jfgzDVevxYgT39_hbUcQ7lTpjdvs9pBBkN8iloIKzhGnQ2-7CDI
Message-ID: <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, wulf@rock-chips.com, zyw@rock-chips.com, 
	Dragan Simic <dsimic@manjaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, frank.wang@rock-chips.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>, 
	william.wu@rock-chips.com, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Trevor Woerner <twoerner@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_060309_804565_58E18683 
X-CRM114-Status: GOOD (  15.12  )
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

On Wed, Jan 15, 2025 at 8:25=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 15 sty 2025, o godz. 14:15:
> >
> >>
> >>
> >> pls find:
> >>
> >> dtsi: https://gist.github.com/warpme/6af9e2778fb06bfb47b64f98fe79d678
> >> and dt: https://gist.github.com/warpme/79340c54c87b2b1e52f2a146461d8c9=
f
> >>
> >>
> >> and compiled .dtb
> >
> > It all looks good.
> > Do you have any CRU errors in the boot log?
> > Can you check for the presence of clk_ref_usb3otg in
> > /sys/kernel/debug/clk/clk_summary?
> >
> >>
>
> cru errors in dmesg - seems no any.
> here is my dmesg: https://gist.github.com/warpme/ecf38482cc88fb68471355d0=
11ecf974
>
> For clk_ref_usb3otg i=E2=80=99m getting following:
>
> root@myth-frontend-e67a8de4c815:~ # cat /sys/kernel/debug/clk/clk_summary=
 | grep usb3
>     clk_usb3otg_suspend              0       0        0        30770     =
  0          0     50000      N      deviceless                      no_con=
nection_id
>     clk_usb3otg_ref                  0       0        0        24000000  =
  0          0     50000      N      deviceless                      no_con=
nection_id
>     clk_ref_usb3otg                  0       0        0        24000000  =
  0          0     50000      Y      deviceless                      no_con=
nection_id
>                    pclk_usb3_grf     0       0        0        75000000  =
  0          0     50000      Y                     deviceless             =
         no_connection_id
>                    pclk_usb3phy_pipe 0       0        0        75000000  =
  0          0     50000      N                     deviceless             =
         no_connection_id
>                    pclk_usb3phy_otg  0       0        0        75000000  =
  0          0     50000      N                     deviceless             =
         no_connection_id
>           clk_ref_usb3otg_src        0       0        0        37500000  =
  0          0     50000      N            deviceless                      =
no_connection_id
>                    aclk_usb3otg      0       0        0        150000000 =
  0          0     50000      N                     deviceless             =
         no_connection_id
>

I'm at a loss here, I applied the patches to a clean 6.9 tree and even
built it as a module (thank you for the sentinel). I have no issues.
I'm wondering if it's your .config or something about your bootloader.

>

