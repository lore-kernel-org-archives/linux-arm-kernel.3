Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560B8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bj6SlnqGUNk+5S9i5pvyH6aDELpYCxdwMZsHtSo9SQ=; b=HrebnGw7uYPKvxF/x5hMTvqhgA
	euchYesrI5mVhjsBHQHD5ktnUBNuqUDmzRYv9WWRDhXN6JMHy6jC0K2uEWyPw5Tw1haliIIov6laR
	yNHjSBTL8e7XoPe2cWB7jZxWLCecBc6IDRk15bnKZP8S9nCOscGfCoRhPT7ezXkiEFTuXwek4LDV/
	5lMEVMrxQin341UG1vJYLIOLpIQFY5AL1iMc38hPu+V3LrUWU5T4aSCHEN+PDKpdnNkmwtq2vmcvn
	XwDYkW3nFgn1yLVu+ISBmJGqXPn2ddGrns6ng6lNqTt47ycGu/QJslKp5+9X6SwavAFQtwsvMJqXl
	CKJqtjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taYuS-0000000A3Oo-3jy9;
	Wed, 22 Jan 2025 11:28:36 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taYt8-0000000A2wX-0Mju;
	Wed, 22 Jan 2025 11:27:16 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 76257120009;
	Wed, 22 Jan 2025 14:27:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 76257120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737545225;
	bh=5Bj6SlnqGUNk+5S9i5pvyH6aDELpYCxdwMZsHtSo9SQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=O7mh6dk+o8cs2UgkOsSDEdMYYrUx6icHmvuQxefocfBRv+M8stAXADwisxpRW782s
	 K2lUVF2rRLMENOg+23trHvf3XEeRLS/fElbF4qf3zEvaMPcKhL4hOZ8iizJrwojHgz
	 SwobHj35QqNOzZ09J2zSEZr0rM5lfhLTxEkjLXaxp9fHGMEVi1jAA9ot4YVobcYkW1
	 SrgUvKiruF9EpZaXAVjT8qBNk7TZ/ZRUHGzf2Z1/n1Cx0ju7bloht6SlB0hY8ArYdp
	 qtYuQNipX0YM23wT3PNqmoyHqLOWPQQd1So29/zeveUEGsjF+wLLSieYqJM34hL2ZZ
	 fzrIgQM65/+sg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 14:27:05 +0300 (MSK)
Date: Wed, 22 Jan 2025 14:27:03 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] clk: amlogic: drop clk_regmap tables
Message-ID: <pvklak6rusprrnj2pd64ada42oi43uty7xi7iaaoqu2sqdpyko@noy36ilokhwf>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
 <20250120-amlogic-clk-drop-clk-regmap-tables-v3-3-126244146947@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-3-126244146947@baylibre.com>
User-Agent: NeoMutt/20241212
X-Originating-IP: [172.28.64.124]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190499 [Jan 22 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/22 10:19:00 #27099507
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_032714_795201_A2724927 
X-CRM114-Status: GOOD (  14.75  )
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

On Mon, Jan 20, 2025 at 06:15:32PM +0100, Jerome Brunet wrote:
> Remove the clk_regmap tables that are used to keep track which clock
> need to be initialised before being registered. The initialisation is now
> done by the .init() operation of clk_regmap.
> 
> This rework saves a bit memory and makes maintenance a bit easier.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

For the A1 and AXG:
Tested-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

> ---
>  drivers/clk/meson/a1-peripherals.c | 163 +-------------
>  drivers/clk/meson/a1-pll.c         |  16 +-
>  drivers/clk/meson/axg-aoclk.c      |  22 --
>  drivers/clk/meson/axg-audio.c      | 433 -------------------------------------
>  drivers/clk/meson/axg.c            | 131 -----------
>  drivers/clk/meson/c3-peripherals.c | 210 +-----------------
>  drivers/clk/meson/c3-pll.c         |  32 +--
>  drivers/clk/meson/g12a-aoclk.c     |  34 ---
>  drivers/clk/meson/g12a.c           | 261 ----------------------
>  drivers/clk/meson/gxbb-aoclk.c     |  19 --
>  drivers/clk/meson/gxbb.c           | 393 ---------------------------------
>  drivers/clk/meson/meson-aoclk.c    |   5 +-
>  drivers/clk/meson/meson-aoclk.h    |   2 -
>  drivers/clk/meson/meson-eeclk.c    |   4 -
>  drivers/clk/meson/meson-eeclk.h    |   2 -
>  drivers/clk/meson/meson8-ddr.c     |   9 -
>  drivers/clk/meson/meson8b.c        | 200 -----------------
>  drivers/clk/meson/s4-peripherals.c | 229 --------------------
>  drivers/clk/meson/s4-pll.c         |  31 ---
>  19 files changed, 5 insertions(+), 2191 deletions(-)
> 

[...]
-- 
Thank you,
Dmitry

