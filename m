Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDrTsEzWaOX89BojzNH8QfMOE2AqATecLGA8bl4b9H8=; b=CeWfTw8iFS6IfLLvcaLqgDiYju
	hRY280dstUcGLFYNB0TCX3vfBO3kGgYzU1o47/LJc29Y5OWcAA/5lSkou6hZI9aCxIml2iEF3P9sf
	/cfIjFZnlTQ94ypUxPNTGxejRTgBu+tnNJsZoxW8QE3GlNS5uHmYSHcUZkK2mdApq242iC3+3gvqh
	tkEJOdf05QnlZOsFVIzhwc2Goi5CUJRplXo75FvBhzBfODZx1JK+Ac++yiBKGSyN5/tg5vW9Tsb+E
	KUOv8tnrCsO0yOg8HSEh4+pXphO0WcRBCbMCo38xKP5VXlb82IwQjON7EtHaHaVlQ1Nxr2dBKjh9G
	2BsiVG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeL9-00000009ciz-3GPs;
	Mon, 23 Dec 2024 09:03:03 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeJx-00000009cci-0hUl;
	Mon, 23 Dec 2024 09:01:51 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EA04E120002;
	Mon, 23 Dec 2024 12:01:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EA04E120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1734944497;
	bh=QDrTsEzWaOX89BojzNH8QfMOE2AqATecLGA8bl4b9H8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Fzerw90+2sw2l3OYYJAjcsRRxc5JBP/63yqNHAn/V7MWkkMOOgIZQYLM2vSOhXpeD
	 YPdTlfTZ38U9SIZtMrElQ21v/RfltO5KGiC2yjGqXYPHLfktU4Ds1a3OgO3r5lq6s/
	 OK0Z9woh+genAzmYtt9yAadd+G2+5ATviOGIvapRa9Ni9Tpa/V+cUbr7u8dHg1aybp
	 9/yZuWPfabHUOelkcf01+IZGVsNJvsrseHBzf41Kh5Vr1EP8w0WdCrgwWmSMLBo4OO
	 z84ZOP7fQ94cpeO7uzHcMEr5S1YpCjvhMvI40pBDw6kaJazjdhca6Bc1iGOjF6mbo2
	 94ftDwetSyU3w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 23 Dec 2024 12:01:37 +0300 (MSK)
Date: Mon, 23 Dec 2024 12:01:37 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Chuan Liu <chuan.liu@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [DMARC error][DKIM error]Re: [PATCH 3/3] clk: amlogic: s4:
 remove unused data
Message-ID: <20241223090137.jbzwrlazhkumatfx@CAB-WSD-L081021>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
 <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
 <3ce97435-71c6-4a7c-8d6c-fa387f68494d@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ce97435-71c6-4a7c-8d6c-fa387f68494d@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.28.192.142]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189997 [Dec 23 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/23 05:07:00 #26899502
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_010149_898319_5BAE222B 
X-CRM114-Status: GOOD (  18.09  )
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

Hello Chuan!

On Mon, Dec 23, 2024 at 03:59:07PM +0800, Chuan Liu wrote:
> Hi Jerome:
> 
> Thank you for pointing out.
> 
> 
> On 12/21/2024 1:17 AM, Jerome Brunet wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > Following the removal of the big clk_regmap clock table from the
> > s4-peripherals clock controller driver, it appears some clocks are unused,
> > which means these are not exported or even registered.
> 
> 
> I have confirmed here that these clocks are used for the demodulator
> of DTV (Digital Television). The DTV-related driver will use these
> clocks.
> 
> 
> > 
> > In all likelihood, these clocks have not been tested. Remove the unused
> > clocks for now. These can added back later when they have been properly
> > tested.
> 
> 
> I will complete these clocks later after testing.

Are you planning to submit the DTV drivers that will utilize these
clocks to the upstream?

If I correctly interpret Jerome's patch series, it appears that these
clocks will not be applied to the upstream kernel unless there are
clients present in the future.

Please correct me if I'm wrong.

[...]

-- 
Thank you,
Dmitry

