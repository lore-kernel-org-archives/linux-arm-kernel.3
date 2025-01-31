Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576B6C02193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w66nwBa+GHbxorNXdWjdWunCnuLe88jUElmyfHxjB78=; b=stbOra7xLnfz+PNrPMiBkDan6U
	nf++6+kaB192LgEocB3a+X+HkBNZD+RhKcbpyx8I8UGuORdUP9ZztncaE93xW/Br9zgnlkH+W+9Yk
	1b3+X7uZgE8cAKMIeaOlc2luudAP/qaFj3ctVYseqDUlNYybS67UdOOOifeC9BNDnDdlEbTK7bBmy
	52jZsAc2snpfsJFAYR9xyG5FVJlP1iKAYkKmI2GY4oXc9OSjHK4SgSFfXqW6ub+kfCP/kLosiG5rq
	KMmtSRNYiHoQ+/RxbXY2oNpP7x9Ok9Jn2VDa6KM2LY9g9mpWbb+QZiLINQudynI0lZqIslfJA9ecE
	fVy8xR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdn3t-0000000AHWJ-1MFl;
	Fri, 31 Jan 2025 09:11:41 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdn2X-0000000AHAA-1CmS;
	Fri, 31 Jan 2025 09:10:18 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738314613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w66nwBa+GHbxorNXdWjdWunCnuLe88jUElmyfHxjB78=;
	b=ls3/hWsGrRsivnoaVnIbnPU1Uf9z93L4dfcm0vJAunbPNK7qG5fKxjGBSNBFijT7dwRS/a
	bz5zyUjR9T69n04l9K6VWu6S05JU/Q2pI3Qu8UfwBcGAjPf9+EZ033YZTwxR7VqYWU29cT
	Hw9iqepXFumcPBXREvGBz5CnlTIGAFcRPM+XPa41FiOqXfvEZ3l2rN+/cSsMSMJ/9hO0AY
	ZdiwDDeJIg8e93wV1GJTfiymUPl7n81Pkslusc+Ffsxl1VkMOTgBHMnalLrKfmjrHXGEj8
	mQOJdfKvuyGmffR87bZtmzrJ4TLKUFA6WfQV55kTHgiCE7oQQOHasdnoRoDFUA==
Date: Fri, 31 Jan 2025 10:10:13 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tianling Shen <cnsztl@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
In-Reply-To: <2910311.mvXUDI8C0e@phil>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <98387508-10de-4c2e-80ad-05d0d86b7006@gmail.com>
 <59e46b34e1c8f9197565fea917335d3f@manjaro.org> <2910311.mvXUDI8C0e@phil>
Message-ID: <19d3590613746aef9af98361d8cda4bc@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_011017_636565_5C89468F 
X-CRM114-Status: GOOD (  22.29  )
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

Hello Heiko,

On 2025-01-31 10:01, Heiko Stuebner wrote:
> Am Freitag, 24. Januar 2025, 07:35:50 MEZ schrieb Dragan Simic:
>> On 2025-01-24 07:28, Tianling Shen wrote:
>> > On 2025/1/19 23:48, Tianling Shen wrote:
>> >> On 2025/1/19 19:36, Dragan Simic wrote:
>> >>> On 2025-01-19 12:15, Tianling Shen wrote:
>> >>>> On 2025/1/19 17:54, Dragan Simic wrote:
>> >>>>> Thanks for the patch.  Please, see a comment below.
>> >>>>>
>> >>>>> On 2025-01-19 10:11, Tianling Shen wrote:
>> >>>>>> In general the delay should be added by the PHY instead of the
>> >>>>>> MAC,
>> >>>>>> and this improves network stability on some boards which seem to
>> >>>>>> need different delay.
>> >>>>>>
>> >>>>>> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi
>> >>>>>> R1 Plus LTS")
>> >>>>>> Cc: stable@vger.kernel.org # 6.6+
>> >>>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>> >>>>>> ---
>> >>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3
>> >>>>>> +--
>> >>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1
>> >>>>>> +
>> >>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1
>> >>>>>> -
>> >>>>>>  3 files changed, 2 insertions(+), 3 deletions(-)
>> >>>>>>
>> >>>>>> diff --git
>> >>>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> >>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> >>>>>> index 67c246ad8b8c..ec2ce894da1f 100644
>> >>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> >>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>> >>>>>> @@ -17,8 +17,7 @@ / {
>> >>>>>>
>> >>>>>>  &gmac2io {
>> >>>>>>      phy-handle = <&yt8531c>;
>> >>>>>> -    tx_delay = <0x19>;
>> >>>>>> -    rx_delay = <0x05>;
>> >>>>>> +    phy-mode = "rgmii-id";
>> >>>>>
>> >>>>> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
>> >>>>> into the "tx-internal-delay-ps" and "rx-internal-delay-ps"
>> >>>>> parameters,
>> >>>>> respectively, so the Motorcomm PHY driver can pick them up and
>> >>>>> actually configure the internal PHY delays?
>> >>>>
>> >>>> The documentation[1] says "{t,r}x-internal-delay-ps" default to 1950
>> >>>> and that value already works fine on my board.
>> >>>>
>> >>>> 1. https://www.kernel.org/doc/Documentation/devicetree/bindings/net/
>> >>>> motorcomm%2Cyt8xxx.yaml
>> >>>
>> >>> I see, but those values differ from the values found in the
>> >>> "tx_delay" and "rx_delay" DT parameters, so I think this patch
>> >>> should be tested with at least one more Orange Pi R1 Plus LTS
>> >>> board, to make sure it's all still fine.
>> >>
>> >> This patch has been tested on 2 boards, and we will do more tests in
>> >> next week.
>> >
>> > Managed to test on another board and looks so far so good.
>> > (Working network connection, no packet drop)
>> 
>> Sounds good to me, thanks for the additional testing.
> 
> I assume that means there are no more open issues, right?
> At least I got that impression from glancing at the thread :-)

Yes, Tianling performed the additional testing, and the
introduced changes worked fine on three boards in total.
To me, that sounds good. :)

