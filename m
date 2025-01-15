Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMDth/XNkGKYagQ1DtWaoZiZXixgZHuQEB9UafKVxPs=; b=c5/06ZXzJOER5saTujBphNwCDz
	vbIEFHHCM2k8Qke1lGv1LYvhH//r4J61TEyh6jn5tPkeuoRk+wmLg+kdh1s7MpI1EejN2HpMl1FbH
	Cc8L6p3eGZCWieMHopNKifhmIHCqx9zsETV8TunIOgRNu8nKj1btgmi0lX8PdahrmGtpoKqfNdWNs
	AoOSYHGR1GMD1ATnTzvRQ8REHOo1D5KYLdh3e30RKV9Dr2N+LOzfK8mqBeH6PsINoVK12rgR4RDQR
	q+m407L+bbvYgwY4VKmCP7SWbunBooHNnbDhLmET3YB6VtkqHylBCaMrwuV48pJ7D17EG7OF656CX
	Qsvd+ANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2UZ-0000000BpQh-3JJL;
	Wed, 15 Jan 2025 12:27:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2TJ-0000000BpGc-2Z21;
	Wed, 15 Jan 2025 12:26:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so11327556a12.0;
        Wed, 15 Jan 2025 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736943968; x=1737548768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMDth/XNkGKYagQ1DtWaoZiZXixgZHuQEB9UafKVxPs=;
        b=VwsjqGbHO976g1oA25HLgnEhEij5YRiCQIoBkf3LkZWxpsCL2pUaYzV1L6PW9UJ0OJ
         4Kuc88aU0/KEdWD4oLtBh8E7YqEqxMfzWAcTyWTLweZjfE1gEM6xlYtMFBxZ3dhSi5Kg
         Twx2mxZIv6SwOZzMqRR9mmMKqo21lZfbu0NAUgwbim0Afg5tA2o26rhR59VX8M2duOSW
         6tj/+P8qzsR//OczBXO0Z6GfldHenFDfbK+U/doSYkeg8mVjTJvhzBCKIP7mFZ2li+6v
         Db4EdhoQHtPrxQ5bI+aka2OzFwUt8y0U/yrSwEaQQYItbAKD24gGk4mBrCfvP2V2lJnR
         DW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943968; x=1737548768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMDth/XNkGKYagQ1DtWaoZiZXixgZHuQEB9UafKVxPs=;
        b=KQRX0kgA2mFcJjN+s+QB5SyxwlkpnGJOCoZJVga/eOtH/JU4XEzvaM0J+Lf7FwRu7Y
         vGPdk/qB5uLiiF5YlZX354suHEOAWS1aZ+E/6yqDdZY46CQmoVNvf1/w8csIy85NcxjV
         Y9ZGyaJ+UARm/Do5RkL844hOHD50H6Xllf02hzsDEzjcQJTn/+pCC1HF3W9NztItcYqG
         1WCefbcOTziyxf1n3I6MkXGCdcsxTGRG4qGqndUTe/Ds1hV/r53M3QWWk8QkVHqkaIcx
         rUrPSuzV6oKrvifrCZdlUhvEx/u/c7WQ34BRwER9z5Jesm9873seNWiSfWMHakrSpa00
         e0yw==
X-Forwarded-Encrypted: i=1; AJvYcCURKIQbhiFDBh4T8Y7TKRzNuTaoon4iqWVoCp/2NqigRV6KdE15Gc5UJKQWoajUynXsDCOHwKV+3MBn@lists.infradead.org, AJvYcCUlZaXLVwUe1cZYoVq9cxJjNvC3daBsCGHFzgeXT+JJKdNXPhhFB+sjOYti1y270UhEE0MdvvRPxJkN/hNcI5Y=@lists.infradead.org, AJvYcCX+x2sApIvXIY+bTaIgv8a4pdrTkSz6VBUqeHLTNADst7keRq4byTQ/JsXsXgHggrpZjYAr0Ymv5RQzwAvpIoj4@lists.infradead.org
X-Gm-Message-State: AOJu0YwW4G0wAiYltfi/AraNSWiw6xBaYcvGuFW55P650/9UbROoC8eb
	dSPX8wm1vr0r1GKwDkpU/SDC1MaB9UG4f78dfZ2PLo82iS/EdomWKaXZYSLwjdXxTJ7qcXFzF7c
	2Uf5Qc9AXvmP7EJHXZ3dEERF9bOIda1VLA0o=
