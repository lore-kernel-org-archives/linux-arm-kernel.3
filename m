Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D551E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDXdVMd8vOl5FoAmu9K6MFINvCbPi2pVuXWtSiL5lnE=; b=cs9IOwgKJMAQIslqm5zIfRDj9x
	7nZiCsK41ramdM2vDNS2uSODtfs69h7XkpzrtV2hEB9s0WSQcn00oAPSFwBqYISA9A0unQRhF5Rd5
	oR5OVPfXaurKQjaMT40K87XQl6gxBmcmDc01Y/R8FRavxOwknQppPttX5DePsuHNKBvYPoeLtL/HQ
	ZafvE6sw0SalFFB0LcCjAg5Imi+0fSXqB9MIgEJpWwIdpGAhesd+en8LpN9asHwlX3T2iUADZYeCi
	Y30dQ8Zm0+ZStL15gTxcQXx4XY2vvIht7JXiA8W/qTWjj4nhWJXLsIilmfNf6dTgQMGw08wrM6Xxz
	Stt6n2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1EE-0000000EqxG-3XYX;
	Sat, 04 Jan 2025 10:17:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1D4-0000000Eqsg-1yfw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 10:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E973A4073C;
	Sat,  4 Jan 2025 10:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551F2C4CED1;
	Sat,  4 Jan 2025 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735985805;
	bh=2T3ciO6m0fCtPynwh9nbyV7VVGdi6rid7fRO8GjcpBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lowWq/CE7cZBlIwEINO9y5sbUhfF1EDr8EmDShKB3l5+8YdWIwMFM0tliVJO5Kw5R
	 ShhUSiOKMHWO99aY8bE6Y3KQhrMgZALSmmNiGtj2vtIK5+o37tczA3QqxZyYRZpKQs
	 laJiCm7XlP2bB6L8I8Hmkc9YD2TIvcwWAlJXEXXYtspOjEhTg/etPocPmrj/R34Isq
	 3Kj1E1iaiKhOYz42+VrGyo4DfByznGMx7ZBoUSmOsnL2PYJRfSxoKGRtaJs/6yaO1V
	 nQrDA2PkYdWKaECuKcaVaD/n7q0EKPEBdQYBuXNIArYDgzVThDZmcB0zVgwYXdphZ5
	 VjnYbfjQ5cZ2Q==
Date: Sat, 4 Jan 2025 11:16:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>, 
	Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman <stuart@gathman.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X
 and PLL_MIPI
Message-ID: <pc7en2jjvce6et6s22sdfooixxxos4u5bitcfhylt7ms65o7wt@bxdvnyeus7b3>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
 <20250104074035.1611136-2-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104074035.1611136-2-anarsoul@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_021646_582124_038409E4 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 03, 2025 at 11:36:57PM -0800, Vasily Khoruzhick wrote:
> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> select TCON0 clock parent in dts
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Where did this happen?

> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook

And these? I cannot find traces on the list.

Best regards,
Krzysztof


