Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90955E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7apG0q46MEHqecnkYUy7rU574wIsENCI9mgJgDKee4=; b=eOGdjYQ/XdDOcrHL2mh7rUe1dt
	IO1CmkaPs/X3BJB7DSddSFp2TbadBtrD4S7LDmxBew+TSDLaHhQcKCAYRxSD6jn6emyI7TaRpAzcK
	MtAfX1Pi5MPJ+5XPIyUy6Ty/jPhnWbvXKILNYPAHCvU7JCvHENCUKq8eym75JLbbRpmi80nBdQ3ti
	rCvlQtUyl23sWqhNMEoQ72VK5Lx2B8R1gA5oZouaJqjkeq+5TiCiaxU8q7FJAiasm2cQH8zB66s3t
	CpeW403Note7eudCH5dIl7Vw5Ndjb8ItW771bY0RQm5Heygo8KeRtyi3G4ydZz/gjqUW0FNSt8JL9
	CW4+Ny0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRBHq-00000000NdF-1Mo9;
	Fri, 27 Dec 2024 14:25:58 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRBGf-00000000NRD-1GPU;
	Fri, 27 Dec 2024 14:24:46 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735309483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7apG0q46MEHqecnkYUy7rU574wIsENCI9mgJgDKee4=;
	b=ut0dNskTmiAvABEg8ub9FJjvur5A6EJOgFc6d//pXcwPebwLD+1USNgtK23DCrvT/lnjTH
	gmSGo0AB7sp1boZaXOOQC5L/7BhFXTgXyr5Dtx5fJb9XnjRozJJ4O7yTb0Q4/azp2+sz7K
	yPMki01qDID5Vm/5OYIENjPj+kH+h3EUCii/lB1oGWqZqihNiQjwfBg9b8WNTvAF0MQq/l
	uCKPn1RGcCy0WGShWPUA2u7NN7LWw4bcpH5ktNUD9ZFezy+NnBl46W9s2Si/zAN+ZWENbf
	ADxXfZAxn9bq/h9pNrUr9hDzWrPgAd7SRzz8r/HtgAeBJjDJZ8GlE99xV9Wy2w==
Date: Fri, 27 Dec 2024 15:24:42 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jagan Teki <jagan@edgeble.ai>
Cc: Kever Yang <kever.yang@rock-chips.com>, Heiko Stuebner
 <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: Add Rockchip RK3588M
In-Reply-To: <CA+VMnFwjbXbjb5nP6FBASOr0Tz+nSNTx0OoQu31xtLHkoWgE_g@mail.gmail.com>
References: <20241227133420.169714-1-jagan@edgeble.ai>
 <8f40821508fde291aab01674618c0a2c@manjaro.org>
 <e03da44cd6ae417feeb3de3fbfbff7f9@manjaro.org>
 <CA+VMnFwjbXbjb5nP6FBASOr0Tz+nSNTx0OoQu31xtLHkoWgE_g@mail.gmail.com>
Message-ID: <340be9d5b8f187ba3eb8bee67fa04905@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_062445_628131_F32B836E 
X-CRM114-Status: GOOD (  27.43  )
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

On 2024-12-27 15:13, Jagan Teki wrote:
> On Fri, 27 Dec 2024 at 19:37, Dragan Simic <dsimic@manjaro.org> wrote:
>> On 2024-12-27 14:48, Dragan Simic wrote:
>> > Please see a comment below.
>> >
>> > On 2024-12-27 14:34, Jagan Teki wrote:
>> >> Rockchip RK3588M is the automotive-grade version of RK3588 SoC and
>> >> is operated with -40 °C to +85 °C temparature.
>> >>
>> >> Add rk3588m specific dtsi for adding rk3588m specific operating points
>> >> and other changes to be add in future.
>> >>
>> >> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
>> >> ---
>> >>  arch/arm64/boot/dts/rockchip/rk3588m.dtsi | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> >>
>> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> >> b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> >> new file mode 100644
>> >> index 000000000000..0bbeee399a63
>> >> --- /dev/null
>> >> +++ b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
>> >> @@ -0,0 +1,7 @@
>> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> >> +/*
>> >> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
>> >> + *
>> >> + */
>> >> +
>> >> +#include "rk3588-extra.dtsi"
>> >
>> > I don't think we need or want a separate rk3588m.dtsi file for this
>> > purpose, unless the RK3588M variant actually differs from the regular
>> > RK3588 variant from the software standpoint.  The latter is already
>> > described in rk3588.dtsi, so it should just be included in the new
>> > board dts(i) file.
>> 
>> Actually, after having a look at the downstream code, it seems that
>> the RK3588J and RK3588M variants share the same OPPs, so actually
>> rk3588j.dtsi should be used for the RK3588M variant.  Could you,
>> please, confirm this?
>> 
>> Alas, it seems we've got some serious issues in the OPPs currently
>> defined in rk3588j.dtsi, which I'll double check to make sure I'm not
>> going crazy, :) and submit a patch that fixes those OPPs.
>> 
>> If you could confirm the RK3588M == RK3588J assumption above, I can
>> add some additional clarification to the rk3588j.dtsi file in the
>> above-mentioned fixes.
> 
> As-far-as-i-know both OPPs were different due to computation grades J
> for Industrial and M for Automotive. What I saw from downstream
> linux-6.1-stan-rkr1 was a simple dtsi for M variant and might have
> changes to add OPPs which I cannot be sure at this point of time. I
> keep that dtsi as separate even though it is nothing as i was
> expecting some future changes on OPPs or so.

After checking the downstream code again, [*] it seems to me that
the RK3588J and RK3588M variants share the same OPPs.  Furthermore,
if the OPPs for the RK3588M variant cannot be defined accurately
at the moment, I'd suggest that the placeholder .dtsi is avoided
and that a complete per-variant .dtsi is added later, when the OPPs
are actually determined and defined.

Regarding the assumed issues with the current OPPs in rk3588j.dtsi,
it's all about the IPA complaining about the same-voltage, lower-
frequency OPPs being inefficient, which I already argued against.
I remain committed to proving that to be inaccurate, but until that
materializes, the current OPPs are there to stay.

[*] 
https://raw.githubusercontent.com/rockchip-linux/kernel/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi

