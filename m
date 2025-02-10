Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31975C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfCRHzFveZzAGV8Z+uWeA7HD1dufJpo8G/47iGVAsSU=; b=H2KF/lRRxW9K2/WKhEx0iYLHm6
	RgCIg7KiH6LM6PZknJpnY7+mIcKFSd/a82P6N6AEnANjZrgqGSeZWkDwHNJ9Hzcz8MQi/irsgBwKD
	yQROcStOjpFHmYOdfHwB5Ck8IYVGDpHXGjon5ebXvyyWP0dTLr2WFea40mgJ4UCjj9D9RF4KO7/8U
	wgBzCsMqCQrS741ULLOkzbDyeiiV1wRY/IdIQ7XtEVQg3TczRr5JE/yGh59yFgdBCPrqOZPKIoyK0
	iSN2GHEnLXdhhja9ar4atH7lnxppIsj9+LZAZCcARUKnCY8/2Uj4W+nmha0lnKEyzVvvEoLW/P8bQ
	/H3nj1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thP0i-0000000GcsO-35k9;
	Mon, 10 Feb 2025 08:19:20 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thOzJ-0000000GcaE-3V78;
	Mon, 10 Feb 2025 08:17:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfCRHzFveZzAGV8Z+uWeA7HD1dufJpo8G/47iGVAsSU=;
	b=ZfEhN2IR8SlgFMvj5IFyT3DSmRK5f1l+1Sj2KDuvqxkjLmRBRILn5pvnC58aUw83sk5hn4
	3+5xQVFhqt59IE8hfV/sGmxsJU8v3iWWNUtUB3QsorNKEHu7wnvavVbAD1R5/w15VAneTZ
	kogexvBfzqe1PfQwRIeR7mdD84Z+KSLVlNfpDUR2wNB3dOpM6o2QrIUM96+Uo5EZj0jMA5
	AVS2xm9KJOUB8o6AHFOLFwgEZQm7p+W+rdYaTWxr4LorSm7tDHAtmHDvILLaL6qJp1EMYd
	rNWZeIGsp0gq3TCmxSqUW3lGZJA119Ko2bpO3o2di17WOxaFryayR4iLi9krFA==
Date: Mon, 10 Feb 2025 09:17:48 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki
 <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
In-Reply-To: <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
 <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
 <3de1cc52-5579-41b1-a333-0c4e81f96fbd@cherry.de>
 <cb8f370474df88d1194d9ee92d3ca4e0@manjaro.org>
 <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
Message-ID: <a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_001754_175858_DFC64910 
X-CRM114-Status: GOOD (  34.34  )
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

On 2025-02-06 12:07, Quentin Schulz wrote:
> On 2/4/25 2:35 PM, Dragan Simic wrote:
>> On 2025-02-04 13:20, Quentin Schulz wrote:
>>> On 2/4/25 12:22 PM, Dragan Simic wrote:
>>>> > On 2025-01-31 11:40, Quentin Schulz wrote:
> 
> Not discussing CONFIG_OF_ALL_DTBS relevancy wrt hiding overlay tests
> behind, unrelated to this series I believe :)
> 
> [...]

Oh, indeed.  I'll get back to it below.

>>>> With the above-proposed changes in place, and with 
>>>> CONFIG_OF_ALL_DTBS
>>>> selected, the relevant part of the "make dtbs" output looks like 
>>>> this:
>>>> 
>>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
>>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>>>>    DTC     
>>>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>>>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>>>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
>>>> 
>>>> No more "phony targets" in the produced output. :)
>>> 
>>> Funnily enough, I would prefer to see OVL for overlays rather than
>>> DTC, but I guess it's just one more occurrence of developers
>>> disagreeing on how to name things :)
>> 
>> I actually agree with that, just like I prefer to see .dtbo files
>> as additions to dtb-$(CONFIG_ARCH_XYZ).  It's all about the overlays,
>> so they should be both specified and echoed back.
>> 
>> Moreover, we currently also have additional .dtb files with applied
>> overlays left after the build and installed afterwards, which doesn't
>> make much sense to me.  To me, those additional .dtb files should be
>> deleted as build artefacts and not installed.
> 
> I **think** it could be useful for systems without overlay support.
> Then you have a dtb which is the result of an overlay applied on top
> of the base dtb and you can replace your previous dtb with that one,
> and voilà.
> 
> What I don't like is that it's difficult to differentiate them from
> the "normal" base DTB or even from the DTBO (simple base DTB + overlay
> test is usually named after the overlay, and in the case of the Rock
> 5B test: rk3588-rock-5b-pcie-srns.dtbo and
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb), easy to
> pick the wrong one. Though that is on **me** as I could pick another
> name for the overlay test and e.g. prepend "test-ovl_" to the filename
> for example.

On second thought, I'd agree that having the additional "extended"
.dtb files, i.e. the versions with the DT overlays already applied,
could be quite useful.  It's just that having them built and installed
as well possibly makes everything a bit more convoluted, maybe even
a bit confusing, but that's pretty much inevitable.  However, the
benefits should outweigh those slight downsides.

Regarding the naming, I don't think that prepending a self-descriptive
prefix would actually work as expected, because of the way "magic"
in scripts/Makefile.dtbs works.  Actually, I just tested that, and
it didn't seem to work as expected.

> [...]
> 
>>> I won't be too difficult to convince here, just want some "authority"
>>> or a piece of history about CONFIG_OF_ALL_DTBS that would go your
>>> direction, before doing the change. I believe automated build tests
>>> without needing to enable a symbol, and that taking DTB and DTBO from
>>> the build output and apply DTBO on top of DTB works without having to
>>> go through some length to get the symbols, are good reasons to keep 
>>> it
>>> the way it is in this patch series.
>> 
>> I'd like the most to perform the above-proposed "divorcing" of the DT
>> overlay tests from CONFIG_OF_ALL_DTBS, so we don't have to enable any
>> additional options to have the overlay tests run automatically, but
>> to keep .dtbo filenames in dtb-$(CONFIG_ARCH_XYZ).  I think that would
>> bring the best of both worlds, so to speak.
> 
> So, just to recap:
> 
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
> 
> stays and I add:
> 
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> 	rk3568-wolfvision-pf5-display-vz.dtbo \
> 	rk3568-wolfvision-pf5-io-expander.dtbo
> 
> at the bottom of the Makefile. I specifically do NOT want to make this
> depend on CONFIG_OF_ALL_DTBS (by using dtb- like in ti/), so that the
> base DTB will always have the symbols in, regardless of
> CONFIG_OF_ALL_DTBS.
> 
> I think the redundancy is unnecessary but I guess it's worth getting
> away from implicit rules.

I fully agree with getting away from the tests depending on the
CONFIG_OF_ALL_DTBS configuration option, which I wasn't happy with
from the very beginning of this discussion.  It just felt and still
feels wrong, especially because CONFIG_OF_ALL_DTBS depends on other
configuration option(s) that pretty much don't go together with a
non-development kernel build.

The above-provided example is perfectly fine with me, and it follows
the way "magic" in scripts/Makefile.dtbs works.  I just tested it,
to make sure it works as expected, which it does.  As a note, I like
that the already present .dtbo lines remain unmoved, because that
keeps the DT overlay tests separate from the "meat" of the Makefile,
which should make it more readable and less error-prone.