X-Gm-Gg: ASbGnctUicoNS/pdT2BPvQy51/wN1iVMMDMcf1RU5Kb8qlUYGxVmobPmsz9rV5yFgNm
	l9pLbjCv1AsWCHdzdR1kYT3OMNN6a7EPZ6Vf5Apw=
X-Google-Smtp-Source: AGHT+IH+qvBvGoDx+jCJz+KZPOUstmywrTmIX10mbpjcqahNDzahOjIUSRJNMh25pq9DtMwv8pnkssopEovu8Dv+ZpM=
X-Received: by 2002:a05:6402:40c6:b0:5d0:b4ea:9743 with SMTP id
 4fb4d7f45d1cf-5d972e09f94mr25110291a12.8.1736943967555; Wed, 15 Jan 2025
 04:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
In-Reply-To: <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 07:25:53 -0500
X-Gm-Features: AbW1kvaJVj90ysXZJNFs0kxY37_GZ4QOK4IDTusf86cx6vh6a5LQgqqnUgTCLtk
Message-ID: <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250115_042609_653681_BDE8F79D 
X-CRM114-Status: GOOD (  30.46  )
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

On Wed, Jan 15, 2025 at 6:22=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 15 sty 2025, o godz. 02:26:
> >
> >
> > This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> > based loosely on my original version, but as of now almost nothing of
> > the original driver remains. The main fix here is the discovery of
> > BIT(6) in the interrupt enable grf register fixes the usb3 disconnectio=
n
> > detection (mostly). On occasion an unpopulated usb3 hub will take
> > several seconds to disconnect. However this means all of the hack aroun=
d
> > work to reset the usb core manually is no longer required.
> >
> > I did my best to document all registers I could find. A lot was taken
> > from emails between myself and Rockchip's engineers, much thanks to
> > William Wu <wulf@rock-chips.com> for their assistance here. The rest of
> > the config bits were taken from the rk3328 and rk3228h TRMs and the
> > downstream driver. Everything that I couldn't find a definition for is
> > prefixed UNK_ or UNKNOWN_. There's a lot of obviously used configuratio=
n
> > registers with the pipe interface that are also undocumented.
> >
> > The only major bug I have so far is my AX88179 usb3 gigabit ethernet
> > adapter (Pluggable brand) crashes out when large amounts of data are
> > transmitted. I suspect this is related to the RX and TX tuning, as
> > leaving it at defaults makes things worse. As I am not a USB3 engineer
> > and I do not have the specialized knowledge and hardware to determine
> > what is going wrong, I am hoping the mailing list will have an answer
> > here.
> >
> > Please test and review.
> >
> > Very Respectfully,
> > Peter Geis
> >
> >
> >
> > Peter Geis (6):
> >  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
> >  dt-bindings: phy: rockchip: add rk3328 usb3 phy
> >  phy: rockchip: add driver for rk3328 usb3 phy
> >  arm64: dts: rockchip: add rk3328 usb3 phy node
> >  arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
> >  arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards
> >
> > .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++
> > .../boot/dts/rockchip/rk3328-nanopi-r2.dtsi   |  12 +
> > .../dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  12 +
> > arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi  |  12 +
> > .../boot/dts/rockchip/rk3328-rock-pi-e.dts    |  12 +
> > .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  12 +
> > arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  39 +
> > drivers/clk/rockchip/clk-rk3328.c             |   2 +-
> > drivers/phy/rockchip/Kconfig                  |  10 +
> > drivers/phy/rockchip/Makefile                 |   1 +
> > drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
> > 11 files changed, 1146 insertions(+), 1 deletion(-)
> > create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno-=
usb3phy.yaml
> > create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> >
> > --
> > 2.39.5
> >
> >
>
> Peter,
> I applied this as test run on 6.12.9 and dmesg says:
>
> [   16.368514] rockchip-usb3-phy ff460000.usb3-phy: could not get usb3phy=
 ref clock
> [   16.368534] rockchip-usb3-phy ff460000.usb3-phy: parse dt failed -2
> [   16.368543] rockchip-usb3-phy ff460000.usb3-phy: probe with driver roc=
kchip-usb3-phy failed with error -2
>
> This is on beelink a1 tvbox.
>
> Do I miss something?
>

Good Morning,

That is an interesting failure. The simplest answer is the
`clock-names =3D "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe";` line
was corrupted. Please check that when applied it matches the patch
exactly. If you are still having problems, you can send me the
compiled DTB and I'll take a look.

Very Respectfully,
Peter Geis

>

