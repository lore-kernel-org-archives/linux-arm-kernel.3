Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD98CD98E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlUDip4GcgFnSaDcETbB3mXqYyAfrmdK96aHUTtbFQ4=; b=gMvtXRHCBwfEnihvfKOFZKgS79
	K1Q6uYZjmIWXLBonAbPLIjHBNSdYlXpcJAoFoNN8xwVyKb3rvqPMC0v8zxbyB1+MqB4XctifbC3cf
	W9t0li39gxk3dmTVzUL7Kr/zrRYZcAzBTsNTE52w+oD1rZ3+ZPIrbxx35997gIdRGlnqqc0Y4r798
	X02KeWegb/0ZGC4fU8NqhdAhppjAIeWe141GZGou3alA4Q7HZnoZ8KrEImyZHSzIQRMVQJk77Xrp5
	ZYhTRvtXwDBAtRZEWhnTUvwYEAsRtIBnBZ9h31W73/oqdyri+Xmu08zZBeeNYfKb+6fk4/1dyo1ZY
	SWmUIJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZU4G-0000000FrLn-0zdI;
	Tue, 16 Jun 2026 13:43:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZU4E-0000000FrLG-0JLl;
	Tue, 16 Jun 2026 13:43:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 277CB600AB;
	Tue, 16 Jun 2026 13:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF891F000E9;
	Tue, 16 Jun 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617380;
	bh=BlUDip4GcgFnSaDcETbB3mXqYyAfrmdK96aHUTtbFQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNZUueQn/N4W6+A2fF7S/sYZIxI8SXTR0Skm5X8h8nfTGlv84Fon2rm/DtaEJg3r3
	 e16LAo5QpqSa3Ajpzs+d+SCI9WeuNBJUWrsVKuRHRyhUesel17fQLiVEbVH0wfilSI
	 Gu+jftp3/UFCJbEzSXLg0SlyZj2XB9n2nnNHlyUDLwpll50BNP6PrRqa/VzW7Q+Kli
	 rPBmDSDe19h5pP3/eJaX273BzmG0LLTdaEDdi+pf1aF+viiZ1gaGBSmZt3/aEihk2e
	 STt9qq3EqUxMY4FxceCxgs63/XTLTB+pgnPPNJmt/3i7Pp9wnaryNn8ghYX57fvpym
	 fQTpXQVmghpbw==
Date: Tue, 16 Jun 2026 08:42:57 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 0/9] Add support for MT6392 PMIC
Message-ID: <20260616134257.GB2335264-robh@kernel.org>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
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

On Mon, Jun 15, 2026 at 09:16:06AM +0200, Luca Leonardo Scorcia wrote:
> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.
> 
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.
> 
> These patches enable four functions: keys, regulator, pinctrl and RTC.
> Mono speaker amp will follow later as I need to work further on the
> audio codec.
> 
> I added a handful of device tree improvements to fix some dtbs_check
> errors, added support for the pinctrl device and addressed the comments
> from last year's reviews.
> 
> Please note that patch 0006 and 0008 depend on patch 0005 as they need the
> registers.h file, but belong to different driver areas. I'm not sure if
> I'm supposed to squash them even if they belong to different driver
> areas of if it's fine like this. Any advice is welcome.
> 
> The series has been tested on Xiaomi Mi Smart Clock X04G and on the
> Lenovo Smart Clock 2 CD-24502F.
> 
> Changes in v7:
> - Removed patch 0008 dependency on patch 0003.
> - Reintroduced the regulator driver. In earlier revisions of this series,
>   it was proposed to remove the dedicated compatible for the regulator
>   device [3]. The driver does not use actually it, but it is not possible
>   at this time to remove it from the bindings since it's a required
>   property.
> 
>   Making the regulator-required property conditional was NACKed in [5],
>   with the suggestion to create a separate binding altogether for devices
>   that do not require the compatible property. I tried implementing this,
>   but since the parent device needs to be declared as compatible with
>   mt6323, it leads to a warning in dt_binding_check since mt6323 would
>   be declared as a compatible in both mt6392 and mt6397.
> 
>   In the end the only regulator driver from the mt6397 documentation that
>   still declares an of_match is mt6397-regulator and it does not seem
>   to be necessary, so it should be possible to remove it and make the
>   regulator compatible optional for all regulators, but that change would
>   probably deserve its own separate patch series.

I don't really follow what the issue is here, but compatible should 
never be optional.

Rob

