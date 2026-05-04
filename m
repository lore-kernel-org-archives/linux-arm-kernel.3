Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C1ACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VukkESAFe3Dz4ubR3JzkbP1ey9khSmUL81vcflLLR9I=; b=0lOSuBhXhfddhJQrOsJHkdVUlM
	sKpkki39ZDiZfUEBbbLiqIE42+UWrVXta5YsDfynOOXFaDglZr21iFpyVvBSw8SPEaTElA1rrmTyS
	TdV45fvW6TeCOFpQcWJK8tgtDtlaySTimBk4Lzazm+Edv2qZsOjoB7FM1PUaapKxC/50rkNjGSFlv
	LZSINKtEXAuT9uDT289B8bRrxDEr01QGrjLI6ncu8ppr0VB/GjcHrO/BV55wLtw9CDDyYiugdq7Tt
	7Eu9VQtN+zabJVXRQY9oh9LFEfkjZe+Lp2LCgG0E8zN+SD6lylilEgu7yqaFrm8HmmV/AT2sbg0pE
	cLKZzR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2Ay-0000000EWvw-2z3z;
	Mon, 04 May 2026 22:54:08 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2Av-0000000EWv7-3gpc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:54:07 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8cQG2K5bz9tpY;
	Tue,  5 May 2026 00:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VukkESAFe3Dz4ubR3JzkbP1ey9khSmUL81vcflLLR9I=;
	b=NEL0nBiDrxWMgFQ5JESDVgyazhUvcXpuJD86ARYio6oZH8DC7Ds2jFMZSLv85pm17lVz8i
	rCDmhGR7jEnlxdht26yOp41wy9JuVqHVTju0gNN0L2hnHDm1kwMEPS0SBgYj8tFwClrc5C
	nNCxr68taV+QM03lbeYph4OxB2fb7uU1GBfJEh31fITvSnpnYpwo7SpSrjyZubvhJzU4Gu
	36Y1SXbG1RoRdr/+blUlyywZm+jhbsVQw72mCbcIQQU616cFIzk1G1DxuktlFmnG3gyZ69
	/38iZWVKcn1VfN553gSwkg0mSuDwhWOBGEazuxO6lCeFboL0gO2TszVzJONUKQ==
Message-ID: <5aaf1bc2-351d-4bd6-ad8d-206f58af1c26@mailbox.org>
Date: Tue, 5 May 2026 00:53:52 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org>
 <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
 <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
 <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: db7b2fc70112bc46d8d
X-MBO-RS-META: 3ezkm5km4odom3wm4cyftc36h38gwj6t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155406_094729_B48D434F 
X-CRM114-Status: GOOD (  11.86  )
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

On 5/4/26 11:24 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>> Do we need these two? We don't have them in e.g.
>>> arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>
>> I believe we should add them, the KSZ9031 PHY does require 100us delay
>> after reset is deasserted and before MDIO access is possible:
>>
>> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
>>
>> FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING
>>
>> "
>> Note 2: After the de-assertion of reset, wait a minimum of 100 µs before
>> starting programming on the MIIM (MDC/MDIO)
>> interface
>> "
> 
> OK. So please add it to the other boards, too.

Will do.

>> [...]
>>
>>>> +       pwm2_pins: pwm2 {
>>>> +               groups = "pwm2_a";
>>>> +               function = "pwm2";
>>>> +       };
>>>
>>> What is pwm2 used for?
>>
>> The signal is accessible on the EXIO connector D (LBSC) .
>> It is up to user to use the pin for their purposes.
> 
> Usually we do not enable support for random user wirings on EXIO connectors.
I'll remove that in V3, thanks !

