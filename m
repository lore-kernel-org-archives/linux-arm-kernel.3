Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8FBC36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XERG4fHTRlBSKZ7O9h54QbkOrIztH+Lz87Rz4mphs4o=; b=oKkcrcYUiCV5Uf2pj1U6ynFJ6l
	dvYuDnzp5Fi6oKYI7+tpKY6r4wi8LbaMQV9w/BloT3M4vyp0ExAZJ0fgd4XeAVRB1SUNPtF1uuyNy
	DSDsQwlJDFH4UbCebW5y5FxWaBtyCSfKDxRD0Y8Q11Wq4lK13iR1mQvIIgLQOZiPMhWTaDMl3Rz3h
	v3gdX17G1qrF8U94pN493Tif80t5QHOs7debE0g07xz8KcdtnRKplqFgnN8GaqHm3ZmmdHlPFTi83
	f3EOy7vRTZO/XxMfrUY+xPTKg3sqcUTynLHGvlcKX0NjpFT5XN3zNfSar8ZVmY6p95jc1f71nIz+4
	LI3LzKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweWx-00000002lXk-2DzU;
	Mon, 24 Mar 2025 09:55:39 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweVE-00000002lQz-0bsS;
	Mon, 24 Mar 2025 09:53:53 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742810030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XERG4fHTRlBSKZ7O9h54QbkOrIztH+Lz87Rz4mphs4o=;
	b=FobUkMLHzOSyOc4vvxt3chAceAe1ueFbrWsmTvLcLgLFx6DMMUAhCGlPBGdfebE2Xstk0x
	cJ8CDVdI3836LwlxSq8VN6AGAVGCu78x/jzI+aDgpAniinYsuelmTsdcbwAZ8qB+0MXaa3
	YUn+eTXy1rPLPvLp35oVNOb0t+jZUFbJjwqwAyp4J/VfrTnKeKwwXTl5sBJTfUgWH84iBq
	nZ9Nz5aFtN1PH2IJo6IwVmCLx9bAfntiZ4AH+eB17tyZYQc6ZQ2KUFOqtoXKILr63YX+5+
	04yl2AjaiVUyJAhsp32aKUocxWx4ZpCiMRhXlGa7dNMh5xiJSUTWM0ekHBnCXQ==
Date: Mon, 24 Mar 2025 10:53:49 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org, Alexey Charkov
 <alchark@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Remove overdrive-mode OPPs from
 RK3588J SoC dtsi
In-Reply-To: <2ece5cca-50ea-4ec9-927e-e757c9c10c18@cherry.de>
References: <f929da061de35925ea591c969f985430e23c4a7e.1742526811.git.dsimic@manjaro.org>
 <71b7c81b-6a4e-442b-a661-04d63639962a@cherry.de>
 <960c038ad9f7b83fe14d0ded388b42f7@manjaro.org>
 <2ece5cca-50ea-4ec9-927e-e757c9c10c18@cherry.de>
Message-ID: <4d25c9af4380598b35a0d55e7c77ac3d@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_025352_507313_5580E10E 
X-CRM114-Status: GOOD (  31.50  )
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

Hello Quentin,

On 2025-03-24 10:23, Quentin Schulz wrote:
> On 3/23/25 11:19 AM, Dragan Simic wrote:
>> On 2025-03-21 10:53, Quentin Schulz wrote:
>>> On 3/21/25 4:28 AM, Dragan Simic wrote:
>>>> The differences in the vendor-approved CPU and GPU OPPs for the 
>>>> standard
>>>> Rockchip RK3588 variant [1] and the industrial Rockchip RK3588J 
>>>> variant [2]
>>>> come from the latter, presumably, supporting an extended temperature 
>>>> range
>>>> that's usually associated with industrial applications, despite the 
>>>> two SoC
>>>> variant datasheets specifying the same upper limit for the allowed 
>>>> ambient
>>>> temperature for both variants.  However, the lower temperature limit 
>>>> is
>>> 
>>> RK3588 is rated for 0-80°C, RK3588J for -40-85°C, c.f. Recommended
>>> Operating Conditions, Table 3-2, Ambient Operating Temperature.
>> 
>> Indeed, which is why I specifically wrote "specifying the same upper
>> limit", because having a lower negative temperature limit could hardly
>> put the RK3588J in danger of overheating or running hotter. :)
> 
> """
> despite the two SoC variant datasheets specifying the same upper limit
> for the allowed temperature for both variants
> """
> 
> is incorrect. The whole range is different, yes it's only a 5°C
> difference for the upper limit, but they still are different.

