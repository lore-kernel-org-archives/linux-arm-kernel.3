Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE21C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbkDpuoMBPcyBFEm988lbtXZYFu6aRBrtLIMJK35q3k=; b=fJfL2g9V8WIXOiJ9c9yg6QNAGR
	d59k43ED4wZoO9WPH/yaq31NKv+d/yRoX+4nNIrLfOlSyGXKTINId41IoYTK7x9d0SEbzNvQRZGzc
	8+JBZFi6CGN+279CDHjl1fJ7XpQcUPkc8ekfJcQXVLQJa9ZVOAI52d+vwfVdldNq4Z2xMzC1Se2uX
	Q/u4d10ZP9fJNTDu4YDNlqBBMOAmSpggigjAslnAK9O6OWnLFHwq5WA3g8Hxg9q9rYHZ4A6GtA8sV
	uUl3P0Zmm93bfVD6QSW+xgjWzl9RRpbtQLCcu51Ncdq4aaSoN1wV/hv+f6dtvnRYmxkwkW7RIaops
	JC+ypAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhpg-00000007c6O-16Ho;
	Fri, 03 Jul 2026 17:37:44 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhpb-00000007c5x-3tBx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 17:37:42 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783100255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbkDpuoMBPcyBFEm988lbtXZYFu6aRBrtLIMJK35q3k=;
	b=C2gvDjyWf+uY2YButwXPZMYYNecozmKiTGL4jepsigtmA/Vep9MPoC54H7dI+6YbngNGwF
	EmWxLlGx9hXsNolKHhrd3o0vjszyLaJX6DZDC0Oqbupe/nW5gsDhXPVv+YklTcxQsTn3/u
	vfnvE8QhMilvjOHJKcGKB3oBYt01eb57UHay117sSK+oU5mV3NxjXEx6S0PsMIl+1A5+ui
	eK0IXGwIGLneVsGer+d9l+2h2z0wx/V3zaoE4Aa+vgfI2yYpwJ3IiuXwkl5YdpYyOFObCC
	INcVvGgDHGPc98FKGInmui3Q/igRN+H+XaBckc7+tcR9E3vlrd1q/8zWV9L20Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 19:37:14 +0200
Message-Id: <DJP4A331FN4E.3EI86SNT87QRP@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 12/12] arm64: dts: rockchip: add support for NanoPi M6
 board
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>, "Diederik de Haas"
 <diederik@cknow-tech.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-12-8344a1559519@gmail.com>
 <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
 <CAPSPb=ustOuAkeWUL8x6aigO=5wkQUupZh2g5g0Pe=qTa3MeEA@mail.gmail.com>
In-Reply-To: <CAPSPb=ustOuAkeWUL8x6aigO=5wkQUupZh2g5g0Pe=qTa3MeEA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_103740_413545_AE010F3B 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Joachim,

On Fri Jul 3, 2026 at 7:14 PM CEST, Joachim Eastwood wrote:
> On Fri, 3 Jul 2026 at 13:34, Diederik de Haas <diederik@cknow-tech.com> w=
rote:
>> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote=
:
>> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
>> >
>> > The NanoPi M6 board shares most of the features of the R6 boards.
>> >
>> > Main differences:
>> > * M.2 M-key slot with PCIe (Also present on R6C)
>> > * M.2 E-key slot with PCIe and USB (from hub)
>> > * 1 additional USB 2.0 port from an on-board USB hub
>> > * RT5616 audio CODEC
>> >
>> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
>> > ---
>>
>> [...]
>>
>> > +&i2c7 {
>> > +     clock-frequency =3D <200000>;
>> > +     status =3D "okay";
>> > +
>> > +     rt5616: codec@1b {
>> > +             compatible =3D "realtek,rt5616";
>> > +             reg =3D <0x1b>;
>> > +             clocks =3D <&cru I2S0_8CH_MCLKOUT>;
>> > +             clock-names =3D "mclk";
>> > +             #sound-dai-cells =3D <0>;
>> > +             assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT>;
>>
>> s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ ?
>>
>> See these links for details:
>> https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-=
tech.com/
>> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git=
/commit/?h=3Dv7.2-clk/fixes&id=3D946352b2f88fd2378f0341312e47dff1e8dc2fac
>
> Thanks for the feedback and pointers.
> I will use I2S0_8CH_MCLKOUT_TO_IO for the next version.
>
> Grepping through the other boards there doesn't seem to any other users
> of I2S0_8CH_MCLKOUT_TO_IO right now. But I assume the other boards
> will be converted over later(?)

That is indeed the idea; boards can(/should) be converted, ideally by someo=
ne
who has the board and can verify its result.

There's at least 'one' (or 3) being worked on ;-)
https://git.sr.ht/~diederik/linux-kernel/log/rk3588-nanopc-t6-plus

But for new boards, it's better to use the new _TO_IO variant.

Cheers,
  Diederik

