Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8037E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r3EXwOyrqA1TPBa3Q4vxINguWxtsGq75OcL5iEtwr4=; b=pgMJim6ebcp5ne6e8X+vCCCPch
	+jieCEix2gL0znkxUqXlNk8khq6fZWcnJtol05CSYqx3TgDpuAyCb7P59lcArOzH9P6/tZYioS7HV
	RLudrIPjK11+z6V6S5RTcm8SJ+z8iMNmXc2Re7ldB2NJ1RTjSQFGgEnda/2nSE2Lj9bJ+SrgHu+4h
	GQZtAb8SoVudB2xzHSpBimOp+EokbbnrbX8A3OD7x67kI6BU6ZUXThv8w0Z4SjxmzfQ3WMQmp/4gn
	5Fq9eUWguTrFV6UQHofCi8KQmndynteCC+maQhjIb+6Sw6iftSSbxIrgdHfnRRJnuFbnrZm4c303v
	K1PIkspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmU0-0000000Fd8F-3mes;
	Wed, 18 Dec 2024 05:20:28 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmSu-0000000Fcvr-3J13
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 05:19:23 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734499158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6r3EXwOyrqA1TPBa3Q4vxINguWxtsGq75OcL5iEtwr4=;
	b=La82PDwtrWr/Hzv125gXlcuqYlFr0IBd33yM+wIzOWQXEcaBQZOeOagv2xXF/52wBPFFTs
	ebzWKHIWI8l9j/LbdtA2TInnL0qDcFS7pRUxfgOU9Lbse92fezNajbH6qUg07pJDre3Cyq
	OPdarmzm59fRDK2A1RoNcRjKF74RrFOy4DsHdvJrLYkPk5SKDG6rzm6EggvCTS5XUH4/KE
	NbBxBs1YfOmBfwp8M3GVXK0EheLAomM3SlyYDDBRs2JL4Y0aXggOFPex2g+nACuvn//isi
	F2p0jsntNOP+zDIIzQkklu4+Fi/PO33XEeBdAOx36Gz3ZuR+spjyusXqpBIR5A==
Date: Wed, 18 Dec 2024 06:19:17 +0100
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
In-Reply-To: <20241218013836.421cc616@minigeek.lan>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
 <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
 <20241217211505.7f9c9e4e@minigeek.lan>
 <d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
 <20241218013836.421cc616@minigeek.lan>
Message-ID: <96ce1cce894a8bd5aa302d5f5183f64c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_211921_125091_A737B2D2 
X-CRM114-Status: GOOD (  31.95  )
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

Hello Andre,

On 2024-12-18 02:38, Andre Przywara wrote:
> On Tue, 17 Dec 2024 23:02:43 +0100
> Dragan Simic <dsimic@manjaro.org> wrote:
>> On 2024-12-17 22:15, Andre Przywara wrote:
>> > On Tue, 17 Dec 2024 10:00:45 -0800
>> > Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> >> On Mon, Dec 16, 2024 at 11:33 PM Krzysztof Kozlowski <krzk@kernel.org>
>> >> wrote:
>> >> >
>> >> > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
>> >> > > These will be used to explicitly select TCON0 clock parent in dts
>> >> > >
>> >> > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
>> >> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> >> > > ---
>> >> > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
>> >> > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +
>> >>
>> >> > You cannot combine these changes.
>> >>
>> >> The patch basically moves defines out from ccu-sun50i-a64.h to
>> >> sun50i-a64-ccu.h. How do I split the change without introducing
>> >> compilation failure?
>> >
>> > You can just have the binding part first, adding the (same) definition
>> > to the binding headers. As long as the #define's are not conflicting,
>> > this is fine.
>> > Then remove the now redundant definitions in the kernel headers, with a
>> > subsequent patch.
>> 
>> Yes, that would be a way to make it formally correct, but also much
>> less readable and understandable later, as part of the source code
>> repository.  FWIW, I find this to be an example of the form being
>> more important than the actual function.
> 
> Not sure I understand your last sentence, exactly,

Ah, sorry, I also saw the need to expand that sentence a bit, but only
after I had already sent my message. :/

> but what Krzysztof pointed out is that one part (the header change in
> include/dt-bindings) is a DT binding patch, so part of a spec, if you
> like, the other is Linux *code*. There is the DT rebasing repo, which
> cherry-picks DT patches, so they form a separate history there, and
> Linux code has no place in there. U-Boot for instance pull this
> repo now on a regular basis. So keeping those things strictly separate
> is really important here.

Thanks a lot for your detailed explanation and for reminding me about
the DT rebasing repository. [*]  I forgot about it for a moment, despite
being active in U-Boot development when the repository was introduced,
so yes, you're right that we're now in need to keep the bindings and the
kernel code separate in patches.

However, I can't stop myself from noticing that the way Krzysztof 
replied
left a lot to be desired when it comes to friendliness in general.  Such
an approach is probably what contributed to me forgetting about the DT
rebasing repository for a moment.

[*] 
https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

>> >> > Please run scripts/checkpatch.pl and fix reported warnings. Then please
>> >> > run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
>> >> > Some warnings can be ignored, especially from --strict run, but the code
>> >> > here looks like it needs a fix. Feel free to get in touch if the warning
>> >> > is not clear.
>> >>
>> >> Yeah, it is not clear what do you want me to do, assuming the previous
>> >> similar change to sun50i-a64-ccu.h did essentially the same, see
>> >> 71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9