I just commented on this separately, with a couple of datasheet
screenshots, before I saw your latest response.  Please, have
a look at that message.

>>>> specified much lower for the RK3588J variant. [1][2]
>>>> 
>>>> To be on the safe side and to ensure maximum longevity of the 
>>>> RK3588J SoCs,
>>>> only the CPU and GPU OPPs that are declared by the vendor to be 
>>>> always safe
>>>> for this SoC variant may be provided.  As explained by the vendor 
>>>> [3] and
>>>> according to its datasheet, [2] the RK3588J variant can actually run 
>>>> safely
>>>> at higher CPU and GPU OPPs as well, but only when not enjoying the 
>>>> assumed
>>>> extended temperature range that the RK3588J, as an SoC variant 
>>>> targeted
>>> 
>>> "only when not enjoying the assumed extended temperature range" is
>>> extrapolated by me/us and not confirmed by Rockchip themselves. I've
>>> asked for a statement on what "industrial environment" they specify 
>>> in
>>> the Normal Mode explanation means since it's the only time they use
>>> the term. I've yet to receive an answer. The only thing Rockchip in
>>> their datasheet is that the overdrive mode will shorten lifetime when
>>> used for a long time, especially in high temperature conditions. It's
>>> not clear whether we can use the overdrive mode even within the 
>>> RK3588
>>> typical range of operation.
>> 
>> True.  I'll see to rephrase the patch description a bit in the v2,
>> to avoid this kind of speculation.  I mean, perhaps the speculation
>> is right, but it hasn't been confirmed officially by Rockchip.
> 
> Speculation is fine, but it should be worded as such.

Agreed, because that's our understanding so far, but it needs
to be explained a bit better.

>>>> The provided RK3588J CPU OPPs follow the slightly debatable "provide 
>>>> only
>>>> the highest-frequency OPP from the same-voltage group" approach 
>>>> that's been
>>> 
>>> Interesting that we went for a different strategy for the GPU OPPs :)
>> 
>> Good point, and I'm fully aware of that. :)  Actually, I'm rather
>> sure that omitting the additional CPU OPPs does no good to us, but
>> I didn't want to argue about that when they were dropped originally,
>> before I can have some hard numbers to prove it in a repeatable way.
> 
> I assume we'll have some patch in the future with those added and
> those hard numbers you're talking about, so looking forward to seeing
> it on the ML :)

Indeed, that's the plan, and there should be even more patches,
which should remove the slightly annoying "xyz OPP is inefficient"
warnings emitted by the IPA governor. :)

>>>> Helped-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> 
>>> Reported-by/Suggested-by?
>>> 
>>> I don't see Helped-by in
>>> https://eur02.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Fprocess%2Fsubmitting-patches.html%23using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes&data=05%7C02%7Cquentin.schulz%40cherry.de%7Cdc754791b6844506b11c08dd69f444a7%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638783220330058516%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=4bv9pUh6aSD0GVLJ4Zvuyvox1K0xxwf83KXX86QsvMo%3D&reserved=0
>>> 
>>> I see 2496b2aaacf137250f4ca449f465e2cadaabb0e8 got the Helped-by
>>> replaced by a Suggested-by for example, but I see other patches with
>>> Helped-by... if that is a standard trailer for kernel patches, then
>>> maybe we should add it to that doc?
>> 
>> Actually, I already tried to get the Helped-by tag added to the
>> kernel documentation, by submitting a small patch series. [*]
>> Unfortunately, it got rejected. :/
>> 
>> However, Heiko accepts Helped-by tags and nobody higher up the
>> tree seems to complain, so we should be fine. :)  It isn't the
>> case with all maintainers, though.
>> 
>> [*] https://eur02.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fall%2Fcover.1730874296.git.dsimic%40manjaro.org%2FT%2F%23u&data=05%7C02%7Cquentin.schulz%40cherry.de%7Cdc754791b6844506b11c08dd69f444a7%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638783220330070422%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3dZgSG%2FBT6f%2Ffqs7D30HvEl18SzqYPwNeUGWBZfMAqM%3D&reserved=0
> 
> Are you trying to up the numbers of Helped-by in commit logs to make
> it a reasonable request to add the trailer in the documentation :) ?

It's just that Helped-by is, to me, of a bit "higher value" than
Suggested-by or Reported-by, because Helped-by means that the
tagged person contributed more to the patch than just suggesting
it or reporting a bug.  In addition, having more Helped-by tags
present in various commits can help a bit with, possibly, making
it officially supported at some point in the future. :)

