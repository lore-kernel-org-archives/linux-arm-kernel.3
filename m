Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69E4E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3T0I8Im+xs38OE09Iv+okJqntT08tdxR/DACobP2E3c=; b=rf32/5FQi87GGKauuMuoewcbJI
	UpB8WelNcSRipu2isdJG8JbqXpLsyISOe4b2Rk6bgHeJd4NSVVp2ylXz53Th/a7plsJ3PpDGG1u4L
	jMztTAy3agnVGHEKdmczU+2rk+6TXKiGTJu2LvIMsLPdTUSD8iGepMpEyVf5TA7ToOWmFswfM9gsE
	tV9skIyXUThDnfCDYzK0+G8m+BrioUPe53KpwRFCufyIhqx0Ej7iQn+mKgzLYnlpnzZrm9Xq4wzwB
	33MSf5Pg1Q72nmbRMHfW0qQ+L5cC1HnDBdp49kqwPVDPFNMef+nOigascXH/aKimPQ+8nZSr93IWJ
	k5yFaOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNffZ-0000000Ewkg-1O3J;
	Tue, 17 Dec 2024 22:03:57 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfeU-0000000Ewch-02ZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 22:02:51 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734472965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3T0I8Im+xs38OE09Iv+okJqntT08tdxR/DACobP2E3c=;
	b=EDauNmcPkUwwP8lSPH+M30N+OnKv8Q1PSFsSnr+QaUKHSmPphOQzEhH3iTcqTw97igd+0M
	yOThkqJBcPPHlNNOrXOguFiij6PHVVqEUSJ6lpyffeCWgwAOtMSXloLfJYn6NGZ2ewojs4
	YQ9x/hzasx92SPbXhf/2+LvHWRq5GgIv9zh/HMSSlZtVvi6OMYXv5mZY98tdunT1I1TfDM
	N+7IRG9LAUQtXFDdbHfjlOPGXOArB1P+uDOAczKm7qWXI+7Vw8yyg6/Zs6vz6eQtfnA0yG
	wC28LJOoOZLiBpcJFz0fQ/d0YaLpg32/qv2hRv5R7A+eCCkBKNq6tC0lCvVSlw==
Date: Tue, 17 Dec 2024 23:02:43 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
In-Reply-To: <20241217211505.7f9c9e4e@minigeek.lan>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
 <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
 <20241217211505.7f9c9e4e@minigeek.lan>
Message-ID: <d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_140250_346085_5AF6B92B 
X-CRM114-Status: GOOD (  22.80  )
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

Hello all,

On 2024-12-17 22:15, Andre Przywara wrote:
> On Tue, 17 Dec 2024 10:00:45 -0800
> Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> On Mon, Dec 16, 2024 at 11:33 PM Krzysztof Kozlowski <krzk@kernel.org> 
>> wrote:
>> >
>> > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
>> > > These will be used to explicitly select TCON0 clock parent in dts
>> > >
>> > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
>> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> > > ---
>> > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
>> > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +
>> 
>> > You cannot combine these changes.
>> 
>> The patch basically moves defines out from ccu-sun50i-a64.h to
>> sun50i-a64-ccu.h. How do I split the change without introducing
>> compilation failure?
> 
> You can just have the binding part first, adding the (same) definition
> to the binding headers. As long as the #define's are not conflicting,
> this is fine.
> Then remove the now redundant definitions in the kernel headers, with a
> subsequent patch.

Yes, that would be a way to make it formally correct, but also much
less readable and understandable later, as part of the source code
repository.  FWIW, I find this to be an example of the form being
more important than the actual function.

>> > Please run scripts/checkpatch.pl and fix reported warnings. Then please
>> > run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
>> > Some warnings can be ignored, especially from --strict run, but the code
>> > here looks like it needs a fix. Feel free to get in touch if the warning
>> > is not clear.
>> 
>> Yeah, it is not clear what do you want me to do, assuming the previous
>> similar change to sun50i-a64-ccu.h did essentially the same, see
>> 71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9

