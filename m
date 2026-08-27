Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3196C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTSs1AFlMEWG3XdL4uN/U6fI9VXTmdiCZqpvLYszC+k=; b=eLaj9R+2YpSxnJ+N5zinfrqm8W
	W85B+RG5QxuNsV+8ppoku5ILo8h/97+oR3EC+dD0xcWcmKW0xFwTk/oSS1MLNc73/TPcYdLZcj33i
	8OXGujyDifhkS91OkBP1RyqAjERFlJylT6lDoXJjGCU7i6ml1eit6GmiD6hf/+6kcS+1vr0uCvg+7
	r/NCkqhWq4vTIgeafEKxVjpDEHfaVB424MSaheimbUJwbJAcjxMUhmA+AdWWi+q6ReLeVbU2uf8+x
	UeNZTdNOXqUdB3Igy4W+UqqDL6g0/b8SkNGEHueblzMT0odhh4IMStNIqwaNUt8e6b6jeC73x+4A/
	0WJhyiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWTD-00000003kaE-24Ft;
	Thu, 27 Aug 2026 09:32:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWTB-00000003kZM-0zWG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:32:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7739E1691;
	Thu, 27 Aug 2026 02:32:18 -0700 (PDT)
Received: from [10.33.8.86] (unknown [10.33.8.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B40A3F66F;
	Thu, 27 Aug 2026 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787823142; bh=/jQKC5c4QuzmnMd3rNtZOojeHxgRfSkVz0sN1uXukLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vN/VHaNXhp4COXH68SRPu1t14JLKJWmIksxvptxoITc63AX6/9o8C1I8RzbOXxBU7
	 bFP7dPxNiuO2OtNsNolpSPxJOFCrOAcPZrjjtB3XKe6XRb3lYWLLtGxOybCmtDhRZH
	 fC/BLYwfHXaEXOmEIELKMdkt7EqTIz40hayPwKvY=
Message-ID: <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
Date: Thu, 27 Aug 2026 10:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-gpio@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250821004232.8134-1-andre.przywara@arm.com>
 <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_023225_327521_F4019939 
X-CRM114-Status: GOOD (  19.77  )
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

Hi,

On 8/27/26 01:07, Vinicius Pedrosa wrote:
> Hi Andre,
> 
> This series no longer applies to mainline. Patch 1/9 fails on current

Yes, naturally, this series is quite old, and we had some changes and 
fixes in pinctrl meanwhile.
I didn't find time in the last cycles, but will send an update *after*
-rc1 is released. So just a bit more patience ...

Cheers,
Andre

P.S. What was the particular purpose of you sending this email? I can't 
help to feel this is AI generated, isn't it? But the breakage is 
obvious, and as you can imagine I am well aware of my patch having been 
merged, and other patches in the vicinity which I authored or reviewed 
conflicting. In fact I regularly rebase my branches on every -rc1, I 
just didn't get around to send a new version.

> master (45c13f3f9e3b), for two separate reasons - one of them from
> outside the series, which is why I am reporting it rather than just
> fixing it locally.
> 
> Applying the series in order:
> 
>    [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
>      error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.c:1521
>      error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.h:88
> 
> The blocking one is your own patch 2/9. It merged as 42e06688c6cb
> ("pinctrl: sunxi: pass down flags to pinctrl routines") without 1/9, so
> sunxi_pinctrl_init_with_flags() now reads
> 
> 	pctl->flags = flags;
> 
> where 1/9 still expects
> 
> 	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
> 
> as context. A 3-way merge does not resolve it - both sides touch
> adjacent lines, so it conflicts.
> 
> The second is unrelated to your work. 70f8915ea4e9 ("pinctrl: sunxi: fix
> gpiochip_lock_as_irq() failure when pinmux is unknown") inserted
> SUN4I_FUNC_DISABLED_OLD/NEW into 1/9's header hunk context, and added a
> fifth use of SUNXI_PINCTRL_NEW_REG_LAYOUT, in
> sunxi_pinctrl_irq_request_resources(). The header hunk merges cleanly
> with -3, but that new use is not covered by the rename, so the tree then
> fails to build with an undeclared identifier.
> 
> Patches 3/9 through 9/9 apply cleanly once 1/9 is resolved.
> 
> Static reproduction only - no A733 hardware here, so nothing in this
> message says anything about whether the series works. I am not sending a
> rebase: which shape 1/9 should take now that 2/9 is in is your call.
> 
> Vinicius


