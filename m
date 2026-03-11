Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B3FFD88D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH/Ie2aFI4K/lDnNQHmGKjIFS9FcKLj4P5iq92/ff4A=; b=dFVht5UU4UlE2aakaRAcdMExM9
	Ccg9vy1wugCbHfksmxGOO07HvF1aFOzZ9QTtbwBnhHZY4HogornLUIXM+q8mRw66Cx4rv67YAyC4M
	MXRepmiGhiTCr62ZEkCBT+IruG8wOGvotbgW2jAqQYOEirZiJV5xQU2VKFc1JUkshbs9zOtDHpSJV
	cwCzZZOK6dIuOVvH82vPgabT0F+RStqT8o0upGxzV1KlZiAnW5ptf690tjFoWd2R7GeMDvHdhtxiq
	Pfb5DdURfhoMocUUVDR4/vs+rTQmxqsuksjvS8rrCG8syuoA2cxIx0Uu+fnI6fteo+O8/wwmC5gQo
	p+njznzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07fX-0000000ASc1-2xt2;
	Wed, 11 Mar 2026 00:43:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07fW-0000000ASbg-3pAw;
	Wed, 11 Mar 2026 00:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2E5C60141;
	Wed, 11 Mar 2026 00:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFE8C19423;
	Wed, 11 Mar 2026 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773189801;
	bh=kH/Ie2aFI4K/lDnNQHmGKjIFS9FcKLj4P5iq92/ff4A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ehjrxnRqe+S2eARDKmHB+T6s70Jt3cX86F+fjg7UoP9KeQpNc++YTPXyAwhtwIrtC
	 q+wwSkK/QiCZrhT3t4VHk0J2WoSlGLUkkGpwlzyZ6jokMDIQm0yfYlsUivEzvT3bMF
	 JgSpQf96bxTLa4D7k5pAKV6KtS++9ko/Db84UTLpbbpHn6dpFhfco15NtaOrsZdhsT
	 vp4VUUPWaEOXi+DT0ZGVDQh52RxlDZ08G2lq7Z3+Xt5hsbx4Li0T+2Y4YDJ+32VMgZ
	 DpWgLqCJ4KlHX1acNrBvV8OHzGz5t/OeAK2QzFST19HKtDhzq6VS1/mBLlA4Lu1IqI
	 VCQ0H/t/tXKqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 01:43:15 +0100
Message-Id: <DGZJBMG2Y738.2MU5LXVGEDD47@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@oss.qualcomm.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Niklas Cassel"
 <cassel@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Hans Zhang"
 <18255117159@163.com>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Wilfred Mallawa"
 <wilfred.mallawa@wdc.com>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Anand Moon" <linux.amoon@gmail.com>, "Grimmauld" <grimmauld@grimmauld.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>, "Lukas Wunner"
 <lukas@wunner.de>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
To: "Robin Murphy" <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
In-Reply-To: <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
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

(Cc: Dmitry)

On Tue Mar 10, 2026 at 10:03 PM CET, Robin Murphy wrote:
> [ +driver-core maintainers - async probe question below ]

<snip>

> I'm guessing it maybe wasn't anticipated to have bus drivers calling
> device_initial_probe() from within async in the first place?

I think this is not limited to device_initial_probe(), device_attach() or e=
ven
device_add() would have the same problem. I.e. the driver core simply does =
not
consider whether it is already running in an async handler when it is reque=
sted
to run probe() synchronously.

A simple workaround to this would be to check whether current_is_async() an=
d in
case it returns true just defer probing in an PROBE_FORCE_SYNCHRONOUS case.=
 This
would at least be compatible with the guarantees given by
PROBE_FORCE_SYNCHRONOUS, but it doesn't sound quite right to me -- guess I =
have
to think about it a bit more.

In any case, given that this is not a supported case, this commit seems to =
be
wrong and should probably be reverted.

I think a quick workaround in the driver core as mentioned above is not a g=
ood
idea, instead this should be properly thought through.

> It may not strictly be the fault of this patch - clearly 91703041697c=20
> ("PCI: Allow built-in drivers to use async initial probing") is=20
> implicated in this too - but the fact is that it *has* exposed a bug=20
> that needs fixing one way or another, it can't just be left hanging and=
=20
> impacting end users.

At a side note, I think device_initial_probe() was not meant to be exposed
outside of the driver core in the first place. As the name suggests it is o=
nly
meant to be called on the initial probe() path (i.e. the initial probe() pa=
th of
the driver core). It seems to me that it ended up in include/linux/device.h
instead of drivers/base/base.h by accident.

The original commit - commit 765230b5f084 ("driver-core: add asynchronous
probing support for drivers") - introducing the feature even mentions "manu=
al
binding is still synchronous" in its commit message and I think this has ne=
ver
been changed.

So, it seems commit 91703041697c ("PCI: Allow built-in drivers to use async
initial probing") relies on something that might work by accident. :)

So, I wouldn't rule out any unexpected side effects entirely.

