Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33392CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Zph+siZBeGkLK5OkBadCTawnz0zQ5RVLKRomkp3JFM=; b=WSlunw/aGamYD9k/xkHy9hi6f3
	nwacq3OJOXKDVUS1i6Jb6jkBkBKK6d13bc0iLleYfJeicwaP9h0cd9aMOti4zvX0pGAouyorwV6ju
	fMTBcx8iJUBFtmPX3K3XH/wjxXZy3p5Nv37sKS+Juo1ZxB+KUm3rtfhl6XoKw39idA9BT/snMiSAR
	FwjpyBTR5xR4IYSPg9Dr+297nX8KNS9CdS+kFmGlB130u58DevhpqEOJyda9+ullKcl9iX0WOb1kI
	9/hiInU5L5mlUi6gg9sTUqbyjA+TB8Dq+jpEKI9+/qpM3zgeqY2U5xBRP9YlHka35uTrCLNp55mHo
	gQzMaI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGBZ-00000001LCf-1HWE;
	Mon, 28 Sep 2026 18:34:45 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGBQ-00000001L96-1hXN;
	Mon, 28 Sep 2026 18:34:38 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260928183430euoutp02d8c2ceefbbbee78d8631d795eb470987~Zj9SaDp1F1266812668euoutp02d;
	Mon, 28 Sep 2026 18:34:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260928183430euoutp02d8c2ceefbbbee78d8631d795eb470987~Zj9SaDp1F1266812668euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790620470;
	bh=4Zph+siZBeGkLK5OkBadCTawnz0zQ5RVLKRomkp3JFM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ooCPWuWAFvYF4ZM2kjMd6Sk5u8LAPjsE03rJcvHzAe/OskadksFIcixYe9TFn3SG5
	 x2Lag0CNxSduPsZVTUcvY8qADKxrETrS0mODDs5RLBK7W0fG+vhAH96c+oaZU+BhSr
	 uY8fE2y2hrrSNfQ4261WxiEAHHMqI6kqWuuKrmhg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260928183429eucas1p291d65fe935c65b88fc63e99837bf87f8~Zj9RjhP5N2664926649eucas1p2Q;
	Mon, 28 Sep 2026 18:34:29 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260928183427eusmtip29fd870671ef52906c604dca1dab6db1e~Zj9Pk2-JD0396803968eusmtip22;
	Mon, 28 Sep 2026 18:34:27 +0000 (GMT)
Message-ID: <d4fb48de-829d-4285-9ca6-ab418a6f4987@samsung.com>
Date: Mon, 28 Sep 2026 20:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/20] dt-bindings: mfd: Add
 starfive,jh7110-hdmi-subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260917-colossal-phenomenal-rattlesnake-7aca88@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260928183429eucas1p291d65fe935c65b88fc63e99837bf87f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153218eucas1p278c4870936afe1aaa52438660418f8c8
X-EPHeader: CA
X-CMS-RootMailID: 20260915153218eucas1p278c4870936afe1aaa52438660418f8c8
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153218eucas1p278c4870936afe1aaa52438660418f8c8@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-3-f0e4fd6f2cc8@samsung.com>
	<20260917-colossal-phenomenal-rattlesnake-7aca88@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_113437_040804_3F85479A 
X-CRM114-Status: UNSURE (   9.90  )
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



On 9/17/26 08:54, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:32:11PM +0200, Michal Wilczynski wrote:
>> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> 
> Your cover letter, in the first paragraph, should explain the
> merging/dependencies constraints - this depends on previous patches and
> cannot be taken alone.

OK I will update this in the v5

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

