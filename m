Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AA5C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcrdfKU3A6deusJ8ZYeLfo9c3Lg+3v5qDALcMQfUIoY=; b=DxebZaM8T/mBN9PVDIIHBYDfXY
	KL/obezBJsvMeLzC/K+j1ZsQw3TllR+pYGc9f6GcLbuCeD9399BNSyKfUDVn3S0gs1V4YT/ZpPe4c
	yPZgltXTM2YKASsgiNCxi3cX6rMVF3b5Ro+DWFVw0Tk8YfhBg64EkkVvK5zyRfWvHVYwUzdJoADjJ
	nI0DSnKG5lCAOOLXTHCSRm2l7ImpahxQoohVtDbs4V4+7f03ESp5eYscxgiC/Ujo0sFQSx8lELmmU
	G+q3GH1Zg8myyiGd/cauVKQOVJbutqDAl2Y6qEiyCrkoYm+0RLs/v8q4jx0JgO2Iv4hPF5NojMz9v
	WRAwGDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5fb-0000000HXPx-1wtt;
	Mon, 28 Sep 2026 07:21:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5fa-0000000HXPp-0f7b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:21:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E375540052;
	Mon, 28 Sep 2026 07:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBA01F000FF;
	Mon, 28 Sep 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790580061;
	bh=XcrdfKU3A6deusJ8ZYeLfo9c3Lg+3v5qDALcMQfUIoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XLCUDEyeTn4Hv8mdCR0sHt1R4Gmshkv4pZJ2UMTvvcYFJf0K+s/oj0Yl7jTPBfNrC
	 s0zhr3vkhy00dcZ351Syb7SuerqvlFP8DrzlLHT32Lica2cS2v/aO+W+pmX91Ktwl/
	 oYn7QJ8RBZZFLm4VMM73vz9XY3c1FFqORe8IAdqucIonD85iZwT0//4xQvy/T4o5G6
	 9X6Ie5/e2JlN44Ensp2m+lJ6i2g8rsrr1A+XuusSLImkPgrna3d/6gtLrZD3f8uNz3
	 41B9x98r70haNzgYdil182+20AJLUNGXQREi+F7hGV7HrOaqe9Q2yPILTVV3Uwkmkk
	 YV/h9hK9/4DQQ==
Date: Mon, 28 Sep 2026 10:20:56 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
Message-ID: <p4mkawney7xtb2sghsyss3zgq53gm6a2aqtylc6obnuohdkkti@rin3eqvadu5h>
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
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

On Fri, Aug 21, 2026 at 02:44:28PM +0200, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to clk-microchip, thanks!

