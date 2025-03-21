Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CB3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 02:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJ63EbsH7vgI4jedsTSMWBQF77GuUGSswmmue0ryXcM=; b=jUEoCinffrc4xxcpvn9bCh1l7O
	QYvEa4PNa/DIyti7uABa2aAdNU+gpRMOpxsaWOuZfpHWxlBXUprqrB3pCUdKuI7P7tho8l7rvAIDQ
	5YHGyZXLeRgBU0LYFoHdIa+8YVeywTPUPJzAhK3Rrxm+l5BFBd26JYPOOWaU6JtLJF6Lbf7TDmL4+
	bXPFRwB0ZcDpPFJ+rgzfYoqSkpZ4BjSteVFOE4r5nMXLDWKD2tw5uWTNdmsc902SD7qJCycnheMOy
	iw+HJH6bR2PGlDPvre/MxzQF09/+3g6mhJ9ggFjFodn1CN5Kmdus4sU95YJHCvP5ckR5tKno+61dG
	SfeP1KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvS0g-0000000Dgdw-1Iw3;
	Fri, 21 Mar 2025 02:21:22 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvRyv-0000000DgY9-1Leg;
	Fri, 21 Mar 2025 02:19:37 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742523570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJ63EbsH7vgI4jedsTSMWBQF77GuUGSswmmue0ryXcM=;
	b=C/WRMxwJjPXsbmhSBUnFOPBeZ8PR30k6LyphZ584eFPiYvplv4IoRJbBy/hcfZjf4CHOjY
	6Xxzm6ypTFO1FrCY94FEJ4NZROkJC33DKAF8CB4s469qH2c3b2lsFZJ0owdgVZEuuwdeAM
	pqDuA6AYIBhquSRROOidRX2CUFAAb05wXwnlY2XrooeX3f3dM+i81U6hmLJTCZKlPDk3PU
	v7zXLe6QwVGAH6OL2URiG0Veri5jGg/3tBFJg0R1PhkQe+YMD59sSRgK8T1E0ZKz8p5y5q
	9yoB0JWtyJyXkdqaCwDaXqdkY82/PqBKH2Z765tzcAA1OxYQSZE1QCd0/UDECw==
Date: Fri, 21 Mar 2025 03:19:30 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Daniel_Kukie=C5=82a?= <daniel@kukiela.pl>, Sven Rademakers
 <sven.rademakers@gmail.com>, Joshua Riek <jjriek@verizon.net>
Subject: Re: [PATCH] arm64: dts: rockchip: Allow Turing RK1 cooling fan to
 spin down
In-Reply-To: <CAH5Ym4hqkMMBsT7XEz_f+TCng+0X2m0nV_Kdr-LAPBqgENgr5A@mail.gmail.com>
References: <20250315204852.1247992-1-CFSworks@gmail.com>
 <e1cdc3a39b9201cb115b12b559899aee@manjaro.org>
 <CAH5Ym4hqkMMBsT7XEz_f+TCng+0X2m0nV_Kdr-LAPBqgENgr5A@mail.gmail.com>
Message-ID: <57bb477925efc74a0ea11b20321fa661@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_191933_739355_444C0D4F 
X-CRM114-Status: GOOD (  34.18  )
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

Hello Sam,

On 2025-03-21 02:20, Sam Edwards wrote:
> On Thu, Mar 20, 2025 at 5:38 PM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> On 2025-03-15 21:48, Sam Edwards wrote:
>> > The RK3588 thermal sensor driver only receives interrupts when a
>> > higher-temperature threshold is crossed; it cannot notify when the
>> > sensor cools back off. As a result, the driver must poll for
>> > temperature
>> > changes to detect when the conditions for a thermal trip are no longer
>> > met. However, it only does so if the DT enables polling.
>> >
>> > Before this patch, the RK1 DT did not enable polling, causing the fan
>> > to
>> > continue running at the speed corresponding to the highest temperature
>> > reached.
>> >
>> > Follow suit with similar RK3588 boards by setting a polling-delay of
>> > 1000ms, enabling the driver to detect when the sensor cools back off,
>> > allowing the fan speed to decrease as appropriate.
>> >
>> > Fixes: 7c8ec5e6b9d6 ("arm64: dts: rockchip: Enable automatic fan
>> > control on Turing RK1")
>> > Signed-off-by: Sam Edwards <CFSworks@gmail.com>
>> > ---
>> >  arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
>> > b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
>> > index 6bc46734cc14..0270bffce195 100644
>> > --- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
>> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
>> > @@ -214,6 +214,8 @@ rgmii_phy: ethernet-phy@1 {
>> >  };
>> >
>> >  &package_thermal {
>> > +     polling-delay = <1000>;
>> > +
>> >       trips {
>> >               package_active1: trip-active1 {
>> >                       temperature = <45000>;
>> 
>> Thanks for the patch, it's looking good to me, with some related
>> thoughts below.  Please, feel free to include:
>> 
>> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>> 
>> After a quick look at the RK3588 TRM Part 1, it seems possible
>> to actually generate additional interrupts when the TSADC channel
>> temperature readouts reach predefined low thresholds.  Moreover,
> 
> It seems to be as simple as adding a `.set_cooloff_temp = ...` that
> writes the lower thresholds to TSADC_COMP#_LOW_INT and sets the
> necessary bits in TSADC_LT_EN+TSADC_LT_INT_EN. Since the driver
> already rescans all temperatures on any interrupt and acknowledges all
> interrupt status bits indiscriminately, I don't anticipate any other
> necessary changes.

Hmm, I'm afraid it isn't that simple...  See, the entire thermal
framework is rather complex and there may be hidden issues, because
such handling of the cooldown events probably isn't the most common
variant on all boards supported upstream.

Even if everything is fine there, with the dynamic reassigning of
the cooldown thresholds and everything else, which hopefully is, :)
generating and handling the LT_INT interrupts, at the first glance,
requires rather major changes to the driver because it introduces
a different class of interrupts, for which the amount of required
changes isn't exactly small.

> I can easily take care of that this weekend or next if that plan
> sounds good to you. However, since *this* patch is a Fixes:, I'd
> rather land it as-is first and handle the above separately. :)

I totally agree that this patch needs to get merged first, perhaps
even as a v2 that would include "Cc: stable" as well.

Regarding adding support for LT_INT interrupts, frankly, I'd much
rather leave that do be done as part of my upcoming major rework
of the OPPs by introducing the SoC binning.  As part of that, I'll
do a whole lot of testing on different boards with different SoCs
and their different variants, which should ensure that everything
works as expected, including the LT_INT stuff.

>> avoiding the polling would actually help the SoC cool down a tiny
>> bit faster, which makes it worth detailed investigation in my book,
>> despite not being used by the downstream kernel code.
> 
> Do you mean "spin down the fan a tiny bit faster" (since it would
> detect the cool-off without needing to poll for it), or are you
> emphasizing saving CPU cycles that would otherwise be spent polling?

Technically both, :) but of course, the primary goal would be to make
the CPU not do what it doesn't really have to, and spinning down the
fan faster would be just an additional benefit.  It isn't going to
make some huge difference in the CPU load (or better said, in the
"background noise"), but again, every tiny bit counts.

When it comes to the HT_INT interrupts, they're obviously much more
important, because there must not be any delays when (over)heating
happens.  That isn't so critical with the LT_INT interrupts, which
is probably the reason why the downstream kernel code uses HT_INT
interrupts only.

