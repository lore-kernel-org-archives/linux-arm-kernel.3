Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268ABC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0RO79xWz5uplYpgJ0aagZslkAQuZeU7KWZBSxdHL84=; b=f57OOwjXCGfQY3D2n+/LO1dDB4
	bBve1d9f3/5gpuP+g7dNwaLCpBhBmfCe2gFEU87g7lILwPJBtbyJK7FHaRd17eR/7lDgMmqajHaoq
	XVxPg07znkEoKLDVrSUV1wwUKDtDtAp54xr7atuT6b0lwdqQbzOIP1m0IJSb8o48xC8wBNckpibLa
	Xzp6iPggB1ThLs2a2OErZ5AtrJV8TMjQxVpHFI7dzwrJId/owlQulkWXau+lxIlFu3EOqihtUnndQ
	do6tg8EKhblt2UQ557RUSFoK1vWUG/3VX/M45p2pLlQsIFumtWlvk4U0jeCwtV7oTTLsNP/eNYoWh
	HAqGzG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTDt-0000000DlVd-1a73;
	Fri, 21 Mar 2025 03:39:05 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTCA-0000000DlKc-3ZYG;
	Fri, 21 Mar 2025 03:37:20 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742528236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0RO79xWz5uplYpgJ0aagZslkAQuZeU7KWZBSxdHL84=;
	b=uwFpPbx4k0pVxvvfDCpYP9Lzo0PEsFw0hCtQgOZaLCL2HzQkhNv8Dl5BtayT85WnavzCDg
	oYm392g5GozjLeSKyGuv+x+YJ1O2bRm+jffBPguQDC1GNYy/JeHAlS4tqYQIVyoo8xQ473
	nszaAOusS6l6X+z8GmM/Thqd0f2owCeK3h/zCW0WiM4W1KFeGBMB6LzrhR/NYAXX6AbgpY
	cFpjpnxUwAdHGQlMBQx1DCwV8Nk6Bd2hwSB6RaKGHNH70zGc5kvdqJsGh/2QfKfJ/wNxu4
	K+Ult3oMOtD/ysjULEgMXyYAWf3QHRDVrPPQOyEe9DrhbMCzOHnOoUN8h30B+Q==
Date: Fri, 21 Mar 2025 04:37:16 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Alexey Charkov
 <alchark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@kernel.org>, Diederik de Haas
 <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: rockchip: Add OPP data for CPU cores
 on RK3588j
In-Reply-To: <80c7d9fcdd270df2c61fbd61eec44d70@manjaro.org>
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <a56b59a21dc3c21192fe45197eee4865@manjaro.org>
 <2cf3889741f84584d8f23a4407fed08e@manjaro.org> <3271211.5fSG56mABF@phil>
 <80c7d9fcdd270df2c61fbd61eec44d70@manjaro.org>
Message-ID: <4432e7f5dd9cb75584fb36e1f52497aa@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_203719_178753_3E18076C 
X-CRM114-Status: GOOD (  19.19  )
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

On 2025-03-13 20:43, Dragan Simic wrote:
> On 2025-03-13 20:00, Heiko Stuebner wrote:
>> Am Donnerstag, 13. März 2025, 11:42:17 MEZ schrieb Dragan Simic:
>>> On 2025-03-12 11:34, Dragan Simic wrote:
>>> Just as a note, everything above (and even a bit more) is confirmed
>>> and clearly described in the publicly available RK3588J datasheet,
>>> which I'll provide as a reference in my upcoming patch.
>> 
>> so just to reiterate my stance, in mainline I really only want 
>> frequencies
>> that are not possibly influencing the lifetime of the chip.
>> 
>> It doesn't even matter about the variant we're talking about being
>> industrial :-) . When someone is using mainline I want them to be
>> reasonable assured that we don't have stuff in here that may affect
>> the lifetime of their board.
>> 
>> All gambling on performance for possible lifetime reduction people
>> can do on their own ... for example with a dt-overlay ;-) .
>> 
>> So TL;DR, I agree to both Quentin and Dragan
> 
> Thanks!  Indeed, we must provide only the OPPs that are declared
> by the manufacturer to be always safe for the particular SoC
> variant.  The RK3588J is actually a good example, because it, in
> theory, can run safely at higher OPPs as well, but only when not
> enjoying the extended temperature range that the RK3588J, as an
> SoC variant targeted at industrial applications, is specifically
> made (or binned) for.
> 
> Thus, we must support only the RK3588J OPPs that are declared to
> be safe throughout the entire extended temperature range, while
> anyone who actually can assure that their RK3588J-based board is
> never going to run within the extended temperature range, probably
> may safely apply an overlay that adds the higher OPPs.  As we
> obviously can't know what will be the temperature conditions, we
> may provide only the lower OPPs that are always safe.
> 
> I'll finish the patch and send it over tomorrow or so...  I still
> need to go through the changes once again, to make 100% sure I've
> missed nothing, and that I haven't included anything extraneous. :)

For future reference and for anyone interested, below is the link
to the above-mentioned patch.

https://lore.kernel.org/linux-rockchip/f929da061de35925ea591c969f985430e23c4a7e.1742526811.git.dsimic@manjaro.org/T/#u

